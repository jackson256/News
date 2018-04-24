package com.hubery.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.hubery.bean.Comment;
import com.hubery.bean.News;
import com.hubery.service.IndexNewsService;

public class NewsSearchTest {
	
	private ApplicationContext app;
	@Before
	public void t(){
		String[] path={"spring/applicationContext-dao.xml",
				"spring/applicationContext-service.xml",
				"spring/applicationContext.xml"};
		app=new ClassPathXmlApplicationContext(path);
	}
	
	/*
	 * 测试首页前五条信息显示功能
	 */
	@Test
	public void getNewsTitleTest(){
		IndexNewsService indexNewsService=(IndexNewsService) app.getBean("indexNewsService");
		List<News> list = indexNewsService.getLatestFiveNewsByCategory("entertainment");
		for (News news : list) {
			System.out.println(news.getTitle());
		}
	}
	
	/* 最新的6条消息 */
	@Test
	public void getLatestNewsTest(){
		IndexNewsService indexNewsService=(IndexNewsService) app.getBean("indexNewsService");
		List<News> list = indexNewsService.getLatestNews();
		for (News news : list) {
			System.out.println(news.getTitle());
		}
	}
	/* 最热的18条消息 */
	@Test
	public void getPopularNewsTest(){
		IndexNewsService indexNewsService=(IndexNewsService) app.getBean("indexNewsService");
		List<News> list = indexNewsService.getPopularNews();
		for (News news : list) {
			System.out.println(news.getTitle());
		}
	}
	
	/* 按id查询新闻 */
	@Test
	public void getNewsByIdTest(){
		IndexNewsService indexNewsService=(IndexNewsService) app.getBean("indexNewsService");
		//System.out.println(indexNewsService.getNewsById(11).getContent());
		List<Comment> list= indexNewsService.getNewsById(13).getComments();
		for (Comment comment : list) {
			System.out.println(comment.getUser().getUserName());
		}
	}
	
	/* 按类别查询新闻 */
	@Test
	public void getNewsByCategoryTest(){
		IndexNewsService indexNewsService=(IndexNewsService) app.getBean("indexNewsService");
		List<News> list = indexNewsService.getNewsByCategory("focus");	
		for (News news2 : list) {
			System.out.println(news2.getTitle());				
		}
	}
	
	/* 按类别查询新闻,返回从startNum后五条 */
	@Test
	public void getFiveNewsByCategoryTest(){
		IndexNewsService indexNewsService=(IndexNewsService) app.getBean("indexNewsService");
		List<News> list = indexNewsService.getFiveNewsByCategory("focus", 5);	
		for (News news2 : list) {
			System.out.println(news2.getTitle());				
		}
	}
	
	
	
}
