<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang cá nhân - Hello Servlet</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>👤</text></svg>">
</head>
<body>
    <div class="container">
        <div class="card fade-in-up" style="max-width: 600px; margin: 50px auto;">
            <div style="text-align: center; margin-bottom: 30px;">
                <h2>👤 Trang cá nhân</h2>
                <p style="color: #718096;">Đăng nhập bằng HttpSession</p>
            </div>

            <div class="user-info">
                <h3>🎉 Xin chào, <span style="color: #667eea;">${user}</span>!</h3>
                <p>Chào mừng bạn đến với trang cá nhân. Thông tin đăng nhập của bạn đang được lưu trữ bằng <strong>HttpSession</strong>.</p>
            </div>

            <div style="background: rgba(102, 126, 234, 0.1); padding: 20px; border-radius: 10px; margin: 20px 0;">
                <h4 style="margin-bottom: 15px; color: #4a5568;">📊 Thông tin phiên làm việc:</h4>
                <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px;">
                    <div>
                        <strong>🔐 Phương thức:</strong><br>
                        <span style="color: #667eea;">HttpSession</span>
                    </div>
                    <div>
                        <strong>⏰ Thời gian:</strong><br>
                        <span style="color: #667eea;">Đến khi đóng trình duyệt</span>
                    </div>
                    <div>
                        <strong>👤 Tài khoản:</strong><br>
                        <span style="color: #667eea;">${user}</span>
                    </div>
                </div>
            </div>

            <div style="background: rgba(56, 161, 105, 0.1); padding: 20px; border-radius: 10px; margin: 20px 0;">
                <h4 style="margin-bottom: 15px; color: #4a5568;">✨ Tính năng Session:</h4>
                <ul style="color: #718096; margin-left: 20px;">
                    <li>✓ Bảo mật cao - dữ liệu lưu trên server</li>
                    <li>✓ Tự động hết hạn khi đóng trình duyệt</li>
                    <li>✓ Không lưu thông tin trên máy tính</li>
                    <li>✓ Phù hợp cho thông tin nhạy cảm</li>
                </ul>
            </div>

            <div class="nav-links" style="justify-content: center; margin-top: 30px;">
                <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">
                    🏠 Trang chủ
                </a>
                <a href="${pageContext.request.contextPath}/login-cookie" class="btn btn-primary">
                    🍪 Thử Cookie
                </a>
                <form method="post" action="${pageContext.request.contextPath}/logout" style="display: inline;">
                    <button type="submit" class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn đăng xuất?')">
                        🚪 Đăng xuất
                    </button>
                </form>
            </div>
        </div>

        <div style="text-align: center; margin-top: 30px; color: rgba(255,255,255,0.8);">
            <small>💡 Phiên làm việc này sử dụng HttpSession - an toàn và bảo mật</small>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
</body>
</html>
