<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Login Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 400px;
            margin: 100px auto;
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
        .footer {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
            text-align: center;
            position: absolute;
            bottom: 0;
            width: 100%;
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
        input[type="text"], input[type="email"], input[type="password"], input[type="submit"] {
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
    </style>
</head>
<body>
<div class="header">
    <h1>Welcome to Admin Portal</h1>
</div>

<div class="container">
    <h1>Admin Login Form</h1>
    <form action="login-servlet" method="post">
        Email: <input type="email" name="email" required><br /><br />
        Password: <input type="password" name="password" required><br /><br />
        <input type="submit" value="Login">
    </form>
</div>

<div class="footer">
    <p>&copy; 2024 Your Company. All rights reserved.</p>
</div>

</body>
</html>
