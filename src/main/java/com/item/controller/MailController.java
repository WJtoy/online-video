package com.item.controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.item.bean.User;
import com.item.service.UserService;
import com.item.utils.EmailUtils;
import com.item.utils.GenerateLinkUtils;

@Controller
@RequestMapping("/email")
public class MailController {
		
		@Autowired
		private UserService userService;
	 
		@RequestMapping("/toregist")
		public String toemail() {
			return "mail";
		}
		
		@RequestMapping("/regist")
		public String regist(User user,HttpSession httpSession,HttpServletResponse response) {
			user.setActivated(false);  //刚注册默认是没有激活状态
			user.setCodeUrl(UUID.randomUUID().toString());
			//注册用户
			if(userService.findUserByEmail(user.getEmail()) == null) {
				/*user.setUsername(user.getEmail());*/
				userService.saveUser(user);
			} else {
				/*throw new RuntimeException("该邮箱已注册");*/
				httpSession.setAttribute("emailError", "邮箱已注册！");
				return "register";
			}
			
			//查看是否注册成功，为实体类User的id赋值
			User findUser = userService.findUserByEmail(user.getEmail());
			if(findUser != null) {
				user.setId(findUser.getId());
			} else {
				throw new RuntimeException("注册用户失败");
				/*httpSession.setAttribute("msg", "注册用户失败!");*/
			}
			
			//注册成功后，发送账户激活链接
			httpSession.setAttribute("user", user);
			EmailUtils.sendAccountActivateEmail(user);
			try {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("激活邮件已经发送，请注意提醒查收");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		
		
		@RequestMapping("/activate")
		public void activate(String id,String checkCode,HttpServletResponse response) {
			int idInt = Integer.parseInt(id);
			
			//根据用户id查找用户
			User user = userService.findUserById(idInt);
			
			//验证无误，状态更改为1，即激活
			if(GenerateLinkUtils.verifyCheckcode(user,checkCode)) {
				//修改状态
				int activated = 1;
				userService.updateActivated(idInt,activated);
				user.setActivated(true);
				try {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().write("恭喜，激活成功！<a href='/ssm-crud/loginss'>去登录页面</a>");
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}	
	}

