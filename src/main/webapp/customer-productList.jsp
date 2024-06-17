<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.practiceweek8task.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.practiceweek8task.dao.ProductDao" %>
<%@ page import="org.example.practiceweek8task.util.ConnectionUtil" %>

<%
    // Fetch all products
    ProductDao productDao = new ProductDao(ConnectionUtil.getConnection());
    List<Product> products = productDao.getAllProducts();
%>
<!DOCTYPE html>
<html>
<head>
    <title>E-Commerce Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .card-header {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }
        .row {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .col-md-3 {
            flex: 0 0 23%;
            margin-bottom: 20px;
        }
        .card {
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .card-img-top {
            width: 100%;
            height: auto;
            border-bottom: 1px solid #ddd;
        }
        .card-body {
            padding: 15px;
        }
        .card-title {
            font-size: 18px;
            margin-bottom: 10px;
        }
        .price {
            font-size: 16px;
            color: #28a745;
            margin-bottom: 15px;
        }
        .btn {
            text-align: center;
            padding: 10px 15px;
            font-size: 14px;
            border-radius: 5px;
            text-decoration: none;
            color: white;
            display: inline-block;
        }
        .btn-dark {
            background-color: #343a40;
        }
        .btn-primary {
            background-color: #007bff;
        }
        .btn-success {
            background-color: #28a745;
        }
        .btn-info {
            background-color: #17a2b8;
        }
        .btn:hover {
            opacity: 0.8;
        }
        .mt-3 {
            margin-top: 15px;
        }
        .d-flex {
            display: flex;
            gap: 10px;
            justify-content: space-between;
        }
        .justify-content-between {
            justify-content: space-between;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card-header my-3">All Products</div>
    <div class="row">
        <%
            if (!products.isEmpty()) {
                for (Product p : products) {
        %>
        <div class="col-md-3 my-3">
            <div class="card w-100">
                <img class="card-img-top" src="product-images/<%=p.getName() %>"
                     alt="<%=p.getName() %>">
                <div class="card-body">
                    <h5 class="card-title"><%=p.getName() %></h5>
                    <h6 class="price">Price: $<%=p.getPrice() %></h6>
                    <div class="mt-3 d-flex justify-content-between">
                        <a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">Add to Cart</a>
                        <a class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
                        <a href="likeProduct?productId=<%= p.getId() %>" class="btn btn-success">Like</a>
                        <a href="saveProduct?productId=<%= p.getId() %>" class="btn btn-info">Save for Later</a>
                    </div>
                </div>
            </div>
        </div>
        <%
                }
            } else {
                out.println("<div class='col-12 text-center'><h5>No products available</h5></div>");
            }
        %>
    </div>
</div>


</body>
</html>
