package com.example.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CookieLoginServlet", urlPatterns = {"/login-cookie"})
public class CookieLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Kiểm tra xem đã có cookie đăng nhập chưa
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("user".equals(cookie.getName()) && cookie.getValue() != null && !cookie.getValue().trim().isEmpty()) {
                    // Đã đăng nhập rồi, chuyển hướng đến profile
                    response.sendRedirect(request.getContextPath() + "/profile-cookie");
                    return;
                }
            }
        }
        
        request.getRequestDispatcher("/WEB-INF/views/login_cookie.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");
        
        // Validate input
        if (username == null || username.trim().isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập tên đăng nhập");
            request.getRequestDispatcher("/WEB-INF/views/login_cookie.jsp").forward(request, response);
            return;
        }
        
        if (password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập mật khẩu");
            request.getRequestDispatcher("/WEB-INF/views/login_cookie.jsp").forward(request, response);
            return;
        }

        // Kiểm tra đăng nhập (demo: password = "123")
        if ("123".equals(password)) {
            String path = request.getContextPath();
            if (path == null || path.isEmpty()) path = "/";
            
            // Tạo cookie cho username
            Cookie userCookie = new Cookie("user", username.trim());
            userCookie.setPath(path);
            
            // Xác định thời gian sống của cookie
            if ("true".equals(rememberMe)) {
                // Remember Me: 30 ngày
                userCookie.setMaxAge(30 * 24 * 60 * 60); // 30 ngày
                
                // Tạo thêm cookie để đánh dấu là "remember me"
                Cookie rememberCookie = new Cookie("rememberMe", "true");
                rememberCookie.setPath(path);
                rememberCookie.setMaxAge(30 * 24 * 60 * 60); // 30 ngày
                response.addCookie(rememberCookie);
                
                request.setAttribute("success", "Đăng nhập thành công! Bạn sẽ được ghi nhớ trong 30 ngày.");
            } else {
                // Đăng nhập thường: 30 phút
                userCookie.setMaxAge(30 * 60); // 30 phút
                request.setAttribute("success", "Đăng nhập thành công! Phiên làm việc: 30 phút.");
            }
            
            // Thêm cookie vào response
            response.addCookie(userCookie);
            
            // Chuyển hướng đến trang profile
            response.sendRedirect(request.getContextPath() + "/profile-cookie");
        } else {
            request.setAttribute("error", "Sai tài khoản hoặc mật khẩu! (Mật khẩu demo: 123)");
            request.getRequestDispatcher("/WEB-INF/views/login_cookie.jsp").forward(request, response);
        }
    }
}
