<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            width: 50%;
            margin: auto;
            margin-top: 5%;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .animated-icon {
            font-size: 4rem; /* Increased size for more emphasis */
            color: rgb(53, 61, 116); /* blue color for emphasis */
            margin-bottom: 20px;
            animation: bounce 1s infinite; /* Added bounce animation */
        }
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
        .btn-login {
            font-size: 1.2rem; /* Decreased size of the login button */
            padding: 12px 24px; /* Adjusted padding for the button */
            background-color: transparent; /* Transparent background */
            border-color: transparent; /* Transparent border */
            color: #333; /* Default text color */
            transition: all 0.3s ease; /* Smooth transition */
        }
        .btn-login:hover {
            color: #dce1dd; /* Green text color on hover */
        }
        .btn-login i {
            margin-left: 5px; /* Space between text and icon */
        }
    </style>
</head>
<body>
    <div class="card">
        <h3>Registration Successful</h3>
        <p>Your account has been successfully registered.</p>
        <p>Please proceed to login:</p>
        <a href="login" class="btn btn-primary btn-lg btn-login"> <!-- Adjusted class for smaller size -->
            Go to Login
            <i class="fas fa-arrow-right animated-icon"></i> <!-- Right arrow icon with animation -->
        </a>
    </div>

    <!-- Bootstrap and Font Awesome JS scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
