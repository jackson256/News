package com.hubery.service;

import com.hubery.bean.User;

public interface RegisterService {
	public User verify(String userName,String password);
	public void updatepwd(String password,String userName);
}
