package com.hubery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hubery.bean.Comment;
import com.hubery.bean.News;
import com.hubery.dao.CommentMapper;

public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentMapper commentMapper;

	@Override
	public List<Comment> getallComment(int id) {
		return commentMapper.getallComment(id);
	}

	@Override
	public News getByID(int id) {
		return commentMapper.getByID(id);
	}

	// 根据评论的id查找评论所有信息（与user表关联）
	public Comment getCommentByCommentId(int commentId) {
		return commentMapper.getCommentByCommentId(commentId);		
	}

	//给新闻增加评论
	public void addCommentToNews(Comment comment) {
		commentMapper.addCommentToNews(comment);		
	}

}
