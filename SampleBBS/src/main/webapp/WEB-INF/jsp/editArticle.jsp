<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="beans.Article" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>記事編集</title>
</head>
<body>

<%
Article article = (Article) request.getAttribute("article");
if (article == null) {
%>
  <p>記事が取得できませんでした。</p>
  <a href="<%= request.getContextPath() %>/ArticleListServlet">記事一覧へ</a>
<%
  return;
}
%>

<h2>記事編集</h2>

<form action="<%= request.getContextPath() %>/UpdateArticleServlet" method="post">
  <input type="hidden" name="articleId" value="<%= article.getId() %>">

  <p>
    タイトル<br>
    <input type="text" name="title" size="60" value="<%= article.getTitle() %>" required>
  </p>

  <p>
    本文<br>
    <textarea name="body" rows="10" cols="60" required><%= article.getBody() %></textarea>
  </p>

  <button type="submit">更新</button>
</form>

<br>
<a href="<%= request.getContextPath() %>/ArticleDetailServlet?articleId=<%= article.getId() %>">← 記事詳細へ戻る</a>

</body>
</html>
