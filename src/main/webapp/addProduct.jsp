<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 10px;
        }
        input[type="text"],
        input[type="number"] {
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        /* Header styling */
        header {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
            text-align: center;
        }
        /* Footer styling */
        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>

    <script>
        function addProduct() {
            var name = document.getElementById("name").value;
            var price = document.getElementById("price").value;
            var quantity = document.getElementById("quantity").value;

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "AddProductServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // Redirect to success page or display success message
                    window.location.href = "product-success.jsp?name=" + name + "&price=" + price + "&quantity=" + quantity;
                }
            };
            xhr.send("name=" + name + "&price=" + price + "&quantity=" + quantity);
        }
    </script>
</head>
<body>
<header>
    <h1>Awesome Store Management</h1>
</header>

<div class="container">
    <h2>Add Product</h2>
    <form>
        <label for="name">Product Name:</label>
        <input type="text" id="name" required>

        <label for="price">Product Price:</label>
        <input type="text" id="price" required>

        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" required>

        <input type="button" value="Add Product" onclick="addProduct()">
    </form>
</div>

<footer>
    <p>&copy; 2024 Awesome Store Management. All rights reserved.</p>
</footer>
</body>
</html>
