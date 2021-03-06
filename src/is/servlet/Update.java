package is.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import is.pojo.UserPojo;
import is.service.UserService;

public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService;

	public Update() {
		super();
		this.userService = new UserService();
	}

	public void destory() {
		super.destroy();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String phonenum = request.getParameter("phonenum");
		String emailadd = request.getParameter("emailadd");
		UserPojo userPojo = new UserPojo();		
		userPojo.setUserid(userid);
		userPojo.setUsername(username);
		userPojo.setPassword(password);
		userPojo.setSex(sex);
		userPojo.setPhonenum(phonenum);
		userPojo.setEmailadd(emailadd);
		userService.update(userPojo);

	}


}
