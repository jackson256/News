package com.hubery.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hubery.bean.News;
import com.hubery.bean.User;
import com.hubery.service.NewsService;
import com.hubery.service.UserService;

@Controller
public class NewsHandler {
	@Autowired
	private NewsService newsService;
	@Autowired
	private UserService userService;
	
	/**添加新闻*/
	@RequestMapping("insertNews")
	@ResponseBody
	public boolean insertNews(News news,HttpServletRequest req,HttpServletResponse res) throws IOException{
		ModelAndView mav=new ModelAndView();
		User user=(User)req.getSession().getAttribute("user");
		Date date=new Date();
		news.setUserId(user.getId());
		news.setCreateTime(date);
		int i=newsService.insertNews(news);
		if(i==0){
			return false;
		}
		return true;
		
	}
	/**后台管理首页*/
	@RequestMapping("welcome")
	public String welcome(){
		return "welcome";
	}
	
	/**遍历新闻(manage)*/
	@RequestMapping("show_News")
	public ModelAndView show_News(HttpServletRequest request){
		User user=(User)request.getSession().getAttribute("user");
		List<News> news=newsService.getNews(user.getId());
		List<String> nameList=new ArrayList<String>();
		ModelAndView mav=new ModelAndView();
		for (News n : news) {
			nameList.add(userService.getNameById(n.getUserId()));
		}
		mav.addObject("news", news);
		mav.addObject("nameList", nameList);
		mav.setViewName("delete_News");
		return mav;
	}
	

	
	
}
