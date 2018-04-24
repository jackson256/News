package com.hubery.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hubery.bean.Comment;
import com.hubery.bean.News;
import com.hubery.bean.User;
import com.hubery.service.CommentService;
import com.hubery.service.NewsService;
import com.hubery.service.RegisterService;
import com.hubery.service.SearchService;
import com.hubery.service.UserService;

@Controller
public class ManageHandler {
	
	
	@Autowired
	private RegisterService reg;
	@Autowired
	private CommentService commentService;
	@Autowired
	private NewsService newsService;
	@Autowired
	private UserService userService;
	@Autowired
	private SearchService searchService;

	/**
	 * 进入后台管理系统
	 * @return
	 */
	@RequestMapping("manage")
	public ModelAndView manage(HttpServletRequest request){
		User user=(User)request.getSession().getAttribute("user");
		ModelAndView mav=new ModelAndView();
		if(user!=null){
			mav.setViewName("manage");
			return mav;
		}else{
			mav.setViewName("error");
			return mav;
		}
			
	}
	
	/**
	 * 退出
	 * @param req
	 * @return
	 */
	@RequestMapping("exit")
	public ModelAndView exit(HttpServletRequest req){
		//清空session
		req.getSession().invalidate();
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:index.jsp");
		return mav;
		
	}
	/**
	 * 修改密码
	 * @return
	 */
	@RequestMapping("update1")
	@ResponseBody
	public boolean update1(@RequestParam("password")String password,
			@RequestParam("rpassword")String rpassword,
			@RequestParam("rrpassword")String rrpassword,HttpServletRequest res){
		User u=(User)res.getSession().getAttribute("user");
		if(u.getPassword().equals(password)&&rpassword.equals(rrpassword)){
			u.setPassword(rpassword);
			reg.updatepwd(rpassword, u.getUserName());
			return true;
		}
		return false;
		
	}
	@RequestMapping("update-pwd")
	public ModelAndView update(HttpServletRequest res){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("update-pwd");
		return mav;
	}
	
	@RequestMapping("add")
	public ModelAndView add(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("add");
		return mav;
	}
	
	/**
	 * 查看用户自己的信息
	 * @return
	 */
	@RequestMapping("show-inf")
	public ModelAndView show_inf(HttpServletRequest req){
		ModelAndView mav=new ModelAndView();
		User user=(User)req.getSession().getAttribute("user");
		List<Comment> list=commentService.getallComment(user.getId());
		List<String> lis=new ArrayList<String>();
		for (Comment commen : list) {
			lis.add(commentService.getByID(commen.getNewsId()).getTitle());
		}
		List<News> news=newsService.getNews(user.getId());
		
		mav.addObject("news", news);
		
		mav.addObject("comment", list);
		mav.addObject("lis", lis);
		mav.setViewName("show-inf");
		return mav;
		
	}
	
	/**
	 * 对评论进行删除(遍历)
	 */
	@RequestMapping("delete_comment")
	public ModelAndView delete_comment(HttpServletRequest request){
		User user=(User)request.getSession().getAttribute("user");
		List<Comment> comment=commentService.getallComment(user.getId());
		List<String> title=new ArrayList<String>();
		for (Comment comm : comment) {
			title.add(newsService.getTitle(comm.getNewsId()));
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("comment", comment);
		mav.addObject("title", title);
		mav.setViewName("delete_comment");
		return mav;
	}
	
	/**
	 * 查看新闻（未使用）
	 */
	@RequestMapping("delete_News")
	public ModelAndView delete_News(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("delete_News");
		return mav;
	}
	/**
	 * 修改基本信息(跳转)
	 */
	@RequestMapping("update-inf")
	public ModelAndView update_inf(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("update-inf");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("update_inf")
	public boolean updateInf(User user,HttpServletRequest request){
		User u=(User)request.getSession().getAttribute("user");
		user.setId(u.getId());
		int i=userService.updateUserInf(user);
		if(i!=0){
			u.setEmail(user.getEmail());
			u.setTelephone(user.getTelephone());
			return true;
		}
		return false;
		
	}
	
	/**
	 * 删除新闻
	 */
	@ResponseBody
	@RequestMapping("delete-news")
	public boolean deletenews(int id){
		newsService.deleteCommentByNewsId(id);
		int i=newsService.deleteNews(id);
		if(i==0){
			return false;
		}
		return true;
		
	}
	/**
	 * 删除评论
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("delete-comment")
	public boolean deletecomment(int id){
		int i=newsService.deleteComment(id);
		if(i==0){
			return false;
		}
		return true;
		
	}
	
	/**
	 * 修改新闻(跳转)
	 * @return
	 */
	@RequestMapping("update-News")
	public ModelAndView updateNews(@RequestParam("id")int id){
		ModelAndView mav=new ModelAndView();
		News news=newsService.getNewsById(id);
		mav.addObject("id", id);
		mav.addObject("news", news);
		mav.setViewName("update_News");
		return mav;
		
	}
	/**
	 * 修改新闻(修改数据库)
	 */
	@ResponseBody
	@RequestMapping("update_News")
	public boolean update_News(News news){
		int i=newsService.updateNews(news);
		if(i!=0){
			return true;
		}
		return false;
		
	}
	
	/**搜索新闻(后台)
	 * @throws IOException */
	@RequestMapping("selectTitle")
	public ModelAndView selectTitle(HttpServletRequest request,HttpServletResponse res) throws IOException{
		ModelAndView mav=new ModelAndView();
		res.setContentType("text/html;charset=utf-8");
		User user=(User)request.getSession().getAttribute("user");
		String userRole=user.getUserRole();
		request.getParameter("title");
		if(userRole.equals("admin")){
			List<News> news=searchService.searchNewsByKeywords(request.getParameter("title"));
			List<String> nameList=new ArrayList<String>();
			for (News n : news) {
				nameList.add(userService.getNameById(n.getUserId()));
			}
			mav.addObject("news", news);
			mav.addObject("nameList", nameList);
			mav.setViewName("delete_News");
			return mav;
		}else{
			res.getWriter().print("<script type='text/javascript'>alert('无访问权限');window.history.back();</script>");
			return null;
		}
		
	}
}
