package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;

/**
 * Servlet implementation class FavoriteServlet
 */
@WebServlet("/FavoriteServlet")
public class FavoriteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String userId = (String) request.getSession().getAttribute("userId");
        int articleId = Integer.parseInt(request.getParameter("articleId"));
        String action = request.getParameter("action"); // "add" or "remove"

        Dao dao = new Dao();
        if ("add".equals(action)) {
            dao.insertFavorite(userId, articleId);
        } else {
            dao.deleteFavorite(userId, articleId);
        }

        // 元の記事詳細ページに戻る
        response.sendRedirect("ArticleDetailServlet?articleId=" + articleId);
    }
}
