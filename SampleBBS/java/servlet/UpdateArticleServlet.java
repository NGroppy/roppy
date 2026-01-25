package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;

@WebServlet("/UpdateArticleServlet")
public class UpdateArticleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/LoginPageServlet");
            return;
        }

        String userId = (String) session.getAttribute("userId");

        int articleId = Integer.parseInt(request.getParameter("articleId"));
        String title = request.getParameter("title");
        String body = request.getParameter("body");

        // 最低限のバリデーション
        if (title == null || title.trim().isEmpty() || body == null || body.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/EditArticlePageServlet?articleId=" + articleId);
            return;
        }

        Dao dao = new Dao();
        dao.updateArticle(articleId, title, body, userId);

        response.sendRedirect(request.getContextPath() + "/ArticleDetailServlet?articleId=" + articleId);
    }
}
