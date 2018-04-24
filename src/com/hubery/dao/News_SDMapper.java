package com.hubery.dao;

import java.util.List;

import com.hubery.bean.News;

/**
 * ���ŵĲ��
 * @author Administrator
 *
 */
public interface News_SDMapper {
	/**����userId��ѯ����*/
	public List<News> getNews(int userId);
	/** ����id��ѯ���Ÿ������ŵ�����*/
	public int updateNews(News news);
	/**�������*/
	public int insertNews(News news);
	/**����id��ѯ���ű���*/
	public String getTitle(int id); 
	/**����idɾ������*/
	public int deleteNews(int id);
	/**
	 * ����idɾ������
	 * @param id
	 * @return
	 */
	public int deleteComment(int id);
	
	/**��������idɾ����Ӧ����*/
	public int deleteCommentByNewsId(int id);
	/**��������id��ѯ���ž�����Ϣ*/
	public News getNewsById(int id);
}
