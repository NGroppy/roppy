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

            Article article = dao.getArticleById(articleId);
            List<Comment> commentList = cDao.findByArticleId(articleId);

            request.setAttribute("article", article);
            request.setAttribute("commentList", commentList);

            RequestDispatcher rd =
                request.getRequestDispatcher("/WEB-INF/jsp/articleDetail.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
//@WebServlet("/ArticleDetailServlet")
//public class ArticleDetailServlet extends HttpServlet {
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        System.out.println("[Detail] START");
//        System.out.println("[Detail] param articleId=" + request.getParameter("articleId"));
//
//        int articleId = Integer.parseInt(request.getParameter("articleId"));
//
//        try {
//            System.out.println("[Detail] before Dao");
//            Dao dao = new Dao();
//
//            System.out.println("[Detail] before getArticleById");
//            Article article = dao.getArticleById(articleId);
//            System.out.println("[Detail] after getArticleById");
//
//            System.out.println("[Detail] before CommentDao");
//            CommentDao cDao = new CommentDao();
//
//            System.out.println("[Detail] before findByArticleId");
//            List<Comment> commentList = cDao.findByArticleId(articleId);
//            System.out.println("[Detail] after findByArticleId");
//
//            request.setAttribute("article", article);
//            request.setAttribute("commentList", commentList);
//
//            System.out.println("[Detail] before forward");
//            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/articleDetail.jsp");
//            rd.forward(request, response);
//            System.out.println("[Detail] after forward");
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            throw new ServletException(e);
//        }
//    }
//}

