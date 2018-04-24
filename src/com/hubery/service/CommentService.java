package com.hubery.service;

import java.util.List;

import com.hubery.bean.Comment;
import com.hubery.bean.News;

public interface CommentService {
	/** 根据用户id查询评论信息 */
	public List<Comment> getallComment(int id);

	/** 根据新闻id查询新闻表中的信息 */
	public News getByID(int id);

	// 根据评论的id查找评论所有信息（与user表关联）
	public Comment getCommentByCommentId(int commentId);
	
	//添加Comment
	public void addCommentToNews(Comment comment);

}
