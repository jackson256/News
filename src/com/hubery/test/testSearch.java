package com.hubery.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.hubery.bean.News;
import com.hubery.service.SearchService;

public class testSearch {
private ApplicationContext applicationcontext;
@Before
public void init(){
	String[] path={"spring/applicationContext-dao.xml",
			"spring/applicationContext-service.xml",
			"spring/applicationContext.xml"};
	applicationcontext=new ClassPathXmlApplicationContext(path);
}
@Test
public void test(){
	SearchService search =(SearchService)applicationcontext.getBean("searchService");
	List<News>list=search.searchNewsByKeywords("24");
	for (News newss : list) {
		System.out.println(newss);
	}

}
}
