<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

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
<link
	href="https://cdn.jsdelivr.net/npm/@mdi/font/css/materialdesignicons.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<!--    -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/seekerdash.css">

<!--     <link rel="stylesheet" href="..\..\assets\css\seekerdash.css">  -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

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
					<a href="seekerCart" class="nav_link "> <i
						class='fas fa-tachometer-alt nav_icon' title="Dashboard"></i> <span
						class="nav_name">Dashboard</span>
					</a> <a href="JobSeekerProfileRetriveController"
						class="nav_link active"> <i class='fas fa-id-badge nav_icon'
						title="My Profile"></i> <span class="nav_name">My Profile</span>
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
					</a> <a href="#" class="nav_link" id="logout-link"> <i
						class='fas fa-sign-out-alt nav_icon' title="LogOut"></i> <span
						class="nav_name">LogOut</span>
					</a>
				</div>
			</div>
		</nav>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<!-- Personal Details Section -->
				<div class="profile-details">
					<div class="profile-image">
						<img
							src="${pageContext.request.contextPath}\assets\images\profile.png"
							alt="Profile Image">
					</div>
					<div class="profile-info">
						<h2>Personal Details</h2>
						<div class="mb-3">
							<label for="name" class="form-label">Name:</label> <input
								type="text" id="name" class="form-control"
								value="${seekers.fName}" readonly>
						</div>
						<div class="mb-3">
							<label for="dob" class="form-label">Date of Birth:</label> <input
								type="text" id="dob" class="form-control" value="${seekers.dob}"
								readonly>
						</div>
						<div class="mb-3">
							<label for="district" class="form-label">Email:</label> <input
								type="text" id="district" class="form-control"
								value="${seekers.email}" readonly>
						</div>
						<div class="mb-3">
							<label for="district" class="form-label">Phone:</label> <input
								type="text" id="district" class="form-control"
								value="${seekers.phoneNumber}" readonly>
						</div>
						<div class="mb-3">
							<label for="district" class="form-label">Address:</label> <input
								type="text" id="district" class="form-control"
								value="${seekers.address}" readonly>
						</div>

						<div class="mb-3">
							<label for="gender" class="form-label">Gender:</label> <input
								type="text" id="gender" class="form-control"
								value="${seekers.gender}" readonly>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-8">
				<!-- Education Section -->
				<div class="profile-details">
					<div class="profile-info">
						<h2>Education</h2>

						<div class="mb-3">
							<label for="course1" class="form-label">Course:</label> <input
								type="text" id="course1" class="form-control"
								value="${seekers.course}" readonly>
						</div>
						<div class="mb-3">
							<label for="specialization1" class="form-label">Specialization:</label>
							<input type="text" id="specialization1" class="form-control"
								value="${seekers.specialization}" readonly>
						</div>
						<div class="mb-3">
							<label for="passingYear1" class="form-label">Passing
								Year:</label> <input type="text" id="passingYear1" class="form-control"
								value="${seekers.passingYear}" readonly>
						</div>
						<div class="mb-3">
							<label for="institute1" class="form-label">Institute
								Name:</label> <input type="text" id="institute1" class="form-control"
								value="${seekers.institute}" readonly>
						</div>
						<div class="mb-3">
							<label for="cgpa1" class="form-label">CGPA:</label> <input
								type="text" id="cgpa1" class="form-control"
								value="${seekers.cgpa}" readonly>
						</div>
						<div class="mb-3">
							<label for="courseType1" class="form-label">Course Type:</label>
							<input type="text" id="courseType1" class="form-control"
								value="${seekers.courseType}" readonly>
						</div>
					</div>
				</div>
				<div class="profile-details">
					<div class="profile-info">
						<h2>Experience</h2>
						<div class="mb-3">
							<label for="designation1" class="form-label">Skill:</label> <input
								type="text" id="designation1" class="form-control"
								value="${seekers.skills}" readonly>
						</div>
					</div>
				</div>
				<!-- Experience Section -->
				<div class="profile-details">
					<div class="profile-info">
						<h2>Experience</h2>
						<div class="mb-3">
							<label for="yearsExperience1" class="form-label">Company
								Name:</label> <input type="text" id="yearsExperience1"
								class="form-control" value="${seekers.company_Name}" readonly>
						</div>
						<div class="mb-3">
							<label for="yearsExperience1" class="form-label">Years of
								Experience:</label> <input type="text" id="yearsExperience1"
								class="form-control" value="${seekers.experience}" readonly>
						</div>
						<div class="mb-3">
							<label for="designation1" class="form-label">Resume Url:</label>
							<input type="text" id="designation1" class="form-control"
								value="${seekers.resumes}" readonly>
						</div>
					</div>
				</div>



				<div class="profile-details">
					<div class="profile-info">
						<h2>Short Profile</h2>

						<div class="mb-3">
							<label for="language1" class="form-label"></label>
							<textarea name="textarea" rows="5" cols="30" 
								maxlength="20" id="language1" class="form-control" readonly>${seekers.objective}</textarea>
						</div>

					</div>
				</div>



				<!-- 
                  <div class="profile-details">
              <form action="${pageContext.request.contextPath}/ResumeDownload" method="get">
       
          <input type="hidden" name="email" value="${seeker.email}">
        <button type="submit" class="btn btn-primary ">DownloadResume</button>
        </form>
        </div>
         -->
				</form>
				<!-- Certifications Section -->


				<div id="logoutModal" class="modal fade" tabindex="-1" role="dialog"
					aria-labelledby="logoutModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header"
								style="background-color: rgb(36, 43, 94)">
								<h5 class="modal-title" id="logoutModalLabel"
									style="color: white">Logout</h5>
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
				<!-- Bootstrap JS and Custom JS -->
				<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
				<script
					src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
				<script
					src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
				<script src="${pageContext.request.contextPath}/assets/js/admin.js"></script>
</body>

</html>
