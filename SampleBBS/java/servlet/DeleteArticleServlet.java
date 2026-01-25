package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;

@WebServlet("/DeleteArticleServlet")
public class DeleteArticleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/LoginPageServlet");
            return;
        }

        String userId = (String) session.getAttribute("userId");
        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/LoginPageServlet");
            return;
        }

        int articleId = Integer.parseInt(request.getParameter("articleId"));

        Dao dao = new Dao();
        dao.deleteArticleById(articleId, userId);

        // 削除後は一覧へ
        response.sendRedirect(request.getContextPath() + "/ArticleListServlet");
    }
}
