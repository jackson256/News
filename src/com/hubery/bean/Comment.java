package com.hubery.bean;

import java.util.Date;

/**
 * ���۱� ���ڴ�ȡ���۵�������Ϣ
 * 
 * @author Administrator
 * 
 */
public class Comment {
	private int id;
	/** �������� */
	private String content;
	/** ����ʱ�� */
	private Date submitTime;
	/** ������Id */
	private int userId;
	/** ��������id */
	private int newsId;
	/** ������(������ѯ) */
	private User user;

	public Comment() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getNewsId() {
		return newsId;
	}

	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}

	public Date getSubmitTime() {
		return submitTime;
	}

	public void setSubmitTime(Date submitTime) {
		this.submitTime = submitTime;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
