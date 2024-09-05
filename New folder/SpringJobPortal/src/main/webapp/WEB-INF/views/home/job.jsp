<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Job Portal</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/css/style.css">
<style>
/* Custom styles */
.navbar {
	font-size: 1rem;
	padding: 1rem;
	padding-left: 30px;
	position: sticky;
	top: 0;
	z-index: 1;
	background-color: rgb(247, 246, 251) !important;
}

.navbar-brand img {
	height: 50px; /* Adjust the height as needed */
}

.navbar-nav .nav-link {
	transition: color 0.5s ease-in-out;
	padding-left: 10px;
	color: rgb(36, 43, 94);
}

.navbar-nav .nav-item .nav-link {
	margin-right: 60px; /* Adjust the margin as needed */
}

.navbar-nav .nav-link:hover {
	color: rgb(250, 35, 106); /* Hover color for nav links */
}

/* Footer */
.footer {
	background-color: rgb(27, 34, 84);
	padding: 20px 0;
	color: #fff;
}

.footer h5 {
	color: #fff;
}

.footer p, .footer a {
	color: #d7dde1;
	margin-bottom: 10px;
}

.footer a:hover {
	color: rgb(250, 35, 106);
}

.footer .newsletter input[type="email"] {
	width: calc(100% - 100px);
	margin-right: -5px;
}

.footer .newsletter button {
	width: 100px;
	border: none;
}

.footer .newsletter button:hover {
	background-color: rgb(250, 35, 106);
}

.footer .ico img {
	position: relative;
	display: block;
	margin: 20px auto 0;
	top: 40px;
	right: 915px;
}

/* Job cards and filters */
.job-card {
	margin-bottom: 20px;
}

.filter-section {
	margin-top: 20px;
	background-color: #f8f9fa;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, .1);
}

.filter-title {
	font-size: 1.2rem;
	font-weight: bold;
	margin-bottom: 10px;
}

.filter-option {
	margin-bottom: 10px;
}

.card {
	max-width: 900px; /* Increase card width */
	margin: 0 auto; /* Center the card */
}

.card-img-top {
	width: 100px; /* Decrease image size */
	height: auto;
	display: block;
	padding: 2px;
	/* margin: 0 auto 10px auto; Center the image and add bottom margin */
}

.card-body {
	height: auto; /* Decrease card body height */
}

