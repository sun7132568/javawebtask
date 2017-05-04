package is.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
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
			PreparedStatement preparedStatement = null;
			String sql = "insert into user(userid,username,password,sex,phonenum,emailadd)" + " values(?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,userPojo.getUserid());
			preparedStatement.setString(2,userPojo.getUsername());
			preparedStatement.setString(3,userPojo.getPassword());
			preparedStatement.setString(4,userPojo.getSex());
			preparedStatement.setString(5,userPojo.getPhonenum());
			preparedStatement.setString(6,userPojo.getEmailadd());
			preparedStatement.executeUpdate();
			DBManager.close(preparedStatement);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void update(UserPojo userPojo) {
		try {
			PreparedStatement preparedStatement = null;
			String sql = "update user set userid=?,password=?,sex=?,phonenum=?,emailadd=? where username= ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,userPojo.getUserid());
			preparedStatement.setString(2,userPojo.getPassword());
			preparedStatement.setString(3,userPojo.getSex());
			preparedStatement.setString(4,userPojo.getPhonenum());
			preparedStatement.setString(5,userPojo.getEmailadd());
			preparedStatement.setString(6,userPojo.getUsername());
			preparedStatement.executeUpdate();
			DBManager.close(preparedStatement);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void delete(UserPojo userPojo){
		try {
			PreparedStatement preparedStatement = null;
			String sql = "delete from user where userid=? and username=?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,userPojo.getUserid());
			preparedStatement.setString(2,userPojo.getUsername());
			preparedStatement.executeUpdate();
			DBManager.close(preparedStatement);
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

