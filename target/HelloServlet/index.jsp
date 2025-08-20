<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hello Servlet - Trang chủ</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/style.css">
    <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🚀</text></svg>">
</head>
<body>
    <div class="container">
        <div class="header fade-in-up">
            <h1>🚀 Hello Servlet</h1>
            <p>Ứng dụng demo Servlet với Session và Cookie</p>
            
            <% if ("success".equals(request.getParameter("logout"))) { %>
                <div class="success" style="margin-top: 20px;">
                    ✅ Đăng xuất thành công! Hẹn gặp lại bạn.
                </div>
            <% } %>
        </div>

        <div class="card fade-in-up">
            <% 
                String sessionUser = (String) session.getAttribute("user");
                String cookieUser = null;
                
                // Kiểm tra cookie
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if ("user".equals(cookie.getName())) {
                            cookieUser = cookie.getValue();
                            break;
                        }
                    }
                }
            %>
            
            <% if (sessionUser != null || cookieUser != null) { %>
                <div class="user-info">
                    <h3>👋 Xin chào!</h3>
                    <% if (sessionUser != null) { %>
                        <p><strong>Session:</strong> <%= sessionUser %></p>
                        <div class="nav-links">
                            <a href="<%= request.getContextPath() %>/profile" class="btn btn-primary">👤 Trang cá nhân (Session)</a>
                            <a href="<%= request.getContextPath() %>/logout" class="btn btn-secondary">🚪 Đăng xuất</a>
                        </div>
                    <% } %>
                    
                    <% if (cookieUser != null) { %>
                        <p><strong>Cookie:</strong> <%= cookieUser %></p>
                        <div class="nav-links">
                            <a href="<%= request.getContextPath() %>/profile-cookie" class="btn btn-primary">👤 Trang cá nhân (Cookie)</a>
                            <a href="<%= request.getContextPath() %>/logout-cookie" class="btn btn-secondary">🚪 Đăng xuất Cookie</a>
                        </div>
                    <% } %>
                </div>
            <% } else { %>
                <div class="user-info">
                    <h3>👋 Chào mừng bạn!</h3>
                    <p>Bạn chưa đăng nhập. Hãy chọn một trong các phương thức đăng nhập bên dưới.</p>
                </div>
            <% } %>
        </div>

        <div class="demo-section">
            <div class="demo-card fade-in-up">
                <h3>🔐 Đăng nhập với Session</h3>
                <p>Sử dụng HttpSession để lưu trữ thông tin đăng nhập. Dữ liệu sẽ mất khi đóng trình duyệt.</p>
                <div class="nav-links">
                    <a href="<%= request.getContextPath() %>/login" class="btn btn-primary">Đăng nhập</a>
                    <a href="<%= request.getContextPath() %>/profile" class="btn btn-secondary">Xem Profile</a>
                </div>
            </div>

            <div class="demo-card fade-in-up">
                <h3>🍪 Đăng nhập với Cookie</h3>
                <p>Sử dụng Cookie để lưu trữ thông tin. Hỗ trợ "Remember Me" để duy trì đăng nhập lâu dài.</p>
                <div class="nav-links">
                    <a href="<%= request.getContextPath() %>/login-cookie" class="btn btn-primary">Đăng nhập</a>
                    <a href="<%= request.getContextPath() %>/profile-cookie" class="btn btn-secondary">Xem Profile</a>
                </div>
            </div>
        </div>

        <div class="card fade-in-up" style="text-align: center; margin-top: 30px;">
            <h3>📋 Thông tin Demo</h3>
            <p><strong>Tài khoản demo:</strong> Bất kỳ tên nào</p>
            <p><strong>Mật khẩu:</strong> 123</p>
            <p><em>Hãy thử cả hai phương thức để thấy sự khác biệt!</em></p>
        </div>
    </div>

    <script src="<%= request.getContextPath() %>/assets/js/app.js"></script>
    <script>
        // Thêm hiệu ứng loading cho các liên kết
        document.querySelectorAll('a.btn').forEach(button => {
            button.addEventListener('click', function() {
                if (!this.querySelector('.spinner')) {
                    this.innerHTML += '<span class="spinner"></span>';
                }
            });
        });
    </script>
</body>
</html>
