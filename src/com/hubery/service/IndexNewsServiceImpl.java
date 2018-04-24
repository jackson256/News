package com.hubery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hubery.bean.News;
import com.hubery.dao.IndexNewsMapper;

public class IndexNewsServiceImpl implements IndexNewsService{
	
	@Autowired
	private IndexNewsMapper indexNewsMapper;
	
	/*
	 * 根据新闻的类别，查询前5条新闻，将新闻标题显示在首页相应位置
	 */
	public List<News> getLatestFiveNewsByCategory(String categoryName) {
		return indexNewsMapper.getLatestFiveNewsByCategory(categoryName);
	}
	
	/*
	 * 查询最新的前6条新闻，将新闻标题显示在首页->新闻零距离
	 */
	public List<News> getLatestNews() {
		return indexNewsMapper.getLatestNews();
	}

	/*
	 * 查询访问量最高的18条新闻，将新闻标题显示在首页->特别关注
	 */
	public List<News> getPopularNews() {
		return indexNewsMapper.getPopularNews();
	}

	/*
	 * 根据id查找新闻(包含所有信息)
	 */
	public News getNewsById(int id) {
		return indexNewsMapper.getNewsById(id);
	}

	/*
	 * 根据类别查找所有新闻
	 */
	public List<News> getNewsByCategory(String categoryName) {
		return indexNewsMapper.getNewsByCategory(categoryName);
	}
	
	/*
	 * 根据新闻的类别查找新闻，从startNum往后5条-》查看更多功能：AJAX实现 - cancelled
	 */
	public List<News> getFiveNewsByCategory(String categoryName, int startNum) {
		return indexNewsMapper.getFiveNewsByCategory(categoryName, startNum);
	}
	

}
