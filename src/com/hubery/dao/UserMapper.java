package com.hubery.dao;

import java.util.List;

import com.hubery.bean.User;

public interface UserMapper {
	public int addUser(User user);
	public List<String> getName();
	public String getNameById(int id);
	public int updateUserInf(User user);
	public List<User> getUser();
	public int liftRole(int id);
	public int deleteUser(int id);
	public int deleteNews(int id);
	public int deleteComment(int id);
	
}
