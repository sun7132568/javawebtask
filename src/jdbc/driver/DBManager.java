package jdbc.driver;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBManager {
	private static String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private static String JDBC_URL = "jdbc:mysql://localhost/users?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false";
	private static String JDBC_USER = "root";
	private static String JDBC_PASSWORD = "123456";

	private static boolean registerDriver() {
		boolean bRegisterFlag = false;
		Driver driver = null;
		try {
			driver = (Driver) Class.forName(JDBC_DRIVER).newInstance();
			DriverManager.registerDriver(driver);
			bRegisterFlag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bRegisterFlag;
	}

	public static synchronized Connection getConnection() throws SQLException {
		if (registerDriver()) {
			return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
		} else
			return null;
	}

	public static void close(Connection conn) {
		try {
			if (conn != null)
				conn.close();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}

	public static void close(Statement stmt) {
		try {
			if (stmt != null)
				stmt.close();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}

	public static void close(ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}

	}
}
