<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="ja">
<head>
  <meta charset="utf-8">
  <title>データ入力</title>
  <style>
  
  </style>
</head>
<body>
<!--  LoginServletにデータを送信するformを宣言する. 登録処理なので，methodはpostを指定．
	後はentryArticle.jspと同様なので，そちらのコメントを参考にするとよい．-->
	<div id="form">
	<p class="form-title" >Tiny BBS データページ</p>
	<form action="MyInput" method="post">
		<p class="mail"><label>data：<input type="text" name="data" size="30" maxlength="20"></label></p>
		<p class="submit"><input type="submit" value="ログイン"></p>
	</form>
	<a href=MyInput>ユーザ登録</a>
	</div>
		<!-- EntryUserPageServletにハイパーリンク．
	ハイパーリンクによるアクセスは，GETアクセスとなり，サーブレットのdoGet()が呼ばれる． -->
	
	<br>
</body>
</html>