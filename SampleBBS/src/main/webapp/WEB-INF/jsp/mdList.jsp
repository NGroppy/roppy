<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- ここから，インポート宣言 -->    
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import ="beans.MyData" %>
<%@page import="java.sql.Timestamp"%>
<!-- ここまで，インポート宣言 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mydataList</title>
</head>
<body>
	<label>記事一覧</label><br><br>
	
	<!-- 直前のサーブレットでrequestにsetAttributeしておいたオブジェクトを取り出す．
	普通に取り出すとObject型になってしまうので，適宜キャストして変数に受け取る． -->
	<%List<MyData> mdList = (List<MyData>)( request.getAttribute("mdList") );%>
	
	<!-- javaの文法とhtmlを組み合わせて，記事リストを表示 -->
	<%for(MyData md : mdList){%>
		<!-- <label><%=String.valueOf(md.getId() )%></label> <br> -->
		<!-- %の直後に=を付けると，そのまま値を表示できる．代わりに，<%out.print(md.getData());%>のように書くことも可能 -->
		<label>Data：<br><%=md.getData()%></label> <br>
		<label>Data2：<br><%=md.getData2()%></label> <br>
		<!-- 日時を指定のフォーマットで表示するための命令 -->
		<%SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");%>
		<label>登録日時：<br><%=sdf.format( md.getEntryDatetime() )%></label>
		<br>
		<br>
		<%} %>
</body>
</html>