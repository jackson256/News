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
	 * ������ҳǰ������Ϣ��ʾ����
	 */
	@Test
	public void getNewsTitleTest(){
		IndexNewsService indexNewsService=(IndexNewsService) app.getBean("indexNewsService");
		List<News> list = indexNewsService.getLatestFiveNewsByCategory("entertainment");
		for (News news : list) {
			System.out.println(news.getTitle());
		}
	}
	
	/* ���µ�6����Ϣ */
	@Test
	public void getLatestNewsTest(){
		IndexNewsService indexNewsService=(IndexNewsService) app.getBean("indexNewsService");
		List<News> list = indexNewsService.getLatestNews();
		for (News news : list) {
			System.out.println(news.getTitle());
		}
	}
	/* ���ȵ�18����Ϣ */
	@Test
	public void getPopularNewsTest(){
		IndexNewsService indexNewsService=(IndexNewsService) app.getBean("indexNewsService");
		List<News> list = indexNewsService.getPopularNews();
		for (News news : list) {
			System.out.println(news.getTitle());
		}
	}
	
	/* ��id��ѯ���� */
	@Test
	public void getNewsByIdTest(){
		IndexNewsService indexNewsService=(IndexNewsService) app.getBean("indexNewsService");
		//System.out.println(indexNewsService.getNewsById(11).getContent());
		List<Comment> list= indexNewsService.getNewsById(13).getComments();
		for (Comment comment : list) {
			System.out.println(comment.getUser().getUserName());
		}
	}
	
	/* ������ѯ���� */
	@Test
	public void getNewsByCategoryTest(){
		IndexNewsService indexNewsService=(IndexNewsService) app.getBean("indexNewsService");
		List<News> list = indexNewsService.getNewsByCategory("focus");	
		for (News news2 : list) {
			System.out.println(news2.getTitle());				
		}
	}
	
	/* ������ѯ����,���ش�startNum������ */
	@Test
	public void getFiveNewsByCategoryTest(){
		IndexNewsService indexNewsService=(IndexNewsService) app.getBean("indexNewsService");
		List<News> list = indexNewsService.getFiveNewsByCategory("focus", 5);	
		for (News news2 : list) {
			System.out.println(news2.getTitle());				
		}
	}
	
	
	
}
