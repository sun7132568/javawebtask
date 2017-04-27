package is.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import is.pojo.UserPojo;
import jdbc.driver.DBManager;

public class UserDao {
	private Connection connection;
	
	public UserDao() {
	try {
		this.connection = DBManager.getConnection();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}
	public void create(UserPojo userPojo) {
		try {
			Statement statement = connection.createStatement();
			String sql = "insert into user(userid,username,password,sex,phonenum,emailadd)" + " values('"
					+ userPojo.getUserid() + "','" + userPojo.getUsername() + "','" + userPojo.getPassword() + "','"
					+ userPojo.getSex() + "','" + userPojo.getPhonenum() + "','" + userPojo.getEmailadd() + "')";
			statement.executeUpdate(sql);
			DBManager.close(statement);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void update(UserPojo userPojo) {
		try {
			Statement statement = connection.createStatement();
			String sql = "update user set userid= '" + userPojo.getUserid() + "',password='" + userPojo.getPassword() + "',sex='"
					+ userPojo.getSex() + "',phonenum='" + userPojo.getPhonenum() + "',emailadd='" 
					+ userPojo.getEmailadd() + "' where username='"+userPojo.getUsername()+"'";
			statement.executeUpdate(sql);
			DBManager.close(statement);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void delete(UserPojo userPojo){
		try {
			Statement statement = connection.createStatement();
			String sql = "delete from user where userid='"+userPojo.getUserid()+"' and username='"+userPojo.getUsername()+"'";
			statement.executeUpdate(sql);
			DBManager.close(statement);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public UserPojo queryByUsername(String usrname){
		UserPojo userPojo = new UserPojo();
		try {
			Statement statement = connection.createStatement();
			String sql = "select * from user where username = '" + usrname + "'";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				String userid = rs.getString("userid");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String sex = rs.getString("sex");
				String phonenum = rs.getString("phonenum");
				String emailadd = rs.getString("emailadd");
				
				userPojo.setUserid(userid);
				userPojo.setUsername(username);
				userPojo.setPassword(password);
				userPojo.setSex(sex);
				userPojo.setPhonenum(phonenum);
				userPojo.setEmailadd(emailadd);
			}
				DBManager.close(rs);
				DBManager.close(statement);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return userPojo;
	}	
	
	public List<UserPojo> queryAll() {
		List<UserPojo> userPojos = new ArrayList<UserPojo>();
		try {
			Statement statement = connection.createStatement();
			String sql = "select * from user ";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				UserPojo userPojo = new UserPojo();
				String userid = rs.getString("userid");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String sex = rs.getString("sex");
				String phonenum = rs.getString("phonenum");
				String emailadd = rs.getString("emailadd");
				
				userPojo.setUserid(userid);
				userPojo.setUsername(username);
				userPojo.setPassword(password);
				userPojo.setSex(sex);
				userPojo.setPhonenum(phonenum);
				userPojo.setEmailadd(emailadd);
				userPojos.add(userPojo);
			}
				DBManager.close(rs);
				DBManager.close(statement);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userPojos;
		
	}
	public void close() {
		DBManager.close(connection);
	}
}

