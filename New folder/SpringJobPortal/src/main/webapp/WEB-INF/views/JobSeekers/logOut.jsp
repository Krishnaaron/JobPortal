<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Boxicons CSS for icons -->
    <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/correctAdmin/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet"  href="${pageContext.request.contextPath}/assets/css/seekerdash.css">
    <style>
        /* Custom Styles */
        .status-active {
            color: green;
        }

        .status-inactive {
            color: red;
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

        /* Custom Modal Styles */
        .custom-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        .modal-header {
            border-bottom: 1px solid #ccc;
            padding-bottom: 10px;
            margin-bottom: 10px;
        }

        .modal-header h2 {
            margin-top: 0;
            color: rgb(36, 43, 94);
        }

        .modal-body {
            margin-bottom: 20px;
        }

        .modal-footer {
            display: flex;
            justify-content: center;
        }

        .btn {
            padding: 8px 20px;
            margin: 0 10px;
        }
    </style>
</head>

<body id="body-pd">
    <header class="header" id="header">
        <div class="header_toggle">
            <i class='bx bx-menu' id="header-toggle"></i>
        </div>
        <div class="header_info">
            <div class="header_img">
                <img src="/Admin - Copy/image/admin.png" alt="Profile Image">
            </div>
            <span class="admin_text">Job Seekers</span>
            <div class="header_icons">
                <i class='bx bx-bell' id="notification-icon" title="Notifications"></i>
                <i class='bx bx-envelope' id="message-icon" title="Messages"></i>
                <i class='bx bx-log-out' id="logout-icon" title="Log Out"></i>
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
                    <a href="#" class="nav_link ">
                        <i class='fas fa-tachometer-alt nav_icon' title="Dashboard"></i>
                        <span class="nav_name">Dashboard</span>
                    </a>
                    <a href="#" class="nav_link">
                        <i class='fas fa-id-badge nav_icon' title="My Profile"></i>
                        <span class="nav_name">My Profile</span>
                    </a>
                    <a href="#" class="nav_link ">
                        <i class='fas fa-user-edit nav_icon' title="Edit Profile"></i>
                        <span class="nav_name">Edit Profile</span>
                    </a>
                    <a href="#" class="nav_link">
                        <i class='fas fa-search nav_icon' title="Job Search"></i>
                        <span class="nav_name">Job Search</span>
                    </a>
                    <a href="#" class="nav_link">
                        <i class='fas fa-briefcase nav_icon' title="Applied Jobs"></i>
                        <span class="nav_name">Applied Jobs</span>
                    </a>
                    <a href="#" class="nav_link ">
                        <i class='fas fa-key nav_icon' title="Reset Password"></i>
                        <span class="nav_name">Reset Password</span>
                    </a>
                    <a href="" class="nav_link active" id="logout-link">
                        <i class='bx bx-log-out nav_icon'></i>
                        <span class="nav_name">LogOut</span>
                    </a>
                </div>
            </div>
        </nav>
    </div>

    <!-- Custom Logout Modal -->
    <div class="custom-modal" id="customLogoutModal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Logout</h2>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to logout?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="cancelLogout">Cancel</button>
                <button type="button" class="btn btn-primary" id="confirmCustomLogout">Logout</button>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#logout-link').click(function () {
                $('#customLogoutModal').css('display', 'flex');
            });

            $('#cancelLogout').click(function () {
                $('#customLogoutModal').css('display', 'none');
            });

            $('#confirmCustomLogout').click(function () {
                // Perform logout action here
                window.location.href = 'http://127.0.0.1:5501/html/index.html'; // Replace with your logout URL
            });
        });
    </script>
 <script src="${pageContext.request.contextPath}/assets/js/admin.js"></script>
   
    <script src="/Admin new/script/script.js"></script>
</body>

</html>

    