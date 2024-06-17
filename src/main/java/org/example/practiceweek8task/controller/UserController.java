package org.example.practiceweek8task.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.practiceweek8task.dao.UserDao;
import org.example.practiceweek8task.model.UserSignup;
import org.example.practiceweek8task.util.ConnectionUtil;

import java.io.IOException;

    @WebServlet(name = "user", value = "/signup")
    public class UserController extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            UserSignup user = new UserSignup(firstName, lastName, email, password);
            UserDao userDao = new UserDao(ConnectionUtil.getConnection());
            userDao.addUser(user);

            // Redirect to a success page or display a message
            response.sendRedirect("signup-success.jsp");
        }
    }

