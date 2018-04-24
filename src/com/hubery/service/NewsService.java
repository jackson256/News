package com.hubery.service;

import java.util.List;

import com.hubery.bean.News;

public interface NewsService {

	/**�������*/
	public int insertNews(News news);
	/**����userId��ѯ����*/
	public List<News> getNews(int userId);
	/** ����id��ѯ���Ÿ������ŵ�����*/
	public int updateNews(News news);
	/**����id��ѯ����*/
	public String getTitle(int id); 
	/**����idɾ������*/
	public int deleteNews(int id);
	public int deleteComment(int id);
	/**��������idɾ������*/
	public int deleteCommentByNewsId(int id);
	/**��������id��ѯ���ž�����Ϣ*/
	public News getNewsById(int id);
}
