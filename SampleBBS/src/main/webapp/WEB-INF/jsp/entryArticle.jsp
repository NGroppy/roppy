<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Article</title>
</head>

<body style="
  background: linear-gradient(120deg, #89f7fe, #66a6ff);
  font-family: Arial, 'Noto Sans JP', sans-serif;
  margin:0;
">

<div style="
  max-width: 700px;
  margin: 60px auto;
  background:#fff;
  padding: 28px 34px;
  border-radius: 14px;
  box-shadow: 0 10px 28px rgba(0,0,0,0.15);
">

  <%
    String loginUserId = (String) session.getAttribute("userId");
  %>

  <!-- 上部バー -->
  <div style="display:flex; align-items:center; justify-content:space-between; margin-bottom:18px;">
    <div style="font-size:22px; font-weight:800;">新規記事登録</div>

    <% if (loginUserId != null) { %>
      <form action="<%= request.getContextPath() %>/LogoutServlet" method="get" style="margin:0;">
        <button type="submit" style="
          background:#ffffff;
          border:1px solid #cfd8e3;
          padding:8px 14px;
          border-radius:18px;
          cursor:pointer;
          font-weight:700;
        ">ログアウト</button>
      </form>
    <% } %>
  </div>

  <a href="<%= request.getContextPath() %>/ArticleListServlet"
     style="color:#2563eb; text-decoration:none; font-weight:700;">
     ← 記事一覧へ戻る
  </a>

  <hr style="border:none; border-top:1px solid #e6e6e6; margin:18px 0;">

  <% if (loginUserId == null) { %>
    <div style="
      border:1px solid #eee;
      border-radius:12px;
      padding:14px;
      background:#fafafa;
      color:#555;
    ">
      記事投稿にはログインが必要です。
    </div>
  <% } else { %>

  <!-- ★ action はあなたの登録サーブレットに合わせて調整 -->
  <!-- 例：EntryArticleServlet / EntryArticleServletAns など -->
  <form action="<%= request.getContextPath() %>/EntryArticleServlet" method="post">

    <div style="margin-bottom:16px;">
      <label style="font-weight:700;">タイトル</label><br>
      <input type="text" name="title" required
             style="
               width:100%;
               padding:10px 12px;
               border-radius:10px;
               border:1px solid #ccc;
               outline:none;
             ">
    </div>

    <div style="margin-bottom:22px;">
      <label style="font-weight:700;">本文</label><br>
      <textarea name="body" rows="8" required
        style="
          width:100%;
          padding:10px 12px;
          border-radius:10px;
          border:1px solid #ccc;
          outline:none;
          resize:vertical;
        "></textarea>
    </div>

    <div style="text-align:center;">
      <button type="submit" style="
        background:#66a6ff;
        color:#fff;
        border:none;
        padding:10px 26px;
        border-radius:18px;
        cursor:pointer;
        font-weight:800;
        font-size:15px;
      ">投稿</button>
    </div>

  </form>

  <% } %>

</div>

</body>
</html>
