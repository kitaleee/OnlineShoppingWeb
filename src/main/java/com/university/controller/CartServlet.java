package com.university.controller;

import com.university.dao.CartDAO;
import com.university.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        if (currentUser == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String action = req.getParameter("action");
        String productIdStr = req.getParameter("productId");
        String quantityStr = req.getParameter("quantity");
        int userId = currentUser.getId();

        if (productIdStr == null || productIdStr.isEmpty()) {
            resp.sendRedirect("cart.jsp");
            return;
        }

        int productId;
        try {
            productId = Integer.parseInt(productIdStr);
        } catch (NumberFormatException e) {
            resp.sendRedirect("cart.jsp");
            return;
        }

        CartDAO cartDAO = new CartDAO();

        if ("remove".equalsIgnoreCase(action)) {
            cartDAO.removeItem(userId, productId);

        } else if ("update".equalsIgnoreCase(action)) {
            if (quantityStr != null && !quantityStr.isEmpty()) {
                try {
                    int quantity = Integer.parseInt(quantityStr);
                    if (quantity <= 0) {
                        cartDAO.removeItem(userId, productId); // tự động xóa nếu nhập 0
                    } else {
                        cartDAO.updateQuantity(userId, productId, quantity); // ✅ KHÔNG cộng dồn
                    }
                } catch (NumberFormatException ignored) {}
            }

        } else { // default is add
            if (quantityStr != null && !quantityStr.isEmpty()) {
                try {
                    int quantity = Integer.parseInt(quantityStr);
                    if (quantity > 0) {
                        cartDAO.addToCart(userId, productId, quantity); // ✅ Cộng dồn
                    }
                } catch (NumberFormatException ignored) {}
            }
        }

        resp.sendRedirect("cart.jsp");
    }
}
