package com.hubery.bean;

/**
 * 用户表,存取用户的基本信息
 * @author Administrator
 *
 */
public class User {
	private int id;
	/**用户名**/

	private String userName;
	/**密码**/

	private String password;
	/**权限类别**/
	private String userRole;
	/**邮箱**/

	private String email;
	/**手机号**/
	private String telephone;




	public User() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", password="
				+ password + ", userRole=" + userRole + ", email=" + email
				+ ", telephone=" + telephone + "]";
	}



}
