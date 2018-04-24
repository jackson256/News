package com.hubery.service;

import java.util.List;

import com.hubery.bean.News;

public interface IndexNewsService {
	
	public List<News> getLatestFiveNewsByCategory(String categoryName);
	
	public List<News> getLatestNews();
	
	public List<News> getPopularNews();
	
	public News getNewsById(int id);
	
	public List<News> getNewsByCategory(String categoryName);
	
	/*
	 * �������ŵ����������ţ���startNum����5��-���鿴���๦�ܣ�AJAXʵ�� - cancelled
	 */
	public List<News> getFiveNewsByCategory(String categoryName,int startNum);

}
