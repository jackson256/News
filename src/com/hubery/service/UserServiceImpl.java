package com.hubery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hubery.bean.User;
import com.hubery.dao.UserMapper;

public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	public boolean addUser(User user) {
		int flag = userMapper.addUser(user);
		if (flag > 0) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public List<String> getName() {
		return userMapper.getName();
	}

	@Override
	public String getNameById(int id) {
		// TODO Auto-generated method stub
		return userMapper.getNameById(id);
	}

	@Override
	public int updateUserInf(User user) {
		// TODO Auto-generated method stub
		return userMapper.updateUserInf(user);
	}

	@Override
	public List<User> getUser() {
		// TODO Auto-generated method stub
		return userMapper.getUser();
	}

	@Override
	public int liftRole(int id) {
		// TODO Auto-generated method stub
		return userMapper.liftRole(id);
	}

	@Override
	public int deleteUser(int id) {
		// TODO Auto-generated method stub
		return userMapper.deleteUser(id);
	}

	@Override
	public int deleteNews(int id) {
		return userMapper.deleteNews(id);
	}

	@Override
	public int deleteComment(int id) {
		// TODO Auto-generated method stub
		return userMapper.deleteComment(id);
	}

}
