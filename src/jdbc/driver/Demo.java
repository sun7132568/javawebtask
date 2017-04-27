package jdbc.driver;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import com.sun.jndi.url.iiopname.iiopnameURLContextFactory;

import is.pojo.UserPojo;
import is.service.UserService;

//import is.pojo.UserPojo;
//import is.service.UserService;

public class Demo {
	private UserService userService;
	public Demo() {
		this.userService = new UserService();
	}
	public static void main(String[] args) {
		/*try {
			Connection connection = DBManager.getConnection();
			Statement statement = connection.createStatement();
			String sql="select * from user";
			ResultSet rSet = statement.executeQuery(sql);
			while(rSet.next()){
				System.out.print(rSet.getString(1)+"\t");
				System.out.print(rSet.getString(2)+"\t");
				System.out.print(rSet.getString(3)+"\t");
				System.out.print(rSet.getString(4)+"\t");
				System.out.print(rSet.getString(5)+"\t");
				System.out.print(rSet.getString(6)+"\t");
				
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}*/
		
	/*	 UserService userService = new UserService(); 
		UserPojo userPojo = userService.queryByUsername("sunpeng2");
		if(userPojo.getUsername() != null || "".equals(userPojo.getUsername()))
			System.out.println("okay");
		else 
			System.out.println("error");
				
			*/
		Demo demo = new Demo();
		List<UserPojo>userPojos = demo.userService.queryAll();	
		System.out.println(userPojos.get(0).getUsername());
		
		
	}
}
