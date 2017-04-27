package is.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import is.pojo.UserPojo;
import is.service.UserService;

/**
 * Servlet implementation class UserQuery
 */
public class UserQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserQuery() {
        super();
        this.userService = new UserService();
        // TODO Auto-generated constructor stub
    }
    public void destory() {
		super.destroy();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<UserPojo> userPojos = userService.queryAll();
		request.setAttribute("userPojos", userPojos);
		request.getRequestDispatcher("userQuery.jsp").forward(request, response);
	}

}
