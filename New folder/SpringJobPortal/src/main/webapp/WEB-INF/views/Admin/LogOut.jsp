<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Boxicons CSS for icons -->
    <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/@mdi/font/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        crossorigin="anonymous" />
   <link rel="stylesheet" href="..\..\assets\css\admincontent.css">
    <link rel="stylesheet" href="/Admin new/css/style.css">
    
    <!--  --> <link rel="stylesheet" href="..\..\assets\css\admincontent.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
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
            /* Ensure the container can scroll horizontally */
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
            color: rgb(36, 43, 94)
        }

        
        .bordered-container {
            min-height: 600px;

            /* padding: 10px; Add padding */
            /* padding-bottom: 15px; */
            margin-bottom: 20px;
            /* Add margin for spacing */
            display: flex;
            top: 111px;
            flex-direction: column;
            justify-content: space-between;
        }

        .table thead th {
            background-color: rgb(36, 43, 94);
            /* Table header background color */
            color: white;
            /* Table header text color */
        }

        .form-inline {
            padding: 10px;
            /* Add padding to form */
        }

        .pagination {
            margin-top: 1px;
            /* Add margin to pagination */
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
            /* Change color as needed */
            margin-left: 15px;
            cursor: pointer;
        }

        .header_img {
            margin-right: 10px;
        }

        .admin_text {
            margin-right: 10px;
        }
    </style>
    <!-- logugut -->

</head>

<body id="body-pd">

    <header class="header" id="header">
        <div class="header_toggle">
            <i class='bx bx-menu' id="header-toggle"></i>
        </div>
        <div class="header_info">
            <div class="header_img">
                <!-- <img src="C:\Users\Aaaron\Desktop\jobportal\Admin - Copy\image\admin.png" alt="Profile Image"> -->
                <img src="/Admin - Copy/image/admin.png" alt="Profile Image">

            </div>
            <span class="admin_text">Admin</span>
            <div class="header_icons">
                <i class='bx bx-bell' id="notification-icon" title="Notifications"></i>
                <i class='bx bx-envelope' id="message-icon" title="Messages"></i>
                <i class='bx ' id="logout-icon" title=""></i>
            </div>
        </div>
    </header>
    <div class="l-navbar" id="nav-bar">
        <nav class="nav">
            <div>
                <a href="#" class="nav_logo">
                    
                    <img src="/image/head.2.png" alt="">
                </a>
                <div class="nav_list">
                    <a href="#" class="nav_link active" id="dashboard-link">
                        <i class='bx bx-grid-alt nav_icon'></i>
                        <span class="nav_name">Dashboard</span>
                    </a>
                    <a href="#" class="nav_link" id="job-link">
                        <i class='fas fa-users nav_icon'></i>
                        <span class="nav_name">Job Seekers</span>
                    </a>
                    <a href="#" class="nav_link" id="seeker-link">
                        <i class='fas fa-user-tie nav_icon'></i>
                        <span class="nav_name">Employers</span>
                    </a>
                    <a href="#" class="nav_link" id="employer-link">
                        <i class='fas fa-briefcase nav_icon'></i>
                        <span class="nav_name">Jobs</span>
                    </a>
                    
                    <a href="#" class="nav_link" id="profile-link">
                        <i class='bx bx-user nav_icon'></i>
                        <span class="nav_name">My Profile</span>
                    </a>


                    <a href="#" class="nav_link" id="logout-link">
                        <i class='bx bx-log-out nav_icon'></i>
                        <span class="nav_name">Sign Out</span>
                    </a>
                </div>
            </div>
        </nav>
    </div>

   
       
    
   

    
        <div id="logoutModal" class="modal"> <!-- Changed class to "modal" -->
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- <div class="modal-header" style="background-color:rgb(36, 43, 94)"> -->
                    <div class="modal-header" style="background-color:rgb(36, 43, 94)">
                        <h5 class="modal-title" style="color:white">Logout</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you want to logout?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="button" id="confirmLogout" class="btn btn-primary"
                            style="color:white">Logout</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#logout-link').click(function () {
                    $('#logoutModal').modal('show');
                });

                $('#confirmLogout').click(function () {
                    // Perform logout action here

                    // window.location.href = '';
                 window.location.href = 'http://127.0.0.1:5501/html/index.html';


                });
            });



        </script>
        
        <!--  -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
       

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

        


        <script src="/html/script.js"></script>

        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
      <script src="../../assets/js/admincontent.js"></script>
        <script src="/Admin new/script/script.js"></script>
</body>

</html>