package com.university.controller;

import com.university.dao.ProductDAO;
import com.university.model.Product;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@MultipartConfig
public class UploadProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id"); // dùng để xác định đang edit
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        Part filePart = request.getPart("image");

        boolean isEdit = (idStr != null && !idStr.trim().isEmpty());
        String fileName = "";

        if (name == null || description == null || priceStr == null ||
            name.trim().isEmpty() || description.trim().isEmpty() || priceStr.trim().isEmpty()) {

            request.getSession().setAttribute("errorMsg", "Please fill in all fields!");
            response.sendRedirect("admin/" + (isEdit ? ("edit-product.jsp?id=" + idStr) : "add-product.jsp"));
            return;
        }

        try {
            double price = Double.parseDouble(priceStr);

            // Nếu có file ảnh mới
            if (filePart != null && filePart.getSize() > 0 && filePart.getSubmittedFileName() != null) {
                fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

                String uploadDir = getServletContext().getRealPath("/images/products");
                File uploadFolder = new File(uploadDir);
                if (!uploadFolder.exists()) uploadFolder.mkdirs();
                filePart.write(uploadDir + File.separator + fileName);
            }

            Product product = new Product();
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);

            ProductDAO dao = new ProductDAO();

            if (isEdit) {
                int id = Integer.parseInt(idStr);
                product.setId(id);

                // Giữ nguyên ảnh cũ nếu không upload ảnh mới
                if (fileName.isEmpty()) {
                    fileName = dao.getProductById(id).getImage();
                }
                product.setImage(fileName);

                boolean updated = dao.updateProduct(product);
                if (updated) {
                    request.getSession().setAttribute("successMsg", "Product updated successfully!");
                    response.sendRedirect("admin/view-product.jsp");
                } else {
                    request.getSession().setAttribute("errorMsg", "Failed to update product.");
                    response.sendRedirect("admin/edit-product.jsp?id=" + id);
                }

            } else {
                product.setImage(fileName);

                boolean added = dao.addProduct(product);
                if (added) {
                    request.getSession().setAttribute("successMsg", "Product added successfully!");
                    response.sendRedirect("admin/dashboard.jsp");
                } else {
                    request.getSession().setAttribute("errorMsg", "Failed to add product.");
                    response.sendRedirect("admin/add-product.jsp");
                }
            }

        } catch (Exception e) {
            request.getSession().setAttribute("errorMsg", "❗ Error: " + e.getMessage());
            response.sendRedirect("admin/" + (isEdit ? ("edit-product.jsp?id=" + idStr) : "add-product.jsp"));
        }
    }
}
