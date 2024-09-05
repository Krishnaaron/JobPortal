<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
        .form-group {
            margin-bottom: 15px;
            position: relative; /* Added for positioning feedback messages */
        }
        .btn-submit {
            font-size: 1.2rem;
            padding: 12px 24px;
        }
        .btn-back {
            font-size: 0.9rem; /* Decreased size of the back to login button */
            padding: 8px 16px;
            margin-top: 10px;
        }
        .feedback {
            position: absolute;
            top: 100%;
            left: 0;
            width: 100%;
            text-align: left;
            padding: 5px;
            font-size: 0.9rem;
        }
        .feedback.error {
            color: red;
        }
        .feedback.success {
            color: green;
        }
    </style>
    <script>
        function validateEmail(email) {
            const re = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            return re.test(email);
        }

        function validateForm() {
            const emailInput = document.forms["forgotPasswordForm"]["email"];
            const emailValue = emailInput.value;
            const feedback = document.getElementById("emailFeedback");

            if (!validateEmail(emailValue)) {
                emailInput.style.borderColor = "red";
                feedback.textContent = "Please enter a valid email address.";
                feedback.className = "feedback error";
                return false;
            } else {
                emailInput.style.borderColor = "green";
                feedback.textContent = "Valid email address.";
                feedback.className = "feedback success";
            }

            return true;
        }
    </script>
</head>
<body>


    <div class="card">
        <h3>Forgot Password</h3>
        <p>Enter your email address to receive a password reset link.</p>
        <form name="forgotPasswordForm" action="AdminPasswordForgetPassword" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <input type="email" class="form-control" name="email" placeholder="Enter your email" oninput="validateForm()">
                <div id="emailFeedback" class="feedback"></div>
            </div>
            <button type="submit" class="btn btn-primary btn-lg btn-submit">Submit</button>
        </form>
        
        <a href="adminlogincontroller" class="btn btn-secondary btn-back">Back to Login</a>
        
    </div>

    <!-- Bootstrap JS scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
