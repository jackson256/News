package com.hubery.handler;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hubery.bean.News;
import com.hubery.bean.User;
import com.hubery.service.NewsService;
import com.hubery.service.UserService;

@Controller
public class UserController {
	@Autowired
private UserService userservice;
	@Autowired
	private NewsService newsService;
	
	@RequestMapping("addUser")
	public ModelAndView addUserQuery(User user,
			HttpServletRequest request,HttpServletResponse res ) throws IOException{
		res.setContentType("text/html; charset=utf-8");
		String username=null;
		String userName=user.getUserName();
		username=new String(userName.getBytes("iso-8859-1"),"utf-8");
		user.setUserName(username);
		ModelAndView mav=new ModelAndView();	
		List<String> list=userservice.getName();
		//�����������û���
		for (String string : list) {
			//�ж��û����Ƿ����
			if(string.equals(user.getUserName())){
				//������������,����һ��
				res.getWriter().print("<script type='text/javascript'>alert('�û�������');window.history.back();</script>");
				return null;
			}
		}
		user.setUserRole("user");		
		userservice.addUser(user);
		mav.setViewName("login");
//		userservice.addUser(user);
		return mav;		
	}
	
	@RequestMapping("reg")
	public ModelAndView reg(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reg");
		return mav;
	}
	
	@RequestMapping("update_Role")
	public ModelAndView update_Role(HttpServletRequest request,HttpServletResponse response) throws IOException{
		User user=(User)request.getSession().getAttribute("user");
		String role=user.getUserRole();
		ModelAndView mav = new ModelAndView();
		if(role.equals("admin")){
			mav.setViewName("update_Role");
			List<User> userList=userservice.getUser();
			mav.addObject("userList",userList);
			return mav;
			
		}else{
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().print("<script type='text/javascript'>alert('����Ȩ����');window.history.back();</script>");
			return null;
		}
	}
	
	@ResponseBody
	@RequestMapping("lift_Role")
	public boolean lift_Role(@RequestParam("id") int id){
		int i=userservice.liftRole(id);
		if(i==0){
			return false;
			
		}
		return true;
	}
	
	@ResponseBody
	@RequestMapping("delete_user")
	public boolean delete_user(@RequestParam("id") int id){
		List<News> newsList=newsService.getNews(id);
		//ɾ�����û������������е�����
		for (News news : newsList) {
			newsService.deleteCommentByNewsId(news.getId());
		}
		//ɾ�����û�������
		userservice.deleteComment(id);
		//ɾ�����û�������
		userservice.deleteNews(id);
		//ɾ�����û�
		int i=userservice.deleteUser(id);
		if(i==0){
			return false;
			
		}
		return true;
	}
}

