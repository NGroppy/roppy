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
	<p class="form-title" >データ入力サンプル</p>
	
	<form action="./MyInputServlet" method="post">
		<p><label>テキストデータ：<input type="text" name="data" size="30" maxlength="20"></label></p>
		<p><label>数値データ：<input type="number" id="number" name="number" /></label></p>
		<label for="price">数値を選択してください: </label>
		<input
  			type="range"
  			name="price"
  			id="price"
  			min="50000"
  			max="500000"
  			step="1000"
  			value="250000" />
		<output class="price-output" for="price"></output>
		<p><input type="submit" value="送信"></p>
	</form>
	
	</div>

</body>
</html>
