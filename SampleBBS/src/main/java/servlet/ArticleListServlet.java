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

        String q = request.getParameter("q");
        String mode = request.getParameter("mode"); 
        //「お気に入り表示」かどうかの判定用
        String userId = (String) request.getSession().getAttribute("userId");

        List<Article> aList;

        //表示するリストの判定
        if ("fav".equals(mode) && userId != null) {
            //お気に入り一覧モード
            aList = dao.getFavoriteArticles(userId);
        } else if (q != null && !q.trim().isEmpty()) {
            //検索モード
            aList = dao.searchArticleList(q.trim());
        } else {
            //通常の全件表示モード
            aList = dao.getArticleList();
        }

        //お気に入り星マーク判定用のIDリスト取得
        List<Integer> favIds = new ArrayList<>();
        if (userId != null) {
            favIds = dao.getFavoriteArticleIds(userId);
        }

        request.setAttribute("articleList", aList);
        request.setAttribute("favIds", favIds);
        request.setAttribute("mode", mode); // 今どのモードかJSPに伝える

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/articleList.jsp");
        dispatcher.forward(request, response);
    }
}