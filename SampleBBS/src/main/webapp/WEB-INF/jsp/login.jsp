<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
  response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body style="
  background: linear-gradient(120deg, #89f7fe, #66a6ff);
  font-family: Arial, sans-serif;
">

<div style="
  max-width: 420px;
  margin: 80px auto;
  background: #fff;
  padding: 30px 40px;
  border-radius: 12px;
  box-shadow: 0 8px 24px rgba(0,0,0,0.15);
">

  <h2 style="text-align:center; margin-bottom:30px;">
    roppy ログイン
  </h2>

  <form action="<%= request.getContextPath() %>/LoginServlet" method="post">

    <div style="margin-bottom:20px;">
      <label>ログインID</label><br>
      <input type="text" name="id" style="
        width:100%;
        padding:10px;
        border-radius:6px;
        border:1px solid #ccc;
      ">
    </div>

    <div style="margin-bottom:30px;">
      <label>パスワード</label><br>
      <input type="password" name="password" style="
        width:100%;
        padding:10px;
        border-radius:6px;
        border:1px solid #ccc;
      ">
    </div>

    <div style="text-align:center;">
      <button type="submit" style="
        background:#66a6ff;
        color:#fff;
        border:none;
        padding:10px 30px;
        border-radius:20px;
        font-size:16px;
        cursor:pointer;
      ">
        ログイン
      </button>
    </div>

  </form>

  <div style="text-align:center; margin-top:20px;">
    <a href="<%= request.getContextPath() %>/EntryUserPageServlet"
       style="color:#66a6ff; text-decoration:none;">
      ユーザ登録
    </a>
  </div>

</div>

</body>
</html>
