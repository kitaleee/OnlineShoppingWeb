package com.university.controller;

import com.university.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/delete-user")
public class DeleteUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            new UserDAO().deleteUser(id);
            response.sendRedirect("admin/manage-users.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin/manage-users.jsp?error=true");
        }
    }
}
