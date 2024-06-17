<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .header, .footer {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
            text-align: center;
        }
        .header h1, .footer p {
            margin: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #007bff;
        }
        p {
            text-align: center;
            margin-bottom: 20px;
            color: #555;
        }
        #productDetails {
            margin-top: 20px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
            gap: 10px; /* Add space between buttons */
        }
        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            flex: 1; /* Make buttons equal width */
        }
        button:hover {
            background-color: #0056b3;
        }
        .Increase {
            margin-right: 10px; /* Space between buttons */
        }
        .Decrease {
            margin-left: 10px; /* Space between buttons */
            margin-right: 10px; /* Space between buttons */
        }
        .Remove {
            margin-left: 10px; /* Space between buttons */
        }
        #notification {
            text-align: center;
            color: green;
            margin-top: 20px;
        }
        a {
            text-decoration: none;
            color: #007bff;
            cursor: pointer;
        }
        a:hover {
            color: #0056b3;
        }
    </style>
    <script>
        function updateQuantity(change) {
            var quantityElement = document.getElementById("quantity");
            var currentQuantity = parseInt(quantityElement.textContent);
            var newQuantity = currentQuantity + change;

            if (newQuantity < 1) {
                newQuantity = 1;
            }

            var name = document.getElementById("name").textContent;

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "UpdateProductServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    quantityElement.textContent = newQuantity;
                }
            };
            xhr.send("name=" + name + "&quantity=" + newQuantity);
        }

        function removeProduct() {
            var name = document.getElementById("name").textContent;

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "RemoveProductServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    document.getElementById("productDetails").style.display = "none";
                    document.getElementById("notification").textContent = "Product " + name + " has been successfully removed.";
                }
            };
            xhr.send("name=" + name);
        }

        function submitForm() {
            document.getElementById("gotoStoreForm").submit();
        }
    </script>
</head>
<body>
<div class="header">
    <h1>Product Management System</h1>
</div>

<div class="container">
    <h1>Product Success</h1>
    <div id="productDetails">
        <p>Product Name: <span id="name"><%= request.getParameter("name") %></span></p>
        <p>Product Price: <span id="price"><%= request.getParameter("price") %></span></p>
        <p>Quantity: <span id="quantity"><%= request.getParameter("quantity") %></span></p>
        <div class="button-container">
            <button class="Increase" onclick="updateQuantity(1)">Increase Quantity</button>
            <button class="Decrease" onclick="updateQuantity(-1)">Decrease Quantity</button>
            <button class="Remove" onclick="removeProduct()">Remove Product</button>
        </div>
    </div>
    <p id="notification"></p>
    <p><a href="addProduct.jsp">Add another product</a></p>
    <form id="gotoStoreForm" action="gotoStore-servlet" method="post">
        <a onclick="submitForm()">Return to Store Management</a>
    </form>
</div>

<div class="footer">
    <p>&copy; 2024 Your Company. All rights reserved.</p>
</div>
</body>
</html>
