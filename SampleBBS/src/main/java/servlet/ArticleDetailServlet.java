package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Article;
import beans.Comment;
import dao.CommentDao;
import dao.Dao;

@WebServlet("/ArticleDetailServlet")
public class ArticleDetailServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int articleId = Integer.parseInt(request.getParameter("articleId"));

        try {
            Dao dao = new Dao();
            CommentDao cDao = new CommentDao();

            // 記事とコメントを取得
            Article article = dao.getArticleById(articleId);
            List<Comment> commentList = cDao.findByArticleId(articleId);

            // --- お気に入り判定（必ずforwardの前に記述） ---
            String userId = (String) request.getSession().getAttribute("userId");
            boolean isFav = false;
            if (userId != null) {
                isFav = dao.isFavorite(userId, articleId);
            }
            
            // JSPへ渡すデータをセット
            request.setAttribute("article", article);
            request.setAttribute("commentList", commentList);
            request.setAttribute("isFavorite", isFav);

            // 最後に画面遷移
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/articleDetail.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}