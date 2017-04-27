package is.pojo;

import java.io.Serializable;

public class UserPojo implements Serializable {
	private static final long serialVersionUID = 1L;
	private String userid;
	private String username;
	private String password;
	private String sex;
	private String phonenum;
	private String emailadd;

	public UserPojo() {
	}

	
	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getPhonenum() {
		return phonenum;
	}


	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}


	public String getEmailadd() {
		return emailadd;
	}


	public void setEmailadd(String emailadd) {
		this.emailadd = emailadd;
	}


}
