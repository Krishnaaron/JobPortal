<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JobSeeker Panel</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<!-- Boxicons CSS for icons -->
<link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/@mdi/font/css/materialdesignicons.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link rel="stylesheet" href="/correctAdmin/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}\assets\css\seekerdash.css">
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

@media ( max-width : 768px) {
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

@media ( min-width : 992px) {
	.job-container .card {
		height: auto; /* Flexible height for laptop view */
	}
}

@media ( max-width : 576px) {
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
<style>
        /* CSS styles from above */
      
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: hidden;
        background-color: rgba(0, 0, 0, 0.5);
    }

    .modal-dialog {
        display: flex;
        align-items: flex-start; /* Aligns to the top */
        justify-content: center;
        height: auto; /* Adjust height to content */
        margin-top: 20px; /* Add some space from the top */
    }

    .modal-content {
        background-color: #fff;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        border-radius: 10px;
        width: 400px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .modal-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .close {
        color: #aaa;
        font-size: 28px;
        cursor: pointer;
    }

    .close:hover {
        color: black;
    }

    .btn {
        padding: 10px 15px;
        color: white;
        background-color: #007bff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .btn-danger {
        background-color: #dc3545;
    }

    .btn:hover {
        background-color: #0056b3;
    }

    .btn-danger:hover {
        background-color: #c82333;
    }
</style>

    
</head>

<%

   response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//http 1.1
   response.setHeader("Pragma","no-cache");//http1.0
   response.setHeader("Expires","0");// Proxies
   
   if(session.getAttribute("seeker")==null){
	   
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

				<img src="${pageContext.request.contextPath}/assets/images/user.png"
					alt="Profile Image">
			</div>
			<span class="admin_text">${seeker.fName}</span>
			<div class="header_icons">
				<i class='bx bx-bell' id="notification-icon" title="Notifications"></i>
				<i class='bx bx-envelope' id="message-icon" title="Messages"></i> <i
					class='bx' id="logout-icon" title=""></i>
			</div>
		</div>
	</header>
	<div class="l-navbar" id="nav-bar">
		<nav class="nav">
			<div>
				<a href="#" class="nav_logo"> <img
					src="${pageContext.request.contextPath}\assets\images\head.2.png"
					alt="">
				</a>
				<div class="nav_list">
					<a href="seekerCart" class="nav_link active"> <i
						class='fas fa-tachometer-alt nav_icon' title="Dashboard"></i> <span
						class="nav_name">Dashboard</span>
					</a> <a href="JobSeekerProfileRetriveController" class="nav_link">
						<i class='fas fa-id-badge nav_icon' title="My Profile"></i> <span
						class="nav_name">My Profile</span>
					</a> <a href="JobSeekerProfileEditController" class="nav_link"> <i
						class='fas fa-user-edit nav_icon' title="Edit Profile"></i> <span
						class="nav_name">Edit Profile</span>
					</a> <a href="jobSearchController" class="nav_link"> <i
						class='fas fa-search nav_icon' title="Job Search"></i> <span
						class="nav_name">Job Search</span>
					</a> <a href="appliedJobController" class="nav_link"> <i
						class='fas fa-briefcase nav_icon' title="Applied Jobs"></i> <span
						class="nav_name">Applied Jobs</span>
					</a> <a href="SeekerPasswordController" class="nav_link"> <i
						class='fas fa-key nav_icon' title="Reset Password"></i> <span
						class="nav_name">Reset Password</span>
					</a> <a href="seekerLogOut" class="nav_link" id="logout-link"> <i
						class='bx bx-log-out nav_icon'></i> <span class="nav_name">LogOut</span>
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
						<div class="text-center">
							<i class="fas fa-briefcase fa-2x mb-2"></i>
						</div>
						<p class="card-text">${applied}</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3 mb-4">
				<div class="card text-white bg-success">
					<div class="card-body">

						<h5 class="card-title">Profile view count</h5>
						<div class="text-center">
							<i class="fas fa-eye fa-2x mb-2"></i>
						</div>
						<p class="card-text">0</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3 mb-4">
				<div class="card text-white bg-warning">
					<div class="card-body">
						<h5 class="card-title">RecomededJobs</h5>
						<div class="text-center">
							<i class="fas fa-thumbs-up fa-2x mb-2"></i>
						</div>
						<p class="card-text">${recomeder}</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3 mb-4">
				<div class="card text-white bg-danger">
					<div class="card-body">
						<h5 class="card-title">No.of.Jobs Bookmarked</h5>
						<div class="text-center">
							<i class="fas fa-bookmark fa-2x mb-2"></i>
						</div>
						<p class="card-text">0</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="recommad">
		<h4>${recomeder}Recommended Job(s)</h4>
	</div>
	<div class="container mt-3 job-container">
		<div class="row" id="jobCardsContainer">
			<!-- Job cards will be dynamically generated here -->
			<c:forEach var="job" items="${jobList}">
				<div class="col-10 mb-4">
					<div class="card job-card">
						<div class="row no-gutters align-items-center">
							<div class="col-md-2 text-center">
								<img
									src="${pageContext.request.contextPath}/assets/images/658378.gif"
									alt="Company Logo">
							</div>
							<div class="col-md-10">
								<div class="card-body job-details">
									<h5 class="card-title" style="color: #28a745 !important">${job.job_Title}</h5>
									<p class="card-text job-info">
										<i class="fas fa-briefcase job-icon"></i> ${job.job_Title} |
										${job.company_Name}
									</p>


									<p class="card-text job-info">
										<i class="far fa-calendar-alt job-icon"></i> Posted Date:
										${job.job_Posted} | Open Until: ${job.application_Deadline}
									</p>
									<p class="card-location job-info">
										<i class="fas fa-money-bill-wave job-icon"></i> Salary | <i
											class="fas fa-map-marker-alt job-icon"></i> ${job.location} |
										<i class="fas fa-cogs job-icon"></i> ${job.job_Type} |  <i class="fas fa-tools job-icon"></i> Required Skills: ${job.required_Skills}
									</p>
									<!-- View Details Button -->

									
									<div class="d-flex justify-content-end">
									<!--
										<button class="btn btn-primary btn-view-details mt-2"
											data-bs-toggle="modal" data-bs-target="#jobDetailsModal"
											data-job-title="${job.job_Title}"
											data-company-name="${job.company_Name}"
											data-job-posted="${job.job_Posted}"
											data-application-deadline="${job.application_Deadline}"
											data-location="${job.location}"
											data-job-type="${job.job_Type}"
											data-job-description="${job.job_Description}"
											data-required-skills="${job.required_Skills}"
											data-experience-level="${job.experience_Level}"
											data-number-of-openings="${job.number_Of_Openings}">
											View Details</button> -->
										<form action="applyCartJob" method="post">
											<input type="hidden" name="job_id" value="${job.job_Id}">
											<input type="hidden" name="seeker_id"
												value="${seeker.JOB_SEEKER_ID}">
											<!-- Replace with actual seeker ID -->
											<button type="submit" class="btn btn-success mt-2 ms-3">Apply</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

 <!-- Success Modal -->
    <div id="successModal" class="modal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Application Submitted Successfully!</h5>
                    <span class="close" id="closeSuccessModal">&times;</span>
                </div>
                <div class="modal-body">
                    Your application has been successfully submitted.
                </div>
                
            </div>
        </div>
    </div>

    <!-- Error Modal -->
    <div id="errorModal" class="modal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content error">
                <div class="modal-header">
                    <h5 class="modal-title">Application Alredy Submitted !</h5>
                    <span class="close" id="closeErrorModal">&times;</span>
                </div>
                <div class="modal-body text-center">
                    <i class="fas fa-exclamation-circle error-icon"></i>
                    <p>Already applied for this job.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" id="closeErrorButton" class="btn btn-danger">OK</button>
                </div>
            </div>
        </div>
    </div>

	<!-- Modal for Job Details -->
	<!-- Modal for Job Details -->
	<div class="modal fade" id="jobDetailsModal" tabindex="-1"
		aria-labelledby="jobDetailsModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header" style="background-color: rgb(36, 43, 94);">
					<h5 class="modal-title" id="jobDetailsModalLabel"
						style="color: white;">Job Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<h5 class="card-title" id="modalJobTitle"></h5>
					<p class="card-text job-info">
						<i class="fas fa-briefcase job-icon"></i> <span
							id="modalCompanyName"></span>
					</p>
					<p class="card-text job-info">
						<i class="far fa-calendar-alt job-icon"></i> Posted Date: <span
							id="modalJobPosted"></span> | Open Until: <span
							id="modalApplicationDeadline"></span>
					</p>
					<p class="card-text job-info">
						<i class="fas fa-money-bill-wave job-icon"></i> Salary | <i
							class="fas fa-map-marker-alt job-icon"></i> <span
							id="modalLocation"></span> | <i class="fas fa-cogs job-icon"></i>
						<span id="modalJobType"></span>
					</p>
					<p class="card-text job-info">
						<i class="fas fa-align-left job-icon"></i> Description: <span
							id="modalJobDescription"></span>
					</p>
					<p class="card-text job-info">
						<i class="fas fa-tools job-icon"></i> Required Skills: <span
							id="modalRequiredSkills"></span>
					</p>
					<p class="card-text job-info">
						<i class="fas fa-level-up-alt job-icon"></i> Experience Level: <span
							id="modalExperienceLevel"></span>
					</p>
					<p class="card-text job-info">
						<i class="fas fa-users job-icon"></i> Openings: <span
							id="modalNumberOfOpenings"></span>
					</p>

					<p class="card-text job-info">
						<i class="fas fa-graduation-cap job-icon"></i> Education
						Qualification: <span id="modalEducationQualification"></span>
					</p>
					<p class="card-text job-info">
						<i class="fas fa-book job-icon"></i> Education Course: <span
							id="modalEducationCourse"></span>
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Error Modal -->
	<div id="customModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <span class="close" id="closeModal">&times;</span>
            <h2>Already Applied for This Job</h2>
        </div>
        <div class="modal-body text-center">
            <i class="fas fa-exclamation-circle error-icon"></i>
            <p>You've already applied for this job.</p>
        </div>
        <div class="modal-footer">
            <button id="okButton" class="btn">OK</button>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script>
	
	document.addEventListener('DOMContentLoaded', () => {
	    var message = '<%= session.getAttribute("message") %>';
	    var messageType = '<%= session.getAttribute("messageType") %>';

	    if (message && messageType) {
	        if (messageType === "success") {
	            document.getElementById('successModal').style.display = "block";
	        } else if (messageType === "error") {
	            document.getElementById('errorModal').style.display = "block";
	        }

	        // Clear session attributes after showing the modal
	        <% session.removeAttribute("message"); %>
	        <% session.removeAttribute("messageType"); %>

	        // Manual close actions
	        document.querySelector('.btn').addEventListener('click', () => {
	            document.getElementById('successModal').style.display = "none";
	        });

	        document.querySelector('.btn-danger').addEventListener('click', () => {
	            document.getElementById('errorModal').style.display = "none";
	        });
	    }

	    // Close modals when clicking on the close button
	    document.getElementById('closeSuccessModal').onclick = () => {
	        document.getElementById('successModal').style.display = "none";
	    };

	    document.getElementById('closeErrorModal').onclick = () => {
	        document.getElementById('errorModal').style.display = "none";
	    };

	    // Close modals when clicking outside
	    window.onclick = (event) => {
	        if (event.target == document.getElementById('successModal')) {
	            document.getElementById('successModal').style.display = "none";
	        }
	        if (event.target == document.getElementById('errorModal')) {
	            document.getElementById('errorModal').style.display = "none";
	        }
	    };
	});

</script>
	<script>
document.addEventListener('DOMContentLoaded', function () {
    const jobDetailsModal = document.getElementById('jobDetailsModal');
    jobDetailsModal.addEventListener('show.bs.modal', function (event) {
        const button = event.relatedTarget;

        const jobTitle = button.getAttribute('data-job-title');
        const companyName = button.getAttribute('data-company-name');
        const jobPosted = button.getAttribute('data-job-posted');
        const applicationDeadline = button.getAttribute('data-application-deadline');
        const location = button.getAttribute('data-location');
        const jobType = button.getAttribute('data-job-type');
        const jobDescription = button.getAttribute('data-job-description');
        const requiredSkills = button.getAttribute('data-required-skills');
        const experienceLevel = button.getAttribute('data-experience-level');
        const numberOfOpenings = button.getAttribute('data-number-of-openings');

        console.log('Job Title:', jobTitle);
        console.log('Company Name:', companyName);

        const modalJobTitle = jobDetailsModal.querySelector('#modalJobTitle');
        const modalCompanyName = jobDetailsModal.querySelector('#modalCompanyName');
        const modalJobPosted = jobDetailsModal.querySelector('#modalJobPosted');
        const modalApplicationDeadline = jobDetailsModal.querySelector('#modalApplicationDeadline');
        const modalLocation = jobDetailsModal.querySelector('#modalLocation');
        const modalJobType = jobDetailsModal.querySelector('#modalJobType');
        const modalJobDescription = jobDetailsModal.querySelector('#modalJobDescription');
        const modalRequiredSkills = jobDetailsModal.querySelector('#modalRequiredSkills');
        const modalExperienceLevel = jobDetailsModal.querySelector('#modalExperienceLevel');
        const modalNumberOfOpenings = jobDetailsModal.querySelector('#modalNumberOfOpenings');

        modalJobTitle.textContent = jobTitle;
        modalCompanyName.textContent = companyName;
        modalJobPosted.textContent = jobPosted;
        modalApplicationDeadline.textContent = applicationDeadline;
        modalLocation.textContent = location;
        modalJobType.textContent = jobType;
        modalJobDescription.textContent = jobDescription;
        modalRequiredSkills.textContent = requiredSkills;
        modalExperienceLevel.textContent = experienceLevel;
        modalNumberOfOpenings.textContent = numberOfOpenings;
    });
});


</script>


	<div id="logoutModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="logoutModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" style="background-color: rgb(36, 43, 94)">
					<h5 class="modal-title" id="logoutModalLabel" style="color: white">Logout</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>Are you sure you want to logout?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancel</button>
					<button type="button" id="confirmLogout" class="btn btn-primary"
						style="color: white">Logout</button>
				</div>
			</div>
		</div>
	</div>
	<script>
    $(document).ready(function () {
        $('#logout-link').click(function () {
            $('#logoutModal').modal('show');
        });

        // Other script logic here...
    });
</script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

	<script src="${pageContext.request.contextPath}\assets\js\admin.js"></script>

</body>

</html>
