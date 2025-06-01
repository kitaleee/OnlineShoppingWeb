package com.university.controller;

import com.university.dao.UserDAO;
import com.university.model.User;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/update-profile")
public class UpdateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String newPassword = request.getParameter("password");

        // Cập nhật user object
        currentUser.setName(name);
        currentUser.setDob(dob);
        currentUser.setGender(gender);

        if (newPassword != null && !newPassword.trim().isEmpty()) {
            currentUser.setPassword(newPassword);  // Đổi mật khẩu nếu có nhập
        }

        // Cập nhật database
        UserDAO userDAO = new UserDAO();
        userDAO.updateProfile(currentUser);  // sẽ update cả password nếu có

        // Cập nhật lại session
        session.setAttribute("currentUser", currentUser);

        response.sendRedirect("profile.jsp");
    }
}
