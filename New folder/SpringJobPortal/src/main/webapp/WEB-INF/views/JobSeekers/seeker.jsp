<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JobSeeker Panel</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Boxicons CSS for icons -->
    <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/@mdi/font/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/correctAdmin/style.css">
    <link rel="stylesheet" href="..\..\assets\css\seeker.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>
        /* Place the CSS here */
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

.card {
    height: 150px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    transition: transform 0.2s;
}

.card:hover {
    transform: translateY(-5px);
}

.card-title {
    text-align: center;
    font-size: 1.2rem;
    font-weight: bold;
}

.card-text {
    text-align: center;
    font-size: 2rem;
    font-weight: bold;
}

.chart-container {
    margin-top: 40px;
    height: auto;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 50px;
}

.chart-container .chart {
    border: 1px solid #1b1b1b;
    border-radius: 5px;
    padding: 15px;
    margin-bottom: 20px;
    flex: 1;
}

.chart-container .chart h5 {
    text-align: center;
    margin-bottom: 20px;
}

@media (max-width: 768px) {
    .chart-container {
        flex-direction: column;
    }

    .chart-container .chart {
        width: 100%;
        max-width: 100%;
    }
}

/* Styles specific to job-container */
.job-container .card {
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    padding: 15px;
    margin: 10px 0;
    height: auto; /* Ensures height is flexible */
    display: flex;
    flex-direction: row; /* Horizontal layout by default */
    align-items: center;
    justify-content: center;
}

.job-container .card img {
    max-width: 100%;
    height: 100px !important;
    height: auto; /* Ensures the image scales properly */
    object-fit: contain;
    margin: auto;
}

.job-container .card-title {
    font-size: 1.5rem;
    color: #28a745;
    font-weight: bold;
}

.job-container .card-text {
    font-size: 1rem;
    margin-bottom: 0.5rem;
}

.job-container .job-details {
    padding-left: 15px;
    width: 100%;
}

.job-container .job-icon {
    margin-right: 10px;
    font-size: 1.2rem;
}

.job-container .job-info {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    margin-bottom: 8px;
}

.job-container .btn-apply {
    font-size: 0.9rem;
    padding: 5px 10px;
}

@media (min-width: 992px) {
    .job-container .card {
        height: auto; /* Flexible height for laptop view */
    }
}

@media (max-width: 576px) {
    .job-container .card {
        flex-direction: column;
        align-items: center;
        text-align: center;
    }

    .job-container .card img {
        margin-bottom: 10px;
    }

    .job-container .job-details {
        padding-left: 0;
    }

    .job-container .job-info {
        text-align: center;
        justify-content: center;
    }
}


    </style>
</head>

<body id="body-pd">
<%
   if(session.getAttribute("seeker")==null){
	   
		request.getRequestDispatcher("/views/JobSeekers/seekerlogin.jsp").forward(request, response);
   }

%>

    <header class="header" id="header">
        <div class="header_toggle">
            <i class='bx bx-menu' id="header-toggle"></i>
        </div>
        <div class="header_info">
            <div class="header_img">
                <img src="../../assets/images/admin.png" alt="Profile Image">
                
            </div>
            <span class="admin_text">Job Seekers</span>
            <div class="header_icons">
                <i class='bx bx-bell' id="notification-icon" title="Notifications"></i>
                <i class='bx bx-envelope' id="message-icon" title="Messages"></i>
                <i class='bx' id="logout-icon" title=""></i>
            </div>
        </div>
    </header>
    <div class="l-navbar" id="nav-bar">
        <nav class="nav">
            <div>
                <a href="#" class="nav_logo">
                    <img src="../../assets/images/head.2.png" alt="">
                     
                </a>
                <div class="nav_list">
                    <a href="#" class="nav_link active">
                        <i class='fas fa-tachometer-alt nav_icon' title="Dashboard"></i>
                        <span class="nav_name">Dashboard</span>
                    </a>
                    <a href="/correctAdmin/seekerinfo.html" class="nav_link">
                        <i class='fas fa-id-badge nav_icon' title="My Profile"></i>
                        <span class="nav_name">My Profile</span>
                    </a>
                    <a href="#" class="nav_link">
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
                    <a href="#" class="nav_link">
                        <i class='fas fa-key nav_icon' title="Reset Password"></i>
                        <span class="nav_name">Reset Password</span>
                    </a>
                    <a href="#" class="nav_link" id="logout-link">
                        <i class='fas fa-sign-out-alt nav_icon' title="LogOut"></i>
                        <span class="nav_name">LogOut</span>
                    </a>
                </div>
            </div>
        </nav>
    </div>

    <div class="container mt-5">
        <div class="row mt-4">
            <div class="col-md-6 col-lg-3 mb-4">
                <div class="card text-white bg-primary">
                    <div class="card-body">
                        <h5 class="card-title">No. of Jobs Applied</h5>
                        <p class="card-text">20</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 mb-4">
                <div class="card text-white bg-success">
                    <div class="card-body">
                        <h5 class="card-title">Employers</h5>
                        <p class="card-text">20</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 mb-4">
                <div class="card text-white bg-warning">
                    <div class="card-body">
                        <h5 class="card-title">Jobs</h5>
                        <p class="card-text">20</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 mb-4">
                <div class="card text-white bg-danger">
                    <div class="card-body">
                        <h5 class="card-title">Applications</h5>
                        <p class="card-text">20</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="recommad">
            <h4>2 Recommended Job(s)</h4>
        </div>
        <div class="container mt-4 job-container">
            <div class="row">
                <!-- Example job card (repeat this structure dynamically with your backend) -->
                <div class="col-10 mb-4">
                    <div class="card job-card">
                        <div class="row no-gutters align-items-center">
                            <div class="col-md-2 text-center">
                              <img src="../../assets/images/21746.gif" alt="Company Logo">
                            </div>
                            <div class="col-md-10">
                                <div class="card-body job-details">
                                    <h5 class="card-title">Graphic Designer and Video Editor</h5>
                                    <p class="card-text job-info">
                                        <i class="fas fa-briefcase job-icon"></i> Graphic Designer | Aden Ads
                                    </p>
                                    <p class="card-text job-info">
                                        <i class="far fa-calendar-alt job-icon"></i> Posted Date: 04-06-2024 | Open Until: 21-06-2024
                                    </p>
                                    <p class="card-text job-info">
                                        <i class="fas fa-money-bill-wave job-icon"></i> 10,000 - 15,000 | <i class="fas fa-map-marker-alt job-icon"></i> Chennai | <i class="fas fa-cogs job-icon"></i> Media & Entertainment
                                    </p>
                                    <p class="card-text job-info">
                                        Assistant Graphic Designer | Graphic Designer
                                    </p>
                                    <a href="#" class="btn btn-primary btn-apply mt-2">Apply Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Repeat the above structure dynamically with your backend data -->
            </div>
        </div>
    </div>
    <div class="container mt-4 job-container">
        <div class="row">
            <!-- Example job card (repeat this structure dynamically with your backend) -->
            <div class="col-10 mb-4">
                <div class="card job-card">
                    <div class="row no-gutters align-items-center">
                        <div class="col-md-2 text-center">
                            <img src="../../assets/images/21746.gif" alt="Company Logo">
                        </div>
                        <div class="col-md-10">
                            <div class="card-body job-details">
                                <h5 class="card-title">Graphic Designer and Video Editor</h5>
                                <p class="card-text job-info">
                                    <i class="fas fa-briefcase job-icon"></i> Graphic Designer | Aden Ads
                                </p>
                                <p class="card-text job-info">
                                    <i class="far fa-calendar-alt job-icon"></i> Posted Date: 04-06-2024 | Open Until: 21-06-2024
                                </p>
                                <p class="card-text job-info">
                                    <i class="fas fa-money-bill-wave job-icon"></i> 10,000 - 15,000 | <i class="fas fa-map-marker-alt job-icon"></i> Chennai | <i class="fas fa-cogs job-icon"></i> Media & Entertainment
                                </p>
                                <p class="card-text job-info">
                                    Assistant Graphic Designer | Graphic Designer
                                </p>
                                <a href="#" class="btn btn-primary btn-apply mt-2">Apply Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Repeat the above structure dynamically with your backend data -->
        </div>
    </div>
