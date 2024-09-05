<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Created</title>
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
            color: #007bff;
            margin-bottom: 20px;
            animation: pulse 1s infinite;
        }
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }
        .btn-back {
            font-size: 0.9rem;
            padding: 8px 16px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<%

   response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//http 1.1
   response.setHeader("Pragma","no-cache");//http1.0
   response.setHeader("Expires","0");// Proxies
   
   if(session.getAttribute("admin")==null){
	   
		request.getRequestDispatcher("/views/Admin/AdminLogin.jsp").forward(request, response);
   }

%>

    <div class="card">
        <i class="fas fa-user-shield animated-icon"></i> <!-- Admin icon with animation -->
        <h3>Admin Created</h3>
        <p>A new admin user has been successfully created.</p>
        <a href="demopro.jsp" class="btn btn-secondary btn-back">Back to Profile</a>
    </div>

    <!-- Bootstrap and Font Awesome JS scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
    