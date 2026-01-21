<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
<link rel="stylesheet" type="text/css"
      href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div id="form">
  <p class="form-title">Tiny BBS ログインページ</p>

  <% if (request.getAttribute("loginError") != null) { %>
    <p style="color:red;">
      <%= request.getAttribute("loginError") %>
    </p>
  <% } %>

  <form action="<%= request.getContextPath() %>/LoginServlet" method="post">
    <p class="mail">
      <label>ログインID：
        <input type="text" name="id" size="30" maxlength="20">
      </label>
    </p>
    <p class="pass">
      <label>パスワード：
        <input type="password" name="password" size="20" maxlength="20">
      </label>
    </p>
    <p class="submit">
      <input type="submit" value="ログイン">
    </p>
  </form>

  <a href="<%= request.getContextPath() %>/EntryUserPageServlet">
    ユーザ登録
  </a>
</div>

</body>
</html>
