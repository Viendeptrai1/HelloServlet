<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang cá nhân (Cookie) - Hello Servlet</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🍪</text></svg>">
</head>
<body>
    <div class="container">
        <div class="card fade-in-up" style="max-width: 600px; margin: 50px auto;">
            <div style="text-align: center; margin-bottom: 30px;">
                <h2>🍪 Trang cá nhân (Cookie)</h2>
                <p style="color: #718096;">Đăng nhập bằng Cookie</p>
            </div>

            <div class="user-info">
                <h3>🎉 Xin chào, <span style="color: #667eea;">${user}</span>!</h3>
                <p>Chào mừng bạn đến với trang cá nhân. Thông tin đăng nhập của bạn đang được lưu trữ bằng <strong>Cookie</strong>.</p>
            </div>

            <%
                // Kiểm tra xem có remember me không
                boolean isRemembered = false;
                String cookieDuration = "30 phút";
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if ("rememberMe".equals(cookie.getName()) && "true".equals(cookie.getValue())) {
                            isRemembered = true;
                            cookieDuration = "30 ngày";
                            break;
                        }
                    }
                }
            %>

            <div style="background: rgba(102, 126, 234, 0.1); padding: 20px; border-radius: 10px; margin: 20px 0;">
                <h4 style="margin-bottom: 15px; color: #4a5568;">📊 Thông tin phiên làm việc:</h4>
                <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px;">
                    <div>
                        <strong>🔐 Phương thức:</strong><br>
                        <span style="color: #667eea;">Cookie</span>
                    </div>
                    <div>
                        <strong>⏰ Thời gian:</strong><br>
                        <span style="color: #667eea;">
                            <%= cookieDuration %>
                            <% if (isRemembered) { %>
                                <span style="color: #38a169; font-size: 0.9em;">(Ghi nhớ)</span>
                            <% } %>
                        </span>
                    </div>
                    <div>
                        <strong>👤 Tài khoản:</strong><br>
                        <span style="color: #667eea;">${user}</span>
                    </div>
                </div>
            </div>

            <% if (isRemembered) { %>
                <div style="background: rgba(56, 161, 105, 0.1); padding: 20px; border-radius: 10px; margin: 20px 0;">
                    <h4 style="margin-bottom: 15px; color: #38a169;">🔄 Chế độ "Ghi nhớ đăng nhập"</h4>
                    <ul style="color: #718096; margin-left: 20px;">
                        <li>✓ Tự động đăng nhập lại khi quay lại website</li>
                        <li>✓ Duy trì đăng nhập trong 30 ngày</li>
                        <li>✓ Không cần nhập lại thông tin đăng nhập</li>
                        <li>✓ An toàn trên thiết bị cá nhân</li>
                    </ul>
                </div>
            <% } else { %>
                <div style="background: rgba(237, 137, 54, 0.1); padding: 20px; border-radius: 10px; margin: 20px 0;">
                    <h4 style="margin-bottom: 15px; color: #4a5568;">⏰ Phiên làm việc thường</h4>
                    <ul style="color: #718096; margin-left: 20px;">
                        <li>✓ Thời gian: 30 phút</li>
                        <li>✓ Tự động hết hạn khi không sử dụng</li>
                        <li>✓ Bảo mật cao cho máy tính công cộng</li>
                        <li>🔄 Có thể chọn "Ghi nhớ" lần đăng nhập tiếp theo</li>
                    </ul>
                </div>
            <% } %>

            <div class="nav-links" style="justify-content: center; margin-top: 30px;">
                <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">
                    🏠 Trang chủ
                </a>
                <a href="${pageContext.request.contextPath}/login" class="btn btn-primary">
                    🔐 Thử Session
                </a>
                <form method="post" action="${pageContext.request.contextPath}/logout-cookie" style="display: inline;">
                    <button type="submit" class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn đăng xuất?')">
                        🚪 Đăng xuất
                    </button>
                </form>
            </div>
        </div>

        <div style="text-align: center; margin-top: 30px; color: rgba(255,255,255,0.8);">
            <small>🍪 Phiên làm việc này sử dụng Cookie - tiện lợi và linh hoạt</small>
        </div>
    </div>

    <script>
        // Hiệu ứng cho button đăng xuất
        document.querySelector('form[action*="logout-cookie"] button').addEventListener('click', function(e) {
            if (confirm('Bạn có chắc muốn đăng xuất và xóa cookie không?')) {
                this.innerHTML = 'Đang đăng xuất... <span class="spinner"></span>';
                this.disabled = true;
                return true;
            }
            e.preventDefault();
            return false;
        });

        // Hiệu ứng welcome với cookie
        setTimeout(() => {
            const welcome = document.querySelector('.user-info h3');
            welcome.style.transform = 'scale(1.05)';
            setTimeout(() => {
                welcome.style.transform = 'scale(1)';
            }, 200);
        }, 500);
    </script>
</body>
</html>
