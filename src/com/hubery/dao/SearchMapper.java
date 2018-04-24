package com.hubery.dao;

import java.util.List;

import com.hubery.bean.News;

public interface SearchMapper {
	public List<News> searchNewsByKeywords(String keywords);
}
 