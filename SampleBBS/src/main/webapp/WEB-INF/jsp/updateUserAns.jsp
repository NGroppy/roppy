<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="beans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update user</title>
</head>
<body>
<label>Sample BBS ユーザ情報アップデート</label>

<%
User user = (User)request.getAttribute("user");
if (user == null) {
%>
  <p>ユーザー情報が取得できませんでした。ログインし直してください。</p>
  <a href="<%= request.getContextPath() %>/LoginPageServlet">ログインへ</a>
<%
  return;
}
%>

<form action="<%= request.getContextPath() %>/UpdateUserServletAns" method="post">
    <p><label>ログインID：<%= user.getId() %></label></p>
    <p><label>名前：
        <input type="text" name="name" size="40" maxlength="20" value="<%= user.getName() %>">
    </label></p>

    <p><label>現在のパスワード：
        <input type="password" name="currentPassword" size="40" maxlength="20">
    </label></p>

    <p><label>新しいパスワード：
        <input type="password" name="newPassword1" size="40" maxlength="20">
    </label></p>

    <p><label>確認用パスワード：
        <input type="password" name="newPassword2" size="40" maxlength="20">
    </label></p>

    <p><input type="submit" value="更新"></p>
</form>

</body>
</html>
