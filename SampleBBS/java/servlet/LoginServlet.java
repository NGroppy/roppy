package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.User;
import dao.Dao;

//SampleBBS/LoginServletにアクセスされると動作
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String password = request.getParameter("password");

		Dao dao = new Dao();
		User user = dao.getUserById(id);

		if (user != null && user.getPassword().equals(password)) {
			request.getSession().setAttribute("userId", id);
			response.sendRedirect(request.getContextPath() + "/ArticleListServlet");
		} else {
			request.setAttribute("loginError", "IDまたはパスワードが違います");
			RequestDispatcher dispatcher =
				request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
			dispatcher.forward(request, response);
		}
	}
}
