package com.item.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.item.bean.User;
import com.item.dao.UserDao;
import com.item.utils.FileUtil;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	public String checkLogin(String adminName,String adminPassword) { 
			User user=userDao.selectByNameAndPwd(adminName,adminPassword); 
		        if(user != null){
		        	return user.getRole();
		        }
			return null;	
	}
	
	public void updataUser(User user) {
		userDao.updata(user);
	}
	
	public String add(MultipartFile adminIcon, User admin, HttpServletRequest request) {
	        if(!adminIcon.isEmpty()){
	        	String path=FileUtil.uploadImage(adminIcon, "img", request);
	        	admin.setHeadimg(path);
	        }
	        try{
	            int  row = userDao.insertSelective(admin);
	            return row > 0 ? "插入成功"
	                    : "插入失败";
	        }catch (Exception e){
	            e.printStackTrace();
	            return null;
	        }
	    }

	public String update(MultipartFile adminIcon, User user, HttpServletRequest request) {
	        try{
	            if(!adminIcon.isEmpty()){
	                //更新首先要先删除原来的文件
	                if(user.getHeadimg() != null){
	                    File file = new File(request.getServletContext().getRealPath("/" +user.getHeadimg()));
	                    if(file != null) file.delete();
	                }
	                String path = FileUtil.uploadImage(adminIcon, "img", request);
	                System.out.println(path);
	                if(path == null) return "上传图片类型错误";
	                user.setHeadimg(path);
	            }
	            int i = userDao.updateByPrimaryKeySelective(user);
	            return i > 0 ? "更新成功" : "更新失败"; 
	        }catch (Exception e){
	            e.printStackTrace();
	            return null;
	        }
	    }
		
	public User getUserById(Integer integer) {
			return userDao.getUserById(integer);
		}
		public User getUser(String str) {
			return userDao.getUser(str);
		}
		
		    public boolean upDatePassword(User admin) {
		        int i = userDao.updateByExampleSelective(admin);
		        System.out.println(i+" 条影响的行数");
		        return i > 0 ? true : false;
		    }

		    //查询用户信息
			public List<User> showUser() {
				List<User> user=userDao.showUser();
				return user;
			}
			//注销用户信息
			public boolean delUserById(Integer id) {
				int i=userDao.delUserById(id);
				System.out.println(i+" 删除影响的行数");
				return i > 0 ? true : false;
			}

			
			//激活账号
			public void updateActivated(int activated, int idInt) {
				userDao.updateActivated(activated,idInt);
			}
			
			public User findUserByEmail(String email) {
				
				return userDao.findUserByEmail(email);
			}
			
			//用户注册后把用户信息保存到数据库里
			public void saveUser(User user) {
				user.setUsername(user.getEmail());//设置账号为邮箱
				userDao.saveUser(user);
			}

			public User findUserById(int idInt) {
				return userDao.findUserById(idInt);
			}

			
			//登录判断是否激活
			public boolean findUserByActivaed(User user) {
				Integer i=userDao.findUserByActivaed(user);
		
				System.out.println(i+"...................");
				if(i!=null&&i==1)
					return true;
				return false;
			}

}
