<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored ="false"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}\assets\css\adminlogin.css">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .login-container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 85vh;
      padding-bottom: 100px;
    }
    .login-box {
      width: 100%;
      max-width: 400px;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
      background-color: #fff;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .login-box h4 {
      text-align: center;
      margin-bottom: 20px;
      font-family: sans-serif !important;
      border-bottom: 1px solid #ddd;
      padding-bottom: 10px;
    }
    .form-group {
      position: relative;
      margin-bottom: 20px;
    }
    .form-group label {
      font-weight: bold;
    }
    .form-control {
      padding-left: 2.5rem;
    }
    .invalid-feedback,
    .valid-feedback {
      display: none;
    }
    .form-control.is-invalid ~ .invalid-feedback {
      display: block;
    }
    .form-control.is-valid ~ .valid-feedback {
      display: block;
    }
    .sub a {
      float: right;
    }
    .hi {
      /* background-color: #1a32bb; */
      border: 1px solid black;
      height: auto;
    }
    .line {
            /* background-color: #1a32bb; */
            border-bottom:solid #1a32bb;
            
            height: auto;
        }
    .errormessage{
       color:red;
    }
  </style>
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}/assets/images/head.2.png" alt="Jobportal"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
      <ul class="navbar-nav h6">
        <li class="nav-item">
          <a class="nav-link" href="homeJsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="jobController">Find Job</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="aboutController">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="ContectController">Contact</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link line" href="#" id="loginDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Login/Register
          </a>
          <div class="dropdown-menu" aria-labelledby="loginDropdown">
            <a class="dropdown-item" href="employersLogin">Employer</a>
            <a class="dropdown-item" href="login">Job Seekers</a>
            <a class="dropdown-item hi" href="adminlogincontroller">Admin</a>
          </div>
        </li>
      </ul>
    </div>
  </nav>
  <div class="login-container">
    <div class="login-box">
      <h4>Login As Admin</h4>
     
      <form id="loginForm" action="adminLogin" method="post">
        <div class="form-group">
          <label for="email">Email address: <i class="input-icon fas fa-envelope"></i></label>
          <input type="email" class="form-control" id="email" name="email" required>
          <div class="invalid-feedback">Please enter a valid email address.</div>
        </div>
        <div class="form-group">
          <label for="password">Password: <i class="input-icon fas fa-lock"></i></label>
          <input type="password" class="form-control" id="password" name="password" required>
          <div class="invalid-feedback">Please enter a password.</div>
        </div>
        <div class="sub">
          <button type="submit" class="btn btn-primary btn-block">Login</button>
          <br>
          <a href="ForgetPassword"><i class="fas fa-unlock-alt"></i>Forgot Password?</a>
        </div>
       
        <c:if test="${not empty errorMessage}">
        <div class="errormessage">${errorMessage}</div>
    </c:if>
      </form>
    </div>
  </div>
  <footer class="footer">
    <div class="container">
      <div class="row">
        <div class="col-md-3">
          <h5>ABOUT US</h5>
          <p>job portal involves various aspects to engage both job seekers and employers effectively. Here's a breakdown of the types of content you might include.</p>
        </div>
        <div class="col-md-3">
          <h5>CONTACT INFO</h5>
          <p>Address: Salem, Tamil Nadu</p>
          <p>Phone: +91 9788336639</p>
          <p>Email: jobfinder@job.ac.com</p>
        </div>
        <div class="col-md-3">
          <h5>LINKS</h5>
          <p><a href="#">Terms & Conditions</a></p>
          <p><a href="#">Download Job Finder App</a></p>
          <p><a href="#">Vulnerability Disclosure Policy</a></p>
          <p><a href="#">International Jobs</a></p>
          <p><a href="#">Support</a></p>
          <p>
            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
              <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951"/>
            </svg> &nbsp;
            <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-instagram" viewBox="0 0 16 16">
              <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.9 3.9 0 0 0-1.417.923A3.9 3.9 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.9 3.9 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8c0-2.172-.01-2.444-.048-3.297-.04-.852-.174-1.433-.372-1.942a3.9 3.9 0 0 0-.923-1.417 3.901 3.901 0 0 0-1.417-.923c-.509-.198-1.09-.333-1.942-.372C10.445.01 10.173 0 8 0ZM8 1.529c2.139 0 2.39.008 3.233.046.78.036 1.204.167 1.486.277.373.145.639.318.92.599.28.28.454.546.598.92.11.281.242.705.278 1.486.038.843.045 1.094.045 3.234 0 2.139-.007 2.39-.045 3.233-.036.78-.167 1.204-.278 1.486a2.371 2.371 0 0 1-.599.92 2.374 2.374 0 0 1-.92.598c-.282.11-.705.242-1.485.278-.844.038-1.095.045-3.234.045-2.14 0-2.39-.007-3.234-.045-.78-.036-1.204-.168-1.486-.278a2.36 2.36 0 0 1-.92-.598 2.36 2.36 0 0 1-.598-.92c-.11-.282-.242-.706-.278-1.486-.038-.843-.045-1.094-.045-3.233 0-2.14.007-2.39.045-3.234.036-.78.168-1.204.278-1.485.144-.373.318-.64.598-.92a2.37 2.37 0 0 1 .92-.599c.282-.11.705-.242 1.486-.278.843-.038 1.094-.045 3.233-.045Zm0 2.405a4.067 4.067 0 1 0 0 8.133 4.067 4.067 0 0 0 0-8.133ZM8 10.6a2.6 2.6 0 1 1 0-5.2 2.6 2.6 0 0 1 0 5.2Zm5.271-7.191a.95.95 0 1 1-1.902 0 .95.95 0 0 1 1.902 0Z"/>
            </svg>
          </p>
        </div>
        <div class="col-md-3">
          <h5>NEWSLETTER</h5>
          <p>Sign up for job alerts, latest news, and updates</p>
          <form action="#" method="POST">
            <div class="form-group">
              <input type="email" class="form-control" placeholder="Your email address">
            </div>
            <button type="submit" class="btn btn-primary">Subscribe</button>
          </form>
        </div>
      </div>
    </div>
  </footer>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script>
  $(document).ready(function() {
	    var emailInput = $('#email');
	    var passwordInput = $('#password');

	    function validateEmail() {
	      var email = emailInput.val();
	      var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	      if (!emailPattern.test(email)) {
	        emailInput.addClass('is-invalid').removeClass('is-valid');
	        return false;
	      } else {
	        emailInput.removeClass('is-invalid').addClass('is-valid');
	        return true;
	      }
	    }

	    function validatePassword() {
	      var password = passwordInput.val();
	      var passwordPattern = /^(?=.*[A-Z])(?=.*[a-z]).{6,}$/;
	      if (!passwordPattern.test(password)) {
	        passwordInput.addClass('is-invalid').removeClass('is-valid');
	        return false;
	      } else {
	        passwordInput.removeClass('is-invalid').addClass('is-valid');
	        return true;
	      }
	    }

	    emailInput.on('change', validateEmail);
	    passwordInput.on('change', validatePassword);

	    $('#loginForm').on('submit', function(event) {
	      event.preventDefault();
	      var isValid = true;

	      if (!validateEmail()) isValid = false;
	      if (!validatePassword()) isValid = false;

	      if (isValid) {
	        // If the form is valid, proceed with the form submission
	        this.submit();
	      }
	    });
	  });	
  </script>
</body>
</html>