.hi {
	/* background-color: #1a32bb; */
	border-bottom: solid #1a32bb;
	height: auto;
}
</style>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#"><img
			src="${pageContext.request.contextPath}/assets/images/head.2.png"
			alt="Jobportal"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-center"
			id="navbarNav">
			<ul class="h6 navbar-nav">
				<li class="nav-item"><a class="nav-link " href="homeJsp">Home <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link hi" href="jobController">Jobs</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="aboutController">About</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="ContectController">Contact</a></li>
				<li class="nav-item dropdown"><a class="nav-link " href="#"
					id="loginDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Login/Register </a>
					 <div class="dropdown-menu" aria-labelledby="loginDropdown">
            <a class="dropdown-item" href="employersLogin">Employer</a>
            <a class="dropdown-item" href="login">Job Seekers</a>
            <a class="dropdown-item" href="adminlogincontroller">Admin</a>
          </div></li>
			</ul>
		</div>
	</nav>

	<div class="container mt-3">
		<form action="" method="get">
			<div class="row g-1 align-items-center">
				<div class="col-lg-3 col-md-4 col-sm-6 col-12 h4">
					<select class="form-select" id="sortDropdown" name="sortby">
						<option value="salary_low_high">Sort By</option>
						<option value="salary_low_high">Salary Low - High</option>
						<option value="salary_high_low">Salary High - Low</option>
						<option value="oldest_newest">Oldest - Newest</option>
						<option value="newest_oldest">Newest - Oldest</option>
					</select>
				</div>
				<div class="col-lg-5 col-md-4 col-sm-6 col-12 mb-2">
					<!-- Decreased column size -->
					<input type="search" class="form-control" id="searchInput"
						name="search" placeholder="Search">
				</div>
				<div class="col-lg-2 col-md-2 col-sm-12 col-12 mb-2">
					<!-- Adjusted column size -->
					<button type="submit" class="btn btn-primary w-100">
						<i class="fas fa-search fa-sm"></i>Submit
					</button>
				</div>
			</div>
		</form>
	</div>

	<!-- Filter Section -->
	<div class="container mt-4">
		<div class="row">
			<div class="col-md-3 mb-0">
				<div class="filter-section">
					<h4 class="filter-title">Filters</h4>
					<div class="filter-option">
						<label for="locationFilter">Jobs By Location</label> <select
							class="form-control" id="locationFilter">
							<option value="">Select Location</option>
							<option value="cuddalore">Cuddalore</option>
							<option value="chennai">Chennai</option>
							<option value="bangalore">Bangalore</option>
							<option value="hyderabad">Hyderabad</option>
						</select>
					</div>
					<div class="filter-option">
						<label for="typeFilter">Jobs By Type</label> <select
							class="form-control" id="typeFilter">
							<option value="">Select Type</option>
							<option value="full-time">Full Time</option>
							<option value="part-time">Part Time</option>
							<option value="contract">Contract</option>
						</select>
					</div>
					<div class="filter-option">
						<label for="sectorFilter">Jobs By Sector</label> <select
							class="form-control" id="sectorFilter">
							<option value="">Select Sector</option>
							<option value="banking">Banking</option>
							<option value="it">IT</option>
							<option value="finance">Finance</option>
							<option value="healthcare">Healthcare</option>
						</select>
					</div>
					<div class="filter-option">
						<label for="genderFilter">Jobs By Gender</label> <select
							class="form-control" id="genderFilter">
							<option value="">Select Gender</option>
							<option value="male">Male</option>
							<option value="female">Female</option>
							<option value="other">Other</option>
						</select>
					</div>
					<div class="filter-option">
						<label for="experienceFilter">Jobs By Experience</label> <select
							class="form-control" id="experienceFilter">
							<option value="">Select Experience</option>
							<option value="0-2">0-2 years</option>
							<option value="2-5">2-5 years</option>
							<option value="5+">5+ years</option>
						</select>
					</div>
					<div class="filter-option">
						<label for="salaryFilter">Salary Range</label> <select
							class="form-control" id="salaryFilter">
							<option value="">Select Salary Range</option>
							<option value="0-10000">Below 10,000</option>
							<option value="10000-30000">10,000 - 30,000</option>
							<option value="30000-50000">30,000 - 50,000</option>
							<option value="50000+">Above 50,000</option>
						</select>
					</div>
					<div class="filter-option">
						<label for="companyFilter">Top Companies</label> <select
							class="form-control" id="companyFilter">
							<option value="">Select Company</option>
							<option value="jayapriya">Jayapriya Group</option>
							<option value="xyz">XYZ Corporation</option>
							<option value="abc">ABC Ltd.</option>
							<option value="pqr">PQR Enterprises</option>
						</select>
					</div>
					<div class="filter-option">
						<label for="qualificationFilter">Qualification</label> <select
							class="form-control" id="qualificationFilter">
							<option value="">Select Qualification</option>
							<option value="graduate">Graduate</option>
							<option value="post-graduate">Post Graduate</option>
							<option value="doctorate">Doctorate</option>
						</select>
					</div>

					<button class="btn btn-primary">Apply Filters</button>
				</div>
			</div>
			<div class="col-md-9 mt-3">
				<!-- Job Cards Section (Assuming this part will display job cards) -->
				<div class="row">
					<!-- Example job card (you can repeat this structure dynamically with your backend) -->
					<div class="col-12 mb-4">
						<div class="card">
							<img src="https://via.placeholder.com/150" class="card-img-top"
								alt="Company Logo">
							<div class="card-body">
								<h5 class="card-title">
									<a href="#" class="text-decoration-none"> <i
										class="fas fa-phone-alt"></i> Telecaller | Jayapriya Group of
										Companies
									</a>
								</h5>
								<p class="card-text">
									<i class="far fa-calendar-alt"></i> Posted Date: 06-06-2024 |
									Open Until: 14-06-2024
								</p>
								<p class="card-text">
									<i class="fas fa-money-bill-wave"></i> 10,000 - 15,000
								</p>
								<p class="card-text">
									<i class="fas fa-map-marker-alt"></i> Cuddalore
								</p>
								<p class="card-text">
									<i class="fas fa-briefcase"></i> Banking, Financial Services
									and Insurance
								</p>
								<p class="card-text">Customer Care Executive</p>
							</div>
						</div>
					</div>


					<div class="col-12 mb-4">
						<div class="card">
							<img src="https://via.placeholder.com/150" class="card-img-top "
								alt="Company Logo">
							<div class="card-body">
								<h5 class="card-title">
									<a href="#" class="text-decoration-none"> <i
										class="fas fa-phone-alt"></i> Telecaller | Jayapriya Group of
										Companies
									</a>
								</h5>
								<p class="card-text">
									<i class="far fa-calendar-alt"></i> Posted Date: 06-06-2024 |
									Open Until: 14-06-2024
								</p>
								<p class="card-text">
									<i class="fas fa-money-bill-wave"></i> 10,000 - 15,000
								</p>
								<p class="card-text">
									<i class="fas fa-map-marker-alt"></i> Cuddalore
								</p>
								<p class="card-text">
									<i class="fas fa-briefcase"></i> Banking, Financial Services
									and Insurance
								</p>
								<p class="card-text">Customer Care Executive</p>
							</div>
						</div>
					</div>
					<!-- Card 2 -->
					<div class="col-12 mb-4">
						<div class="card">
							<img src="https://via.placeholder.com/150" class="card-img-top"
								alt="Company Logo">
							<div class="card-body">
								<h5 class="card-title">
									<a href="#" class="text-decoration-none"> <i
										class="fas fa-phone-alt"></i> Telecaller | Jayapriya Group of
										Companies
									</a>
								</h5>
								<p class="card-text">
									<i class="far fa-calendar-alt"></i> Posted Date: 06-06-2024 |
									Open Until: 14-06-2024
								</p>
								<p class="card-text">
									<i class="fas fa-money-bill-wave"></i> 10,000 - 15,000
								</p>
								<p class="card-text">
									<i class="fas fa-map-marker-alt"></i> Cuddalore
								</p>
								<p class="card-text">
									<i class="fas fa-briefcase"></i> Banking, Financial Services
									and Insurance
								</p>
								<p class="card-text">Customer Care Executive</p>
							</div>
						</div>
					</div>
					<!-- Card 3 -->
					<div class="col-12 mb-4">
						<div class="card">
							<img src="https://via.placeholder.com/150" class="card-img-top"
								alt="Company Logo">
							<div class="card-body">
								<h5 class="card-title">
									<a href="#" class="text-decoration-none"> <i
										class="fas fa-phone-alt"></i> Telecaller | Jayapriya Group of
										Companies
									</a>
								</h5>
								<p class="card-text">
									<i class="far fa-calendar-alt"></i> Posted Date: 06-06-2024 |
									Open Until: 14-06-2024
								</p>
								<p class="card-text">
									<i class="fas fa-money-bill-wave"></i> 10,000 - 15,000
								</p>
								<p class="card-text">
									<i class="fas fa-map-marker-alt"></i> Cuddalore
								</p>
								<p class="card-text">
									<i class="fas fa-briefcase"></i> Banking, Financial Services
									and Insurance
								</p>
								<p class="card-text">Customer Care Executive</p>
							</div>
						</div>
					</div>
				</div>


				<!-- Repeat this job card structure dynamically based on backend data -->
			</div>
		</div>
	</div>
	</div>
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<h5>ABOUT US</h5>
					<p>job portal involves various aspects to engage both job
						seekers and employers effectively. Here's a breakdown of the types
						of content you might include.</p>
				</div>
				<div class="col-md-3">
					<h5>CONTACT INFO</h5>
					<p>Address: Salem, Tamil Nadu</p>
					<p>Phone: +91 9788336639</p>
					<p>Email: jobfinder@job.ac.com</p>
				</div>
				<div class="col-md-3">
					<h5>LINKS</h5>
					<p>
						<a href="#">Terms & Conditions</a>
					</p>
					<p>
						<a href="#">Download Job Finder App</a>
					</p>
					<p>
						<a href="#">Vulnerability Disclosure Policy</a>
					</p>
					<p>
						<a href="#">International Jobs</a>
					</p>
					<p>
						<a href="#">Support</a>
					</p>
					<p>
						<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
							fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
                            <path
								d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951" />
                          </svg>
						&nbsp;
						<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
							fill="currentColor" class="bi bi-instagram" viewBox="0 0 16 16">
                            <path
								d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.9 3.9 0 0 0-1.417.923A3.9 3.9 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.9 3.9 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.9 3.9 0 0 0-.923-1.417A3.9 3.9 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599s.453.546.598.92c.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.5 2.5 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.5 2.5 0 0 1-.92-.598 2.5 2.5 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233s.008-2.388.046-3.231c.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92s.546-.453.92-.598c.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92m-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217m0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334" />
                          </svg>
						&nbsp
						<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
							fill="currentColor" class="bi bi-youtube" viewBox="0 0 16 16">
                            <path
								d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.01 2.01 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.01 2.01 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31 31 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.01 2.01 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A100 100 0 0 1 7.858 2zM6.4 5.209v4.818l4.157-2.408z" />
                          </svg>
						&nbsp
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
							fill="currentColor" class="bi bi-twitter-x" viewBox="0 0 16 16">
                            <path
								d="M12.6.75h2.454l-5.36 6.142L16 15.25h-4.937l-3.867-5.07-4.425 5.07H.316l5.733-6.57L0 .75h5.063l3.495 4.633L12.601.75Zm-.86 13.028h1.36L4.323 2.145H2.865z" />
                          </svg>
					</p>
				</div>
				<div class="col-md-3">
					<h5>NEWSLETTER</h5>
					<form class="newsletter" action="#">
						<div class="form-group">
							<input type="email" class="form-control"
								placeholder="Enter your email">
						</div>
						<button type="submit" class="btn btn-primary">Subscribe</button>
					</form>
					<div class="ico">
						<img src="../../assets/images/icons/logo2_footer.png.png"
							alt="Jobfinder" class="img-fluid">
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Copyright notice -->
	<div class="text-center py-4" style="background-color: #f0f0f0;">
		<p>&copy; 2024 job finder. All rights reserved.</p>
	</div>
	<!-- Bootstrap and Font Awesome JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
