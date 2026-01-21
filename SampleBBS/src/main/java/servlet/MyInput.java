package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Mydata;
import dao.Dao;

/**
 * Servlet implementation class MyInput
 */
@WebServlet("/MyInput")
public class MyInput extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyInput() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//requestから受け取る値の文字コードをUTF-8に設定．これがないと，たまに文字化けする．
		request.setCharacterEncoding("UTF-8");
		
		//requestから，"id"というnameの値を取得
		String data = request.getParameter("data");
		//requestから，"password"というnameの値を取得
		//コンソールに表示
		
		//daoを使用したDBにdataを保存
		Dao dao=new Dao();
		dao.insertMyData(data);
		
		System.out.println("data ="+ data);
		
		List<Mydata> mdList =dao.getMyDataList();
		for(int i=0; i < mdList.size(); i++) {
			System.out.println(mdList.get(i).getId()
					+mdList.get(i).getData()
					+mdList.get(i).getEntryDataTime()
					);
		}
	}

}
