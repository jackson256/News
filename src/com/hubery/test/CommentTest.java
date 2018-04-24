package com.hubery.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.hubery.bean.Comment;
import com.hubery.service.CommentService;

public class CommentTest {
	private ApplicationContext app;
	@Before
	public void t(){
		String[] path={"spring/applicationContext-dao.xml",
				"spring/applicationContext-service.xml",
				"spring/applicationContext.xml"};
		app=new ClassPathXmlApplicationContext(path);
	}
	
	/**���Բ�ѯ���getall*/
	@Test
	public void getall(){
		SimpleDateFormat bartDateFormat = new SimpleDateFormat
  				("yyyy-MM-dd HH:mm:ss"); 
		CommentService comment=(CommentService)app.getBean("commentService");
		List<Comment> co=comment.getallComment(2);
		for (Comment cc : co) {
			System.out.println(bartDateFormat.format(cc.getSubmitTime()));
			System.out.println(cc.getSubmitTime());
		}
	}
	
	// �������۵�id��������������Ϣ����user�������
	@Test
	public void getCommentByCommentIdTest(){		
		CommentService service=(CommentService)app.getBean("commentService");
		Comment comment = service.getCommentByCommentId(11);
		System.out.println(comment.getContent());
		System.out.println(comment.getUser().getUserName());
	}
	
	// ��������������
		@Test
		public void addCommentToNewsTest() throws ParseException{		
			CommentService service=(CommentService)app.getBean("commentService");
			Comment comment = new Comment();
			comment.setContent("�����ˡ�����");
			comment.setNewsId(11);
			comment.setUserId(4);
			String date = "2017-3-23";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date submitTime = sdf.parse(date);
			comment.setSubmitTime(submitTime);
			service.addCommentToNews(comment);
		}
}
