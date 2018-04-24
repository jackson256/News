package com.hubery.handler;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hubery.bean.User;
import com.hubery.service.RegisterService;

@Controller
public class RegisterHandler {
	
	@Autowired
	private RegisterService register;
	
	@RequestMapping("login")
	public ModelAndView register(){
		//System.out.println("2");
		ModelAndView mav=new ModelAndView();
		mav.setViewName("login");
		return mav;		
	}
	
	@RequestMapping("verify")
	public ModelAndView verify(String userName,String password,HttpServletRequest req,HttpServletResponse res) throws IOException{
		User user=register.verify(userName, password);
		res.setContentType("text/html; charset=utf-8");
		ModelAndView mav=new ModelAndView();
		if(user!=null){
			req.getSession().setAttribute("user", user);
			mav.setViewName("redirect:");
			return mav;
		}
		res.getWriter().print("<script type='text/javascript'>alert('用户名不存在或者密码错误！');window.history.back();</script>");
		return null;		
	}	


}
