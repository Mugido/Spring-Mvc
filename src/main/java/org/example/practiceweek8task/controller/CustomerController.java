package org.example.practiceweek8task.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.practiceweek8task.dao.CustomerDao;
import org.example.practiceweek8task.dao.UserDao;
import org.example.practiceweek8task.model.Customer;
import org.example.practiceweek8task.model.UserSignup;
import org.example.practiceweek8task.util.ConnectionUtil;

import java.io.IOException;

@WebServlet(name = "customer", value = "/signup_customer")
public class CustomerController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Customer customer = new Customer(firstName, lastName, email, password);
        CustomerDao userDao = new CustomerDao(ConnectionUtil.getConnection());
        userDao.addCustomer(customer);

        // Redirect to a success page or display a message
        response.sendRedirect("customerLogin.jsp");
    }


}
