<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored ="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
 <script src="${pageContext.request.contextPath}/assets/js/admincontent.js"></script>
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        crossorigin="anonymous" />
    <!-- Custom CSS -->
    <!-- <link href="C:\Users\Aaaron\Desktop\jobportal\Admin new\css\style.css" rel="stylesheet"> -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}\assets\css\adminprofile.css">
   
    <!--  -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- <link rel="stylesheet" href="C:\Users\Aaaron\Desktop\jobportal\html\style.css"> -->
    <!-- <link rel="stylesheet" href="/html/style.css"> -->


    <!-- <link rel="stylesheet" href="/html/style.css"> -->
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

        /* #job-content{

            height: 700px;
        }
       #bordered-container{
        height: 600px;
       }
       .bordered-container {
        height: 500px;} */
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

        #job-content{

padding-top: 90px !important;
}
    </style>
    <!-- logugut -->

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
                <!-- <img src="C:\Users\Aaaron\Desktop\jobportal\Admin - Copy\image\admin.png" alt="Profile Image"> -->
                  <img src="${pageContext.request.contextPath}/assets/images/user.png" alt="Profile Image">

            </div>
            <span class="admin_text">${admin.name}</span>
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
                    <!-- <img src="C:\Users\Aaaron\Desktop\jobportal\image\head.2.png" alt=""> -->
                    <img src="${pageContext.request.contextPath}/assets/images/head.2.png" alt="">
                </a>
                <div class="nav_list">
                    <a href="cart" class="nav_link" id="dashboard-link">
                        <i class='bx bx-grid-alt nav_icon'></i>
                        <span class="nav_name" >Dashboard</span>
                    </a>
                    <a href="AdminRetriveData" class="nav_link" id="job-link">
                        <i class='fas fa-users nav_icon'></i>
                        <span class="nav_name">Job Seekers</span>
                    </a>
                    <a href="AdminEmployerRetriveData" class="nav_link" id="seeker-link">
                        <i class='fas fa-user-tie nav_icon'></i>
                        <span class="nav_name">Employers</span>
                    </a>
                    <a href="AdminJobRetriveData" class="nav_link active" id="employer-link">
                        <i class='fas fa-briefcase nav_icon'></i>
                        <span class="nav_name">Jobs</span>
                    </a>
                    <!-- <a href="#" class="nav_link" id="message-link">
                        <i class='bx bx-envelope nav_icon'></i>
                        <span class="nav_name">Message</span>
                    </a> -->
                    <a href="AdminProfileView" class="nav_link" id="profile-link">
                        <i class='bx bx-user nav_icon'></i>
                        <span class="nav_name">My Profile</span>
                    </a>
 <a href="adminPasswordController" class="nav_link">
                        <i class='fas fa-key nav_icon' title="Reset Password"></i>
                        <span class="nav_name">Reset Password</span>
                    </a>

                    <a href="#" class="nav_link" id="logout-link">
                        <i class='bx bx-log-out nav_icon'></i>
                        <span class="nav_name">Sign Out</span>
                    </a>
                </div>
            </div>
        </nav>
    </div>

  
    <!--  -->
    <!-- <div class="container" id="employer-content"> -->
        <div id="job-content">
        
        <h4 class="text-center h4" style="border: 1px solid black;">Jobs Information</h4>
        <div class="form-inline justify-content-between mt-6 border border-secondary bg-secondary">
        <!--    <button class="btn btn-primary btn-sm mr-2" id="addJobButton" data-toggle="modal"
                data-target="#addJobModal">
                <i class="bi bi-plus-circle"></i> Add job
            </button> -->
            <input type="text" class="form-control form-control-sm ml-auto w-50" id="jobSearch"
                placeholder="Search job">
                <button id="exportButton" class="btn btn-primary ml-2">Export to Excel</button>
                
        </div>
        <div class="table-responsive mt-3">
            <table class="table table-striped table-bordered" style="background-color: #b80e0e;">
                <thead>
                    <tr class="text-center">
                        <th scope="col">Serial</th>
                        <th scope="col">Job Title</th>
                        <th scope="col">Company Name</th>
                        <th scope="col">Location</th>
                        <th scope="col">Status</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody id="jobTableBody">
                    <!-- Job data will be dynamically added here -->
                    <c:forEach var="jobsList" items="${jobsList}" varStatus="loop">
       <tr class="text-center">
       
    
    <td>${loop.index + 1}</td>
    <td>${jobsList.job_Title}</td>
    <td>${jobsList.company_Name}</td>
        <td>${jobsList.location}</td>
    
    <td>${jobsList.job_Status}</td>
    
    <td>
     <div class="btn-toolbar" role="toolbar">
                      <div class="btn-group mr-2" role="group">
        <button class="btn btn-primary btn-sm btn-view" data-toggle="tooltip" data-placement="top" title="View"
            data-jobstitle="${jobsList.job_Title}" data-companyname="${jobsList.company_Name}" data-jobdescription="${jobsList.job_Description}"
            data-jobskills="${jobsList.required_Skills}" data-joblocation="${jobsList.location}" data-deadlinedate="${jobsList.application_Deadline}"
            data-numberofopenings="${jobsList.number_Of_Openings}" data-applicationclosedate="${jobList.application_Deadline}"
            data-numberofapplicationsreceived="${jobList.number_Of_Openings}" data-status="${jobsList.job_Status}" data-jobsid="${jobsList.job_Id}" data-employerId="${jobsList.employer_Id}">
            <i class="fas fa-eye"></i>
        </button>
                       </div>
                       <div class="btn-group mr-2" role="group">
    <button class="btn btn-secondary btn-sm btn-edit" data-toggle="tooltip" data-placement="top" title="Edit" 
     data-jobstitle="${jobsList.job_Title}" data-companyname="${jobsList.company_Name}" 
        data-joblocation="${jobsList.location}" data-status="${jobsList.job_Status}" data-jobsId="${jobsList.job_Id}" data-employerid="${jobsList.employer_Id}">
        <i class="fas fa-edit"></i>
    </button>
