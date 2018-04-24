package com.hubery.dao;

import java.util.List;

import com.hubery.bean.News;

/**
 * 新闻的查改
 * @author Administrator
 *
 */
public interface News_SDMapper {
	/**根据userId查询新闻*/
	public List<News> getNews(int userId);
	/** 根据id查询新闻更改新闻的内容*/
	public int updateNews(News news);
	/**添加新闻*/
	public int insertNews(News news);
	/**根据id查询新闻标题*/
	public String getTitle(int id); 
	/**根据id删除新闻*/
	public int deleteNews(int id);
	/**
	 * 根据id删除评论
	 * @param id
	 * @return
	 */
	public int deleteComment(int id);
	
	/**根据新闻id删除对应评论*/
	public int deleteCommentByNewsId(int id);
	/**根据新闻id查询新闻具体信息*/
	public News getNewsById(int id);
}
