package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.User;
import dao.Dao;

@WebServlet("/UpdateUserPageServletAns")
public class UpdateUserPageServletAns extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/LoginPageServlet"); // ログイン導線に合わせて
            return;
        }

        String userId = (String) session.getAttribute("userId");
        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/LoginPageServlet");
            return;
        }

        Dao dao = new Dao();
        User user = dao.getUserById(userId);

        request.setAttribute("user", user);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/updateUserAns.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
