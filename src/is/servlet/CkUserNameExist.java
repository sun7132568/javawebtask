package is.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import is.pojo.UserPojo;
import is.service.UserService;

public class CkUserNameExist extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService;

	public CkUserNameExist() {
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

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");

		UserPojo userPojo = userService.queryByUsername(username);
		if (userPojo.getUsername() != null) {
			out.println(false);
		} else {
			out.println(true);
		}

		out.flush();
		out.close();

	}

}
