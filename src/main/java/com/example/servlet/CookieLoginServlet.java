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
        request.getRequestDispatcher("/WEB-INF/views/login_cookie.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username != null && !username.trim().isEmpty() && "123".equals(password)) {
            String path = request.getContextPath();
            if (path == null || path.isEmpty()) path = "/";
            Cookie cookie = new Cookie("user", username.trim());
            cookie.setPath(path);
            cookie.setMaxAge(30 * 60); // 30 minutes
            response.addCookie(cookie);
            response.sendRedirect(request.getContextPath() + "/profile-cookie");
        } else {
            request.setAttribute("error", "Sai tài khoản hoặc mật khẩu (mật khẩu mặc định: 123)");
            request.getRequestDispatcher("/WEB-INF/views/login_cookie.jsp").forward(request, response);
        }
    }
}