</div>
    
    
    </td>
    
    
   
</tr>
       
    </c:forEach>
                </tbody>
            </table>
        </div>

       <nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
    </li>
  </ul>
</nav>



        <div class="modal fade" id="addJobModal" tabindex="-1" aria-labelledby="addJobModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header text-white" style="background-color: rgb(36, 43, 94);">
                        <h5 class="modal-title" id="addJobModalLabel"><i class="fas fa-plus-circle mr-2"></i> Add Job
                        </h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="jobForm">
                            <div class="form-group">
                                <label for="jobTitle"><i class="fas fa-briefcase mr-2"></i> Job Title</label>
                                <input type="text" class="form-control" id="jobTitle" required>
                                <div id="jobTitleError" class="error-message"></div>
                            </div>
                            <div class="form-group">
                                <label for="jobCompanyName"><i class="fas fa-building mr-2"></i> Company Name</label>
                                <input type="text" class="form-control" id="jobCompanyName" required>
                                <div id="jobCompanyNameError" class="error-message"></div>
                            </div>
                            <div class="form-group">
                                <label for="jobDescription"><i class="fas fa-file-alt mr-2"></i> Description</label>
                                <textarea class="form-control" id="jobDescription" required></textarea>
                                <div id="jobDescriptionError" class="error-message"></div>
                            </div>
                            <div class="form-group">
                                <label for="jobSkills"><i class="fas fa-tools mr-2"></i> Skills Required</label>
                                <textarea class="form-control" id="jobSkills" required></textarea>
                                <div id="jobSkillsError" class="error-message"></div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="jobLocation"><i class="fas fa-map-marker-alt mr-2"></i> Location</label>
                                    <select class="form-control" id="jobLocation" required>
                                        <option value="">Select Location</option>
                                        <option value="Salem">Salem</option>
                                        <option value="Erode">Erode</option>
                                        <option value="Tiruchy">Tiruchy</option>
                                        <option value="Chennai">Chennai</option>
                                    </select>
                                    <div id="jobLocationError" class="error-message"></div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="jobType"><i class="fas fa-clock mr-2"></i> Job Type</label>
                                    <select class="form-control" id="jobType" required>
                                        <option value="">Select Job Type</option>
                                        <option value="Full-time">Full Time</option>
                                        <option value="Part-time">Part Time</option>
                                        <option value="Intern">Internship</option>
                                        <option value="Contract">Contract</option>
                                    </select>
                                    <div id="jobTypeError" class="error-message"></div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="numberOfOpenings"><i class="fas fa-users mr-2"></i> Number of
                                        Openings</label>
                                    <input type="number" class="form-control" id="numberOfOpenings" min="1" required>
                                    <div id="numberOfOpeningsError" class="error-message"></div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="postDate"><i class="fas fa-calendar-alt mr-2"></i> Post Date</label>
                                    <input type="date" class="form-control" id="postDate" required>
                                    <div id="postDateError" class="error-message"></div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="applicationDeadline"><i class="fas fa-calendar-times mr-2"></i>
                                        Application Deadline</label>
                                    <input type="date" class="form-control" id="applicationDeadline" required>
                                    <div id="applicationDeadlineError" class="error-message"></div>
                                </div>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn text-white" id="addJobBtn"
                                    style="background-color: rgb(36, 43, 94);">
                                    <i class="fas fa-plus-circle mr-2 text-white"></i> Add Job
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <!-- view job -->
        <div class="modal fade" id="viewJobModal" tabindex="-1" aria-labelledby="viewJobModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: rgb(36, 43, 94); color:white";>
                        <h5 class="modal-title" id="viewJobModalLabel"
                            style="background-color: rgb(36, 43, 94); color: white;">View Job</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style=" color:white"
                            ;>
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                      
                        <p><strong>Job Title:</strong> <span id="viewJobTitle"></span></p>
                        <p><strong>Company Name:</strong> <span id="viewJobCompanyName"></span></p>
                        <p><strong>Description:</strong> <span id="viewJobDescription"></span></p>
                        <p><strong>Skills:</strong> <span id="viewJobSkills"></span></p>
                        <p><strong>Location:</strong> <span id="viewJobLocation"></span></p>
                        <p><strong>Deadline Date:</strong> <span id="viewJobDeadlineDate"></span></p>
                        <p><strong>Number of Openings:</strong> <span id="viewJobNumberOfOpenings"></span></p>
                         <p><strong>Number of Openings:</strong> <span id="employerId"></span></p>
                        
                        <p><strong>Job Status:</strong> <span id="viewJobStatus"></span></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- edit job -->
        
