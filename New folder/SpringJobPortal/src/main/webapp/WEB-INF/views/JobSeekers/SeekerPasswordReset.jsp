<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored ="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Boxicons CSS for icons -->
    <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href= "${pageContext.request.contextPath}/assets/css/seeker.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script><link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        /* Custom Styles */
        .status-active {
            color: green;
        }

        .status-inactive {
            color: red;
        }

        .modal.fade .modal-dialog {
            transition: transform 0.3s ease-out;
            transform: translate(0, -50px);
        }

        .modal.fade.show .modal-dialog {
            transform: translate(0, 0);
        }

        .bordered-container {
            padding: 1rem;
            border-radius: 5px;
            overflow-x: auto;
        }

        .pagination {
            margin-top: 20px;
        }

        .pagination .page-item .page-link {
            color: #101315;
        }

        .pagination .page-item.active .page-link {
            background-color: #007bff;
            border-color: #007bff;
        }

        .h4 {
            color: rgb(36, 43, 94);
        }

        .bordered-container {
            min-height: 600px;
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .table thead th {
            background-color: rgb(36, 43, 94);
            color: white;
        }

        .form-inline {
            padding: 10px;
        }

        .pagination {
            margin-top: 1px;
        }

        .header_info {
            display: flex;
            align-items: center;
        }

        .header_icons {
            display: flex;
            align-items: center;
            margin-left: 20px;
        }

        .header_icons i {
            font-size: 24px;
            color: white;
            margin-left: 15px;
            cursor: pointer;
        }

        .header_img {
            margin-right: 10px;
        }

        .admin_text {
            margin-right: 10px;
        }

        .container {
            padding-top: 20px;
        }

        /* Profile-specific styles */
        .profile-details {
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .profile-details h2 {
            color: #333;
            margin-bottom: 20px;
            border-bottom: 1px solid #ccc;
            padding-bottom: 10px;
        }

        .profile-details .profile-info {
            margin-bottom: 20px;
        }

        .profile-details .profile-info label {
            font-weight: bold;
        }

        .profile-details .profile-image {
            text-align: center;
        }

        .profile-details .profile-image img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #007bff;
        }

        .edit-mode .form-control {
            background-color: #fff;
            border: 1px solid #ccc;
            box-shadow: none;
        }

        #body-pd {
            background-color: rgb(241, 241, 241);
        }
       
       #title {
        margin-top: 100px;
       }
       .nav_link {
    text-decoration: none !important;
    }
    .resetpas{
    margin-top: 100px !important;
    
    }

       
    </style>
    <style>
        /* Custom Styles */
        .status-active {
            color: green;
        }

        .status-inactive {
            color: red;
        }

        .modal.fade .modal-dialog {
            transition: transform 0.3s ease-out;
            transform: translate(0, -50px);
        }

        .modal.fade.show .modal-dialog {
            transform: translate(0, 0);
        }

        .bordered-container {
            padding: 1rem;
            border-radius: 5px;
            overflow-x: auto;
        }

        .pagination {
            margin-top: 20px;
        }

        .pagination .page-item .page-link {
            color: #101315;
        }

        .pagination .page-item.active .page-link {
            background-color: #007bff;
            border-color: #007bff;
        }

        .h4 {
            color: rgb(36, 43, 94);
        }

        .bordered-container {
            min-height: 600px;
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .table thead th {
            background-color: rgb(36, 43, 94);
            color: white;
        }

        .form-inline {
            padding: 10px;
        }

        .pagination {
            margin-top: 1px;
        }

        .header_info {
            display: flex;
            align-items: center;
        }

        .header_icons {
            display: flex;
            align-items: center;
            margin-left: 20px;
        }

        .header_icons i {
            font-size: 24px;
            color: white;
            margin-left: 15px;
            cursor: pointer;
        }

        .header_img {
            margin-right: 10px;
        }

        .admin_text {
            margin-right: 10px;
        }

        .container {
            padding-top: 20px;
        }

        /* Profile-specific styles */
        .profile-details {
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .profile-details h2 {
            color: #333;
            margin-bottom: 20px;
            border-bottom: 1px solid #ccc;
            padding-bottom: 10px;
        }

        .profile-details .profile-info {
            margin-bottom: 20px;
        }

        .profile-details .profile-info label {
            font-weight: bold;
        }

        .profile-details .profile-image {
            text-align: center;
        }

        .profile-details .profile-image img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #007bff;
        }

        .edit-mode .form-control {
            background-color: #fff;
            border: 1px solid #ccc;
            box-shadow: none;
        }

        #body-pd {
            background-color: rgb(241, 241, 241);
        }

        #title {
            margin-top: 100px;
        }

        .nav_link {
            text-decoration: none !important;
        }

        /* Password validation styles */
        .is-invalid {
            border-color: red;
        }

        .is-valid {
            border-color: green;
        }

         /* Custom Styles */
         .password-icon {
                position: absolute;
                right: 10px;
                top: 50%;
                transform: translateY(-50%);
                cursor: pointer;
            }
    
            .password-strength {
                font-size: 12px;
                margin-top: 5px;
            }
    
            .password-weak {
                color: red;
            }
    
            .password-medium {
                color: orange;
            }
    
            .password-strong {
                color: green;
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
    </style>
</head>
<%

   response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//http 1.1
   response.setHeader("Pragma","no-cache");//http1.0
   response.setHeader("Expires","0");// Proxies
   
   if(session.getAttribute("seeker")==null){
	   
	   response.sendRedirect("index.jsp");
   }

%>
<body id="body-pd">
    <header class="header" id="header">
        <div class="header_toggle">
            <i class='bx bx-menu' id="header-toggle"></i>
        </div>
        <div class="header_info">
            <div class="header_img">
                  <img src="${pageContext.request.contextPath}/assets/images/user.png" alt="Profile Image">
            </div>
            <span class="admin_text">${seeker.fName}</span>
            <div class="header_icons">
                <i class='bx bx-bell' id="notification-icon" title="Notifications"></i>
                <i class='bx bx-envelope' id="message-icon" title="Messages"></i>
               
            </div>
        </div>
    </header>
    <div class="l-navbar" id="nav-bar">
         <nav class="nav">
            <div>
                <a href="#" class="nav_logo">
                    <img src="${pageContext.request.contextPath}/assets/images/head.2.png" alt="">
                </a>
                <div class="nav_list">
                    <a href="seekerCart" class="nav_link ">
                        <i class='fas fa-tachometer-alt nav_icon' title="Dashboard"></i>
                        <span class="nav_name">Dashboard</span>
                    </a>
                   <a href="JobSeekerProfileRetriveController" class="nav_link">
    <i class='fas fa-id-badge nav_icon' title="My Profile"></i>
    <span class="nav_name">My Profile</span>
</a>
                    <a href="JobSeekerProfileEditController"  class="nav_link">
                        <i class='fas fa-user-edit nav_icon' title="Edit Profile"></i>
                        <span class="nav_name">Edit Profile</span>
                    </a>
                    <a href="jobSearchController" class="nav_link ">
                        <i class='fas fa-search nav_icon' title="Job Search"></i>
                        <span class="nav_name">Job Search</span>
                    </a>
                     <a href="appliedJobController" class="nav_link">
                        <i class='fas fa-briefcase nav_icon' title="Applied Jobs"></i>
                        <span class="nav_name">Applied Jobs</span>
                    </a>
                    <a href="SeekerPasswordController"  class="nav_link active">
                        <i class='fas fa-key nav_icon' title="Reset Password"></i>
                        <span class="nav_name">Reset Password</span>
                    </a>
                    <a href="#" class="nav_link" id="logout-link">
                        <i class='bx bx-log-out nav_icon'></i>
                        <span class="nav_name">LogOut</span>
                    </a>
                </div>
            </div>
        </nav>
    </div>

 <div class="container mt-5 resetpas">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header" style="background-color:rgb(36, 43, 94); color:white;">
                    Reset Password
                </div>
                <div class="card-body">
                    <form id="password-reset-form" action="SeekerPasswordRestController" method="post">
                        <input type="hidden" name="seeker_id" value="${seeker.JOB_SEEKER_ID}">
                        <div class="form-group position-relative mb-3">
                            <label for="oldPassword">Old Password:</label>
                            <input type="password" id="oldPassword" name="oldPassword" class="form-control">
                        </div>
                        <div class="form-group position-relative mb-3">
                            <label for="newPassword">New Password:</label>
                            <input type="password" id="newPassword" name="newPassword" class="form-control">
                            <div class="invalid-feedback" id="newPasswordError"></div> <!-- Error message placeholder -->
                            <div class="password-strength" id="password-strength"></div> <!-- Password strength indicator -->
                        </div>
                        <div class="form-group position-relative mb-3">
                            <label for="confirmPassword">Confirm Password:</label>
                            <input type="password" id="confirmPassword" class="form-control">
                            <div class="invalid-feedback" id="confirmPasswordError"></div> <!-- Error message placeholder -->
                        </div>
                        <button type="submit" class="btn btn-primary" id="password-reset-form">Update Password</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        // Password validation
        $('#newPassword, #confirmPassword').on('input', function () {
            validatePasswords();
        });

        $('#password-reset-form').on('submit', function (event) {
            event.preventDefault();
            if (validatePasswords()) {
                this.submit(); // Submit the form if validation is successful
            }
        });

        function validatePasswords() {
            const newPassword = $('#newPassword');
            const confirmPassword = $('#confirmPassword');

            let isValid = true;

            // Validate new password
            if (!isValidPassword(newPassword.val())) {
                newPassword.addClass('is-invalid').removeClass('is-valid');
                $('#newPasswordError').html("Password must contain at least one lowercase letter, one uppercase letter, one number, one special character, and be at least 8 characters long.");
                isValid = false;
            } else {
                newPassword.addClass('is-valid').removeClass('is-invalid');
                $('#newPasswordError').html("");
            }

            // Validate confirm password
            if (newPassword.val() !== confirmPassword.val()) {
                confirmPassword.addClass('is-invalid').removeClass('is-valid');
                $('#confirmPasswordError').html("Passwords do not match.");
                isValid = false;
            } else {
                confirmPassword.addClass('is-valid').removeClass('is-invalid');
                $('#confirmPasswordError').html("");
            }

            return isValid;
        }

        // Function to validate password format
        function isValidPassword(password) {
            // Regex for validation: At least one lowercase, one uppercase, one number, one special character, and minimum 8 characters
            const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$/;
            return passwordRegex.test(password);
        }
    });
