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
        Cookie cookie = new Cookie("user", "");
        cookie.setMaxAge(0);
        cookie.setPath(path);
        response.addCookie(cookie);
        response.sendRedirect(request.getContextPath() + "/login-cookie");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
