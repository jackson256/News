package com.hubery.dao;

import java.util.List;

import com.hubery.bean.News;

public interface IndexNewsMapper {
	
	/*
	 * �������ŵ���𣬲�ѯǰ5�����ţ������ű�����ʾ����ҳ��Ӧλ��
	 */	
	public List<News> getLatestFiveNewsByCategory(String categoryName);
	
	/*
	 * ��ѯ���µ�ǰ6�����ţ������ű�����ʾ����ҳ->���������
	 */
	public List<News> getLatestNews();
	
	/*
	 * ��ѯ��������ߵ�18�����ţ������ű�����ʾ����ҳ->�ر��ע
	 */
	public List<News> getPopularNews();
	
	/*
	 * ��������id����News
	 */
	public News getNewsById(int id);
	
	/*
	 * �������ŵ���𣬲�ѯ��������
	 */
	public List<News> getNewsByCategory(String categoryName);
	
	/*
	 * �������ŵ����������ţ���startNum����5��-���鿴���๦�ܣ�AJAXʵ�� - cancelled
	 */
	public List<News> getFiveNewsByCategory(String categoryName,int startNum);
	
}
