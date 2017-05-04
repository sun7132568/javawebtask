package is.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.PrintWriter;

public class CkState extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CkState() {
		super();

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
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		if (session.getAttribute("username") == null || session.getAttribute("username").equals("null")) {
			String text = "<button type='button' class='btn navbar-btn' data-toggle='modal'"
					+ "data-target='#Modal' style='margin-right: 15px;'>登录</button>"
					+ "<button type='button' class='btn navbar-btn'"
					+ "onclick=\"window.location.href='register.html'\"" + "style='margin-right: 20px;'>注册</button>";
			out.println(text);
		} else {
			String text = "<ul class='nav navbar-nav'>" + "<li class='dropdown'>"
					+ "<a href='#' class='dropdown-toggle' id='usrname' data-toggle='dropdown' role='button' aria-expanded='false'>"
					+session.getAttribute("username")
					+ "<span class='caret'></span></a>" + "<ul class='dropdown-menu' role='menu'>"
					+ "<li><a href='#'>修改信息</a></li>" + "<li><a href='#'>借阅查询</a></li>" + "<li class='divider'></li>"
					+ "<li><a href='Login?method=logout'>退出登录</a></li>" + "</ul></li>" + "</ul>";
			out.println(text);
		}

	}

}
