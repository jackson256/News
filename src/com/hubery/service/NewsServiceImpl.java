package com.hubery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hubery.bean.News;
import com.hubery.dao.News_SDMapper;

public class NewsServiceImpl implements NewsService{

	@Autowired
	private News_SDMapper news_SD;
	
	@Override
	public int insertNews(News news) {
		return news_SD.insertNews(news);
	}

	@Override
	public List<News> getNews(int userId) {
		// TODO Auto-generated method stub
		return news_SD.getNews(userId);
	}

	@Override
	public String getTitle(int id) {
		// TODO Auto-generated method stub
		return news_SD.getTitle(id);
	}

	@Override
	public int deleteNews(int id) {
		// TODO Auto-generated method stub
		return news_SD.deleteNews(id);
	}

	@Override
	public int deleteComment(int id) {
		// TODO Auto-generated method stub
		return news_SD.deleteComment(id);
	}

	@Override
	public int deleteCommentByNewsId(int id) {
		// TODO Auto-generated method stub
		return news_SD.deleteCommentByNewsId(id);
	}

	@Override
	public int updateNews(News news) {
		// TODO Auto-generated method stub
		return news_SD.updateNews(news);
	}

	@Override
	public News getNewsById(int id) {
		// TODO Auto-generated method stub
		return news_SD.getNewsById(id);
	}

	
}
