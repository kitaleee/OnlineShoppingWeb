package com.university.controller;

import com.university.dao.CartDAO;
import com.university.dao.OrderDAO;
import com.university.model.CartItem;
import com.university.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        if (currentUser == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        CartDAO cartDAO = new CartDAO();
        List<CartItem> cart = cartDAO.getCartByUser(currentUser.getId());

        if (cart == null || cart.isEmpty()) {
            req.setAttribute("message", "Your cart is empty.");
            req.getRequestDispatcher("order_result.jsp").forward(req, resp);
            return;
        }

        // Save order (có thể thêm DAO riêng để lưu vào DB nếu cần)
        OrderDAO orderDAO = new OrderDAO();
        orderDAO.saveOrder(currentUser.getId(), cart);

        // Clear cart after saving order
        cartDAO.clearCart(currentUser.getId());

        req.setAttribute("cartItems", cart);
        req.setAttribute("user", currentUser);
        req.getRequestDispatcher("order_result.jsp").forward(req, resp);
    }
}
