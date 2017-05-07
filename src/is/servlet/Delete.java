package is.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import is.service.UserService;

public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService;
    public Delete() {
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
		String username = request.getParameter("username");
		userService.delete(username);
		response.sendRedirect("UserQuery");
	}

}
