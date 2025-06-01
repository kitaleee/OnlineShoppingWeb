package com.university.controller;

import com.university.dao.ProductDAO;
import com.university.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        ProductDAO dao = new ProductDAO();
        List<Product> featured = dao.getFeaturedProducts();
        List<Product> newArrivals = dao.getNewArrivals();

        req.setAttribute("productListFeatured", featured);
        req.setAttribute("productListNew", newArrivals);

        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
