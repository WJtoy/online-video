package com.item.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.item.bean.User;

public interface UserDao {
	
	public List<User> getUserAll();
	
	
	public User selectByNameAndPwd(@Param("adminName") 
			String adminName,@Param("adminPassword") String adminPassword);
	
	public void updata(User user);
	
	public int insertSelective(User user);

	public int updateByPrimaryKeySelective(User user);

	public User getUserById(Integer str);
	
	public User getUser(String str);

	public int updateByExampleSelective(User user);

	
	//查询用户信息
	public List<User> showUser();
	//注销删除用户
	public int delUserById(Integer id);

	
	
	//更新用户的状态
	public void updateActivated( @Param("idInt")int idInt,@Param("activated")int activated);
	public User findUserByEmail(String email);
	public User findUserById(int idInt);
	public void saveUser(User user);

	//根据用户id来查查询激活字段
	public Integer findUserByActivaed(User user);
}
