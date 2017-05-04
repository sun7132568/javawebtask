package is.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;

import is.pojo.UserPojo;
import is.service.UserService;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService;
	private String flag;

	public Login() {
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
		String method = request.getParameter("method");
		if(method == "login" || method.equals("login")){
			login(request, response);
		}else if(method == "logout" || method.equals("logout")){
			logout(request, response);
		}else {
			response.sendError(404);
		}

	}

	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String usrname = request.getParameter("username");
		String passwd = request.getParameter("password");
		String identity = request.getParameter("identity");
		UserPojo userPojo = userService.queryByUsername(usrname);
		String userid = userPojo.getUserid();
		if (passwd.equals(userPojo.getPassword())) {
			if (userid == "1" || userid.equals("1")) {
				if (identity == "admin" || identity.equals("admin"))
					flag = "0";
				else
					flag = "2";

			} else if (userid == "0" || userid.equals("0")) {
				if (identity == "ghost" || identity.equals("ghost"))
					flag = "1";
				else
					flag = "2";
			}
		} else
			flag = "error";

		JsonObject json = new JsonObject();
		json.addProperty("flag", flag);
		json.addProperty("username", usrname);
		out.println(json);
		out.flush();
		out.close();

		if (flag == "0" || flag == "1") {
			HttpSession session = request.getSession();
			List<UserPojo> list = new ArrayList<>();
			list.add(userPojo);
			session.setAttribute("userInfo", list);
			session.setAttribute("username", usrname);
		}
	}
	public void logout(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("index.jsp");
	}
}
