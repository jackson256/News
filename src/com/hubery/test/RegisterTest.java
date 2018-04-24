package com.hubery.test;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.hubery.bean.User;
import com.hubery.service.RegisterService;

public class RegisterTest {
	
	private ApplicationContext app;
	@Before
	public void t(){
		String[] path={"spring/applicationContext-dao.xml",
				"spring/applicationContext-service.xml",
				"spring/applicationContext.xml"};
		app=new ClassPathXmlApplicationContext(path);
	}
	
	@Test
	public void register(){
		RegisterService register=(RegisterService) app.getBean("registerService");
		User b=register.verify("zy","123");
		System.out.println(b);
	}
	@Test
	public void updatepwd(){
		RegisterService register=(RegisterService) app.getBean("registerService");
		register.updatepwd("123", "’≈—Ù");
		
	}
}
