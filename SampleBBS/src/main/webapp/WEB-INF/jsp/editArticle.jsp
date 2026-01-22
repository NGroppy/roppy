<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="beans.Article" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>記事編集</title>

<style>
body{
  margin:0;
  font-family:"Segoe UI","ヒラギノ角ゴ",sans-serif;
  min-height:100vh;
  background: linear-gradient(135deg, #7dd3fc, #60a5fa);
  display:flex;
  justify-content:center;
  align-items:center;
  padding:30px;
}

.card{
  background:#fff;
  width: 720px;
  max-width: 92vw;
  padding: 36px 40px;
  border-radius: 16px;
  box-shadow: 0 10px 30px rgba(0,0,0,0.15);
}

.header{
  display:flex;
  align-items:center;
  justify-content:space-between;
  gap:12px;
  margin-bottom: 22px;
}

h2{
  margin:0;
  font-size: 22px;
}

.sub{
  color:#64748b;
  font-size: 13px;
  margin-top: 6px;
}

.form-group{
  margin: 16px 0;
}

label{
  display:block;
  margin-bottom:8px;
  font-size: 14px;
}

input[type="text"], textarea{
  width:100%;
  box-sizing:border-box;
  padding: 12px 12px;
  border-radius: 10px;
  border: 1px solid #cbd5e1;
  font-size: 14px;
  outline:none;
}

input[type="text"]:focus, textarea:focus{
  border-color:#60a5fa;
  box-shadow: 0 0 0 4px rgba(96,165,250,0.2);
}

textarea{
  resize: vertical;
  min-height: 220px;
}

.actions{
  display:flex;
  gap:12px;
  justify-content:flex-end;
  margin-top: 20px;
}

.btn{
  border:none;
  border-radius:999px;
  padding: 12px 18px;
  font-size: 14px;
  cursor:pointer;
}

.btn-primary{
  background:#60a5fa;
  color:#fff;
}
.btn-primary:hover{
  background:#3b82f6;
}

.btn-ghost{
  background:#eef2ff;
  color:#1e3a8a;
  text-decoration:none;
  display:inline-flex;
  align-items:center;
  justify-content:center;
  padding: 12px 18px;
}
.btn-ghost:hover{
  background:#e0e7ff;
}

.footer-link{
  margin-top: 16px;
  text-align:left;
}
.footer-link a{
  color:#2563eb;
  text-decoration:none;
  font-size: 14px;
}
</style>
</head>

<body>

<%
Article article = (Article) request.getAttribute("article");
if (article == null) {
%>
  <div class="card">
    <div class="header">
      <h2>記事編集</h2>
    </div>
    <p>記事が取得できませんでした。</p>
    <div class="footer-link">
      <a href="<%= request.getContextPath() %>/ArticleListServlet">← 記事一覧へ</a>
    </div>
  </div>
<%
  return;
}
%>

<div class="card">
  <div class="header">
    <div>
      <h2>記事編集</h2>
      <div class="sub">タイトルと本文を編集して「更新」を押してください</div>
    </div>
    <a class="btn btn-ghost"
       href="<%= request.getContextPath() %>/ArticleDetailServlet?articleId=<%= article.getId() %>">
      ← 詳細へ戻る
    </a>
  </div>

  <form action="<%= request.getContextPath() %>/UpdateArticleServlet" method="post">
    <input type="hidden" name="articleId" value="<%= article.getId() %>">

    <div class="form-group">
      <label>タイトル</label>
      <input type="text" name="title" value="<%= article.getTitle() %>" required>
    </div>

    <div class="form-group">
      <label>本文</label>
      <textarea name="body" required><%= article.getBody() %></textarea>
    </div>

    <div class="actions">
      <a class="btn btn-ghost"
         href="<%= request.getContextPath() %>/ArticleDetailServlet?articleId=<%= article.getId() %>">
        キャンセル
      </a>
      <button class="btn btn-primary" type="submit">更新</button>
    </div>
  </form>

  <div class="footer-link">
    <a href="<%= request.getContextPath() %>/ArticleListServlet">← 記事一覧へ</a>
  </div>
</div>

</body>
</html>
