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

<body style="
  background: linear-gradient(120deg, #89f7fe, #66a6ff);
  font-family: Arial, 'Noto Sans JP', sans-serif;
  margin:0;
">

<div style="
  max-width: 900px;
  margin: 50px auto;
  background: #fff;
  padding: 28px 34px;
  border-radius: 14px;
  box-shadow: 0 10px 28px rgba(0,0,0,0.15);
">

  <%
    Article article = (Article) request.getAttribute("article");
    List<Comment> commentList = (List<Comment>) request.getAttribute("commentList");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String loginUserId = (String) session.getAttribute("userId");
  %>

  <!-- 上部バー（戻る + ログアウト） -->
  <div style="display:flex; align-items:center; justify-content:space-between; gap:12px; margin-bottom: 16px;">
    <a href="<%= request.getContextPath() %>/ArticleListServlet"
       style="color:#2563eb; text-decoration:none; font-weight:700;">
      ← 記事一覧へ戻る
    </a>

    <% if (loginUserId != null) { %>
      <form action="<%= request.getContextPath() %>/LogoutServlet" method="get" style="margin:0;">
        <button type="submit" style="
          background:#ffffff;
          border:1px solid #cfd8e3;
          padding:8px 14px;
          border-radius: 18px;
          cursor:pointer;
          font-weight:700;
        ">ログアウト</button>
      </form>
    <% } %>
  </div>

  <%
    if (article == null) {
  %>
      <div style="
        border:1px solid #eee;
        border-radius:12px;
        padding:18px;
        background:#fafafa;
        color:#555;
      ">
        記事が見つかりませんでした。
      </div>
  <%
    } else {
  %>

  <!-- 記事本体カード -->
  <div style="
    border:1px solid #e6e6e6;
    border-radius: 12px;
    padding: 18px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.06);
    margin-bottom: 16px;
  ">
    <div style="font-size: 24px; font-weight: 800; margin-bottom: 10px;">
      <%= article.getTitle() %>
    </div>

    <div style="color:#444; white-space:pre-wrap; line-height:1.6; margin-bottom: 14px;">
      <%= article.getBody() %>
    </div>

    <div style="display:flex; gap:14px; flex-wrap:wrap; color:#777; font-size:13px;">
      <span>登録者：<b><%= article.getEditorId() %></b></span>
      <span>登録日時：<%= sdf.format(article.getEntryDatetime()) %></span>
    </div>

    <!-- 編集/削除（投稿者のみ） -->
    <%
      if (loginUserId != null && loginUserId.equals(article.getEditorId())) {
    %>
      <div style="margin-top: 14px; display:flex; gap:10px; flex-wrap:wrap;">
        <a href="<%= request.getContextPath() %>/EditArticlePageServlet?articleId=<%= article.getId() %>"
           style="
             display:inline-block;
             padding:10px 14px;
             border-radius:10px;
             background:#66a6ff;
             color:#fff;
             text-decoration:none;
             font-weight:700;
           ">
          この記事を編集
        </a>

        <form action="<%= request.getContextPath() %>/DeleteArticleServlet" method="post"
              onsubmit="return confirm('この記事を削除します。よろしいですか？');"
              style="margin:0;">
          <input type="hidden" name="articleId" value="<%= article.getId() %>">
          <button type="submit" style="
            background:#ff5b5b;
            color:#fff;
            border:none;
            padding:10px 14px;
            border-radius:10px;
            cursor:pointer;
            font-weight:700;
          ">
            この記事を削除
          </button>
        </form>
      </div>
    <%
      }
    %>
  </div>

  <!-- コメント一覧カード -->
  <div style="
    border:1px solid #e6e6e6;
    border-radius:12px;
    padding:18px;
    margin-bottom:16px;
  ">
    <div style="font-size:18px; font-weight:800; margin-bottom: 12px;">コメント</div>

    <%
      if (commentList == null || commentList.size() == 0) {
    %>
      <div style="color:#666;">コメントはまだありません。</div>
    <%
      } else {
        for (Comment c : commentList) {
    %>
      <div style="
        border:1px solid #eee;
        border-radius:10px;
        padding:12px;
        margin-bottom:10px;
        background:#fafafa;
      ">
        <div style="white-space:pre-wrap; color:#333; margin-bottom:6px;">
          <%= c.getBody() %>
        </div>
        <div style="color:#777; font-size:12px;">
          <b><%= c.getUserId() %></b> ・ <%= sdf.format(c.getCreatedAt()) %>
        </div>
      </div>
    <%
        }
      }
    %>
  </div>

  <!-- コメント投稿カード -->
  <div style="
    border:1px solid #e6e6e6;
    border-radius:12px;
    padding:18px;
  ">
    <div style="font-size:18px; font-weight:800; margin-bottom: 12px;">コメントを書く</div>

    <%
      if (loginUserId == null) {
    %>
      <div style="color:#666;">コメント投稿にはログインが必要です。</div>
    <%
      } else {
    %>
      <form action="<%= request.getContextPath() %>/AddCommentServlet" method="post">
        <input type="hidden" name="articleId" value="<%= article.getId() %>">

        <textarea name="body" rows="4" required
          style="
            width:100%;
            padding:10px 12px;
            border-radius:10px;
            border:1px solid #ccc;
            outline:none;
            resize:vertical;
          "></textarea>

        <div style="margin-top:10px;">
          <button type="submit" style="
            background:#66a6ff;
            color:#fff;
            border:none;
            padding:10px 18px;
            border-radius:18px;
            cursor:pointer;
            font-weight:700;
          ">
            送信
          </button>
        </div>
      </form>
    <%
      } // login check end
    %>
  </div>

  <%
    } // article null check end
  %>

</div>
</body>
</html>
