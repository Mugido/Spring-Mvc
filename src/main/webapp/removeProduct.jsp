<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Remove Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #333;
            color: #fff;
            padding: 20px 0;
            text-align: center;
        }
        .header h1 {
            margin: 0;
            font-size: 24px;
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
            color: #007bff;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        input[type="text"], input[type="submit"] {
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 300px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .footer {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
            text-align: center;
            position: absolute;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
<div class="header">
    <h1>Product Management System</h1>
</div>

<div class="container">
    <h1>Remove Product</h1>
    <form action="RemoveProductServlet" method="post">
        <label for="name">Product Name:</label>
        <input type="text" name="name" id="name" required><br><br>
        <label for="price">Product Price:</label>
        <input type="text" name="price" id="price" required><br><br>
        <input type="submit" value="Remove Product">
    </form>
</div>

<div class="footer">
    <p>&copy; 2024 Your Company. All rights reserved.</p>
</div>
</body>
</html>
