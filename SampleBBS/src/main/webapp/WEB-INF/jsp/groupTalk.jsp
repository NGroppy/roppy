<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="beans.Article" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>${group}グループ</h1>
<%
    List<Article> aList = (List<Article>) request.getAttribute("articleList");
    List<Integer> favIds = (List<Integer>) request.getAttribute("favIds"); // 追加
    if (favIds == null) favIds = new ArrayList<Integer>(); // 安全策

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    if (aList == null || aList.size() == 0) {
  %>
      <p style="color:#666;">記事がありません。</p>
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
    ">

      <div style="font-size:18px; font-weight:800; margin-bottom: 8px; display: flex; align-items: center; gap: 8px;">
        <a href="<%= request.getContextPath() %>/ArticleDetailServlet?articleId=<%= a.getId() %>"
           style="color:#2563eb; text-decoration:none;">
          <%= a.getTitle() %>
        </a>
        
        <%-- お気に入り判定：IDリストに含まれていれば星を表示 --%>
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

</body>
</html>