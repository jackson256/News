package com.hubery.dao;

import com.hubery.bean.User;

public interface RegisterMapper {
	/**
	 * ���ڲ�ѯ�û����������Ƿ�ƥ��
	 * @param userName:�û���
	 * @param password:����
	 * @return 
	 */
	public User verify(String userName,String password);
	
	public void updatePwd(String password,String userName);
}
