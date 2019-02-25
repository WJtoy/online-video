package com.item.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import com.item.bean.User;

public interface UserService {
	
	public User getUserById(Integer integer);
	public String checkLogin(String adminName,String adminPassword);
	public void updataUser(User user);

	public String add(MultipartFile adminIcon, User user, HttpServletRequest request);
	
	public String update(MultipartFile adminIcon, User user, HttpServletRequest request);
	public User getUser(String str);
	public boolean upDatePassword(User admin);
	
	
	
	//查询user用户信息
	public List<User> showUser();
	public boolean delUserById(Integer id);
	
	//更改用户激活状态为1
	public void updateActivated(int idInt,int activated );
	
	
	//搜邮箱
	public User findUserByEmail(String email);
	
	//添加用户
	public void saveUser(User user);
	
	public User findUserById(int idInt);
	
	//判断是否激活
	public boolean findUserByActivaed(User user);

}
