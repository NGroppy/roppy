package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.MyData;
import dao.Dao;

/**
 * Servlet implementation class MyDataListServlet
 */
@WebServlet("/MyDataListServlet")
public class MyDataListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyDataListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
  //POSTアクセスされた場合は，doGetに丸投げ
  	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		doGet(request,response);
  	}
  	
  	//GETアクセスされた場合に動作
  	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		//DBアクセスのためのクラスをインスタンス化
  		Dao dao = new Dao();
  		//すべての記事のリストを取得．MyData(記事)クラスはbeansパッケージに宣言してある．
  		List<MyData> mdList = dao.getMyDataList();

  		//requestに記事リストを格納．
  		request.setAttribute("mdList" , mdList);

  		//./WEB-INF/jsp/articleList.jspを表示
  		RequestDispatcher dispatcher = request.getRequestDispatcher("./WEB-INF/jsp/mdList.jsp");
  		dispatcher.forward(request, response);
  	}

}
