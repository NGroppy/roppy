package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Article;
import dao.Dao;

@WebServlet("/ArticleListServlet")
public class ArticleListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ArticleListServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        Dao dao = new Dao();

        // 検索クエリの処理
        String q = request.getParameter("q");
        List<Article> aList;

        if (q != null && !q.trim().isEmpty()) {
            aList = dao.searchArticleList(q.trim());
        } else {
            aList = dao.getArticleList();
        }

        // --- お気に入りIDリストの取得処理を追加 ---
        String userId = (String) request.getSession().getAttribute("userId");
        List<Integer> favIds = new ArrayList<Integer>();
        if (userId != null) {
            favIds = dao.getFavoriteArticleIds(userId);
        }

        // JSPへ渡すデータをセット
        request.setAttribute("articleList", aList);
        request.setAttribute("favIds", favIds); // 追加

        RequestDispatcher dispatcher =
            request.getRequestDispatcher("/WEB-INF/jsp/articleList.jsp");
        dispatcher.forward(request, response);
    }
}