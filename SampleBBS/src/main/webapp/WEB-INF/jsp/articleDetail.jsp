<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="beans.Article" %>
<%@ page import="beans.Comment" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article detail</title>
</head>
<body>

<!-- ログアウト（ログイン中のみ） -->
<%
if (session.getAttribute("userId") != null) {
%>
  <div style="position: absolute; top: 10px; left: 10px;">
    <form action="<%= request.getContextPath() %>/LogoutServlet" method="get">
      <button type="submit">ログアウト</button>
    </form>
  </div>
  <br><br>
<%
}
%>

<!-- 一覧に戻る -->
<a href="<%= request.getContextPath() %>/ArticleListServlet">← 記事一覧へ戻る</a>
<br><br>

<%
Article article = (Article) request.getAttribute("article");
List<Comment> commentList = (List<Comment>) request.getAttribute("commentList");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

if (article == null) {
%>
  <p>記事が見つかりませんでした。</p>
<%
} else {
%>
  <h2><%= article.getTitle() %></h2>
  <p><%= article.getBody() %></p>

  <p>登録者：<%= article.getEditorId() %></p>
  <p>登録日時：<%= sdf.format(article.getEntryDatetime()) %></p>

  <hr>

  <h3>コメント</h3>

  <%
  if (commentList == null || commentList.size() == 0) {
  %>
    <p>コメントはまだありません。</p>
  <%
  } else {
      for (Comment c : commentList) {
  %>
    <div style="border-bottom: 1px solid #ccc; padding: 6px 0;">
      <div><%= c.getBody() %></div>
      <small><%= c.getUserId() %> / <%= sdf.format(c.getCreatedAt()) %></small>
    </div>
  <%
      }
  }
  %>

  <hr>

  <h3>コメントを書く</h3>

  <%
  // 未ログインなら投稿させない（表示だけ変える）
  if (session.getAttribute("userId") == null) {
  %>
    <p>コメント投稿にはログインが必要です。</p>
  <%
  } else {
  %>
    <form action="<%= request.getContextPath() %>/AddCommentServlet" method="post">
      <input type="hidden" name="articleId" value="<%= article.getId() %>">
      <textarea name="body" rows="4" cols="60" required></textarea><br>
      <button type="submit">送信</button>
    </form>
  <%
  }
}
%>

</body>
</html>