<div class="modal fade" id="editJobModal" tabindex="-1" aria-labelledby="editJobModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color:rgb(36, 43, 94); color:rgb(249, 249, 249)">
                <h5 class="modal-title" id="editJobModalLabel">Edit Job</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" style="color:white;">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editJobForm" action="AdminJobEdit">
                    <div class="form-group">
                      
                        <input type="hidden" class="form-control"  id="editJobID"  name ="job_id" readonly >
                    </div>
                     <div class="form-group">
                       
                        <input type="hidden" class="form-control"  id="editEmployerID" name="emp_id" readonly >
                    </div>
                    <div class="form-group">
                        <label for="editJobTitle">Job Title</label>
                        <input type="text" class="form-control" id="editJobTitle" readonly>
                        <div id="editJobTitleError" class="error-message"></div>
                    </div>
                    <div class="form-group">
                        <label for="editJobCompanyName">Company Name</label>
                        <input type="text" class="form-control" id="editJobCompanyName" readonly>
                        <div id="editJobCompanyNameError" class="error-message"></div>
                    </div>
                     <div class="form-group">
                        <label for="editJobCompanyLocation">Location</label>
                        <input type="text" class="form-control" id="editJobCompanyLocation" readonly>
                        <div id="editJobCompanyNameError" class="error-message"></div>
                    </div>
                    <div class="form-group">
                        <label for="editJobStatus">Status *</label>
                        <select class="form-control" id="editJobStatus" name="job_Status" required>
                            
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                        <div id="editJobStatusError" class="error-message"></div>
                    </div>
                    <button type="submit" class="btn btn-primary" id="editJobModal">Save Changes</button>
                </form>
            </div>
        </div>
    </div>
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
            	window.location.href = "AdminLogOut";


            });
        });



    </script>
    <script>
       
     // Export to PDF functionality
        $("#exportButton").click(function () {
            // Convert the table data to a string format
            var tableData = "Job Title,Company Name,Location,Status\n"; // CSV header

            $("#jobTableBody tr").each(function () {
                var row = $(this);
                var rowData = row.find("td:eq(1)").text() + "," + row.find("td:eq(2)").text() + "," +
                    row.find("td:eq(3)").text() + "," + row.find("td:eq(4)").text() + "\n";
                tableData += rowData;
            });

            // Create a Blob object with the CSV data
            var blob = new Blob([tableData], { type: "text/csv" });

            // Create a link element
            var link = document.createElement("a");
            link.href = URL.createObjectURL(blob);
            link.download = "employers.csv";

            // Programmatically trigger the download
            link.click();
        });
