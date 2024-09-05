<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Panel</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
	rel="stylesheet">
<script src="https://code.highcharts.com/highcharts.js"></script>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">


<!-- Custom CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin.css">



</head>

<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//http 1.1
response.setHeader("Pragma", "no-cache");//http1.0
response.setHeader("Expires", "0");// Proxies

if (session.getAttribute("admin") == null)
{

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
			<span class="admin_text">${admin.name}</span>
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
					src="${pageContext.request.contextPath}/assets/images/head.2.png"
					alt="">
				</a>
				<div class="nav_list">
					<a href="cart" class="nav_link active"> <i
						class='bx bx-grid-alt nav_icon'></i> <span class="nav_name">Dashboard</span>
					</a> <a href="AdminRetriveData" class="nav_link"> <i
						class='fas fa-users nav_icon'></i> <span class="nav_name">Job
							Seekers</span>
					</a> <a href="AdminEmployerRetriveData" class="nav_link"> <i
						class='fas fa-user-tie nav_icon'></i> <span class="nav_name">Employers</span>
					</a> <a href="AdminJobRetriveData" class="nav_link"> <i
						class='fas fa-briefcase nav_icon'></i> <span class="nav_name">Jobs</span>
					</a> <a href="AdminProfileView" class="nav_link"> <i
						class='bx bx-user nav_icon'></i> <span class="nav_name">My
							Profile</span>
					</a> <a href="adminPasswordController" class="nav_link"> <i
						class='fas fa-key nav_icon' title="Reset Password"></i> <span
						class="nav_name">Reset Password</span>
					</a> <a href="#" class="nav_link" id="logout-link"> <i
						class='bx bx-log-out nav_icon'></i> <span class="nav_name">Sign
							Out</span>
					</a>
				</div>
			</div>
		</nav>
	</div>

	<div class="container mt-6">
		<div class="row mt-4">
			<div class="col-md-6 col-lg-3 mb-4">
				<div class="card text-white"
					style="background-color: rgba(54, 162, 235, 0.5);">
					<div class="card-body">
						<h6 class="card-title">Job Seekers</h6>
						<div class="text-center">
							<i class="fas fa-user-graduate fa-2x mb-2"></i>
						</div>
						<p class="card-text">${seekerSize}</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3 mb-4">
				<div class="card text-white bg-success">
					<div class="card-body">

						<h6 class="card-title">Employers</h6>
						<div class="text-center">
							<i class="fas fa-building fa-2x mb-2"></i>
						</div>
						<p class="card-text">${employe}</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3 mb-4">
				<div class="card text-white bg-warning">
					<div class="card-body">
						<h6 class="card-title">Jobs</h6>
						<div class="text-center">
							<i class="fas fa-briefcase fa-2x mb-2"></i>
						</div>
						<p class="card-text">${jobSize}</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3 mb-4">
				<div class="card text-white bg-danger">
					<div class="card-body">
						<h6 class="card-title">Applications</h6>
						<div class="text-center">
							<i class="fas fa-file-alt fa-2x "></i>
						</div>
						<p class="card-text">${jobApplicationSize}</p>
					</div>
				</div>
			</div>
		</div>
     </div>


	<div id="logoutModal" class="modal fade center" tabindex="-1"
		aria-labelledby="logoutModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="background-color: rgb(36, 43, 94)">
					<h5 class="modal-title" id="logoutModalLabel" style="color: white">Logout</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Are you sure you want to logout?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cancel</button>
					<button type="button" id="confirmLogout" class="btn btn-primary"
						style="color: white">Logout</button>
				</div>
			</div>
		</div>
	</div>





	<script src="${pageContext.request.contextPath}/assets/js/admin.js"></script>




</body>

</html>
