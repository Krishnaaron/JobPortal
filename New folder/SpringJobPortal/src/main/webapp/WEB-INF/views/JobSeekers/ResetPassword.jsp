<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<%

   response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//http 1.1
   response.setHeader("Pragma","no-cache");//http1.0
   response.setHeader("Expires","0");// Proxies
   
   if(session.getAttribute("seeker")==null){
	   
		request.getRequestDispatcher("/views/JobSeekers/seekerlogin.jsp").forward(request, response);
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
            <span class="admin_text">${seeker.name}</span>
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
                    <img src="${pageContext.request.contextPath}/assets//images/head.2.png" alt="">
                </a>
                <div class="nav_list">
                    <a href="/jobseeker/html/index copy.html" class="nav_link ">
                        <i class='fas fa-tachometer-alt nav_icon' title="Dashboard"></i>
                        <span class="nav_name">Dashboard</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/JobSeekerProfileRetriveController" class="nav_link">
                        <i class='fas fa-id-badge nav_icon' title="My Profile"></i>
                        <span class="nav_name">My Profile</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/SeekerProfileEditController" class="nav_link ">
                        <i class='fas fa-user-edit nav_icon' title="Edit Profile"></i>
                        <span class="nav_name">Edit Profile</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/JobSearchController" class="nav_link">
                        <i class='fas fa-search nav_icon' title="Job Search"></i>
                        <span class="nav_name">Job Search</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/AppliedJobController" class="nav_link ">
                        <i class='fas fa-briefcase nav_icon' title="Applied Jobs"></i>
                        <span class="nav_name">Applied Jobs</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/SeekerPasswordView" class="nav_link active">
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

  <div class="container m-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header" style="background-color:rgb(36, 43, 94); color:white;">
                            Reset Password
                        </div>
                        <div class="card-body">
                          
                            <form id="password-reset-form" action="${pageContext.request.contextPath}/SeekerPasswordRestController" method="post">
                                <input type="hidden" name="email" value="${seeker.email}">
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
    
                                <button type="submit" class="btn btn-primary">Update Password</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


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
    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9gybBogGzjI4IHcE5O5p+4ujCq4OzH2VpZNR9PZ73fJf9BCLvHY" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9B8J2eFFSUUUHRc/kbY5aaO7C4mQeGz64lVFN5hFHz8B35u94B7B4QK" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-<updated-integrity-hash>" crossorigin="anonymous"></script>
 <script>
    $(document).ready(function () {
        // Password strength indicator levels
        const PASSWORD_STRENGTH_WEAK = 1;
        const PASSWORD_STRENGTH_MEDIUM = 2;
        const PASSWORD_STRENGTH_STRONG = 3;

        // Password strength messages
        const PASSWORD_STRENGTH_MESSAGES = {
            [PASSWORD_STRENGTH_WEAK]: 'Weak',
            [PASSWORD_STRENGTH_MEDIUM]: 'Medium',
            [PASSWORD_STRENGTH_STRONG]: 'Strong'
        };

        // Password validation
        $('#newPassword').on('input', function () {
            validatePassword();
        });

        $('#password-reset-form').on('submit', function (event) {
            event.preventDefault();
            validatePassword(); // Validate password before submission
        });

        function validatePassword() {
            const newPassword = $('#newPassword');
            const confirmPassword = $('#confirmPassword');

            // Regex for validation
            const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$/;

            let isValid = true;

            // Validate new password
            if (!passwordRegex.test(newPassword.val())) {
                newPassword.addClass('is-invalid').removeClass('is-valid');
                $('#newPasswordError').html("Password must contain at least one lowercase letter, one uppercase letter, one number, one special character, and be at least 8 characters long.");
                $('#password-strength').removeClass().addClass('password-strength password-weak').html(PASSWORD_STRENGTH_MESSAGES[PASSWORD_STRENGTH_WEAK]);
                isValid = false;
            } else {
                newPassword.addClass('is-valid').removeClass('is-invalid');
                $('#newPasswordError').html("");

                // Check password strength
                const strength = checkPasswordStrength(newPassword.val());
                $('#password-strength').removeClass().addClass('password-strength password-' + strength).html(PASSWORD_STRENGTH_MESSAGES[strength]);
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

            // Submit form if valid
            if (isValid) {
                $('#password-reset-form').off('submit').submit(); // Unbind previous submit event and submit the form
            }

            return isValid;
        }

        // Function to check password strength
        function checkPasswordStrength(password) {
            // Password strength criteria
            const hasLowerCase = /[a-z]/.test(password);
            const hasUpperCase = /[A-Z]/.test(password);
            const hasDigit = /\d/.test(password);
            const hasSpecialChar = /[\W_]/.test(password);
            const minLength = password.length >= 8;

            let strength = PASSWORD_STRENGTH_WEAK;

            if (hasLowerCase && hasUpperCase && hasDigit && hasSpecialChar && minLength) {
                strength = PASSWORD_STRENGTH_STRONG;
            } else if ((hasLowerCase || hasUpperCase || hasDigit || hasSpecialChar) && minLength) {
                strength = PASSWORD_STRENGTH_MEDIUM;
            }

            return strength;
        }
    });
</script>

<script>
    $(document).ready(function () {
        $('#logout-link').click(function () {
            $('#logoutModal').modal('show');
        });

        // Other script logic here...
    });
</script>



    <script src="${pageContext.request.contextPath}/assets/js/jobseeker.js"></script>
</body>

</html>
