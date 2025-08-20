<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập - Hello Servlet</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🔐</text></svg>">
</head>
<body>
    <div class="container">
        <div class="form-container">
            <div class="card fade-in-up">
                <div style="text-align: center; margin-bottom: 30px;">
                    <h2>🔐 Đăng nhập</h2>
                    <p style="color: #718096;">Sử dụng HttpSession</p>
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
                
                <form method="post" action="${pageContext.request.contextPath}/login" id="loginForm">
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
                    
                    <button type="submit" class="btn btn-primary" style="width: 100%;">
                        Đăng nhập
                    </button>
                </form>
                
                <div style="text-align: center; margin-top: 20px; padding-top: 20px; border-top: 1px solid #e2e8f0;">
                    <p style="color: #718096; margin-bottom: 10px;">Hoặc thử phương thức khác:</p>
                    <a href="${pageContext.request.contextPath}/login-cookie" class="btn btn-secondary">
                        🍪 Đăng nhập với Cookie
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

    <script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
</body>
</html>
