<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Article</title>
</head>

<body style="
  background: linear-gradient(120deg, #89f7fe, #66a6ff);
  font-family: Arial, 'Noto Sans JP', sans-serif;
  margin:0;
">

<div style="
  max-width: 700px;
  margin: 60px auto;
  background:#fff;
  padding: 28px 34px;
  border-radius: 14px;
  box-shadow: 0 10px 28px rgba(0,0,0,0.15);
">

  <%
    String loginUserId = (String) session.getAttribute("userId");
  %>

  <!-- 上部バー -->
  <div style="display:flex; align-items:center; justify-content:space-between; margin-bottom:18px;">
    <div style="font-size:22px; font-weight:800;">新規記事登録</div>

    <% if (loginUserId != null) { %>
      <form action="<%= request.getContextPath() %>/LogoutServlet" method="get" style="margin:0;">
        <button type="submit" style="
          background:#ffffff;
          border:1px solid #cfd8e3;
          padding:8px 14px;
          border-radius:18px;
          cursor:pointer;
          font-weight:700;
        ">ログアウト</button>
      </form>
    <% } %>
  </div>

  <a href="<%= request.getContextPath() %>/ArticleListServlet"
     style="color:#2563eb; text-decoration:none; font-weight:700;">
     ← 記事一覧へ戻る
  </a>

  <hr style="border:none; border-top:1px solid #e6e6e6; margin:18px 0;">

  <% if (loginUserId == null) { %>
    <div style="
      border:1px solid #eee;
      border-radius:12px;
      padding:14px;
      background:#fafafa;
      color:#555;
    ">
      記事投稿にはログインが必要です。
    </div>
  <% } else { %>

  <form action="<%= request.getContextPath() %>/EntryArticleServlet" method="post">
  
  <div style="margin-bottom:16px;">
  			<p><label>数字を入力してください(0～100)　そのグループにしか閲覧されない</label></p>
  	
      <input type="number" name="number" min ="0" max="100" step="1" required
             style="
               width:100%;
               padding:10px 12px;
               border-radius:10px;
               border:1px solid #ccc;
               outline:none;
             ">
    </div>

    <div style="margin-bottom:16px;">
      <label style="font-weight:700;">タイトル</label><br>

      <input type="text"
             id="title"
             name="title"
             required
             maxlength="50"
             oninput="updateCounts()"
             style="
               width:100%;
               padding:10px 12px;
               border-radius:10px;
               border:1px solid #ccc;
               outline:none;
             ">

      <div id="titleCount" style="margin-top:6px; font-size:12px; color:#555;">
        0 / 50 文字
      </div>
    </div>

    <div style="margin-bottom:22px;">
      <label style="font-weight:700;">本文</label><br>

      <textarea id="body"
                name="body"
                rows="8"
                required
                maxlength="200"
                oninput="updateCounts()"
        style="
          width:100%;
          padding:10px 12px;
          border-radius:10px;
          border:1px solid #ccc;
          outline:none;
          resize:vertical;
        "></textarea>

      <!-- 残り文字数（①） -->
      <div id="remainCount"
           style="margin-top:6px; font-size:13px; font-weight:700; color:#555;">
        あと 200 文字
      </div>

      <!-- プログレスバー（⑤） -->
      <div style="
        margin-top:8px;
        height:8px;
        background:#eee;
        border-radius:4px;
        overflow:hidden;
      ">
        <div id="progressBar"
             style="
               height:100%;
               width:0%;
               background:#66a6ff;
               transition: width 0.2s;
             "></div>
      </div>
    </div>

    <div style="text-align:center;">
      <button type="submit" id="submitBtn" style="
        background:#66a6ff;
        color:#fff;
        border:none;
        padding:10px 26px;
        border-radius:18px;
        cursor:pointer;
        font-weight:800;
        font-size:15px;
      ">投稿</button>
    </div>

  </form>

  <script>
  function updateCounts() {
    const title = document.getElementById("title");
    const body  = document.getElementById("body");

    const titleCount = document.getElementById("titleCount");
    const remainView = document.getElementById("remainCount");
    const bar        = document.getElementById("progressBar");
    const btn        = document.getElementById("submitBtn");

    const tLen = title.value.length;
    const bLen = body.value.length;

    // タイトル文字数
    titleCount.textContent = tLen + " / " + title.maxLength + " 文字";
    titleCount.style.color = (tLen >= title.maxLength) ? "red" : "#555";

    // 残り文字数（①）
    const remain = body.maxLength - bLen;
    remainView.textContent = "あと " + remain + " 文字";

    // プログレス（⑤）※100%を超えないように
    const percent = Math.min((bLen / body.maxLength) * 100, 100);
    bar.style.width = percent + "%";

    // 色変化（分かりやすさUP）
    if (percent >= 100) {
      bar.style.background = "#ef4444";   // 赤
      remainView.style.color = "red";
    } else if (percent >= 80) {
      bar.style.background = "#f59e0b";   // オレンジ
      remainView.style.color = "#f59e0b";
    } else {
      bar.style.background = "#66a6ff";   // 青
      remainView.style.color = "#555";
    }

    // 空欄防止（任意）
    btn.disabled = (title.value.trim() === "" || body.value.trim() === "");
  }

  // 初期表示を整える
  window.addEventListener("DOMContentLoaded", updateCounts);
  </script>

  <% } %>

</div>

</body>
</html>
