package com.item.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.mock.web.portlet.MockActionRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.item.bean.User;
import com.item.bean.Video;
import com.item.redis.TokenUtil;
import com.item.service.UserService;
import com.item.utils.JsonResult;
import com.item.utils.Msg;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource
	private UserService userService;
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	 @RequestMapping("/userManage")
    public ModelAndView userManage() {
	    return new ModelAndView("img");
	 }
	 @RequestMapping("/rePassword")
	 public ModelAndView rePassword() {
		 return new ModelAndView("rePassword");
	 }
	 
		 //验证登陆
	 @RequestMapping("/doLogin")
	 public ModelAndView doLogin(User user, HttpSession session) {
	    	TokenUtil tu=new TokenUtil();
	     String message= userService.checkLogin(user.getUsername(), user.getPassword());
	        if(message!=null&&message.equals("0")) {
	            User realAdmin = userService.getUser(user.getUsername());
	            session.setAttribute("admin",realAdmin);
	            tu.createToken(realAdmin.getId());
	            return new ModelAndView("index");
	        }
	        ModelAndView mv=new ModelAndView("/user/login");
	        mv.addObject("msg", "账号或密码错误");
	        return mv;
	  }
	    
	    @RequestMapping("/loginOut")
	    public ModelAndView loginOut(HttpSession session) {
	    	session.invalidate();
	    	return new ModelAndView("redirect:/");
	    }
	    
	    @RequestMapping("/show")
	    public ModelAndView show(User user ,HttpSession session) {
	    	User u=userService.getUserById(user.getId());
	    	session.setAttribute("admin", u);
	    	return new ModelAndView("img");
	    }
	    
	    
		@RequestMapping("/update")
	    public ModelAndView addOrUpdate(MultipartFile pictureImg , User user, HttpServletRequest request){
	    	String message=null;
	    	ModelAndView mv=new ModelAndView();
	    	 if(user.getId() == null) {
	    		 return mv;
	    	}else{
	    		message=userService.update(pictureImg,user,request);
	    		mv.addObject("message",message);
	    		mv.setViewName("forward:show");
	    		return mv;
	    		}
	    }
		
		@RequestMapping("/receptionUpdate")
	    public ModelAndView aupdate(MultipartFile pictureImg , User user, HttpServletRequest request){
	    	String message=null;
	    	ModelAndView mv=new ModelAndView();
	    	 if(user.getId() == null) {
	    		 return mv;
	    	}else{
	    		message=userService.update(pictureImg,user,request);
	    		mv.addObject("message",message);
	    		mv.setViewName("forward:receptionShow");
	    		return mv;
	    		}
	    }
		
		@RequestMapping("/receptionShow")
	    public ModelAndView receptionShow(User user ,HttpSession session) {
	    	User u=userService.getUserById(user.getId());
	    	session.setAttribute("user", u);
	    	return new ModelAndView("receptionUser");
	    }
		
		
		//修改提交的密码
	    @RequestMapping(value="/submitResetPwd")/*produces = "application/json;charset=UTF-8"*/
	    @ResponseBody	
	    public JsonResult submitResetPwd(String oldPassword, String newPassword,HttpSession httpSession){
	    	
	        User admin = (User) httpSession.getAttribute("admin");
	        if(oldPassword.equals(newPassword)) {
	        	return new JsonResult(false, "新密码不能与原密码相同！");
	        }
	        if(!admin.getPassword().equals(oldPassword)) {
	        	return new JsonResult(false, "原密码输入错误！") ;
	        }
	        admin.setPassword(newPassword);
	        boolean isSuccess = userService.upDatePassword(admin);
	        if(isSuccess) { 
	        		return new JsonResult(isSuccess,"密码修改成功！");
	        	}else {
	        		return new JsonResult(isSuccess,"系统内部错误，修改密码失败！");
	        }
	    }
	    
	    //普通用户信息管理
	    @RequestMapping("/showUser")
	    public ModelAndView showUserList() {
		    return new ModelAndView("delUser");
		 }
	    
	    
	    
	    
	    //注销用户信息
	    @RequestMapping(value="/delUser/{id}",method=RequestMethod.DELETE)
	    @ResponseBody
	    public JsonResult delUserById(@PathVariable("id")Integer id) {
	    	Boolean isSuccess=userService.delUserById(id);
	    	System.out.println(isSuccess+"   ashdasjkh");
	    	 if(isSuccess) { 
	        		return new JsonResult(isSuccess,"注销用户成功！");
	        	}else {
	        		return new JsonResult(isSuccess,"系统内部错误，注销失败！");
	        }
	    }

	    @RequestMapping("/userList")
		@ResponseBody
		public Msg getEmpsWithJson(
				@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
			// 这不是一个分页查询
			// 引入PageHelper分页插件
			// 在查询之前只需要调用，传入页码，以及每页的大小
			PageHelper.startPage(pn, 5);
			// startPage后面紧跟的这个查询就是一个分页查询
			List<User> emps = userService.showUser();
			System.out.println(emps.size());
			// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
			// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
			PageInfo page = new PageInfo(emps, 5);
			return Msg.success().add("pageInfo", page);
		}
	    
	    
	    @RequestMapping("/isActivaed")
	    public ModelAndView isActivaed(User user ,HttpSession session) {
	    	TokenUtil tu=new TokenUtil();
	    	boolean bool=userService.findUserByActivaed(user);
	    	if(bool) {
	    		String message= userService.checkLogin(user.getUsername(), user.getPassword());
	    		if(message!=null) {
		            User realAdmin = userService.getUser(user.getUsername());
		            session.setAttribute("user",realAdmin);
		            tu.createToken(realAdmin.getId());
		            return new ModelAndView("forward:/reception/receptionBase");
		        }
		        ModelAndView mv=new ModelAndView("/receptionLogin");
		        mv.addObject("msg", "账号或密码错误");
		        return mv;
	    	}
	    	ModelAndView mv=new ModelAndView("/receptionLogin");
	    	mv.addObject("msg", "账号或密码错误");
	    	return mv;
	    }
	    
	    @RequestMapping("/receptionLoginOut")
	    public ModelAndView receptionLoginOut(HttpSession session) {
	    	session.invalidate();
	    	return new ModelAndView("redirect:/receptionLogin");
	    }
	    
}
