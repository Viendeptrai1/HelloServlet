<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập với Cookie - Hello Servlet</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🍪</text></svg>">
</head>
<body>
    <div class="container">
        <div class="form-container">
            <div class="card fade-in-up">
                <div style="text-align: center; margin-bottom: 30px;">
                    <h2>🍪 Đăng nhập với Cookie</h2>
                    <p style="color: #718096;">Hỗ trợ "Ghi nhớ đăng nhập"</p>
                </div>
                
                <% if (request.getAttribute("error") != null) { %>
                    <div class="error">
                        ❌ <%= request.getAttribute("error") %>
                    </div>
                <% } %>
                
                <% if ("required".equals(request.getParameter("error"))) { %>
                    <div class="error">
                        🔒 Bạn cần đăng nhập để truy cập trang này!
                    </div>
                <% } %>
                
                <% if (request.getAttribute("success") != null) { %>
                    <div class="success">
                        ✅ <%= request.getAttribute("success") %>
                    </div>
                <% } %>
                
                <form method="post" action="${pageContext.request.contextPath}/login-cookie" id="loginForm">
                    <div class="form-group">
                        <label for="username">👤 Tên đăng nhập</label>
                        <input id="username" name="username" type="text" required 
                               placeholder="Nhập tên đăng nhập" 
                               value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>">
                    </div>
                    
                    <div class="form-group">
                        <label for="password">🔒 Mật khẩu</label>
                        <input id="password" name="password" type="password" required 
                               placeholder="Nhập mật khẩu (demo: 123)">
                    </div>
                    
                    <div class="checkbox-group">
                        <input type="checkbox" id="rememberMe" name="rememberMe" value="true">
                        <label for="rememberMe">🔄 Ghi nhớ đăng nhập (30 ngày)</label>
                    </div>
                    
                    <button type="submit" class="btn btn-primary" style="width: 100%;">
                        Đăng nhập
                    </button>
                </form>
                
                <div style="background: rgba(102, 126, 234, 0.1); padding: 15px; border-radius: 8px; margin-top: 20px;">
                    <h4 style="margin-bottom: 10px; color: #4a5568;">💡 Tính năng Cookie:</h4>
                    <ul style="color: #718096; margin-left: 20px;">
                        <li>✓ Đăng nhập thường: 30 phút</li>
                        <li>✓ Ghi nhớ đăng nhập: 30 ngày</li>
                        <li>✓ Tự động đăng nhập lại khi quay lại</li>
                    </ul>
                </div>
                
                <div style="text-align: center; margin-top: 20px; padding-top: 20px; border-top: 1px solid #e2e8f0;">
                    <p style="color: #718096; margin-bottom: 10px;">Hoặc thử phương thức khác:</p>
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-secondary">
                        🔐 Đăng nhập với Session
                    </a>
                </div>
                
                <div style="text-align: center; margin-top: 15px;">
                    <a href="${pageContext.request.contextPath}/" style="color: #667eea; text-decoration: none;">
                        ← Quay về trang chủ
                    </a>
                </div>
            </div>
            
            <div style="text-align: center; margin-top: 20px; color: rgba(255,255,255,0.8);">
                <small>💡 Tài khoản demo: bất kỳ tên nào | Mật khẩu: 123</small>
            </div>
        </div>
    </div>

    <script>
        // Thêm hiệu ứng loading cho form
        document.getElementById('loginForm').addEventListener('submit', function() {
            const submitBtn = this.querySelector('button[type="submit"]');
            const rememberMe = document.getElementById('rememberMe').checked;
            
            if (rememberMe) {
                submitBtn.innerHTML = 'Đang đăng nhập và lưu cookie... <span class="spinner"></span>';
            } else {
                submitBtn.innerHTML = 'Đang đăng nhập... <span class="spinner"></span>';
            }
            submitBtn.disabled = true;
        });
        
        // Auto focus vào username
        document.getElementById('username').focus();
        
        // Hiệu ứng cho checkbox
        document.getElementById('rememberMe').addEventListener('change', function() {
            const label = this.nextElementSibling;
            if (this.checked) {
                label.style.color = '#667eea';
                label.style.fontWeight = '600';
            } else {
                label.style.color = '';
                label.style.fontWeight = '500';
            }
        });
    </script>
</body>
</html>
