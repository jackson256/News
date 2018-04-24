package com.hubery.bean;

import java.util.Date;
import java.util.List;

/**
 * ���ű� ���ڼ�¼���е�������Ϣ
 * 
 * @author Administrator
 * 
 */
public class News {
	private int id;
	private String title;
	private String content;
	private Date createTime;
	private int categoryId;
	private int userId;
	private int visits;

	// �������۱� 1�Զ�
	private List<Comment> comments;
	// �����û��� 1��1
	private User user;
	// �������� 1��1
	private Category category;

	public News() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getVisits() {
		return visits;
	}

	public void setVisits(int visits) {
		this.visits = visits;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "News [id=" + id + ", title=" + title + ", content=" + content
				+ ", createTime=" + createTime + ", categoryId=" + categoryId
				+ ", userId=" + userId + ", visits=" + visits + "]";
	}
}
