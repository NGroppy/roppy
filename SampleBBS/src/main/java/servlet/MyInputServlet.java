package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.MyData;
import dao.Dao;

/**
 * Servlet implementation class MyInputServlet
 */
@WebServlet("/MyInputServlet")
public class MyInputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyInputServlet() {
        super();
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//requestから受け取る値の文字コードをUTF-8に設定．これがないと，たまに文字化けする．
		request.setCharacterEncoding("UTF-8");
		
		//requestから，"data"というnameの値を取得
		String data = request.getParameter("data");
		String number=request.getParameter("number");
		String price=request.getParameter("price");
		
		//
		Dao dao=new Dao();
		
		dao.insertMyData(data,"固定値");
		dao.insertMyData(number,"固定値");
		dao.insertMyData(price,"固定値");

		
		//コンソールにdataを表示
		System.out.println("data = "+data);
		System.out.println("number= "+number);
		System.out.println("price= "+price);
		
		List<MyData> mdList=dao.getMyDataList();
		
		for(int i=0;i<mdList.size();i++) {
			System.out.println(mdList.get(i).getId()
					+mdList.get(i).getData()
					+mdList.get(i).getData2()
					+mdList.get(i).getEntryDatetime()
					);
		}
		
	}

}
