package com.hubery.service;

import java.util.List;

import com.hubery.bean.Comment;
import com.hubery.bean.News;

public interface CommentService {
	/** �����û�id��ѯ������Ϣ */
	public List<Comment> getallComment(int id);

	/** ��������id��ѯ���ű��е���Ϣ */
	public News getByID(int id);

	// �������۵�id��������������Ϣ����user�������
	public Comment getCommentByCommentId(int commentId);
	
	//���Comment
	public void addCommentToNews(Comment comment);

}
