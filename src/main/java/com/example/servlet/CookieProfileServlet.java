package com.example.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CookieProfileServlet", urlPatterns = {"/profile-cookie"})
public class CookieProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if ("user".equals(c.getName()) && c.getValue() != null && !c.getValue().trim().isEmpty()) {
                    user = c.getValue();
                    break;
                }
            }
        }
        
        // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login-cookie?error=required");
            return;
        }
        
        request.setAttribute("user", user);
        request.getRequestDispatcher("/WEB-INF/views/profile_cookie.jsp").forward(request, response);
    }
}
