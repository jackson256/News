package com.hubery.bean;

import java.util.Date;

/**
 * 评论表 用于存取评论的所有信息
 * 
 * @author Administrator
 * 
 */
public class Comment {
	private int id;
	/** 评论内容 */
	private String content;
	/** 评论时间 */
	private Date submitTime;
	/** 评论人Id */
	private int userId;
	/** 所属新闻id */
	private int newsId;
	/** 评论人(关联查询) */
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
