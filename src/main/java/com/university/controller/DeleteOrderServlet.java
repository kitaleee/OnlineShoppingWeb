package com.university.controller;

import com.university.dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/delete-order")
public class DeleteOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String idStr = request.getParameter("id");

        if (idStr != null) {
            int orderId = Integer.parseInt(idStr);
            new OrderDAO().deleteOrderById(orderId);
        }

        response.sendRedirect("admin/orders-product.jsp");
    }
}
