<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ登録</title>

<style>
body {
  margin: 0;
  font-family: "Segoe UI", "ヒラギノ角ゴ", sans-serif;
  height: 100vh;
  background: linear-gradient(135deg, #7dd3fc, #60a5fa);
  display: flex;
  justify-content: center;
  align-items: center;
}

.card {
  background: #fff;
  width: 420px;
  padding: 40px;
  border-radius: 16px;
  box-shadow: 0 10px 30px rgba(0,0,0,0.15);
}

h2 {
  text-align: center;
  margin-bottom: 30px;
}

.form-group {
  margin-bottom: 18px;
}

label {
  display: block;
  margin-bottom: 6px;
  font-size: 14px;
}

input[type="text"],
input[type="password"] {
  width: 100%;
  padding: 12px;
  border-radius: 8px;
  border: 1px solid #ccc;
  font-size: 14px;
}

button {
  width: 100%;
  margin-top: 20px;
  padding: 12px;
  border: none;
  border-radius: 999px;
  background: #60a5fa;
  color: #fff;
  font-size: 15px;
  cursor: pointer;
}

button:hover {
  background: #3b82f6;
}

.back {
  text-align: center;
  margin-top: 20px;
}

.back a {
  color: #2563eb;
  text-decoration: none;
  font-size: 14px;
}
</style>
</head>

<body>

<div class="card">
  <h2>Tiny BBS ユーザ登録</h2>

  <form action="<%= request.getContextPath() %>/EntryUserServlet" method="post">

    <div class="form-group">
      <label>ログインID</label>
      <input type="text" name="id" required maxlength="20">
    </div>

    <div class="form-group">
      <label>名前</label>
      <input type="text" name="name" required maxlength="20">
    </div>

    <div class="form-group">
      <label>パスワード</label>
      <input type="password" name="password1" required maxlength="20">
    </div>

    <div class="form-group">
      <label>確認用パスワード</label>
      <input type="password" name="password2" required maxlength="20">
    </div>

    <button type="submit">登録</button>
  </form>

  <div class="back">
    <a href="<%= request.getContextPath() %>/LoginPageServlet">← ログイン画面へ戻る</a>
  </div>
</div>

</body>
</html>
