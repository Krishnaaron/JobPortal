<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Profile</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<!-- Boxicons CSS for icons -->
<link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
	rel="stylesheet">
<!-- Font Awesome for icons -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/seeker.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


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

/* Custom styles for search bar */
.search-bar {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-evenly;
	align-items: center;
	padding: 20px;
	background-color: #fff;
	/* border: 1px solid #ccc; */
	border-radius: 10px;
	margin-bottom: 20px;
}

.search-bar .form-group {
	margin: 10px;
}

.search-bar .form-control {
	height: 45px;
	font-size: 18px;
}

.search-bar .btn {
	height: 45px;
	font-size: 18px;
	padding: 0 20px;
}

.job-container {
	padding-top: 20px;
}

.nav_link {
	text-decoration: none !important;
}

@media ( max-width : 768px) {
	.search-bar {
		flex-direction: column;
	}
	.job-card .card-body {
		flex-direction: column;
		text-align: center;
	}
	.job-card .card-body img {
		margin-bottom: 10px;
	}
	.job-card .card-body button {
		width: 100%;
		margin-top: 10px;
	}
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
				<i class='bx bx-envelope' id="message-icon" title="Messages"></i>

			</div>
		</div>
	</header>
	<div class="l-navbar" id="nav-bar">
		<nav class="nav">
			<div>
				<a href="#" class="nav_logo"> <img
					src="${pageContext.request.contextPath}/assets/images/head.2.png"
					alt="">
				</a>
				<div class="nav_list">
					<a href="seekerCart" class="nav_link "> <i
						class='fas fa-tachometer-alt nav_icon' title="Dashboard"></i> <span
						class="nav_name">Dashboard</span>
					</a> <a href="JobSeekerProfileRetriveController" class="nav_link">
						<i class='fas fa-id-badge nav_icon' title="My Profile"></i> <span
						class="nav_name">My Profile</span>
					</a> <a href="JobSeekerProfileEditController" class="nav_link"> <i
						class='fas fa-user-edit nav_icon' title="Edit Profile"></i> <span
						class="nav_name">Edit Profile</span>
					</a> <a href="jobSearchController" class="nav_link active"> <i
						class='fas fa-search nav_icon' title="Job Search"></i> <span
						class="nav_name">Job Search</span>
					</a> <a href="appliedJobController" class="nav_link"> <i
						class='fas fa-briefcase nav_icon' title="Applied Jobs"></i> <span
						class="nav_name">Applied Jobs</span>
					</a> <a href="SeekerPasswordController" class="nav_link"> <i
						class='fas fa-key nav_icon' title="Reset Password"></i> <span
						class="nav_name">Reset Password</span>
					</a> <a href="#" class="nav_link" id="logout-link"> <i
						class='bx bx-log-out nav_icon'></i> <span class="nav_name">LogOut</span>
					</a>
				</div>
			</div>
		</nav>
	</div>

	<div id="title">
		<div class="container">
			<form class="search-bar form-inline justify-content" id="searchForm">
				<div class="form-group">
					<input type="text" class="form-control input-lg" id="jobTitle"
						placeholder="Job Title">
				</div>
				<div class="form-group">
					<input type="text" class="form-control input-lg" id="location"
						placeholder="Location">
				</div>
				<div class="form-group">
					<input type="text" class="form-control input-lg" id="company"
						placeholder="Company">
				</div>
				<button type="submit" class="btn btn-primary btn-lg ">Search</button>
			</form>
		</div>
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
										<i class="fas fa-money-bill-wave job-icon"></i> Salary : ${job.salary}  | <i
											class="fas fa-map-marker-alt job-icon"></i>Job Location : ${job.location} |
										<i class="fas fa-cogs job-icon"></i>JobType : ${job.job_Type}
									</p>
									<p class="card-education job-info">  
										<i class="fas fa-graduation-cap job-icon"></i> Education : ${job.education_Qualification} | <i
											class="fas fa-book-open job-icon"> Course : ${job.education_Cource}</i> 
									</p>

									


									<div class="d-flex justify-content-end">
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
											View Details</button>
										<form action="applyJob" method="post">
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


	<!-- Bootstrap Modal -->
	<!-- Success Modal -->
	<div class="modal fade" id="successModal" tabindex="-1"
		aria-labelledby="successModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="successModalLabel">Application
						Submitted Successfully!</h5>

				</div>
				<div class="modal-body">Your application has been successfully
					submitted.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
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

					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Error Modal -->
	<div class="modal fade" id="errorModal" tabindex="-1"
		aria-labelledby="errorModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content error">
				<div class="modal-header">
					<h5 class="modal-title" id="errorModalLabel">Already Apply
						This Job</h5>

				</div>
				<div class="modal-body text-center">
					<i class="fas fa-exclamation-circle error-icon"></i>
					<p>Already Apply This Job.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>

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
        
        // Manual close and OK button actions
        $('.btn-primary').click(function() {
            $('#successModal').modal('hide');
        });
        
        $('.btn-danger').click(function() {
            $('#errorModal').modal('hide');
        });
        
      
    }
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
	<!-- Bootstrap JS and jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz4fnFO9gybBogGzjI4IHcE5O5p+4ujCq4OzH2VpZNR9PZ73fJf9BCLvHY"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9B8J2eFFSUUUHRc/kbY5aaO7C4mQeGz64lVFN5hFHz8B35u94B7B4QK"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
		integrity="sha384-<updated-integrity-hash>" crossorigin="anonymous"></script>

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

	<script>
$(document).ready(function() {
    $('#searchForm').submit(function(e) {
        e.preventDefault();
        performFilter();
    });

    function performFilter() {
        const jobTitle = $('#jobTitle').val().toLowerCase();
        const location = $('#location').val().toLowerCase();
        const company = $('#company').val().toLowerCase();

        // Select all job cards
        const jobCards = $('.job-card');

        // Loop through each job card to check filters
        jobCards.each(function() {
            const card = $(this);
            const cardTitle = card.find('.card-title').text().toLowerCase();
            const cardCompany = card.find('.card-text').first().text().toLowerCase();
            const cardLocation = card.find('.card-location').text().toLowerCase();

            // Determine if the card should be shown based on filter criteria
            const titleMatch = (jobTitle === '' || cardTitle.includes(jobTitle));
            const companyMatch = (company === '' || cardCompany.includes(company));
            const locationMatch = (location === '' || cardLocation.includes(location));

            // Show or hide based on filter criteria
            if (titleMatch && companyMatch && locationMatch) {
                card.show();
            } else {
                card.hide();
            }
        });

        // Show message if no jobs match the filters
        const noJobsMessage = $('#noJobsMessage');
        if (jobCards.filter(':visible').length === 0) {
            noJobsMessage.show();
        } else {
            noJobsMessage.hide();
        }
    }
});
</script>


	<!-- Include jQuery and Bootstrap JS (already included in your code) -->



	<script src="${pageContext.request.contextPath}/assets/js/jobseeker.js"></script>
</body>