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

@WebServlet(name = "customerLoginServlet", value = "/customerLogin-servlet")
    public class CustomerLoginServlet extends HttpServlet {
        private static final String JDBC_URL = "jdbc:mysql://localhost:3306/EcommerceDb1";
        private static final String JDBC_USER = "root";
        private static final String JDBC_PASSWORD = "Starline24$";

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
                    String sql = "SELECT * FROM customer WHERE email=? AND password=?";
                    try (PreparedStatement statement = conn.prepareStatement(sql)) {
                        statement.setString(1, email);
                        statement.setString(2, password);
                        try (ResultSet result = statement.executeQuery()) {
                            if (result.next()) {
                                // User authenticated
                                String userEmail = result.getString("email");
                                request.getSession().setAttribute("email", userEmail);

                                // Fetch all products
                                ProductDao productDao = new ProductDao(conn);
                                List<Product> products = productDao.getAllProducts();
                                request.setAttribute("products", products);

                                response.sendRedirect("customer-productList.jsp");

                                //request.getRequestDispatcher("login-success.jsp").forward(request, response);
                            } else {
                                // Invalid credentials
                                response.sendRedirect("signup-error.jsp");
                            }
                        }
                    }
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

        }
    }

