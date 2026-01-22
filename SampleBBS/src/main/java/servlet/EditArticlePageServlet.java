package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Article;
import dao.Dao;

@WebServlet("/EditArticlePageServlet")
public class EditArticlePageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/LoginPageServlet");
            return;
        }

        String userId = (String) session.getAttribute("userId");
        int articleId = Integer.parseInt(request.getParameter("articleId"));

        Dao dao = new Dao();
        Article article = dao.getArticleById(articleId);

        // 記事がない or 投稿者本人じゃない → 詳細に戻す
        if (article == null || !userId.equals(article.getEditorId())) {
            response.sendRedirect(request.getContextPath() + "/ArticleDetailServlet?articleId=" + articleId);
            return;
        }

        request.setAttribute("article", article);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/editArticle.jsp");
        rd.forward(request, response);
    }
}
