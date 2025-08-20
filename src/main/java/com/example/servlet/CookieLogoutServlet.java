package com.example.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CookieLogoutServlet", urlPatterns = {"/logout-cookie"})
public class CookieLogoutServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getContextPath();
        if (path == null || path.isEmpty()) path = "/";
        
        // Xóa cookie user
        Cookie userCookie = new Cookie("user", "");
        userCookie.setMaxAge(0);
        userCookie.setPath(path);
        response.addCookie(userCookie);
        
        // Xóa cookie rememberMe nếu có
        Cookie rememberCookie = new Cookie("rememberMe", "");
        rememberCookie.setMaxAge(0);
        rememberCookie.setPath(path);
        response.addCookie(rememberCookie);
        
        // Chuyển hướng về trang chủ với thông báo
        response.sendRedirect(request.getContextPath() + "/?logout=success");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