//pagenation

 var itemsPerPage =5;
            var $table = $('#jobTableBody');
            var $pagination = $('.pagination');
            var totalItems = $table.find('tr').length;
            var totalPages = Math.ceil(totalItems / itemsPerPage);

            function updatePagination() {
                $pagination.find('li').not(':first, :last').remove();
                for (var i = 1; i <= totalPages; i++) {
                    $('<li class="page-item"><a class="page-link" href="#">' + i + '</a></li>').insertBefore($pagination.find('li:last'));
                }
                showPage(1);
            }

            function showPage(page) {
                $table.find('tr').hide();
                var start = (page - 1) * itemsPerPage;
                var end = start + itemsPerPage;
                $table.find('tr').slice(start, end).show();
                $pagination.find('li').removeClass('active');
                $pagination.find('li').eq(page).addClass('active');
            }

            $pagination.on('click', 'a', function(e) {
                e.preventDefault();
                var $parent = $(this).parent();
                if ($parent.hasClass('disabled') || $parent.hasClass('active')) return;

                var page = $parent.index();
                if ($parent.find('.page-link').attr('aria-label') === 'Previous') {
                    page = $pagination.find('li.active').index() - 1;
                } else if ($parent.find('.page-link').attr('aria-label') === 'Next') {
                    page = $pagination.find('li.active').index() + 1;
                }
                if (page > 0 && page <= totalPages) {
                    showPage(page);
                }
            });

            updatePagination();
    </script>
    
    <script>
        $(document).ready(function () {
            // View Button Click
            $(document).on('click', '.btn-view', function () {
               
                var jobTitle = $(this).data('jobstitle');
                var companyName = $(this).data('companyname');
                var jobDescription = $(this).data('jobdescription');
                var jobSkills = $(this).data('jobskills');
                var jobLocation = $(this).data('joblocation');
                var deadlineDate = $(this).data('deadlinedate');
                var numberOfOpenings = $(this).data('numberofopenings');
                var applicationCloseDate = $(this).data('applicationclosedate');
                var numberOfApplicationsReceived = $(this).data('numberofapplicationsreceived');
                var status = $(this).data('status');
                var employer = $(this).data('jobsid');
               
                $('#viewJobTitle').text(jobTitle);
                $('#viewJobCompanyName').text(companyName);
                $('#viewJobDescription').text(jobDescription);
                $('#viewJobSkills').text(jobSkills);
                $('#viewJobLocation').text(jobLocation);
                $('#viewJobDeadlineDate').text(deadlineDate);
                $('#viewJobNumberOfOpenings').text(numberOfOpenings);
                $('#viewJobApplicationClosedDate').text(applicationCloseDate);
                $('#viewJobNumberOfApplicationsReceived').text(numberOfApplicationsReceived);
                $('#employerId').text(employer);
                $('#viewJobStatus').text(status);

                // Show the view modal
                $('#viewJobModal').modal('show');
            });
            
            
            
            
           

            $(document).on('click', '.btn-edit', function () {
            	 var jobTitle = $(this).data('jobstitle');
                 var companyName = $(this).data('companyname');
                 var jobLocation = $(this).data('joblocation');
                 var jobId = $(this).data('jobsid');
                 var employerId = $(this).data('employerid');
                 var status = $(this).data('status');
    
                 $('#editJobTitle').val(jobTitle);
                 $('#editJobCompanyName').val(companyName);
                 $('#editJobCompanyLocation').val(jobLocation);
                 
                 $('#editJobID').val(jobId);
                 $('#editEmployerID').val(employerId);
                 
                 $('#editJobStatus').val(status);
   

     $('#editJobModal').modal('show');
 });

 // Form submission handling
 $('#editJobForm').on('submit', function () {
     // Allow the form to submit normally
     $('#editJobForm').modal('hide');
 });

 // Reset form handling
 $('#resetEditForm').on('click', function () {
     $('#editJobForm')[0].reset();
 });


             // Reset form handling
             $('#resetEditForm').on('click', function () {
                 $('#editJobForm')[0].reset();
                 $('.error-message').text('');
             });

             // Search functionality
             $('#jobSearch').on('keyup', function () {
                 var value = $(this).val().toLowerCase();
                 $("#jobTableBody tr").filter(function () {
                     $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                 });
             });
            
        });
    </script>
    
     

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>


        <!-- seeker -->
        <!-- <script src="C:\Users\Aaaron\Desktop\jobportal\html\script.js"></script> -->
        <script src="/html/script.js"></script>

        <!--  -->
        <!-- External JS libraries -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <!-- Local JS file -->
        <!-- <script src="C:\Users\Aaaron\Desktop\jobportal\Admin new\script\script.js"></script> -->
        <script src="/Admin new/script/script.js"></script>
        
        
</body>

</html>