<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Trang cá nhân (Cookie)</title>
    <style>
        body { font-family: system-ui, Arial, sans-serif; margin: 40px; }
        .box { max-width: 600px; margin: 0 auto; }
        form { display: inline; }
    </style>
</head>
<body>
<div class="box">
    <h2>Xin chào, ${user}!</h2>
    <p>Phiên đăng nhập được lưu bằng Cookie.</p>

    <form method="post" action="${pageContext.request.contextPath}/logout-cookie">
        <button type="submit">Đăng xuất</button>
    </form>
</div>
</body>
</html>
