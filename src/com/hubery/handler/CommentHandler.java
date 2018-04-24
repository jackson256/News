package com.hubery.handler;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hubery.bean.Comment;
import com.hubery.bean.User;
import com.hubery.service.CommentService;

@Controller
public class CommentHandler {

	@Autowired
	private CommentService commentService;
	
	/*
	 * Ìí¼Ócomment
	 */
	@RequestMapping("addComment")
	@ResponseBody
	public void addComment(String content,String submitTime,String newsId,HttpServletRequest request){		
		User user = (User) request.getSession().getAttribute("user");
		Comment comment = new Comment();
		comment.setContent(content);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date convertSubmitTime = null;
		try {
			convertSubmitTime = sdf.parse(submitTime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		comment.setSubmitTime(convertSubmitTime);
		comment.setNewsId(Integer.parseInt(newsId));
		comment.setUserId(user.getId());
		commentService.addCommentToNews(comment);
	}

}
