package com.hubery.dao;

import com.hubery.bean.User;

public interface RegisterMapper {
	/**
	 * 用于查询用户名和密码是否匹配
	 * @param userName:用户名
	 * @param password:密码
	 * @return 
	 */
	public User verify(String userName,String password);
	
	public void updatePwd(String password,String userName);
}
