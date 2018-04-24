package com.hubery.bean;

/**
 * 内别表
 * 标注留言和新闻的类别
 * @author Administrator
 *
 */
public class Category {
	private int id;
	/**类别名*/
	private String name;
	
	public Category(){}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + "]";
	}
	
	
}