</script>



    <div id="logoutModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="logoutModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color:rgb(36, 43, 94)">
                    <h5 class="modal-title" id="logoutModalLabel" style="color:white">Logout</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    </button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to logout?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" id="confirmLogout" class="btn btn-primary" style="color:white">Logout</button>
                </div>
            </div>
        </div>
    </div>
    
    
 <!-- Success Modal -->
<div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content success">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">Success</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-center">
                <i class="fas fa-check-circle success-icon"></i>
                <p>Password Update Successfully.</p>
            </div>
            <div class="modal-footer">
                <button type="button" id="successCloseBtn" class="btn btn-success" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>

<!-- Error Modal -->
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
                <p>Password Update Failed. Enter the correct old Password.</p>
            </div>
            <div class="modal-footer">
                <button type="button" id="errorCloseBtn" class="btn btn-danger" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
    var message = '<%= session.getAttribute("message") %>';
    var messageType = '<%= session.getAttribute("messageType") %>';
    
    if (message && messageType) {
        if (messageType === "success") {
            $('#successModal').modal('show');
        } else if (messageType === "error") {
            $('#errorModal').modal('show');
        }
        
        // Clear session attributes after showing the modal
        <% session.removeAttribute("message"); %>
        <% session.removeAttribute("messageType"); %>
        
        // Manual close and OK button actions
        $('#successCloseBtn').click(function() {
            $('#successModal').modal('hide');
        });
        
        $('#errorCloseBtn').click(function() {
            $('#errorModal').modal('hide');
        });
        
      
    }
});
</script>

<!-- jQuery and Bootstrap 5 JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/js/bootstrap.min.js"></script>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9B8J2eFFSUUUHRc/kbY5aaO7C4mQeGz64lVFN5hFHz8B35u94B7B4QK" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-<updated-integrity-hash>" crossorigin="anonymous"></script>



 <script>
        $(document).ready(function () {
            $('#logout-link').click(function () {
                $('#logoutModal').modal('show');
            });

            $('#confirmLogout').click(function () {
                // Perform logout action here

                // window.location.href = '';
                window.location.href = 'seekerLogOut';


            });
        });



    </script>
    <script src="${pageContext.request.contextPath}/assets/js/jobseeker.js"></script>
</body>

</html>
