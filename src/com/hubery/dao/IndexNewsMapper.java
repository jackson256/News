package com.hubery.dao;

import java.util.List;

import com.hubery.bean.News;

public interface IndexNewsMapper {
	
	/*
	 * 根据新闻的类别，查询前5条新闻，将新闻标题显示在首页相应位置
	 */	
	public List<News> getLatestFiveNewsByCategory(String categoryName);
	
	/*
	 * 查询最新的前6条新闻，将新闻标题显示在首页->新闻零距离
	 */
	public List<News> getLatestNews();
	
	/*
	 * 查询访问量最高的18条新闻，将新闻标题显示在首页->特别关注
	 */
	public List<News> getPopularNews();
	
	/*
	 * 根据新闻id查找News
	 */
	public News getNewsById(int id);
	
	/*
	 * 根据新闻的类别，查询所有新闻
	 */
	public List<News> getNewsByCategory(String categoryName);
	
	/*
	 * 根据新闻的类别查找新闻，从startNum往后5条-》查看更多功能：AJAX实现 - cancelled
	 */
	public List<News> getFiveNewsByCategory(String categoryName,int startNum);
	
}
