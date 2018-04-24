package com.hubery.handler;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hubery.bean.News;
import com.hubery.service.SearchService;

@Controller
public class SearchHandler {
	@Autowired
	private SearchService searchService;
	
	@RequestMapping("search1")
	public ModelAndView querySearch(@RequestParam("keywords") String keywords,HttpServletRequest request,HttpServletResponse response){
		//response.setContentType("text/html;charset=utf-8");
		String newKeywords = null;
		try {
			newKeywords = new String(keywords.getBytes("iso-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		ModelAndView mav=new ModelAndView();		
		mav.setViewName("newsSearchResultPage");
		List<News> list = searchService.searchNewsByKeywords(newKeywords);
		for (News news : list) {
			if(news.getContent().length()>100){
				String con=news.getContent().substring(0, 100).concat("...");
				news.setContent(con);
			}
			
			//System.out.println(news.getTitle());
		}		
		mav.addObject("newsList",list);
		mav.addObject("keywords", keywords);
		
		return mav;
	}
		
	

}
