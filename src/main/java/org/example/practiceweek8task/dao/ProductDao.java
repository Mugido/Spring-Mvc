package org.example.practiceweek8task.dao;

import org.example.practiceweek8task.model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    private Connection connection;
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/EcommerceDb1";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Starline24$";

    public ProductDao(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public ProductDao(Connection connection) {
        this.connection = connection;
    }

    public void addProduct(Product product) {
        String sql = "INSERT INTO product (name, price, quantity) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setInt(3, product.getQuantity());
            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating product failed, no rows affected.");
            }

            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    product.setId(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating product failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("Product has been added");
    }

    public void removeProduct(String name) {
        String sql = "DELETE FROM product WHERE name = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, name);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateProductQuantity(String name, int quantity) {
        String sql = "UPDATE product SET quantity = ? WHERE name = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, quantity);
            statement.setString(2, name);
            System.out.println(name + "" + quantity);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("Product quantity has been updated");
    }

    public void increaseProductQuantity(String name, int quantityToAdd) {
        String sql = "UPDATE product SET quantity = quantity + ? WHERE name = ?";
//        String sql = "UPDATE product SET quantity = 8 WHERE name = ?";
        System.out.println("called ");
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, quantityToAdd);
            statement.setString(2, name);

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("Product quantity has been increased");
    }

    public void decreaseProductQuantity(String name, int quantityToSubtract) {
        String sql = "UPDATE product SET quantity = GREATEST(quantity - ?, 0) WHERE name = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, quantityToSubtract);
            statement.setString(2, name);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("Product quantity has been decreased");
    }

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM product";
        try {

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Product product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setPrice(resultSet.getDouble("price"));
                product.setQuantity(resultSet.getInt("quantity"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public boolean deleteProduct(int id){
        boolean success = false;
        try{
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM product where id=?");
            preparedStatement.setInt(1, id);
            int delete = preparedStatement.executeUpdate();
            if(delete>0){
                success = true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return success;
    }
    public void increaseProductQuantity(int productId, int quantityToAdd) {
        String sql = "UPDATE product SET quantity = quantity + ? WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, quantityToAdd);
            statement.setInt(2, productId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void decreaseProductQuantity(int productId, int quantityToSubtract) {
        String sql = "UPDATE product SET quantity = GREATEST(quantity - ?, 0) WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, quantityToSubtract);
            statement.setInt(2, productId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}