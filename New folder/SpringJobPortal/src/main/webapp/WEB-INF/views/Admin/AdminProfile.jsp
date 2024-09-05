<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored ="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Boxicons CSS for icons -->
    <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/@mdi/font/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="/Admin new/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets\css\adminprofile.css">
    <!-- Additional Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
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
    <style>
        /* Custom Styles */
        .status-active { color: green; }
        .status-inactive { color: red; }
        .modal.fade .modal-dialog { transition: transform 0.3s ease-out; transform: translate(0, -50px); }
        .modal.fade.show .modal-dialog { transform: translate(0, 0); }
        .bordered-container { padding: 1rem; border-radius: 5px; overflow-x: auto; }
        .pagination { margin-top: 20px; }
        .pagination .page-item .page-link { color: #101315; }
        .pagination .page-item.active .page-link { background-color: #007bff; border-color: #007bff; }
        .h4 { color: rgb(36, 43, 94); }
        .bordered-container { min-height: 600px; margin-bottom: 20px; display: flex; flex-direction: column; justify-content: space-between; }
        .table thead th { background-color: rgb(36, 43, 94); color: white; }
        .form-inline { padding: 10px; }
        .pagination { margin-top: 1px; }
        .header_info { display: flex; align-items: center; }
        .header_icons { display: flex; align-items: center; margin-left: 20px; }
        .header_icons i { font-size: 24px; color: white; margin-left: 15px; cursor: pointer; }
        .header_img { margin-right: 10px; }
        .admin_text { margin-right: 10px; }
        .error-message { color: red; display: none; }
        .valid { border-color: green; }
        .invalid { border-color: red; }
    </style>
</head>

<%

   response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//http 1.1
   response.setHeader("Pragma","no-cache");//http1.0
   response.setHeader("Expires","0");// Proxies
   
   if(session.getAttribute("admin")==null){
	   
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
            <span class="admin_text">${admin.name}</span>
            <div class="header_icons">
                <i class='bx bx-bell' id="notification-icon" title="Notifications"></i>
                <i class='bx bx-envelope' id="message-icon" title="Messages"></i>
                <i class='bx' id="logout-icon" title="Logout"></i>
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
                    <a href="cart" class="nav_link " id="dashboard-link">
                        <i class='bx bx-grid-alt nav_icon'></i>
                        <span class="nav_name">Dashboard</span>
                    </a>
                    <a href="AdminRetriveData" class="nav_link" id="job-link">
                        <i class='fas fa-users nav_icon'></i>
                        <span class="nav_name">Job Seekers</span>
                    </a>
                    <a href="AdminEmployerRetriveData" class="nav_link" id="seeker-link">
                        <i class='fas fa-user-tie nav_icon'></i>
                        <span class="nav_name">Employers</span>
                    </a>
                    <a href="AdminJobRetriveData" class="nav_link" id="employer-link">
                        <i class='fas fa-briefcase nav_icon'></i>
                        <span class="nav_name">Jobs</span>
                    </a>
                    <a href="AdminProfileView" class="nav_link active"  id="profile-link">
                        <i class='bx bx-user nav_icon'></i>
                        <span class="nav_name">My Profile</span>
                    </a>
                     <a href="adminPasswordController" class="nav_link">
                        <i class='fas fa-key nav_icon' title="Reset Password"></i>
                        <span class="nav_name">Reset Password</span>
                    </a>
                    <a href="#" class="nav_link" id="logOut-link">
                        <i class='bx bx-log-out nav_icon'></i>
                        <span class="nav_name">Sign Out</span>
                    </a>
                </div>
            </div>
        </nav>
    </div>

    <div class="container" id="profile-content">
        <div class="container mt-5 offset-md-1rem bordered-container">
            <div class="admin-card text-center">
                <img src="https://img.icons8.com/bubbles/100/000000/user.png" alt="Admin Image">
                <h4 class="card-title">${admin.name}</h4>
                <div class="card-info">
                    <i class="fas fa-envelope"></i>
                    <p class="card-text">${admin.email}</p>
                </div>
                <div class="card-info">
                    <i class="fas fa-user-tie"></i>
                    <p class="card-text">Role: Administrator</p>
                    
                    <p>${adminCreationMessage}</p>
                </div>
                
                <button class="btn btn-primary btn-block mb-2" id="editProfileBtn" data-toggle="modal" data-target="#editProfileModal">Edit Profile</button>
                <button class="btn btn-secondary btn-block" id="registerAdminBtn" data-toggle="modal" data-target="#registerAdminModal">Create Admin</button>
               
            </div>
        </div>
    </div>

   
   
<!-- Edit Profile Modal -->
<div class="modal fade" id="editProfileModal" tabindex="-1" aria-labelledby="editProfileModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color:rgb(36, 43, 94)">
                <h5 class="modal-title" id="editProfileModalLabel" style="color:white">Edit Profile</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editProfileForm" action="AdminProfileEdite">
                    <div class="form-group">
                        <label for="adminIdInput">Admin_Id</label>
                        <input type="text" class="form-control" id="adminIdInput" name="admin_id"  value="${admin.admin_id}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="adminNameInput">Name</label>
                        <input type="text" class="form-control" id="adminNameInput" name="name"   value="${admin.name}" >
                        <div id="editNameError" class="error-message"></div>
                    </div>
                    <div class="form-group">
                        <label for="adminEmailInput">Email</label>
                        <input type="email" class="form-control" id="adminEmailInput" name="email" value="${admin.email}">
                        <div id="editEmailError" class="error-message"></div>
                    </div>
                   
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Register Admin Modal -->
<div class="modal fade" id="registerAdminModal" tabindex="-1" aria-labelledby="registerAdminModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color:rgb(36, 43, 94)">
                <h5 class="modal-title" id="registerAdminModalLabel" style="color:white">Register Another Admin</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="registerAdminForm" action="AdminNewUserController">
                    <div class="form-group">
                        <label for="newAdminName">Name</label>
                        <input type="text" class="form-control" id="newAdminName" name="name">
                        <div id="registerNameError" class="error-message">Name is required</div>
                    </div>
                    <div class="form-group">
                        <label for="newAdminEmail">Email</label>
                        <input type="email" class="form-control" id="newAdminEmail" name="email">
                        <div id="registerEmailError" class="error-message">Valid email is required sri@gmail.com</div>
                    </div>
                    <div class="form-group">
                        <label for="newAdminPassword">Password</label>
                        <input type="text" class="form-control" id="newAdminPassword" name="password" value="Welcome121@" readonly>
                    </div>
                    <div class="form-group">
                        <label for="newAdminConfirmPassword">Confirm Password</label>
                        <input type="password" class="form-control" id="newAdminConfirmPassword" name="confirmPassword" value="Welcome121@" disabled>
                        <div id="registerConfirmPasswordError" class="error-message">Passwords do not match</div>
                    </div>
                    <button type="submit" class="btn btn-primary">Register</button>
                </form>
            </div>
        </div>
    </div>
</div>
 
  <div class="modal fade" id="successProfileModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content success">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">Success Message</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-center">
                <i class="fas fa-check-circle success-icon"></i>
                <p>profile updated successfully.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>
 
    <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content success">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">Success Message</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-center">
                <i class="fas fa-check-circle success-icon"></i>
                <p>Admin user created successfully.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">OK</button>
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
                <p>Email ID already exists.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>
<!-- Logout Modal -->
<div id="logoutModal" class="modal fade" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color:rgb(36, 43, 94)">
                <h5 class="modal-title" id="logoutModalLabel" style="color:white">Logout</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to logout?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="button" id="confirmLogout" class="btn btn-primary" style="color:white">Logout</button>
            </div>
        </div>
    </div>
</div>


 <c:if test="${not empty adminCreationMessage}">
        <div class="modal fade" id="adminCreationModal" tabindex="-1" role="dialog" aria-labelledby="adminCreationModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="adminCreationModalLabel">Admin Registration</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>${adminCreationMessage}</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('#adminCreationModal').modal('show');
            });
        </script>
    </c:if>
    <!-- External JS libraries -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    <script>
    
    
    document.addEventListener("DOMContentLoaded", function() {
        const showNavbar = (toggleId, navId, bodyId, headerId) => {
            const toggle = document.getElementById(toggleId),
                nav = document.getElementById(navId),
                bodypd = document.getElementById(bodyId),
                headerpd = document.getElementById(headerId);

            if (toggle && nav && bodypd && headerpd) {
                toggle.addEventListener('click', () => {
                    nav.classList.toggle('show');
                    toggle.classList.toggle('bx-x');
                    bodypd.classList.toggle('body-pd');
                    headerpd.classList.toggle('body-pd');
                });
            }
        };

        showNavbar('header-toggle', 'nav-bar', 'body-pd', 'header');

        const linkColor = document.querySelectorAll('.nav_link');

        function colorLink() {
            if (linkColor) {
                linkColor.forEach(l => l.classList.remove('active'));
                this.classList.add('active');
            }
        }
        linkColor.forEach(l => l.addEventListener('click', colorLink));
    });

    $(document).ready(function() {
        $('#editProfileBtn').on('click', function() {
            $('#editProfileModal').modal('show');
        });

        $('#registerAdminBtn').on('click', function() {
            $('#registerAdminModal').modal('show');
        });

        $('#editProfileForm').on('submit', function(e) {
            e.preventDefault();
            const adminName = $('#adminNameInput').val();
            const adminEmail = $('#adminEmailInput').val();
            

            if (!adminName.trim()) {
                $('#editNameError').text('Name is required').show();
                return;
            } else {
                $('#editNameError').hide();
            }

            if (!adminEmail.trim() || !isValidEmail(adminEmail)) {
                $('#editEmailError').text('Valid email is required').show();
                return;
            } else {
                $('#editEmailError').hide();
            }

           

           
            //alert('Profile updated successfully!');
            $('#editProfileModal').modal('hide');
            this.submit();
        });

        $('#registerAdminForm').on('submit', function(e) {
            e.preventDefault();
            const newAdminName = $('#newAdminName').val();
            const newAdminEmail = $('#newAdminEmail').val();

            if (!newAdminName.trim()) {
                $('#registerNameError').text('Name is required').show();
                return;
            } else {
                $('#registerNameError').hide();
            }

            if (!newAdminEmail.trim() || !isValidEmail(newAdminEmail)) {
                $('#registerEmailError').text('Valid email is required').show();
                return;
            } else {
                $('#registerEmailError').hide();
            }

            // If all validations pass, remove preventDefault and submit the form
            this.submit();
        });

        function isValidEmail(email) {
            const re = /\S+@\S+\.\S+/;
            return re.test(email);
        }

        function validatePassword(password) {
            const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$/;
            return regex.test(password);
        }
    });
    
    
    $(document).ready(function () {
        $('#logOut-link').click(function () {
            $('#logoutModal').modal('show');
        });

        $('#confirmLogout').click(function () {
            // Perform logout action here
            window.location.href = "AdminLogOut";
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
            if (messageType === "success") {
                $('#successModal').modal('show');
            } else if (messageType === "error") {
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
</body>

</html>

