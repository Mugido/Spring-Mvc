package org.example.practiceweek8task.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.practiceweek8task.dao.ProductDao;
import org.example.practiceweek8task.model.Product;

import java.io.IOException;
import java.sql.*;
import java.util.List;

@WebServlet(name = "gotoStore", value = "/gotoStore-servlet")
public class GoToStoreServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/EcommerceDb1";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "Starline24$";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            // Fetch all products
            ProductDao productDao = new ProductDao(conn);
            List<Product> products = productDao.getAllProducts();
            request.setAttribute("products", products);
            request.getRequestDispatcher("login-success.jsp").forward(request, response);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
