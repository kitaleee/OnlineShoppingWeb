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

@WebServlet("/upload-product")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,  // 1MB
        maxFileSize = 10 * 1024 * 1024,   // 10MB
        maxRequestSize = 20 * 1024 * 1024 // 20MB
)
public class AddProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        Part imagePart = request.getPart("image");

        if (name == null || description == null || priceStr == null || imagePart == null || imagePart.getSize() == 0) {
            response.sendRedirect("admin/add-product.jsp?msg=empty");
            return;
        }

        try {
            double price = Double.parseDouble(priceStr);

            // Lấy tên file gốc
            String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();

            // Tạo đường dẫn thư mục upload
            String uploadPath = getServletContext().getRealPath("/images/products/");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            // Ghi file vào thư mục
            imagePart.write(uploadPath + File.separator + fileName);

            // Tạo đối tượng sản phẩm
            Product product = new Product();
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);
            product.setImage(fileName); // chỉ lưu tên file ảnh

            boolean success = new ProductDAO().addProduct(product);
            if (success) {
                response.sendRedirect("admin/add-product.jsp?msg=success");
            } else {
                response.sendRedirect("admin/add-product.jsp?msg=fail");
            }

        } catch (NumberFormatException e) {
            response.sendRedirect("admin/add-product.jsp?msg=invalid");
        }
    }
}
