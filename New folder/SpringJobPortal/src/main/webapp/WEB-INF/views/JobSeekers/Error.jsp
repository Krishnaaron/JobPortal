<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Error</title>
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
            color: #dc3545; /* Red color for emphasis */
            margin-bottom: 20px;
            animation: bounce 1s infinite; /* Added bounce animation */
        }
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
        .btn-retry {
            font-size: 1.2rem; /* Decreased size of the retry button */
            padding: 12px 24px; /* Adjusted padding for the button */
            background-color: #dc3545; /* Red background color */
            border-color: #dc3545; /* Matching border color */
        }
        .btn-retry i {
            margin-left: 5px; /* Space between text and icon */
        }
    </style>
</head>
<body>
<%
   if(session.getAttribute("seeker")==null){
	   
		request.getRequestDispatcher("/views/JobSeekers/seekerlogin.jsp").forward(request, response);
   }

%>

    <div class="card">
        <h3>Registration Error</h3>
        <p>There was an error creating your account:</p>
        <div class="error-message">
            <i class="fas fa-exclamation-circle animated-icon"></i> <!-- Exclamation icon with animation -->
            <p><%= request.getAttribute("errorMessage") %></p>
        </div>
        <p>Please try again:</p>
        <a href="Register.jsp" class="btn btn-primary btn-lg btn-retry">
            Retry Registration 
            <i class="fas fa-redo"></i> <!-- Redo icon -->
        </a>
    </div>

    <!-- Bootstrap and Font Awesome JS scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
