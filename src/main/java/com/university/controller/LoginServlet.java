package com.university.controller;

import com.university.dao.UserDAO;
import com.university.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String redirect = req.getParameter("redirect");

        UserDAO dao = new UserDAO();
        User user = dao.getUserByEmailAndPassword(email, password);

            if (user != null) {
        if (!user.isActive()) {
            req.setAttribute("error", "Your account has been deactivated. Please contact admin.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        HttpSession session = req.getSession();
        session.setAttribute("currentUser", user);

        if (redirect != null && !redirect.isEmpty()) {
            resp.sendRedirect(redirect);
        } else if ("admin".equals(user.getRole())) {
            resp.sendRedirect("admin/dashboard.jsp");
        } else {
            resp.sendRedirect("home");
        }
        } else {
            req.setAttribute("error", "Invalid email or password!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }

    }
}

