package com.hubery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hubery.bean.News;
import com.hubery.dao.SearchMapper;

public class SearchServiceImpl implements SearchService{
	@Autowired
	private SearchMapper searchMapper;

	@Override
	public List<News> searchNewsByKeywords(String keywords) {
		// TODO Auto-generated method stub
		return searchMapper.searchNewsByKeywords(keywords);
	}

	

}
