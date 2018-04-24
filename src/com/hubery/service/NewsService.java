package com.hubery.service;

import java.util.List;

import com.hubery.bean.News;

public interface NewsService {

	/**添加新闻*/
	public int insertNews(News news);
	/**根据userId查询新闻*/
	public List<News> getNews(int userId);
	/** 根据id查询新闻更改新闻的内容*/
	public int updateNews(News news);
	/**根据id查询新闻*/
	public String getTitle(int id); 
	/**根据id删除新闻*/
	public int deleteNews(int id);
	public int deleteComment(int id);
	/**根据新闻id删除评论*/
	public int deleteCommentByNewsId(int id);
	/**根据新闻id查询新闻具体信息*/
	public News getNewsById(int id);
}
