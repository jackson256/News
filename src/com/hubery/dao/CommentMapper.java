package com.hubery.dao;

import java.util.List;

import com.hubery.bean.Comment;
import com.hubery.bean.News;

public interface CommentMapper {
	
	/** �����û�id��ѯ������Ϣ */
	public List<Comment> getallComment(int id);

	/** ��������id��ѯ���ű��е���Ϣ */
	public News getByID(int id);

	// �������۵�id��������������Ϣ����user�������-huhan
	public Comment getCommentByCommentId(int commentId);
	
	//�������������
	public void addCommentToNews(Comment comment);

}
