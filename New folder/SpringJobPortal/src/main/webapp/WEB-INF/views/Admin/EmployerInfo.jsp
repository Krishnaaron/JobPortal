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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Boxicons CSS for icons -->
    <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/@mdi/font/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/adminprofile.css">
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
            top: 111px;
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
        #job-content {
            padding-bottom: 100px !important;
        }
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
                <i class='bx bx-log-out' id="logout-icon" title="Sign Out"></i>
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
                    <a href="${pageContext.request.contextPath}views/Admin/admin.jsp" class="nav_link active" id="dashboard-link">
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
    
    

    <div id="job-content">
        <h4 class="text-center h4" style="border:1px solid black;">Seeker Information</h4>
        <div class="form-inline justify-content-between" style="background-color:rgb(108, 117, 125);">
            <input type="text" class="form-control form-control-sm ml-auto w-50" id="seekerSearch" placeholder="Search jobseekers">
        </div>

        <table class="table table-striped table-bordered mt-2">
            <thead>
                <tr class="text-center">
                    <th scope="col">Serial</th>
                    <th scope="col">Name</th>
                    <th scope="col">Phone Number</th>
                    <th scope="col">Email</th>
                    <th scope="col">Status</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody id="seekerTableBody">
                <c:forEach items="${jobSeekersList}" var="jobSeeker" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td>${jobSeeker.name}</td>
                        <td>${jobSeeker.phone}</td>
                        <td>${jobSeeker.email}</td>
                        <td>${jobSeeker.status}</td>
                        <td>
                            <div class="btn-group mr-2" role="group">
                                <button class="btn btn-secondary btn-sm btn-edit" data-toggle="tooltip" data-placement="top" title="Edit" data-id="${jobSeeker.email}">
                                    <i class="fas fa-edit"></i>
                                </button>
                            </div>
                          <button class="btn btn-primary btn-sm btn-view" data-toggle="modal" data-target="#viewSeekerModal"
        data-email="${jobSeeker.email}">
        <i class="fas fa-eye"></i>
    </button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Pagination -->
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#">Next</a>
            </li>
        </ul>
    </nav>

    
     <!-- View Seeker Modal -->
        <div class="modal fade" id="viewSeekerModal" tabindex="-1" aria-labelledby="viewSeekerModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="background-color:rgb(36, 43, 94)" ;>
                        <h5 class="modal-title" id="viewSeekerModalLabel" style="color:white">View Job Seeker</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color:white">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p><strong>Name:</strong> <span id="viewSeekerName" value ="${jobSeeker.name}"></span></p>
                        <p><strong>Seeker-id:</strong> <span id="viewSeekerCompanyName"></span></p>
                        <p><strong>Email:</strong> <span id="viewSeekerEmail"></span></p>
                        <p><strong>Status:</strong> <span id="viewSeekerStatus"></span></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Edit Seeker Modal -->
        <div class="modal fade" id="editSeekerModal" tabindex="-1" aria-labelledby="editSeekerModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="background-color:rgb(36, 43, 94)" ;>
                        <h5 class="modal-title" id="editSeekerModalLabel" style="color:white">Edit Job Seeker</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color:white">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="editSeekerForm" action="${pageContext.request.contextPath}\AdminEmployerEdit" method="post">
                            <div class="form-group">
                                <label for="editSeekerName">Name</label>
                                <input type="text" class="form-control" id="editSeekerName" required>
                                <div id="nameError" class="error-message"></div>
                            </div>
                            <div class="form-group">
                                <label for="editSeekerCompanyName">Seeker_id</label>
                                <input type="text" class="form-control" id="editSeekerCompanyName" disabled>
                                <div id="companyNameError" class="error-message"></div>
                            </div>
                            <div class="form-group">
                                <label for="editSeekerEmail">Email</label>
                                <input type="email" class="form-control" id="editSeekerEmail" required>
                                <div id="emailError" class="error-message"></div>
                            </div>
                            <div class="form-group">
                                <label for="editSeekerStatus">Status</label>
                                <select class="form-control" id="editSeekerStatus" required>
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary" id="submitBtn">Save Changes</button>
                            <button type="button" class="btn btn-secondary" id="resetEditForm">Reset</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    <!-- Success Message Card -->
    <div class="container">
        <div id="successMessageCard" class="alert alert-success alert-dismissible fade show text-center" role="alert"
            style="display: none; position: fixed; top: 100px; left: 50%; transform: translateX(-50%); width:300px;">
            <i class="fas fa-check-circle"></i> Updated successfully!
        </div>
    </div>

    <!-- JavaScript libraries -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-HoA7GpGL+vG7L3kgZw+Z5PpNUVQ/Gn6C9/TePmV4v8R5k3Ehtoj7ft/w2ob6D2yf" crossorigin="anonymous"></script>
<script>
    $(document).ready(function() {
        $('.btn-view').on('click', function() {
            var email = $(this).data('email');
            $.ajax({
                url: 'admin',
                type: 'POST',
                data: { action: 'viewDetails', email: email },
                success: function(response) {
                    var seeker = response.jobSeeker;
                    $('#viewSeekerName').text(seeker.name);
                    $('#viewSeekerEmail').text(seeker.email);
                    $('#viewSeekerPhone').text(seeker.phone);
                    $('#viewSeekerStatus').text(seeker.status);
                    $('#viewSeekerDob').text(seeker.dob);
                    $('#viewSeekerState').text(seeker.state);
                    $('#viewSeekerDistrict').text(seeker.district);
                    $('#viewSeekerPincode').text(seeker.pincode);
                    $('#viewSeekerGender').text(seeker.gender);
                    $('#viewSeekerEduQualification').text(seeker.eduQualification);
                    $('#viewSeekerCourse').text(seeker.course);
                    $('#viewSeekerSpecialization').text(seeker.specialization);
                    $('#viewSeekerPassingYear').text(seeker.passingYear);
                    $('#viewSeekerInstitute').text(seeker.institute);
                    $('#viewSeekerCgpa').text(seeker.cgpa);
                    $('#viewSeekerCourseType').text(seeker.courseType);
                    $('#viewSeekerYearsExperience').text(seeker.yearsExperience);
                    $('#viewSeekerDesignation').text(seeker.designation);
                    $('#viewSeekerLanguage').text(seeker.language);
                    $('#viewSeekerProficiencyRead').text(seeker.proficiencyRead);
                    $('#viewSeekerProficiencyWrite').text(seeker.proficiencyWrite);
                    $('#viewSeekerProficiencySpeak').text(seeker.proficiencySpeak);
                    $('#viewSeekerCertification').text(seeker.certification);
                    $('#viewSeekerCertificationYear').text(seeker.certificationYear);
                    $('#viewSeekerCertificationInstitute').text(seeker.certificationInstitute);
                }
            });
        });
    });
</script>

    <script src="${pageContext.request.contextPath}/assets/js/admincontent.js"></script>
</body>

</html>
                    
   