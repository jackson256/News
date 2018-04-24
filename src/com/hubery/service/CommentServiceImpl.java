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

	// �������۵�id��������������Ϣ����user�������
	public Comment getCommentByCommentId(int commentId) {
		return commentMapper.getCommentByCommentId(commentId);		
	}

	//��������������
	public void addCommentToNews(Comment comment) {
		commentMapper.addCommentToNews(comment);		
	}

}
