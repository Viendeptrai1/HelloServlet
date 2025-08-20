<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Đăng nhập</title>
    <style>
        body { font-family: system-ui, Arial, sans-serif; margin: 40px; }
        .box { max-width: 360px; margin: 0 auto; padding: 24px; border: 1px solid #ddd; border-radius: 8px; }
        .row { margin-bottom: 12px; }
        label { display:block; margin-bottom: 6px; }
        input[type=text], input[type=password] { width: 100%; padding: 8px; }
        .error { color: #b00020; margin-bottom: 12px; }
        button { padding: 8px 12px; }
        a { text-decoration: none; }
    </style>
</head>
<body>
<div class="box">
    <h2>Đăng nhập</h2>
    <% if (request.getAttribute("error") != null) { %>
        <div class="error"><%= request.getAttribute("error") %></div>
    <% } %>
    <form method="post" action="${pageContext.request.contextPath}/login">
        <div class="row">
            <label for="username">Tên đăng nhập</label>
            <input id="username" name="username" type="text" required />
        </div>
        <div class="row">
            <label for="password">Mật khẩu</label>
            <input id="password" name="password" type="password" required />
        </div>
        <button type="submit">Đăng nhập</button>
    </form>
</div>
</body>
</html>
