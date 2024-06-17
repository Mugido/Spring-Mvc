<%@ page import="org.example.practiceweek8task.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.practiceweek8task.dao.ProductDao" %>
<%@ page import="org.example.practiceweek8task.util.ConnectionUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    // Fetch all products
    ProductDao productDao = new ProductDao(ConnectionUtil.getConnection());
    List<Product> products = productDao.getAllProducts();

%>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .header {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
            text-align: center;
            margin-bottom: 20px;
        }
        .header h1 {
            margin: 0;
        }
        h2 {
            text-align: center;
            color: #007bff;
        }
        p {
            text-align: center;
            margin-bottom: 20px;
            color: #555;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        a {
            text-decoration: none;
            color: #007bff;
            margin-right: 10px;
        }
        .quantity-controls {
            display: none;
            align-items: center;
        }
        .quantity-controls button {
            margin: 0 5px;
            padding: 5px 10px;
            font-size: 16px;
        }
        .edit-mode .quantity-controls {
            display: flex;
        }
    </style>
    <script>
        function toggleEdit(productId) {
            var row = document.getElementById("row-" + productId);
            var controls = row.getElementsByClassName("quantity-controls")[0];
            if (controls.style.display === "none" || controls.style.display === "") {
                controls.style.display = "flex";
            } else {
                controls.style.display = "none";
            }
        }

        function updateQuantity(productId, operation) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "UpdateQuantityServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var quantitySpan = document.getElementById("quantity-" + productId);
                    // var quantitySpan = document.querySelector("#row-" + productId + " .quantity-display");
                    var newQuantity = parseInt(quantitySpan.textContent);
                    newQuantity = operation === 'increase' ? newQuantity + 1 : newQuantity - 1;
                    quantitySpan.textContent = newQuantity;
                }
            };
            xhr.send("productId=" + productId + "&operation=" + operation);
        }
    </script>
</head>
<body>
<div class="header">
    <h1>Welcome Admin</h1>
    <p>Welcome, ${email}, to your dashboard</p>
</div>

<div class="container">
    <div align="center">
        <h2>Store Management</h2>
        <a href="addProduct.jsp">Add New Product</a> <br /> <br />

        <!-- Display table of products -->
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Actions</th>
            </tr>
            <%
//                List<Product> products = (List<Product>) request.getAttribute("products");
                if (products != null && !products.isEmpty()) {
                    for (Product product : products) {
            %>
            <tr id="row-<%= product.getId() %>">
                <td><%= product.getId() %></td>
                <td><%= product.getName() %></td>
                <td><%= product.getPrice() %></td>
                <td id="quantity-<%= product.getId() %>"><%= product.getQuantity() %></td>
                <td>
                    <a href="javascript:void(0);" onclick="toggleEdit(<%= product.getId() %>)">Edit</a>
                    <a href="deleteProduct?id=<%= product.getId() %>">Delete</a>
                    <div class="quantity-controls">
                        <button onclick="updateQuantity(<%= product.getId() %>, 'decrease')">-</button>
<%--                        <span id="quantity-<%= product.getId() %>"><%= product.getQuantity() %></span>--%>
                        <button onclick="updateQuantity(<%= product.getId() %>, 'increase')">+</button>
                    </div>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="5">No products found.</td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</div>

</body>
</html>
