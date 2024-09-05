<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Submit Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
    }
    .container {
        width: 300px;
        margin: 0 auto;
        padding-top: 50px;
    }
    .form-group {
        margin-bottom: 15px;
    }
    label {
        display: block;
        margin-bottom: 5px;
    }
    input[type="text"], input[type="email"], input[type="password"] {
        width: 100%;
        padding: 8px;
        box-sizing: border-box;
    }
    button {
        padding: 10px 15px;
        background-color: #007BFF;
        color: #FFF;
        border: none;
        cursor: pointer;
    }
    button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<div class="container">
    <form action ="..\..\DemoServle" method="post">
    
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit">Submit</button>
    </form>
</div>
</body>
</html>
