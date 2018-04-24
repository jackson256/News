package com.hubery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hubery.bean.News;
import com.hubery.dao.IndexNewsMapper;

public class IndexNewsServiceImpl implements IndexNewsService{
	
	@Autowired
	private IndexNewsMapper indexNewsMapper;
	
	/*
	 * �������ŵ���𣬲�ѯǰ5�����ţ������ű�����ʾ����ҳ��Ӧλ��
	 */
	public List<News> getLatestFiveNewsByCategory(String categoryName) {
		return indexNewsMapper.getLatestFiveNewsByCategory(categoryName);
	}
	
	/*
	 * ��ѯ���µ�ǰ6�����ţ������ű�����ʾ����ҳ->���������
	 */
	public List<News> getLatestNews() {
		return indexNewsMapper.getLatestNews();
	}

	/*
	 * ��ѯ��������ߵ�18�����ţ������ű�����ʾ����ҳ->�ر��ע
	 */
	public List<News> getPopularNews() {
		return indexNewsMapper.getPopularNews();
	}

	/*
	 * ����id��������(����������Ϣ)
	 */
	public News getNewsById(int id) {
		return indexNewsMapper.getNewsById(id);
	}

	/*
	 * ������������������
	 */
	public List<News> getNewsByCategory(String categoryName) {
		return indexNewsMapper.getNewsByCategory(categoryName);
	}
	
	/*
	 * �������ŵ����������ţ���startNum����5��-���鿴���๦�ܣ�AJAXʵ�� - cancelled
	 */
	public List<News> getFiveNewsByCategory(String categoryName, int startNum) {
		return indexNewsMapper.getFiveNewsByCategory(categoryName, startNum);
	}
	

}
