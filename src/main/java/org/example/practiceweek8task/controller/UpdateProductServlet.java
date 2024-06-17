package org.example.practiceweek8task.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.practiceweek8task.dao.ProductDao;
import org.example.practiceweek8task.util.ConnectionUtil;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        String name = request.getParameter("name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        System.out.println("called ");


        // Update the product quantity
        try (Connection connection = ConnectionUtil.getConnection()) {
            ProductDao productDao = new ProductDao(connection);
            productDao.updateProductQuantity(name, quantity);
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exception properly, maybe show an error page
            // Redirect to an error page
            response.sendRedirect("error.jsp");
            return; // Stop further execution
        }

        // Redirect to a success page
        response.sendRedirect("product-success.jsp?name=" + name + "&quantity=" + quantity);
    }
}
