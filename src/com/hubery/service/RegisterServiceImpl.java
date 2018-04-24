package com.hubery.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.hubery.bean.User;
import com.hubery.dao.RegisterMapper;

public class RegisterServiceImpl implements RegisterService{

	@Autowired
	private RegisterMapper register;
	
	@Override
	public User verify(String userName,String password) {
		User u=register.verify(userName,password);
		
		return u;
	}

	@Override
	public void updatepwd(String password, String userName) {
		register.updatePwd(password, userName);
	}

}
