package org.example.practiceweek8task.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.practiceweek8task.dao.ProductDao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

@WebServlet(name = "UpdateQuantityServlet", value = "/UpdateQuantityServlet")
public class UpdateQuantityServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/EcommerceDb1";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "Starline24$";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        String operation = request.getParameter("operation");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
                ProductDao productDao = new ProductDao(conn);
                if ("increase".equals(operation)) {
                    productDao.increaseProductQuantity(productId, 1);
                } else if ("decrease".equals(operation)) {
                    productDao.decreaseProductQuantity(productId, 1);
                }
                response.setStatus(HttpServletResponse.SC_OK);
            } catch (SQLException ex) {
                ex.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}