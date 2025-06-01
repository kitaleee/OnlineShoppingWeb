package com.university.controller;

import com.university.dao.UserDAO;
import com.university.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/add-admin")
public class AddAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setRole("admin");
        user.setActive(true); // tự động kích hoạt

        UserDAO dao = new UserDAO();
        dao.insertUser(user);

        response.sendRedirect("admin/manage-users.jsp");
    }
}
