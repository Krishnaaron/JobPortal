<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        crossorigin="anonymous" />
    <!-- Custom CSS -->
    <!-- <link href="C:\Users\Aaaron\Desktop\jobportal\Admin new\css\style.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="/Admin new/css/style.css">
       <link rel="stylesheet" href="..\..\assets\css\adminprofile.css">
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
                <img src="/Admin - Copy/image/admin.png" alt="Profile Image">

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
                    <img src="/image/head.2.png" alt="">
                </a>
                <div class="nav_list">
                    <a href="" class="nav_link active" id="dashboard-link">
                        <i class='bx bx-grid-alt nav_icon'></i>
                        <span class="nav_name">Dashboard</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/AdminRetriveData" class="nav_link" id="job-link">
                        <i class='fas fa-users nav_icon'></i>
                        <span class="nav_name">Job Seekers</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/AdminEmployerView" class="nav_link" id="seeker-link">
                        <i class='fas fa-user-tie nav_icon'></i>
                        <span class="nav_name">Employers</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/JobController" class="nav_link" id="employer-link">
                        <i class='fas fa-briefcase nav_icon'></i>
                        <span class="nav_name">Jobs</span>
                    </a>
                    <!-- <a href="#" class="nav_link" id="message-link">
                        <i class='bx bx-envelope nav_icon'></i>
                        <span class="nav_name">Message</span>
                    </a> -->
                    <a href="${pageContext.request.contextPath}/AdminProfileView" class="nav_link" id="profile-link">
                        <i class='bx bx-user nav_icon'></i>
                        <span class="nav_name">My Profile</span>
                    </a>


                    <a href="AdminLogOut" class="nav_link" id="logout-link">
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
            <button class="btn btn-primary btn-sm mr-2" id="addJobButton" data-toggle="modal"
                data-target="#addJobModal">
                <i class="bi bi-plus-circle"></i> Add job
            </button>
            <input type="text" class="form-control form-control-sm ml-auto w-50" id="jobSearch"
                placeholder="Search job">
        </div>
        <div class="table-responsive mt-3">
            <table class="table table-striped table-bordered" style="background-color: #b80e0e;">
                <thead>
                    <tr class="text-center">
                        <th scope="col">Serial</th>
                        <th scope="col">Job Title</th>
                        <th scope="col">Location</th>
                        <th scope="col">Company</th>
                        <th scope="col">Status</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody id="jobTableBody">
              <c:forEach var="jobsList" items="${jobsList}" varStatus="loop">
       <tr class="text-center">
       
    
    <td>${loop.index + 1}</td>
    <td>${jobsList.jobTitle}</td>
    <td>${jobsList.location}</td>
    <td>${jobsList.companyName}</td>
    
    <td>${jobsList.status}</td>
    <td>
        <button class="btn btn-info btn-sm btn-view" data-toggle="tooltip" title="View"
            data-name="${employer.name}" data-company-name="${employer.companyName}"
            data-email="${employer.email}" data-status="${employer.status}">
            <i class="fas fa-eye"></i>
        </button>
        <button class="btn btn-primary btn-sm btn-edit" data-toggle="tooltip" title="Edit"
            data-name="${employer.name}" data-company-name="${employer.companyName}"
            data-email="${employer.email}" data-status="${employer.status}">
            <i class="fas fa-edit"></i>
        </button>
    </td>
