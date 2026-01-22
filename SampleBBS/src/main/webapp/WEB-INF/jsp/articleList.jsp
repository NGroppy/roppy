<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import ="beans.Article" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article list page</title>
</head>
<body>

<%
    if (session.getAttribute("userId") != null) {
%>
    <div style="position: absolute; top: 10px; left: 10px;">
        <form action="LogoutServlet" method="get">
            <button type="submit">ログアウト</button>
        </form>
    </div>
    <br><br>
<%
    }
%>

<label>記事一覧</label><br><br>

<a href="./UpdateUserPageServletAns">ユーザ情報更新</a><br><br>
<a href="./EntryArticlePageServlet">新規記事登録</a><br><br>

<%
List<Article> aList = (List<Article>) request.getAttribute("articleList");
if (aList != null) {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    for (Article a : aList) {
%>
        <!-- タイトルを「詳細ページへのリンク」にする -->
        <label>タイトル：<br>
            <a href="<%= request.getContextPath() %>/ArticleDetailServlet?articleId=<%= a.getId() %>">
    			<%= a.getTitle() %>
			</a>

        </label>
        <br>

        <label>本文：<br><%= a.getBody() %></label><br>
        <label>登録者：<br><%= a.getEditorId() %></label><br>
        <label>登録日時：<br><%= sdf.format(a.getEntryDatetime()) %></label>
        <br><br>
<%
    }
}
%>

</body>
</html>
