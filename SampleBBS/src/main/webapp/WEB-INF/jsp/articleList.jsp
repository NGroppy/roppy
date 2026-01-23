<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="beans.Article" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article list</title>
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

  <div style="display:flex; align-items:center; justify-content:space-between; margin-bottom: 18px;">
    <div style="font-size: 22px; font-weight: 700;">roppy 記事一覧</div>

    <%
      String loginUserId = (String) session.getAttribute("userId");
      if (loginUserId != null) {
    %>
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
    <%
      }
    %>
  </div>

  <div style="display:flex; gap:10px; flex-wrap:wrap; margin-bottom: 16px;">
    <a href="<%= request.getContextPath() %>/UpdateUserPageServletAns"
       style="
         display:inline-block;
         padding:10px 14px;
         border-radius:10px;
         border:1px solid #d6d6d6;
         text-decoration:none;
         color:#333;
         font-weight:700;
       ">ユーザ情報更新</a>

    <a href="<%= request.getContextPath() %>/EntryArticlePageServlet"
       style="
         display:inline-block;
         padding:10px 14px;
         border-radius:10px;
         background:#66a6ff;
         color:#fff;
         text-decoration:none;
         font-weight:700;
       ">新規記事登録</a>

    <% if (loginUserId != null) { %>
      <% if ("fav".equals(request.getAttribute("mode"))) { %>
        <a href="<%= request.getContextPath() %>/ArticleListServlet"
           style="
             display:inline-block;
             padding:10px 14px;
             border-radius:10px;
             background:#fff;
             border:1px solid #ffca28;
             color:#ffca28;
             text-decoration:none;
             font-weight:700;
           ">← 全ての記事を表示</a>
      <% } else { %>
        <a href="<%= request.getContextPath() %>/ArticleListServlet?mode=fav"
           style="
             display:inline-block;
             padding:10px 14px;
             border-radius:10px;
             background:#ffca28;
             color:#fff;
             text-decoration:none;
             font-weight:700;
           ">★ いいね一覧</a>
      <% } %>
    <% } %>
  </div>

  <form action="<%= request.getContextPath() %>/ArticleListServlet" method="get"
        style="display:flex; gap:10px; align-items:center; margin: 10px 0 18px;">
    <input type="text" name="q" placeholder="検索（タイトル/本文/投稿者）"
           value="<%= request.getParameter("q")==null ? "" : request.getParameter("q") %>"
           style="
             flex:1;
             padding:10px 12px;
             border-radius:10px;
             border:1px solid #ccc;
             outline:none;
           ">

    <button type="submit" style="
      background:#66a6ff;
      color:#fff;
      border:none;
      padding:10px 18px;
      border-radius: 18px;
      cursor:pointer;
      font-weight:700;
    ">検索</button>

    <a href="<%= request.getContextPath() %>/ArticleListServlet"
       style="color:#66a6ff; font-weight:700; text-decoration:none;">
      クリア
    </a>
  </form>

  <hr style="border:none; border-top:1px solid #e6e6e6; margin: 18px 0;">

  <div style="font-size: 18px; font-weight: 700; margin-bottom: 15px; color: #444; display: flex; align-items: center; gap: 5px;">
    <% if ("fav".equals(request.getAttribute("mode"))) { %>
       <span style="color: #ffca28;">★</span> いいね登録済みの記事
    <% } else { %>
       新着記事一覧
    <% } %>
  </div>

  <%
    List<Article> aList = (List<Article>) request.getAttribute("articleList");
    List<Integer> favIds = (List<Integer>) request.getAttribute("favIds"); 
    if (favIds == null) favIds = new ArrayList<Integer>(); 

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    if (aList == null || aList.size() == 0) {
  %>
      <p style="color:#666;">表示する記事がありません。</p>
  <%
    } else {
      for (Article a : aList) {
  %>

    <div style="
      border:1px solid #e6e6e6;
      border-radius: 12px;
      padding: 16px 16px;
      margin-bottom: 14px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.06);
      background: #fff;
    ">

      <div style="font-size:18px; font-weight:800; margin-bottom: 8px; display: flex; align-items: center; gap: 8px;">
        <a href="<%= request.getContextPath() %>/ArticleDetailServlet?articleId=<%= a.getId() %>"
           style="color:#2563eb; text-decoration:none;">
          <%= a.getTitle() %>
        </a>
        
        <%-- お気に入りスター（金色に修正） --%>
        <% if (favIds.contains(a.getId())) { %>
          <span style="color: #ffca28; font-size: 20px;">★</span>
        <% } %>
      </div>

      <div style="color:#555; margin-bottom: 10px; white-space:pre-wrap;">
        <%= a.getBody() %>
      </div>

      <div style="display:flex; gap:14px; flex-wrap:wrap; color:#777; font-size:13px;">
        <span>登録者：<b><%= a.getEditorId() %></b></span>
        <span>登録日時：<%= sdf.format(a.getEntryDatetime()) %></span>
      </div>

    </div>

  <%
      }
    }
  %>

</div>

</body>
</html>