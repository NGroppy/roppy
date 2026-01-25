package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Comment;
import dao.CommentDao;

@WebServlet("/AddCommentServlet")
public class AddCommentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        int articleId = Integer.parseInt(request.getParameter("articleId"));
        String body = request.getParameter("body");
        String userId = (String) request.getSession().getAttribute("userId");

        Comment c = new Comment();
        c.setArticleId(articleId);
        c.setUserId(userId);
        c.setBody(body);

        try {
            CommentDao dao = new CommentDao();
            dao.insert(c);
            response.sendRedirect(request.getContextPath()
                    + "/ArticleDetailServlet?articleId=" + articleId);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
