package org.example.practiceweek8task.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.practiceweek8task.dao.ProductDao;
import org.example.practiceweek8task.util.ConnectionUtil;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/RemoveProductServlet")
public class RemoveProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");

        ProductDao productDao = new ProductDao(ConnectionUtil.getConnection());
        productDao.removeProduct(name);

        response.sendRedirect("product-success.jsp?removed=true");
    }
}