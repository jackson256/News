package com.hubery.service;

import java.util.List;

import com.hubery.bean.News;

public interface SearchService {
	public List<News> searchNewsByKeywords(String keywords);
}
