package is.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import is.pojo.UserPojo;
import is.service.UserService;


public class Modify extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService;
  
    public Modify() {
        super();
        this.userService = new UserService();
        
    }
    public void destory() {
		super.destroy();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		UserPojo userPojo = userService.queryByUsername(username);
		request.setAttribute("userInfo", userPojo);
		HttpSession session = request.getSession();
		UserPojo uPojo = (UserPojo)session.getAttribute("userInfo");
		if(uPojo.getUserid() == "1" || uPojo.getUserid().equals("1")){
		request.getRequestDispatcher("modify_admin.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("modify_ghost.jsp").forward(request, response);
		}
		}

}
