package is.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import is.pojo.UserPojo;
import is.service.UserService;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService;

	@Override
	public void init() throws ServletException {
		userService = new UserService();
	}

	public Register() {
		super();
	}

	public void destory() {
		this.destroy();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String phonenum = request.getParameter("phonenum");
		String emailadd = request.getParameter("emailadd");
	
			UserPojo userPojo = new UserPojo();
			String userid = "0";
			userPojo.setUserid(userid);
			userPojo.setUsername(username);
			userPojo.setPassword(password);
			userPojo.setSex(sex);
			userPojo.setPhonenum(phonenum);
			userPojo.setEmailadd(emailadd);
			
			userService.create(userPojo);
		}	
}
