<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored ="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
    .sub .forget {
      float: right;
    } 
    .link {
            /* background-color: #1a32bb; */
            border-bottom:solid #1a32bb;
            
            height: auto;
        }
    .hi {
      /* background-color: #1a32bb; */
      border: 1px solid black;
      height: auto;
    }
    .signup {
      text-align: left !important;
    }
    
      .errormessage{
       color:red;
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
            <a class="dropdown-item" href="employersLogin">Employer</a>
            <a class="dropdown-item hi" href="login">Job Seekers</a>
            <a class="dropdown-item " href="adminlogincontroller">Admin</a>
          </div>
        </li>
      </ul>
    </div>
  </nav>
  <div class="login-container">
    <div class="login-box">
      <h4>Login as Candidate</h4>
        <form id="loginForm" action="seekerdash" method="post">
        <div class="form-group">
          <label for="email">Email address: <i class="input-icon fas fa-envelope"></i></label>
          <input type="email" class="form-control" id="email" name="email">
          <div class="invalid-feedback">Please enter a valid email address.</div>
        </div>
        <div class="form-group">
          <label for="password">Password: <i class="input-icon fas fa-lock"></i></label>
          <input type="password" class="form-control" id="password" name="password">
          <div class="invalid-feedback">Please enter a password.</div>
        </div>
        <div class="sub">
          <button type="submit" class="btn btn-primary btn-block">Login</button>
          <br>
          
          
          <a href="registerc" ><i class="fas fa-user-plus"></i>Sign up?</a>
          <a href="ForgetPasswordForSeeker" class="forget"><i class="fas fa-unlock-alt"></i>Forgot Password?</a>
        </div>
       
        <c:if test="${not empty errorMessage}">
        <div class="errormessage">${errorMessage}</div>
    </c:if>
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
        <!-- Footer content -->
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
                 <p><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
                        <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951"/>
                      </svg> &nbsp;<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-instagram" viewBox="0 0 16 16">
                        <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.9 3.9 0 0 0-1.417.923A3.9 3.9 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.9 3.9 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.9 3.9 0 0 0-.923-1.417A3.9 3.9 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599s.453.546.598.92c.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.5 2.5 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.5 2.5 0 0 1-.92-.598 2.5 2.5 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233s.008-2.388.046-3.231c.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92s.546-.453.92-.598c.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92m-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217m0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334"/>
                      </svg>  &nbsp<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-youtube" viewBox="0 0 16 16">
                        <path d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.01 2.01 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.01 2.01 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31 31 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.01 2.01 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A100 100 0 0 1 7.858 2zM6.4 5.209v4.818l4.157-2.408z"/>
                      </svg>  &nbsp<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-twitter-x" viewBox="0 0 16 16">
                        <path d="M12.6.75h2.454l-5.36 6.142L16 15.25h-4.937l-3.867-5.07-4.425 5.07H.316l5.733-6.57L0 .75h5.063l3.495 4.633L12.601.75Zm-.86 13.028h1.36L4.323 2.145H2.865z"/>
                      </svg></p>
            </div>
            <div class="col-md-3">
                <h5>NEWSLETTER</h5>
                <form class="newsletter" action="#">
                    <div class="form-group">
                        <input type="email" class="form-control" placeholder="Enter your email">
                    </div>
                    <button type="submit" class="btn btn-primary">Subscribe</button>
                </form>
                <div class="ico">
                    <img src="/image/logo2_footer.png" alt="Jobfinder" class="img-fluid">
                </div>
            </div>
        </div>
    </div>
    </div>
  </footer>
  <!-- Copyright notice -->
  <div class="text-center py-4" style="background-color: #f0f0f0;">
    <p>&copy; 2024 Job finder. All rights reserved.</p>
  </div>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script>
  
  $(document).ready(function() {
    var emailInput = $('#email');
    var passwordInput = $('#password');

    function validateEmail() {
      var email = emailInput.val();
      var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
      if (!emailPattern.test(email)) {
        emailInput.addClass('is-invalid');
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
        passwordInput.addClass('is-invalid');
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
        this.submit();
        $('#loginForm').trigger('reset');
        $('.form-control').removeClass('is-valid is-invalid');
      }
    });
  });

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
</script>

  
  
  <script>
    function registerUser() {
        fetch('/register', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(response => {
            if (response.ok) {
                // If the response is okay, redirect to the registration form
                window.location.href = '/register';
            } else {
                // Handle errors if the response is not okay
                console.error('Failed to load the registration page.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    }
    
   
    $(document).ready(function() {
        setTimeout(function() {
            $('#errorMessage').fadeOut('slow');
        }, 1000); // 2000 milliseconds = 2 seconds
    });
</script>


  
</body>
</html>
