<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored ="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/seekerregister.css">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .login-container {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 85vh;
      padding: 20px;
    }
    .login-box {
      width: 100%;
      max-width: 450px;
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
    .form-control.is-invalid {
      border-color: red;
    }
    .form-control.is-valid {
      border-color: green;
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
    .sub .forget {
      float: right;
    }
    .hi {
      border: 1px solid black;
      height: auto;
    }
    .signup {
      text-align: left !important;
    }
    .mandatory {
      color: red;
    }
    footer {
      background-color: #f8f9fa;
      padding: 20px 0;
    }
  </style>
  <style>
        .modal-content.success {
            animation: successAnimation 0.5s ease-in-out;
        }

        .modal-content.error {
            animation: errorAnimation 0.5s ease-in-out;
        }

        @keyframes successAnimation {
            0% {
                opacity: 0;
                transform: scale(0.8);
            }
            100% {
                opacity: 1;
                transform: scale(1);
            }
        }

        @keyframes errorAnimation {
            0% {
                opacity: 0;
                transform: translateY(-100%);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .success-icon {
            font-size: 3rem;
            color: green;
            animation: iconAnimation 1s ease-in-out infinite;
        }

        .error-icon {
            font-size: 3rem;
            color: red;
            animation: iconAnimation 1s ease-in-out infinite;
        }

        @keyframes iconAnimation {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.2);
            }
        }
        
        .link {
            /* background-color: #1a32bb; */
            border-bottom:solid #1a32bb;
            
            height: auto;
        }
    </style>
</head>

<body>
   <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}\assets\images\head.2.png" alt="Jobportal"></a>
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
          <a class="nav-link link" href="#" id="loginDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Login/Register
          </a>
          <div class="dropdown-menu" aria-labelledby="loginDropdown">
            <a class="dropdown-item" href="employer_login.html">Employer</a>
            <a class="dropdown-item hi" href="login">Job Seekers</a>
            <a class="dropdown-item" href="adminlogincontroller">Admin</a>
          </div>
        </li>
      </ul>
    </div>
  </nav>
  <div class="login-container">
    <div class="login-box">
      <h4>Register as Candidate</h4>
      
      <form id="registerForm" action="seekerRegister">
        <div class="form-group">
          <label for="name">Full Name <span class="mandatory">*</span>: <i class="input-icon fas fa-user"></i></label>
          <input type="text" class="form-control" id="name" name="name">
          
          <div class="invalid-feedback">Please enter your full name.</div>
        </div>
        <div class="form-group">
          <label for="email">Email address <span class="mandatory">*</span>: <i class="input-icon fas fa-envelope"></i></label>
          <input type="email" class="form-control" id="email" name="email">
          <div class="invalid-feedback">Please enter a valid email address.</div>
        </div>
        <div class="form-group">
          <label for="phoneNumber">Mobile Number <span class="mandatory">*</span>: <i class="input-icon fas fa-phone"></i></label>
          <input type="text" class="form-control" id="mobile" name="phoneNumber">
          <div class="invalid-feedback">Please enter a valid 10-digit mobile number starting with 6, 7, 8, or 9.</div>
        </div>
        <div class="form-group">
          <label for="password">Password <span class="mandatory">*</span>: <i class="input-icon fas fa-lock"></i></label>
          <input type="password" class="form-control" id="password" name="password">
          <div class="invalid-feedback">Please enter a password with at least 6 characters, 1 special character, 1 uppercase letter, and 1 lowercase letter.</div>
        </div>
        <div class="form-group">
          <label for="confirmPassword">Confirm Password <span class="mandatory">*</span>: <i class="input-icon fas fa-lock"></i></label>
          <input type="password" class="form-control" id="confirmPassword">
          <div class="invalid-feedback">Passwords do not match.</div>
        </div>
        <div class="sub">
          <button type="submit" class="btn btn-primary btn-block">Register</button>
          <button type="reset" class="btn btn-secondary btn-block">Reset</button>
          <br>
          <a href="login"> <i class="fas fa-sign-in-alt"></i> Back to Login</a>
        </div>
      </form>
    </div>
  </div>
  
  
  <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content error">
            <div class="modal-header">
                <h5 class="modal-title" id="errorModalLabel">Error Message</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-center">
                <i class="fas fa-exclamation-circle error-icon"></i>
                <p>Email ID already exists.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>
  <footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <h5>ABOUT US</h5>
                <p>Job portal involves various aspects to engage both job seekers and employers effectively. Here's a breakdown of the types of content you might include.</p>
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
                <!-- <p>
                  <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
                    <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"/>
                  </svg>
                </p> -->
            </div>
            <div class="col-md-3">
                <h5>FOLLOW US</h5>
                <p>Stay connected through our social media channels:</p>
                <p>
                  <a href="https://www.facebook.com" target="_blank" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                  <a href="https://www.twitter.com" target="_blank" class="social-icon"><i class="fab fa-twitter"></i></a>
                  <a href="https://www.linkedin.com" target="_blank" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
                  <a href="https://www.instagram.com" target="_blank" class="social-icon"><i class="fab fa-instagram"></i></a>
                </p>
            </div>
        </div>
    </div>
  </footer>
  
  
  
  <script>
  document.addEventListener('DOMContentLoaded', function() {
	  var form = document.getElementById('registerForm');

	  function validateName() {
	    var name = document.getElementById('name');
	    if (name.value.trim() === '') {
	      name.classList.add('is-invalid');
	      return false;
	    } else {
	      name.classList.remove('is-invalid');
	      name.classList.add('is-valid');
	      return true;
	    }
	  }

	  function validateEmail() {
	    var email = document.getElementById('email');
	    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	    if (!emailPattern.test(email.value)) {
	      email.classList.add('is-invalid');
	      return false;
	    } else {
	      email.classList.remove('is-invalid');
	      email.classList.add('is-valid');
	      return true;
	    }
	  }

	  function validateMobile() {
	    var mobile = document.getElementById('mobile');
	    var mobilePattern = /^[6-9]\d{9}$/;
	    if (!mobilePattern.test(mobile.value)) {
	      mobile.classList.add('is-invalid');
	      return false;
	    } else {
	      mobile.classList.remove('is-invalid');
	      mobile.classList.add('is-valid');
	      return true;
	    }
	  }

	  function validatePassword() {
	    var password = document.getElementById('password');
	    var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{6,}$/;
	    if (!passwordPattern.test(password.value)) {
	      password.classList.add('is-invalid');
	      return false;
	    } else {
	      password.classList.remove('is-invalid');
	      password.classList.add('is-valid');
	      return true;
	    }
	  }

	  function validateConfirmPassword() {
	    var password = document.getElementById('password');
	    var confirmPassword = document.getElementById('confirmPassword');
	    if (password.value !== confirmPassword.value) {
	      confirmPassword.classList.add('is-invalid');
	      return false;
	    } else {
	      confirmPassword.classList.remove('is-invalid');
	      confirmPassword.classList.add('is-valid');
	      return true;
	    }
	  }

	  // Attach onchange event listeners
	  document.getElementById('name').addEventListener('change', validateName);
	  document.getElementById('email').addEventListener('change', validateEmail);
	  document.getElementById('mobile').addEventListener('change', validateMobile);
	  document.getElementById('password').addEventListener('change', validatePassword);
	  document.getElementById('confirmPassword').addEventListener('change', validateConfirmPassword);

	  form.addEventListener('submit', function(event) {
	    event.preventDefault();
	    var isValid = true;

	    if (!validateName()) isValid = false;
	    if (!validateEmail()) isValid = false;
	    if (!validateMobile()) isValid = false;
	    if (!validatePassword()) isValid = false;
	    if (!validateConfirmPassword()) isValid = false;

	    if (isValid) {
	      form.submit();
	      form.reset();
	      var inputs = document.querySelectorAll('.form-control');
	      inputs.forEach(function(input) {
	        input.classList.remove('is-valid', 'is-invalid');
	      });
	    }
	  });
	});

  </script>
  
  
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function() {
        var message = '<%= session.getAttribute("message") %>';
        var messageType = '<%= session.getAttribute("messageType") %>';
        
        if (message && messageType) {
             if (messageType === "error") {
                $('#errorModal').modal('show');
            }
            
            // Clear session attributes after showing the modal
            <% session.removeAttribute("message"); %>
            <% session.removeAttribute("messageType"); %>
        }
    });
    
    $(document).ready(function() {
        var message = '<%= session.getAttribute("profile") %>';
        var messageType = '<%= session.getAttribute("profileType") %>';
        
        if (message && messageType) {
            if (messageType === "success") {
                $('#successProfileModal').modal('show');
            } 
            
            // Clear session attributes after showing the modal
            <% session.removeAttribute("profile"); %>
            <% session.removeAttribute("profileType"); %>
        }
    });
</script>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
  <script src="/js/registration.js"></script>
</body>
</html>
