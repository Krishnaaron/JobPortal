<!DOCTYPE html>
<html lang="en">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>

<body id="body-pd">
<%

   response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//http 1.1
   response.setHeader("Pragma","no-cache");//http1.0
   response.setHeader("Expires","0");// Proxies
   
   if(session.getAttribute("seeker")==null){
	   
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
                    <img src="${pageContext.request.contextPath}/assets//images/head.2.png" alt="">
                </a>
                <div class="nav_list">
                   <a href="seekerCart" class="nav_link "> <i
						class='fas fa-tachometer-alt nav_icon' title="Dashboard"></i> <span
						class="nav_name">Dashboard</span>
					</a> <a href="JobSeekerProfileRetriveController" class="nav_link">
    <i class='fas fa-id-badge nav_icon' title="My Profile"></i>
    <span class="nav_name">My Profile</span>
</a>
                    <a href="JobSeekerProfileEditController"  class="nav_link ">
                        <i class='fas fa-user-edit nav_icon' title="Edit Profile"></i>
                        <span class="nav_name">Edit Profile</span>
                    </a>
                    <a href="jobSearchController" class="nav_link">
                        <i class='fas fa-search nav_icon' title="Job Search"></i>
                        <span class="nav_name">Job Search</span>
                    
					</a>
                     <a href="appliedJobController" class="nav_link active">
                        <i class='fas fa-briefcase nav_icon' title="Applied Jobs"></i>
                        <span class="nav_name">Applied Jobs</span>
                    </a>
                    <a href="SeekerPasswordController"  class="nav_link">
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

    <div id="title">
    <h3>Applied Jobs</h3>
    </div>

    <div class="container mt-3 job-container">
        <div class="row" id="jobCardsContainer">
            <!-- Job cards will be dynamically generated here -->
            <c:forEach var="job" items="${jobsList}">
              <div class="col-10 mb-4">
    <div class="card job-card">
        <div class="row no-gutters align-items-center">
            <div class="col-md-2 text-center">
                <img src="${pageContext.request.contextPath}/assets/images/658378.gif" alt="Company Logo" alt="Company Logo">
            </div>
            <div class="col-md-10">
                <div class="card-body job-details">
                    <h5 class="card-title">${job.job_Title}</h5>
                    <p class="card-text job-info">
                        <i class="fas fa-briefcase job-icon"></i> ${job.job_Title} |<i class="fas fa-building company-icon"></i>
                         ${job.company_Name}
                    </p>
                    <p class="card-text job-info">
                        <i class="far fa-calendar-alt job-icon"></i> Posted Date: ${job.job_Posted} | Open Until: ${job.application_Deadline}
                    </p>
                    <p class="card-text job-info">
                        <i class="fas fa-money-bill-wave job-icon"></i>  Salary   | <i class="fas fa-map-marker-alt job-icon"></i> ${job.location} | <i class="fas fa-cogs job-icon"></i> ${job.job_Type}
                    </p>
                    <p class="card-text job-info">
                        <i class="fas fa-align-left job-icon"></i> Description: ${job.job_Description}
                    </p>
                    <p class="card-text job-info">
                        <i class="fas fa-tools job-icon"></i> Required Skills: ${job.required_Skills}
                    </p>
                    <p class="card-text job-info">
                        <i class="fas fa-level-up-alt job-icon"></i> Experience Level: ${job.experience_Level}
                    </p>
                    <p class="card-text job-info">
                        <i class="fas fa-users job-icon"></i> Openings: ${job.number_Of_Openings}
                    </p>
                    <p class="card-text job-info">
                        <i class="fas fa-graduation-cap job-icon"></i> Education Qualification: ${job.education_Qualification}
                    </p>
                    <p class="card-text job-info">
                        <i class="fas fa-book job-icon"></i> Education Course: ${job.education_Cource}
                    </p>
                   
                    <div class="d-flex justify-content-end">
                 
                 
                 <!--    <button class="btn btn-success btn-view-status mt-2 ms-3" data-toggle="modal" data-target="#applicationStatusModal"
        data-job-application-status="${job.job_Application_Status}">
    View Status
</button>
                    
                          
                        <button class="btn btn-success btn-view-details mt-2 ms-3" data-toggle="modal" data-target="#jobDetailsModal">Status</button> --> 
                      
                       <button class="btn btn-success btn-view-status mt-2 ms-3"
        data-toggle="modal"
        data-target="#applicationStatusModal"
        data-job-application-status="${job.job_Application_Status}">
    View Status
</button>
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

            </c:forEach>
        </div>
    </div>
  <!-- Example of pagination links generation -->
<nav>
    <ul class="pagination">
        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
            <a class="page-link" href="?id=${id}&page=${currentPage - 1}" tabindex="-1">Previous</a>
        </li>
        <li class="page-item ${currentPage == 1 ? 'active' : ''}">
            <a class="page-link" href="?id=${id}&page=1">1</a>
        </li>
        <li class="page-item ${currentPage == 2 ? 'active' : ''}">
            <a class="page-link" href="?id=${id}&page=2">2</a>
        </li>
        <!-- Add more pages as needed -->
        <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
            <a class="page-link" href="?id=${id}&page=${currentPage + 1}">Next</a>
        </li>
    </ul>
</nav>
  
  <div class="modal fade" id="applicationStatusModal" tabindex="-1" role="dialog" aria-labelledby="applicationStatusModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-top" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: rgb(36, 43, 94);">
                <h5 class="modal-title" id="applicationStatusModalLabel" style="color: white;">Application Status</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p><strong>Application Status:</strong> <span id="modalApplicationStatus"></span></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
  
<script>
document.addEventListener('DOMContentLoaded', function () {
    const applicationStatusModal = document.getElementById('applicationStatusModal');
    applicationStatusModal.addEventListener('show.bs.modal', function (event) {
        const button = event.relatedTarget;
        
        const jobApplicationStatus = button.getAttribute('data-job-application-status');
        const modalApplicationStatus = applicationStatusModal.querySelector('#modalApplicationStatus');
        
        modalApplicationStatus.textContent = jobApplicationStatus;
    });
});
</script>

  <script src="path/to/bootstrap.bundle.min.js"></script>
  
    <!-- Modal for Job Details -->
    <div class="modal fade" id="jobDetailsModal" tabindex="-1" role="dialog" aria-labelledby="jobDetailsModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-top modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color: rgb(36, 43, 94);">
                    <h5 class="modal-title" id="jobDetailsModalLabel" style="color: white;">Job Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                 
                <!-- Job details content -->
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
                <!-- Add more job details here as needed -->
            </div>
                    <!-- Job details content will be dynamically loaded here -->
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

<script>
    $(document).ready(function () {
        $('.btn-view-details').click(function () {
            // This should trigger the modal
            $('#jobDetailsModal').modal('show');
        });
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
    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9gybBogGzjI4IHcE5O5p+4ujCq4OzH2VpZNR9PZ73fJf9BCLvHY" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9B8J2eFFSUUUHRc/kbY5aaO7C4mQeGz64lVFN5hFHz8B35u94B7B4QK" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-<updated-integrity-hash>" crossorigin="anonymous"></script>


 
    <script>
        $(document).ready(function () {
            $('#logout-link').click(function () {
                $('#logoutModal').modal('show');
            });

            $('#confirmLogout').click(function () {
            	 window.location.href = 'seekerLogOut';
            });
        });

   
    </script>
    <!-- Include jQuery and Bootstrap JS (already included in your code) -->

<script>
$(document).ready(function () {
    $('.btn-view-status').click(function () {
        // Get the job application status from the button's data attribute
        const jobApplicationStatus = $(this).data('job-application-status');

        // Update the modal content with the job application status
        $('#modalApplicationStatus').text(jobApplicationStatus);

        // Show the modal
        $('#applicationStatusModal').modal('show');
    });
});
</script>

    <script src="${pageContext.request.contextPath}/assets/js/jobseeker.js"></script>
</body>

</html>
