package com.university.controller;

import com.university.dao.UserDAO;
import com.university.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        User newUser = new User();
        newUser.setName(name);
        newUser.setEmail(email);
        newUser.setPassword(password);
        newUser.setRole("user");

        UserDAO dao = new UserDAO();
        boolean success = dao.registerUser(newUser);

        if (success) {
            resp.sendRedirect("home");
        } else {
            req.setAttribute("error", "Registration failed!");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
    }
}
