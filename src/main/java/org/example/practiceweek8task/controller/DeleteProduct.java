package org.example.practiceweek8task.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.practiceweek8task.dao.ProductDao;

import java.io.IOException;

@WebServlet("/deleteProduct")
public class DeleteProduct extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        ProductDao productDao = new ProductDao();
        boolean delete = productDao.deleteProduct(id);

        if(delete){
            response.sendRedirect("login-success.jsp");
        }else {
            response.sendRedirect("error");
        }
    }
}
