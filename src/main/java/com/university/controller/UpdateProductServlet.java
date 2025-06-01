package com.university.controller;

import com.university.dao.ProductDAO;
import com.university.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.File;

import java.io.IOException;
import java.nio.file.Paths;

@WebServlet("/update-product")
@MultipartConfig
public class UpdateProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String oldImage = request.getParameter("oldImage");

        Part filePart = request.getPart("image");
        String fileName = (filePart != null && filePart.getSize() > 0) 
            ? Paths.get(filePart.getSubmittedFileName()).getFileName().toString() 
            : oldImage;

        // Nếu có file mới thì lưu lại
        if (filePart != null && filePart.getSize() > 0) {
            String uploadDir = getServletContext().getRealPath("/images/products");
            File uploadFolder = new File(uploadDir);
            if (!uploadFolder.exists()) uploadFolder.mkdirs();
            filePart.write(uploadDir + File.separator + fileName);
        }

        Product product = new Product();
        product.setId(id);
        product.setName(name);
        product.setDescription(description);
        product.setPrice(Double.parseDouble(priceStr));
        product.setImage(fileName);

        boolean updated = new ProductDAO().updateProduct(product);
        response.sendRedirect("admin/view-product.jsp");
    }
}
