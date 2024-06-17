<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        .header {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
        }
        .header h1 {
            margin: 0;
        }
        .footer {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
            position: absolute;
            bottom: 0;
            width: 100%;
        }
        h1 {
            margin-top: 50px;
            color: #007bff;
        }
        a {
            display: block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="header">
    <h1>Welcome to JSP - Hello World!</h1>
</div>

<h1><%= "Hello World!" %></h1>
<br/>
<a href="signup.jsp">Hello Servlet</a>

<div class="footer">
    <p>&copy; 2024 Your Company. All rights reserved.</p>
</div>
</body>
</html>
