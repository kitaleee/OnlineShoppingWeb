package com.university.controller;

import com.university.dao.ProductDAO;
import com.university.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/shop")
public class ProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        ProductDAO productDAO = new ProductDAO();
        List<Product> productList = productDAO.getAllProducts();

        req.setAttribute("productList", productList);
        req.getRequestDispatcher("shop.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }
}
