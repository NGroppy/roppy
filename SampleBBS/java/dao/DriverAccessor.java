package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverAccessor {

	// データベースアクセスのための諸情報
	private final static String DRIVER_URL="jdbc:mysql://localhost:3306/samplebbs?characterEncoding=utf8&allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=GMT%2B9:00&rewriteBatchedStatements=true";
	private final static String DRIVER_NAME="com.mysql.cj.jdbc.Driver"; 
	private final static String USER_NAME="samplebbs"; // mysqlのユーザ名
	private final static String PASSWORD="bbspass"; // mysqlのパスワード

	// DBとのコネクションを作る
	public Connection createConnection(){
		try{
			Class.forName(DRIVER_NAME);
			Connection con=DriverManager.getConnection(DRIVER_URL,USER_NAME,PASSWORD);
			return con;
		} catch(ClassNotFoundException e) {
			// JDBCが見つからなかった場合
			System.out.println("Can't Find JDBC Driver.\n");
		} catch(SQLException e) {
			// 接続できない場合
			e.printStackTrace();
			System.out.println("Connection Error.\n");
		}
		return null;
	}

	// コネクションを閉じる
	public void closeConnection(Connection con){
		try{
			if(con != null) {
				con.close();
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
}