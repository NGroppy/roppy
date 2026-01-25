<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>データ入力</title>
</head>
<body>
<!--  LoginServletにデータを送信するformを宣言する. 登録処理なので，methodはpostを指定．
	後はentryArticle.jspと同様なので，そちらのコメントを参考にするとよい．-->
	<div id="form">
	<p class="form-title">グループ選択</p>
	
	<form action="./GroupServlet" method="post"> <!-- パスに送る -->
		<p><label>数字を入力してください(0～100)<input type="number" name="number" min="0" max="100" step="1" required></label></p>
		<!-- numberとして送られる -->
		
		<p><input type="submit" value="送信"></p>
	</form>
	
	</div>

</body>
</html>