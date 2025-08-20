package com.example.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to JSP
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Simple demo auth: accept any non-empty user with password "123"
        if (username != null && !username.trim().isEmpty() && "123".equals(password)) {
            HttpSession session = request.getSession(true);
            session.setAttribute("user", username.trim());
            // 30 minutes
            session.setMaxInactiveInterval(30 * 60);
            response.sendRedirect(request.getContextPath() + "/profile");
        } else {
            request.setAttribute("error", "Sai tài khoản hoặc mật khẩu (mật khẩu mặc định: 123)");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }
    }
}
