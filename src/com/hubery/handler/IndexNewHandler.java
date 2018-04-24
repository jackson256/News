package com.hubery.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hubery.bean.Comment;
import com.hubery.bean.News;
import com.hubery.service.CommentService;
import com.hubery.service.IndexNewsService;
import com.hubery.service.SearchService;

@Controller
public class IndexNewHandler {

	@Autowired
	private IndexNewsService indexNewsService;
	@Autowired
	private SearchService searchService;
	@Autowired
	private CommentService commentService;

	/**
	 * ��ȡ��������ǰ5�����ţ��������map���Ϸ��ء�keyΪ���,String;valueΪ5��News��List����
	 * 
	 * @return
	 */
	@RequestMapping("getLatestFiveNewsByCategory")
	public @ResponseBody Map<String, List<News>> getLatestFiveNewsByCategory() {
		Map<String, List<News>> map = new HashMap<String, List<News>>();
		String[] categories = new String[] { "focus", "entertainment",
				"finance", "military", "sports", "education", "politics",
				"culture" };
		for (String string : categories) {
			List<News> list = indexNewsService.getLatestFiveNewsByCategory(string);
			for (News news : list) {
				if(news.getTitle().length()>23){
					news.setTitle(news.getTitle().substring(0,20).concat("..."));
				}
			}
			map.put(string, list);
		}
		return map;
	}

	/**
	 * �õ����µ�ǰ6�����ţ������ű�����ʾ����ҳ->���������
	 */
	@RequestMapping("getLatestNews")
	public @ResponseBody List<News> getLatestNews() {
		List<News> list = indexNewsService.getLatestNews();
		for (News news : list) {
			if(news.getTitle().length()>23){
				news.setTitle(news.getTitle().substring(0,20).concat("..."));
			}
		}		
		return list;
	}

	/**
	 * ��ѯ��������ߵ�18�����ţ������ű�����ʾ����ҳ->�ر��ע
	 */
	@RequestMapping("getPopularNews")
	public @ResponseBody List<News> getPopularNews() {
		List<News> list = indexNewsService.getPopularNews();
		for (News news : list) {
			if(news.getTitle().length()>23){
				news.setTitle(news.getTitle().substring(0,20).concat("..."));
			}
		}
		return list;
	}

	/**
	 * ��ID�������ţ�����������Ϣ��
	 */
	@RequestMapping("getNewsById")
	public ModelAndView getPopularNews(@RequestParam("id")int id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("newsShowPage");
		News news = indexNewsService.getNewsById(id);
		mav.addObject("news", news);
		List<Comment> list = news.getComments();
		List<Comment> commentList = new ArrayList<Comment>();
		
		/* ����װ��commentList,ʹ���µ�������ʾ����ǰ�� */
		for(int i=list.size()-1;i>=0;i--){
			Comment comment = list.get(i);
			/*commentList�������۷����˵���Ϣ*/
			comment = commentService.getCommentByCommentId(comment.getId());
			commentList.add(comment);			
		}		
		mav.addObject("commentList", commentList);
		return mav;
	}

	/**
	 * ����������������
	 */
	@RequestMapping("getNewsByCategory")
	public ModelAndView getNewsByCategory(String categoryName) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("newsSearchResultPage");
		List<News> newsList = indexNewsService.getNewsByCategory(categoryName);		
		for (News news : newsList) {
			if (news.getContent().length() > 100) {
				String subContent = news.getContent().substring(0, 100)
						.concat("...");
				news.setContent(subContent);
			}			
		}
		int totalPage = (int) Math.ceil(newsList.size()/5);
		mav.addObject("newsList", newsList);
		mav.addObject("categoryName", categoryName);
		mav.addObject("totalPage", totalPage);
		return mav;
	}
	
	/*�鿴���๦�ܣ�AJAXʵ�� - cancelled*/
	@RequestMapping("getFiveNewsByCategory")
	public ModelAndView getNewsByCategoryTest(@RequestParam("categoryName")String categoryName,
			@RequestParam(value="startNum",defaultValue="0")Integer startNum) {
		ModelAndView mav = new ModelAndView();
		System.out.println("������������������������������������������������������������������");
		mav.setViewName("newsSearchResultPage");
		List<News> newsList = indexNewsService.getFiveNewsByCategory(categoryName, startNum);
		for (News news : newsList) {
			if (news.getContent().length() > 100) {
				String subContent = news.getContent().substring(0, 100).concat("...");
				news.setContent(subContent);
			}
		}
		mav.addObject("newsList", newsList);
		mav.addObject("categoryName", categoryName);
		return mav;
	}
	

}
