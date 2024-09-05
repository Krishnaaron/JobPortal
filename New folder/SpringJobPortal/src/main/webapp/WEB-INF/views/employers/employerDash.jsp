
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored ="false"%>
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
       <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/employerDash.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
   
</head>
<body id="body-pd">
<%

   response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//http 1.1
   response.setHeader("Pragma","no-cache");//http1.0
   response.setHeader("Expires","0");// Proxies
   
   if(session.getAttribute("employers")==null){
	   
	   response.sendRedirect("index.jsp");
   }

%>
    <header class="header" id="header">
        <div class="header_toggle">
            <i class='bx bx-menu' id="header-toggle"></i>
        </div>
        <div class="header_info">
            <div class="header_img">
                <img src="${pageContext.request.contextPath}/assets/images/user.png" alt="Profile Image">
            </div>
            <span class="admin_text">${employers.userName}</span>
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
                    <img src="${pageContext.request.contextPath}/assets/images/head.2.png" alt="">
                </a>
                <div class="nav_list">
                    <a href="employercard" class="nav_link active">
                        <i class='bx bx-grid-alt nav_icon'></i>
                        <span class="nav_name">Dashboard</span>
                    </a>
                    <a href="postjob" class="nav_link">
                        <i class='fas fa-briefcase fa-2x nav_icon'></i>
                        <span class="nav_name">Bulk Upload</span>
                    </a>
                    <a href="#" class="nav_link">
                        <i class='fas fa-list-alt fa-2x nav_icon'></i>
                        <span class="nav_name">Posted Jobs</span>
                    </a>
                     <a href="#" class="nav_link">
                        <i class='fas fa-ban fa-2x nav_icon'></i>
                        <span class="nav_name">Blocked Jobs</span>
                    </a>
                    <a href="#" class="nav_link">
                        <i class='bx bx-user nav_icon'></i>
                        <span class="nav_name">My Profile</span>
                    </a>
                    <a href="#" class="nav_link">
                        <i class='fas fa-key nav_icon' title="Reset Password"></i>
                        <span class="nav_name">Reset Password</span>
                    </a>
                     <a href="employersLogout" class="nav_link" id="logout-lin">
                        <i class='bx bx-log-out nav_icon'></i>
                        <span class="nav_name">Sign Out</span>
                    </a>
                </div>
            </div>
        </nav>
    </div>

    <div class="container mt-5">
        <div class="row mt-4">
            <div class="col-md-6 col-lg-3 mb-4">
                <div class="card text-white"style="background-color: rgba(54, 162, 235, 0.5);">
                    <div class="card-body">
                        <h6 class="card-title">No. of Posted Jobs</h6>
                         <div class="text-center">
 <i class="fas fa-bullhorn fa-2x mb-2"></i>
 </div>
                        <p class="card-text">${numberOfPostedJob}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 mb-4">
                <div class="card text-white bg-success">
                    <div class="card-body">
                    
                        <h6 class="card-title">Application Recived</h6>
                         <div class="text-center">
                         <i class="fas fa-paperclip fa-2x mb-2"></i> 
                         </div>
                        <p class="card-text">${numberOfApllicationRecived}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 mb-4">
                <div class="card text-white bg-warning">
                    <div class="card-body">
                        <h6 class="card-title">No.of Active Jobs</h6>
                        <div class="text-center">
                           <i class="fas fa-chart-line fa-2x mb-2"></i>
                           </div>
                        <p class="card-text">${numberOfActiveJobs}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 mb-4">
                <div class="card text-white bg-danger">
                    <div class="card-body">
                        <h6 class="card-title">No.of InActive Jobs</h6>
                         <div class="text-center">
                         <i class="fas fa-pause-circle fa-2x "></i> 
                         </div>
                        <p class="card-text">${numberOfInActiveJobs}</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row chart-container">
            <div class="col-lg-5 col-md-12 chart">
                <h5>USERS</h5>
                <canvas id="lineChart"></canvas>
            </div>
            <div class="col-lg-5 col-md-12 chart">
                <h5>Job Applications</h5>
                <canvas id="barChart"></canvas>
            </div>
        </div>
    </div>

<div id="logoutModal" class="modal fade center" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
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

    <!-- Ensure Chart.js is loaded after jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/admin.js"></script>
    
   <script>
$(document).ready(function() {
    // Dynamic data from your server-side variables
    const numberOfPostedJob = ${numberOfPostedJob};
    const numberOfActiveJobs = ${numberOfActiveJobs};
    //const jobSize = ${jobSize};
    const numberOfApllicationRecived = ${numberOfApllicationRecived};

    // Example dynamic data for charts (replace with real data if available)
    const jobSeekersData = [5, 10, 11, 18, 19, 25, numberOfPostedJob];
    const employersData = [3, 3, 4, 6, 8, 10, 2,numberOfActiveJobs];
    const applicationsData = [0, 0, 1, 2, 2, 2, numberOfApllicationRecived];

    // Set dynamic values in the HTML
    //$('#seekerSize').text(seekerSize);
   $('#numberOfActiveJobs').text(numberOfActiveJobs);
    $('#numberOfActiveJobs').text(numberOfActiveJobs);
    $('#numberOfApllicationRecived').text(numberOfApllicationRecived);

    // Data for Line Chart
    const lineData = {
        labels: ['1', '2', '3', '4', '5', '6', '7'],
        datasets: [
            {
                label: 'posted Jobs',
                data: jobSeekersData,
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1,
                fill: false
            },
            {
                label: 'No.of Active Jobs',
                data: employersData,
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1,
                fill: false
            },
            {
                label: 'Applications',
                data: applicationsData,
                backgroundColor: 'rgba(255, 206, 86, 0.2)',
                borderColor: 'rgba(255, 206, 86, 1)',
                borderWidth: 1,
                fill: false
            }
        ]
    };

    // Initialize Line Chart
    const lineCtx = document.getElementById('lineChart').getContext('2d');
    new Chart(lineCtx, {
        type: 'line',
        data: lineData,
        options: {
            responsive: true,
            scales: {
                y: { beginAtZero: true }
            },
            plugins: {
                legend: { position: 'top' },
                tooltip: { enabled: true }
            }
        }
    });

    // Data for Bar Chart
    const barData = {
        labels: ['1', '2', '3', '4', '5', '6', '7'],
        datasets: [{
            label: 'Applications',
            data: applicationsData,
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            borderColor: 'rgba(255, 99, 132, 1)',
            borderWidth: 1
        }]
    };

    // Initialize Bar Chart
    const barCtx = document.getElementById('barChart').getContext('2d');
    new Chart(barCtx, {
        type: 'bar',
        data: barData,
        options: {
            responsive: true,
            scales: {
                y: { beginAtZero: true }
            },
            plugins: {
                legend: { position: 'top' },
                tooltip: { enabled: true }
            }
        }
    });

    $('#logout-link').click(function () {
        $('#logoutModal').modal('show');
    });

    $('#confirmLogout').click(function () {
        window.location.href = "employersLogout";
    });
});
</script>

</body>

</html>