</div>

<div class="container mt-4 job-container">
    <div class="row">
        <!-- Example job card (repeat this structure dynamically with your backend) -->
        <div class="col-10 mb-4">
            <div class="card job-card">
                <div class="row no-gutters align-items-center">
                    <div class="col-md-2 text-center">
                        <img src="../../assets/images/21746.gif" alt="Company Logo">
                    </div>
                    <div class="col-md-10">
                        <div class="card-body job-details">
                            <h5 class="card-title">Graphic Designer and Video Editor</h5>
                            <p class="card-text job-info">
                                <i class="fas fa-briefcase job-icon"></i> Graphic Designer | Aden Ads
                            </p>
                            <p class="card-text job-info">
                                <i class="far fa-calendar-alt job-icon"></i> Posted Date: 04-06-2024 | Open Until: 21-06-2024
                            </p>
                            <p class="card-text job-info">
                                <i class="fas fa-money-bill-wave job-icon"></i> 10,000 - 15,000 | <i class="fas fa-map-marker-alt job-icon"></i> Chennai | <i class="fas fa-cogs job-icon"></i> Media & Entertainment
                            </p>
                            <p class="card-text job-info">
                                Assistant Graphic Designer | Graphic Designer
                            </p>
                            <a href="#" class="btn btn-primary btn-apply mt-2">Apply Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Repeat the above structure dynamically with your backend data -->
    </div>
</div>
</div>
<div class="container mt-4 job-container">
    <div class="row">
        <!-- Example job card (repeat this structure dynamically with your backend) -->
        <div class="col-10 mb-4">
            <div class="card job-card">
                <div class="row no-gutters align-items-center">
                    <div class="col-md-2 text-center">
                        <img src="../../assets/images/21746.gif" alt="Company Logo">
                      
                    </div>
                    <div class="col-md-10">
                        <div class="card-body job-details">
                            <h5 class="card-title">Graphic Designer and Video Editor</h5>
                            <p class="card-text job-info">
                                <i class="fas fa-briefcase job-icon"></i> Graphic Designer | Aden Ads
                            </p>
                            <p class="card-text job-info">
                                <i class="far fa-calendar-alt job-icon"></i> Posted Date: 04-06-2024 | Open Until: 21-06-2024
                            </p>
                            <p class="card-text job-info">
                                <i class="fas fa-money-bill-wave job-icon"></i> 10,000 - 15,000 | <i class="fas fa-map-marker-alt job-icon"></i> Chennai | <i class="fas fa-cogs job-icon"></i> Media & Entertainment
                            </p>
                            <p class="card-text job-info">
                                Assistant Graphic Designer | Graphic Designer
                            </p>
                            <a href="#" class="btn btn-primary btn-apply mt-2">Apply Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Repeat the above structure dynamically with your backend data -->
    </div>
</div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="/Admin new/script/script.js"></script>
     <script src="../../assets/js/admin.js"></script>
</body>

</html>
    