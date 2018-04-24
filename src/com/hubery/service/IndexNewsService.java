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
	 * 根据新闻的类别查找新闻，从startNum往后5条-》查看更多功能：AJAX实现 - cancelled
	 */
	public List<News> getFiveNewsByCategory(String categoryName,int startNum);

}