</tr>
       
    </c:forEach>
                </tbody>
            </table>
        </div>

        <nav aria-label="Page navigation">
            <ul class="pagination justify-content-end" id="paginationCont"></ul>
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
                    <div class="modal-header" style="background-color: rgb(36, 43, 94); color:white" ;>
                        <h5 class="modal-title" id="viewJobModalLabel"
                            style="background-color: rgb(36, 43, 94); color: white;">View Job</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style=" color:white"
                            ;>
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p><strong>Job ID:</strong> <span id="viewJobID"></span></p>
                        <p><strong>Employer ID:</strong> <span id="viewEmployerID"></span></p>
                        <p><strong>Job Title:</strong> <span id="viewJobName"></span></p>
                        <p><strong>Company Name:</strong> <span id="viewJobCompanyName"></span></p>
                        <p><strong>Description:</strong> <span id="viewJobDescription"></span></p>
                        <p><strong>Skills:</strong> <span id="viewJobSkills"></span></p>
                        <p><strong>Location:</strong> <span id="viewJobLocation"></span></p>
                        <p><strong>Deadline Date:</strong> <span id="viewJobDeadlineDate"></span></p>
                        <p><strong>Number of Openings:</strong> <span id="viewJobNumberOfOpenings"></span></p>
                        <p><strong>Application Closed Date:</strong> <span id="viewJobApplicationClosedDate"></span></p>
                        <p><strong>Number of Applications Received:</strong> <span
                                id="viewJobNumberOfApplicationsReceived"></span></p>
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
                        <form id="editJobForm">
                            <div class="form-group">
                                <label for="editJobID">Job ID</label>
                                <input type="text" class="form-control" id="editJobID" disabled>
                            </div>
                            <div class="form-group">
                                <label for="editEmployerID">Employer ID</label>
                                <input type="text" class="form-control" id="editEmployerID" disabled>
                            </div>
                            <div class="form-group">
                                <label for="editJobTitle">Job Title *</label>
                                <input type="text" class="form-control" id="editJobTitle" required>
                                <div id="editJobTitleError" class="error-message"></div>
                            </div>
                            <div class="form-group">
                                <label for="editJobCompanyName">Company Name *</label>
                                <input type="text" class="form-control" id="editJobCompanyName" required>
                                <div id="editJobCompanyNameError" class="error-message"></div>
                            </div>
                            <div class="form-group">
                                <label for="editJobDescription">Description *</label>
                                <textarea class="form-control" id="editJobDescription" required></textarea>
                                <div id="editJobDescriptionError" class="error-message"></div>
                            </div>
                            <div class="form-group">
                                <label for="editJobSkills">Skills Required *</label>
                                <textarea class="form-control" id="editJobSkills" required></textarea>
                                <div id="editJobSkillsError" class="error-message"></div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="editJobLocation">Location *</label>
                                    <select class="form-control" id="editJobLocation" required>
                                        <option value="">Select Location</option>
                                        <option value="Salem">Salem</option>
                                        <option value="Erode">Erode</option>
                                        <option value="Tiruchy">Tiruchy</option>
                                        <option value="Chennai">Chennai</option>
                                    </select>
                                    <div id="editJobLocationError" class="error-message"></div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="editJobType">Job Type *</label>
                                    <select class="form-control" id="editJobType" required>
                                        <option value="">Select Job Type</option>
                                        <option value="Full-time">Full Time</option>
                                        <option value="Part-time">Part Time</option>
                                        <option value="Intern">Internship</option>
                                        <option value="Contract">Contract</option>
                                    </select>
                                    <div id="editJobTypeError" class="error-message"></div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="editNumberOfOpenings">Number of Openings *</label>
                                    <input type="number" class="form-control" id="editNumberOfOpenings" min="1"
                                        required>
                                    <div id="editNumberOfOpeningsError" class="error-message"></div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="editPostDate">Post Date</label>
                                    <input type="date" class="form-control" id="editPostDate" disabled>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="editApplicationDeadline">Application Deadline *</label>
                                    <input type="date" class="form-control" id="editApplicationDeadline" required>
                                    <div id="editApplicationDeadlineError" class="error-message"></div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="editNumberOfApplicationsReceived">Number of Applications Received
                                        *</label>
                                    <input type="number" class="form-control" id="editNumberOfApplicationsReceived"
                                        min="0" required>
                                    <div id="editNumberOfApplicationsReceivedError" class="error-message"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="editJobStatus">Status *</label>
                                <select class="form-control" id="editJobStatus" required>
                                    <option value="">Select Status</option>
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


    </div>
    
        <!--  -->
       
     

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

        <script>
            $(document).ready(function () {
                var currentPage = 1;
                var itemsPerPage = 5;


                var jobDummyData = [
                    {
                        serial: 1,
                        jobTitle: "Software Engineer",
                        companyName: "Tech Corp",
                        empId: "E12345",
                        jobDescription: "Develop software applications",
                        jobSkills: "JavaScript, Python, SQL",
                        jobLocation: "San Francisco, CA",
                        jobType: "Full-time",
                        numberOfOpenings: 3,
                        viewPostedDate: "2024-06-10",
                        applicationDeadlineDate: "2024-07-10",
                        status: "Active",
                        jobID: "J123",
                        employerID: "EMP456",
                        postDate: "2024-06-10",
                        numberOfApplicationsReceived: 10
                    },
                    {
                        serial: 2,
                        jobTitle: "Data Analyst",
                        companyName: "Data Solutions Inc.",
                        empId: "E56789",
                        jobDescription: "Analyze data and generate reports",
                        jobSkills: "SQL, Excel, Data Visualization",
                        jobLocation: "New York, NY",
                        jobType: "Contract",
                        numberOfOpenings: 2,
                        viewPostedDate: "2024-06-11",
                        applicationDeadlineDate: "2024-07-11",
                        status: "Active",
                        jobID: "J456",
                        employerID: "EMP789",
                        postDate: "2024-06-11",
                        numberOfApplicationsReceived: 5
                    },
                    // Add more dummy data entries as needed
                    {
                        serial: 3,
                        jobTitle: "Frontend Developer",
                        companyName: "WebTech Solutions",
                        empId: "E24680",
                        jobDescription: "Develop user interfaces",
                        jobSkills: "HTML, CSS, JavaScript, React",
                        jobLocation: "Los Angeles, CA",
                        jobType: "Full-time",
                        numberOfOpenings: 1,
                        viewPostedDate: "2024-06-12",
                        applicationDeadlineDate: "2024-07-12",
                        status: "Active",
                        jobID: "J789",
                        employerID: "EMP123",
                        postDate: "2024-06-12",
                        numberOfApplicationsReceived: 7
                    },
                    {
                        serial: 4,
                        jobTitle: "Marketing Manager",
                        companyName: "Advertise Inc.",
                        empId: "E13579",
                        jobDescription: "Manage marketing campaigns",
                        jobSkills: "Marketing Strategy, Digital Marketing",
                        jobLocation: "Chicago, IL",
                        jobType: "Part-time",
                        numberOfOpenings: 1,
                        viewPostedDate: "2024-06-13",
                        applicationDeadlineDate: "2024-07-13",
                        status: "Active",
                        jobID: "J246",
                        employerID: "EMP678",
                        postDate: "2024-06-13",
                        numberOfApplicationsReceived: 3
                    },
                    {
                        serial: 5,
                        jobTitle: "Graphic Designer",
                        companyName: "Creative Designs Co.",
                        empId: "E97531",
                        jobDescription: "Create visually appealing designs",
                        jobSkills: "Adobe Illustrator, Photoshop",
                        jobLocation: "Seattle, WA",
                        jobType: "Full-time",
                        numberOfOpenings: 2,
                        viewPostedDate: "2024-06-14",
                        applicationDeadlineDate: "2024-07-14",
                        status: "Active",
                        jobID: "J357",
                        employerID: "EMP910",
                        postDate: "2024-06-14",
                        numberOfApplicationsReceived: 8
                    },
                    {
                        serial: 6,
                        jobTitle: "Financial Analyst",
                        companyName: "Finance Group Ltd.",
                        empId: "E24681",
                        jobDescription: "Analyze financial data and trends",
                        jobSkills: "Financial Modeling, Excel, Accounting",
                        jobLocation: "Boston, MA",
                        jobType: "Full-time",
                        numberOfOpenings: 1,
                        viewPostedDate: "2024-06-15",
                        applicationDeadlineDate: "2024-07-15",
                        status: "Active",
                        jobID: "J468",
                        employerID: "EMP246",
                        postDate: "2024-06-15",
                        numberOfApplicationsReceived: 6
                    },
                    {
                        serial: 7,
                        jobTitle: "Human Resources Manager",
                        companyName: "HR Solutions Inc.",
                        empId: "E75319",
                        jobDescription: "Manage HR operations and recruitment",
                        jobSkills: "Recruitment, Employee Relations",
                        jobLocation: "Houston, TX",
                        jobType: "Full-time",
                        numberOfOpenings: 1,
                        viewPostedDate: "2024-06-16",
                        applicationDeadlineDate: "2024-07-16",
                        status: "Active",
                        jobID: "J579",
                        employerID: "EMP135",
                        postDate: "2024-06-16",
                        numberOfApplicationsReceived: 4
                    },
                    {
                        serial: 8,
                        jobTitle: "Customer Service Representative",
                        companyName: "Service Solutions LLC",
                        empId: "E46802",
                        jobDescription: "Provide customer support and assistance",
                        jobSkills: "Communication, Problem Solving",
                        jobLocation: "Miami, FL",
                        jobType: "Part-time",
                        numberOfOpenings: 3,
                        // viewPostedDate: "2024-06-17", 
                        applicationDeadlineDate: "2024-07-17",
                        status: "Active",
                        jobID: "J791",
                        employerID: "EMP468",
                        postDate: "2024-06-17",
                        numberOfApplicationsReceived: 9
                    }
                ];

                function renderTable(data) {
                    $('#jobTableBody').empty(); // Clear the existing table body content
                    data.forEach(function (job) { // Loop through each job data object
                        // Construct HTML for each row using the job data
                        var row = '<tr class="text-center">';
                        row += '<td>' + job.serial + '</td>';
                        row += '<td>' + job.jobTitle + '</td>';
                        row += '<td>' + job.companyName + '</td>';
                        row += '<td>' + job.empId + '</td>';
                        row += '<td class="status-' + job.status.toLowerCase() + '">' + job.status + '</td>';
                        row += '<td>';
                        row += '<div class="btn-toolbar" role="toolbar">';
                        row += '<div class="btn-group mr-2" role="group">';
                        row += '<button class="btn btn-primary btn-sm btn-view" data-toggle="tooltip" data-placement="top" title="View"><i class="fas fa-eye"></i></button>';
                        row += '</div>';
                        row += '<div class="btn-group mr-2" role="group">';
                        row += '<button class="btn btn-secondary btn-sm btn-edit" data-toggle="tooltip" data-placement="top" title="Edit"><i class="fas fa-edit"></i></button>';
                        row += '</div>';
                       
                        row += '</div>';
                        row += '</td>';
                        row += '</tr>';

                        // Append the constructed row to the table body
                        $('#jobTableBody').append(row);
                    });
                    // After all rows are added, update the serial numbers if needed
                    updateSerialNumbers();
                }

                function updateSerialNumbers() {
                    $('#jobTableBody tr').each(function (index) {
                        $(this).find('td:eq(0)').text((currentPage - 1) * itemsPerPage + index + 1);
                    });
                }

                function goToPage(page) {
                    currentPage = page;
                    var startIndex = (page - 1) * itemsPerPage;
                    var endIndex = startIndex + itemsPerPage;
                    var paginatedData = jobDummyData.slice(startIndex, endIndex);
                    renderTable(paginatedData);
                    renderPagination(jobDummyData.length);
                }

                function renderPagination(totalItems) {
                    $('#paginationCont').empty();
                    var totalPages = Math.ceil(totalItems / itemsPerPage);
                    for (var i = 1; i <= totalPages; i++) {
                        var pageItem = '<li class="page-item ' + (i === currentPage ? 'active' : '') + '"><a class="page-link" href="#">' + i + '</a></li>';
                        $('#paginationCont').append(pageItem);
                    }
                }

                // Initial rendering
                renderTable(jobDummyData.slice(0, itemsPerPage));
                renderPagination(jobDummyData.length);

                // Pagination click handler
                $('#paginationCont').on('click', 'a', function (event) {
                    event.preventDefault();
                    var page = parseInt($(this).text());
                    goToPage(page);
                });

                // Search functionality
                $('#jobSearch').on('keyup', function () {
                    var value = $(this).val().toLowerCase();
                    $('#jobTableBody tr').filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                    });
                });

               


                $('#jobTableBody').on('click', '.btn-view', function () {
                    var row = $(this).closest('tr');
                    var serial = parseInt(row.find('td:eq(0)').text()) - 1; // Adjusted index and converted to zero-based
                    var job = jobDummyData[serial]; // Get the corresponding job data from jobDummyData array

                    // Set the values in the view modal
                    $('#viewJobID').text(job.serial);
                    $('#viewEmployerID').text(job.empId);
                    $('#viewJobName').text(job.jobTitle);

                    $('#viewJobCompanyName').text(job.companyName);
                    $('#viewJobDescription').text(job.jobDescription);
                    $('#viewJobSkills').text(job.jobSkills);
                    $('#viewJobLocation').text(job.jobLocation);
                    $('#viewJobDeadlineDate').text(job.applicationDeadlineDate);
                    $('#viewJobNumberOfOpenings').text(job.numberOfOpenings);
                    $('#viewJobApplicationClosedDate').text(job.postDate); // Assuming this is not provided in the data
                    $('#viewJobNumberOfApplicationsReceived').text(job.numberOfApplicationsReceived); // Assuming this is not provided in the data
                    $('#viewJobStatus').text(job.status);

                    // Show the view modal
                    $('#viewJobModal').modal('show');
                });


                // Function to handle job edit
                $('#jobTableBody').on('click', '.btn-edit', function () {
                    var row = $(this).closest('tr');
                    var serial = parseInt(row.find('td:eq(0)').text()) - 1; // Adjusted index and converted to zero-based
                    var job = jobDummyData[serial]; // Get the corresponding job data from jobDummyData array

                    // Set the values in the edit modal
                    $('#editJobID').val(job.jobID); // Assuming job ID is stored in empId
                    $('#editEmployerID').val(job.empId);
                    $('#editJobTitle').val(job.jobTitle);
                    $('#editJobCompanyName').val(job.companyName);
                    $('#editJobDescription').val(job.jobDescription);
                    $('#editJobSkills').val(job.jobSkills);
                    $('#editJobLocation').val(job.jobLocation);
                    $('#editJobType').val(job.jobType);
                    $('#editNumberOfOpenings').val(job.numberOfOpenings);
                    $('#editPostDate').val(job.viewPostedDate); // Assuming post date is stored in viewPostedDate
                    $('#editApplicationDeadline').val(job.applicationDeadlineDate);
                    $('#editNumberOfApplicationsReceived').val(job.numberOfApplicationsReceived); // Assuming number of applications received is available
                    $('#editJobStatus').val(job.status);

                    // Show the edit modal
                    $('#editJobModal').modal('show');
                });

                // Function to handle job delete
                $('#jobTableBody').on('click', '.btn-delete', function () {
                    // Your delete job functionality
                });

                // Job form submission handler
                $('#jobForm').submit(function (event) {
                    event.preventDefault();

                    // Get input values
                    var jobTitle = $('#jobTitle').val();
                    var companyName = $('#jobCompanyName').val();
                    var jobDescription = $('#jobDescription').val();
                    var jobSkills = $('#jobSkills').val();
                    var jobLocation = $('#jobLocation').val();
                    var jobType = $('#jobType').val();
                    var numberOfOpenings = $('#numberOfOpenings').val();
                    var postDate = $('#postDate').val();
                    var applicationDeadline = $('#applicationDeadline').val();

                    // Create new job object
                    var newJob = {
                        serial: jobDummyData.length + 1,
                        jobTitle: jobTitle,
                        companyName: companyName,
                        jobDescription: jobDescription,
                        jobSkills: jobSkills,
                        jobLocation: jobLocation,
                        jobType: jobType,
                        numberOfOpenings: numberOfOpenings,
                        postDate: postDate,
                        applicationDeadline: applicationDeadline,
                        status: "Active" // Default status to Active
                    };

                    // Append new job to jobDummyData array
                    jobDummyData.push(newJob);

                    // Render the updated table
                    renderTable(jobDummyData);

                    // Reset form
                    $('#jobForm')[0].reset();

                    // Hide the modal
                    $('#addJobModal').modal('hide');
                });

                // Save edited Job button click handler
                $(document).ready(function () {
                    $('#editJobForm').submit(function (event) {
                        event.preventDefault();
                        var index = $('#editJobTitle').data('index');

                        var updatedJob = {
                            jobID: $('#editJobID').val(),
                            employerID: $('#editEmployerID').val(),
                            jobTitle: $('#editJobTitle').val(),
                            companyName: $('#editJobCompanyName').val(),
                            jobDescription: $('#editJobDescription').val(),
                            jobSkills: $('#editJobSkills').val(),
                            jobLocation: $('#editJobLocation').val(),
                            jobType: $('#editJobType').val(),
                            numberOfOpenings: $('#editNumberOfOpenings').val(),
                            postDate: $('#editPostDate').val(),
                            applicationDeadline: $('#editApplicationDeadline').val(),
                            numberOfApplicationsReceived: $('#editNumberOfApplicationsReceived').val(),
                            jobStatus: $('#editJobStatus').val()
                        };

                        // Update the data in the jobDummyData array
                        jobDummyData[index] = updatedJob;

                        // Re-render the table with the updated data
                        renderTable(jobDummyData);

                        // Hide the modal
                        $('#editJobModal').modal('hide');
                    });

                    // Initialize tooltips
                    $('[data-toggle="tooltip"]').tooltip();
                });

            });
        </script>


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
          <script> src="../../assets/js/admincontent.js"></script>
          
</body>

</html>