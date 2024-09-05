<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Email ID Not Found</title>
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
            font-size: 4rem;
            color: #dc3545;
            margin-bottom: 20px;
            animation: shake 1s infinite;
        }
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            50% { transform: translateX(5px); }
            75% { transform: translateX(-5px); }
        }
        .btn-back {
            font-size: 0.9rem;
            padding: 8px 16px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="card">
        <i class="fas fa-exclamation-circle animated-icon"></i> <!-- Red exclamation icon -->
        <h3>Email ID Not Found</h3>
        <p>The email ID you entered does not exist in our records.</p>
         <a  href="login" class="btn btn-secondary btn-back">Back to Login</a>
         
    </div>

    <!-- Bootstrap and Font Awesome JS scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
    