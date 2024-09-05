<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Job Portal</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<!-- ?<link href="C:\Users\Aaaron\Desktop\jobportal\css\style.css" rel="stylesheet"> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}\assets\css\begin.css">
<script>
	function validateEmail() {
		const email = document.getElementById('newsletter-email').value;
		const successMessage = document.getElementById('success-message');
		const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		if (emailPattern.test(email)) {
			successMessage.style.display = 'block';
		} else {
			successMessage.style.display = 'none';
			alert('Please enter a valid email address.');
		}
	}
</script>
<style>
.hi {
            /* background-color: #1a32bb; */
            border-bottom:solid #1a32bb;
            
            height: auto;
        }
</style>
<!-- Custom CSS for dropdown menu -->

</head>
<body>
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
				<li class="nav-item"><a class="nav-link hi" href="homeJsp">Home <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="jobController">Jobs</a>
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
	<div id="carouselExampleControls" class="carousel slide"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="<%=request.getContextPath()%>/assets/images/side2.jpg"
					class="d-block w-100" alt="First slide">
			</div>
			<div class="carousel-item">
				<img src="<%=request.getContextPath()%>/assets/images/side3.jpg"
					class="d-block w-100" alt="Second slide">
			</div>
			<div class="carousel-item">
				<img src="<%=request.getContextPath()%>/assets/images/side4.jpg"
					class="d-block w-100" alt="Third slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleControls"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleControls"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>

	<div class="input-group">
		<input type="search" class="form-control rounded"
			placeholder="Search Job" aria-label="Search"
			aria-describedby="search-addon" />
		<button type="button" class="btn btn-outline-primary ml-2"
			data-mdb-ripple-init style="border-radius: 10px;">Search</button>
	</div>

	<div class="iconsectors">
		<div class="icons">
			<img
				src="${pageContext.request.contextPath}/assets/images/icons/businessman.png"
				alt="">
			<h4 class="value">8713</h4>
			<h5>Company</h5>
		</div>
		<div class="icons">
			<img
				src="${pageContext.request.contextPath}/assets/images/icons/sector.png"
				alt="">
			<h4 class="value">7843</h4>
			<h5>Sector</h5>
		</div>
		<div class="icons">
			<img
				src="${pageContext.request.contextPath}/assets/images/icons/folder.png"
				alt="">
			<h4 class="value">2233</h4>
			<h5>Vacancies</h5>
		</div>
		<div class="icons">
			<img
				src="${pageContext.request.contextPath}/assets/images/icons/group.png"
				alt="">
			<h4 class="value">5213</h4>
			<h5>Job Seekers</h5>
		</div>
		<div class="icons">
			<img
				src="${pageContext.request.contextPath}/assets/images/icons/placed.png"
				alt="">
			<h4 class="value">3216</h4>
			<h5>Placement Offer</h5>
		</div>
		<div class="icons">
			<img
				src="${pageContext.request.contextPath}/assets/images/icons/offers.png"
				alt="">
			<h4 class="value">6213</h4>
			<h5>Job Seekers Placed</h5>
		</div>
	</div>
	<div class="">
		<div class="text">
			<!-- <h4 class="job">FEATURED TOURS PACKAGES</h4> -->
			<h1>
				<span class="latest">Top Sectors</span>
			</h1>
		</div>
		<div class="slide">
			<div class="slideicon">
				<img
					src="${pageContext.request.contextPath}/assets/images/icons/work-from-home_8332554.png"
					alt="">
				<!-- <h5 class="value">Design & Creative</h5> -->
				<h5>Information Technology</h5>
			</div>
			<div class="slideicon">
				<img
					src="${pageContext.request.contextPath}/assets/images/icons/property_9202660.png"
					alt="">
				<!-- <h5 class="value">Design & Creative</h5> -->
				<h5>Real Estate</h5>
			</div>
			<div class="slideicon">
				<img
					src="${pageContext.request.contextPath}/assets/images/icons/promotion_13079204.png"
					alt="">
				<!-- <h5 class="value">Design & Creative</h5> -->
				<h5>Sales & Marketing</h5>
			</div>
			<div class="slideicon">
				<img
					src="${pageContext.request.contextPath}/assets/images/icons/employee_538672.png"
					alt="">
				<!-- <h5 class="value">Design & Creative</h5> -->
				<h5>Stack Market</h5>
			</div>
			<div class="slideicon">
				<img
					src="${pageContext.request.contextPath}/assets/images/icons/writer_3079941.png"
					alt="">
				<!-- <h5 class="value">Design & Creative</h5> -->
				<h5>Strategic Manufacturing</h5>
			</div>
			<div class="slideicon">
				<img
					src="${pageContext.request.contextPath}/assets/images/icons/pop-up_11544557.png"
					alt="">
				<!-- <h5 class="value">Design & Creative</h5> -->
				<h5>Insurance</h5>
			</div>
			<div class="slideicon">
				<img
					src="${pageContext.request.contextPath}/assets/images/icons/helmet_2823675.png"
					alt="">
				<!-- <h5 class="value">Design & Creative</h5> -->
				<h5>Construction</h5>
			</div>
			<div class="slideicon">
				<img
					src="${pageContext.request.contextPath}/assets/images/icons/employee_538672.png"
					alt="">
				<!-- <h5 class="value">Design & Creative</h5> -->
				<h5>Energey Industry</h5>
			</div>
		</div>
	</div>

	<div class="a"
		style="background-color: blueviolet; width: 100%; height: 20%;">

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
					<p>Address:salem,Tamil nadu</p>
					<p>Phone: +91 9788336639</p>
					<p>Email: jobfinder@job.ac.com</p>
				</div>
				<div class="col-md-3">
					<h5>LINKS</h5>
					<p>
						<a href="#">Terms & Conditions</a>
					</p>
					<p>
						<a href="#">Download Job Finer App</a>
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
					<h5>Legal</h5>
					<p>Privacy Policy</p>
					<p>User Terms & Conditions</p>
					<p>Employer Terms of Service</p>
					<p>Employer FAQs</p>
					<p>Community Guidelines</p>
					<div class="newsletter">
						<div class="input-group">
							<input type="email" id="newsletter-email" class="form-control"
								placeholder="Your Email Address" required>
							<div class="input-group-append">
								<button class="btn btn-primary w-2" type="button"
									onclick="validateEmail()">Subscribe</button>
							</div>
						</div>
						<div id="success-message" style="color: #1a32bb; display: none;">Subscription
							successful!</div>
					</div>

				</div>

			</div>
		</div>
		<div class="ico">
			<img
				src="${pageContext.request.contextPath}/assets/images/icons/logo2_footer.png"
				alt="">
		</div>

	</footer>
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="loginModalLabel">Login</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="loginForm">
						<div class="form-group">
							<label for="username">Username</label> <input type="text"
								class="form-control" id="username" placeholder="Enter username">
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								class="form-control" id="password" placeholder="Password">
						</div>
						<a href="file:///C:/Users/Aaaron/Desktop/form.html">singn up</a>
					</form>
				</div>
				<!-- Copyright notice -->
				<div class="text-center py-4" style="background-color: #f0f0f0;">
					<p>&copy; 2024 Your Company Name. All rights reserved.</p>
				</div>
				<script>
					// Login form submission
					document.getElementById("loginButton").addEventListener(
							"click",
							function() {
								var username = document
										.getElementById("username").value;
								var password = document
										.getElementById("password").value;
								// Perform your login logic here
								console.log("Username: " + username);
								console.log("Password: " + password);
								// For demonstration, let's just close the modal
								$('#loginModal').modal('hide');
							});
				</script>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="loginButton">Login</button>
				</div>
			</div>
		</div>
	</div>
	<div class="text-center py-4" style="background-color: #f0f0f0;">
		<p>&copy; 2024 Job finder. All rights reserved.</p>
	</div>
	<!-- <h5>FEATURED TOURS PACKAGES</h5>
<h1>Browse Top Categories</h1> -->
	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
