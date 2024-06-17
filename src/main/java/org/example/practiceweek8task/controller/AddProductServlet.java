package org.example.practiceweek8task.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.practiceweek8task.dao.ProductDao;
import org.example.practiceweek8task.model.Product;
import org.example.practiceweek8task.util.ConnectionUtil;

import java.io.IOException;

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Product product = new Product();
        product.setName(name);
        product.setPrice(price);
        product.setQuantity(quantity);


        ProductDao productDao = new ProductDao(ConnectionUtil.getConnection());
        productDao.addProduct(product);

        // Redirect to a success page with product details as query parameters
        response.sendRedirect("product-success.jsp?name=" + name + "&price=" + price + "&quantity=" + quantity);
    }
}