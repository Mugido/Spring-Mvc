package org.example.practiceweek8task.dao;

import org.example.practiceweek8task.model.Customer;
import org.example.practiceweek8task.model.UserSignup;
import org.example.practiceweek8task.util.ConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CustomerDao {
    private Connection connection;


    public CustomerDao(Connection connection) {
        this.connection = ConnectionUtil.getConnection();
    }

    public void addCustomer(Customer customer){
        try{
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO customer (firstName, lastName, email, password) VALUES (?, ?, ?, ?)");
            preparedStatement.setString(1, customer.getFirstName());
            preparedStatement.setString(2, customer.getLastName());
            preparedStatement.setString(3, customer.getEmail());
            preparedStatement.setString(4, customer.getPassword());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
