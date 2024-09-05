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
body {
	background-color: #f8f9fa;
}

.login-container {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 85vh;
	padding: 20px;
}

.login-box {
	width: 100%;
	max-width: 800px;
	margin-top: 50px;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #fff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.login-box h4 {
	text-align: center;
	font-family: sans-serif !important;
	border-bottom: 1px solid #ddd;
	padding-bottom: 10px;
}

.form-group {
	position: relative;
	margin-bottom: 20px;
}

.form-group label {
	font-weight: bold;
}

.form-control {
	padding-left: 2.5rem;
}

.form-control.is-invalid {
	border-color: red;
}

.form-control.is-valid {
	border-color: green;
}

.invalid-feedback, .valid-feedback {
	display: none;
}

.form-control.is-invalid ~ .invalid-feedback {
	display: block;
}

.form-control.is-valid ~ .valid-feedback {
	display: block;
}

.sub .forget {
	float: right;
}

.hi {
	border: 1px solid black;
	height: auto;
}

.signup {
	text-align: left !important;
}

.mandatory {
	color: red;
}

footer {
	background-color: #f8f9fa;
	padding: 20px 0;
}
</style>
<style>
        .modal-content.success {
            animation: successAnimation 0.5s ease-in-out;
        }

        .modal-content.error {
            animation: errorAnimation 0.5s ease-in-out;
        }

        @keyframes successAnimation {
            0% {
                opacity: 0;
                transform: scale(0.8);
            }
            100% {
                opacity: 1;
                transform: scale(1);
            }
        }

        @keyframes errorAnimation {
            0% {
                opacity: 0;
                transform: translateY(-100%);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .success-icon {
            font-size: 3rem;
            color: green;
            animation: iconAnimation 1s ease-in-out infinite;
        }

        .error-icon {
            font-size: 3rem;
            color: red;
            animation: iconAnimation 1s ease-in-out infinite;
        }

        @keyframes iconAnimation {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.2);
            }
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
				<a href="#" class="nav_logo"> <img
					src="${pageContext.request.contextPath}/assets//images/head.2.png"
					alt="">
				</a>
				<div class="nav_list">
					<a href="seekerCart" class="nav_link "> <i
						class='fas fa-tachometer-alt nav_icon' title="Dashboard"></i> <span
						class="nav_name">Dashboard</span>
					</a> <a href="JobSeekerProfileRetriveController" class="nav_link">
    <i class='fas fa-id-badge nav_icon' title="My Profile"></i>
    <span class="nav_name">My Profile</span>
</a>
                    <a href="JobSeekerProfileEditController"  class="nav_link active">
                        <i class='fas fa-user-edit nav_icon' title="Edit Profile"></i>
                        <span class="nav_name">Edit Profile</span>
                    </a>
                    <a href="jobSearchController" class="nav_link">
                        <i class='fas fa-search nav_icon' title="Job Search"></i>
                        <span class="nav_name">Job Search</span>
                    
					</a> <a href="appliedJobController" class="nav_link">
                        <i class='fas fa-briefcase nav_icon' title="Applied Jobs"></i>
                        <span class="nav_name">Applied Jobs</span>
                    </a>
                    <a href="SeekerPasswordController"  class="nav_link">
                        <i class='fas fa-key nav_icon' title="Reset Password"></i>
                        <span class="nav_name">Reset Password</span>
                    </a><a href="#" class="nav_link" id="logout-link"> <i
						class='bx bx-log-out nav_icon'></i> <span class="nav_name">LogOut</span>
					</a>
				</div>
			</div>
		</nav>
	</div>

	<div class="login-container">
		<div class="login-box">
			<h4>Edite Profile</h4>
			<form id="registerForm"
				action="SeekerProfileEdit"
				method="post" >
				<div class="form-section add-education-form">
					<h5>Personal Details</h5>
					<div class="education-info">
						<!-- Name -->
						<div class="form-group">
						
							<label for="name">Name<span class="mandatory">*</span>:</label> <input type="text"
							
								class="form-control" id="name" name="fName"
								value="${seekers.fName}">
							<div class="invalid-feedback">Please enter your name.</div>
						</div>

						<!-- Email -->
						<div class="form-group">
							<label for="email">Email<span class="mandatory">*</span>:</label> <input type="email"
								class="form-control" id="email" name="email"
								value="${seekers.email}">
							<div class="invalid-feedback">Please enter a valid email.</div>
						</div>

				<!-- Date of Birth -->
				<div class="form-group">
					<label for="dob">Date of Birth<span class="mandatory">*</span>:
					</label> <input type="date" class="form-control" id="dob" name="dob" value="${seekers.dob}">
					<div class="invalid-feedback">Please select a valid date of
						birth.</div>
				</div>


				<!-- Gender -->
				<div class="form-group" name="gender">
							<label>Gender<span class="mandatory">*</span>:
							</label><br> <input type="radio" name="gender" value="male"
								<c:if test="${seekers.gender == 'male'}">checked</c:if>>
							Male<br> <input type="radio" name="gender" value="female"
								<c:if test="${seekers.gender == 'female'}">checked</c:if>>
							Female<br>
							<div class="invalid-feedback">Please select your gender.</div>
						</div>
						
						
							<!-- Phone -->
						<div class="form-group">
							<label for="phone">Phone<span class="mandatory">*</span>:
							</label> <input type="text" class="form-control" id="phone" name="phone"
								value="${seekers.phoneNumber}">
							<div class="invalid-feedback">Please enter a valid 10-digit
								phone number.</div>
						</div>
				<!-- hidden -->
				<input type="hidden" class="form-control" id="jeeker_id"
					name="JOB_SEEKER_ID" value="${seeker.JOB_SEEKER_ID}">
				<!-- Address -->
				<div class="form-group">
					<label for="address">Address<span class="mandatory">*</span>:
					</label>
					<textarea class="form-control" id="address" name="address">${seekers.address}</textarea>
					<div class="invalid-feedback">Please enter your address.</div>
				</div>

				<div class="form-group">
					<label for="designation">Short Profile<span
						class="mandatory">*</span>:
					</label> <input type="text" class="form-control" id="designation"
						name="objective" value="${seekers.objective}">
					<div class="invalid-feedback">Please enter your designation.</div>
				</div>
				<div class="form-section add-education-form">
					<h5>Education Details</h5>
					<div class="education-info">
						<!-- Course -->
						<div class="education-info">
							<!-- Course -->
							<div class="form-group">
    <label for="course">Course<span class="mandatory">*</span>:</label>
    <select class="form-control" id="course" name="course" onchange="updateSpecialization()">
        <option value="">Select Course</option>
        <option value="BE" <c:if test="${seekers.course == 'BE'}">selected</c:if>>BE</option>
        <option value="ARTS" <c:if test="${seekers.course == 'ARTS'}">selected</c:if>>Arts</option>
        <option value="EXTRA" <c:if test="${seekers.course == 'EXTRA'}">selected</c:if>>Other</option>
    </select>
    <div class="invalid-feedback">Please select a course.</div>
</div>


							<!-- Specialization -->
							<!-- Specialization -->
<div class="form-group">
    <label for="specialization">Specialization<span class="mandatory">*</span>:</label>
    <select class="form-control" id="specialization" name="specialization">
        <option value="">Select Specialization</option>
        <c:if test="${seekers.course == 'BE'}">
            <option value="CSE" <c:if test="${seekers.specialization == 'CSE'}">selected</c:if>>CSE</option>
            <option value="IT" <c:if test="${seekers.specialization == 'IT'}">selected</c:if>>IT</option>
            <option value="EXTRA" <c:if test="${seekers.specialization == 'EXTRA'}">selected</c:if>>Other</option>
        </c:if>
        <c:if test="${seekers.course == 'ARTS'}">
            <option value="Literature" <c:if test="${seekers.specialization == 'Literature'}">selected</c:if>>Literature</option>
            <option value="History" <c:if test="${seekers.specialization == 'History'}">selected</c:if>>History</option>
            <option value="EXTRA" <c:if test="${seekers.specialization == 'EXTRA'}">selected</c:if>>Other</option>
        </c:if>
        <!-- Add more conditions for other courses as needed -->
    </select>
    <div class="invalid-feedback">Please select your specialization.</div>
</div>


							<!-- Institute -->
							<div class="form-group">
								<label for="institute">Institute<span class="mandatory">*</span>:
								</label> <input type="text" class="form-control" id="institute"
									name="institute" value="${seekers.institute}">
								<div class="invalid-feedback">Please enter your institute.</div>
							</div>

							<!-- Passing Year -->
							<div class="form-group">
    <label for="passingYear">Passing Year<span class="mandatory">*</span>:</label>
    <select class="form-control" id="passingYear" name="passingYear">
        <option value="">Select Year</option>
        <c:forEach var="year" begin="1970" end="2030">
            <option value="${year}" <c:if test="${year == seekers.passingYear}">selected</c:if>>${year}</option>
        </c:forEach>
    </select>
    <div class="invalid-feedback">Please select a valid passing year.</div>
</div>

							<!-- CGPA -->
							<div class="form-group">
								<label for="cgpa">CGPA<span class="mandatory">*</span>:
								</label> <input type="number" step="0.01" class="form-control" id="cgpa"
									name="cgpa" value="${seekers.cgpa}">
								<div class="invalid-feedback">Please enter a valid CGPA
									(1.0-10.0).</div>
							</div>

							<!-- Course Type -->
							<div class="form-group">
  <div class="form-group">
    <label for="courseType">Course Type<span class="mandatory">*</span>:</label>
    <select class="form-control" id="courseType" name="course_Type">
        <option value="">Select Course Type</option>
        <option value="Full Time" <c:if test="${seekers.courseType == 'Full Time'}">selected</c:if>>Full Time</option>
        <option value="Part Time" <c:if test="${seekers.courseType == 'Part Time'}">selected</c:if>>Part Time</option>
        <option value="Distance Education" <c:if test="${seekers.courseType == 'Distance Education'}">selected</c:if>>Distance Education</option>
    </select>
    <div class="invalid-feedback">Please select your course type.</div>
</div>


					<div class="form-group">
    <label for="technicalSkills">Technical Skills ${seekers.skills}<span class="mandatory">*</span>:</label>
    <select class="form-control" id="technicalSkills" name="skills">
        <option value="">Select Skills </option>
        <option value="Java" <c:if test="${seekers.skills == 'Java'}">selected</c:if>>Java</option>
        <option value="JavaScript" <c:if test="${seekers.skills == 'JavaScript'}">selected</c:if>>JavaScript</option>
        <option value="Python" <c:if test="${seekers.skills == 'Python'}">selected</c:if>>Python</option>
        <option value="SQL" <c:if test="${seekers.skills == 'SQL'}">selected</c:if>>SQL</option>
        <option value="HTML" <c:if test="${seekers.skills == 'HTML'}">selected</c:if>>HTML</option>
        <option value="CSS" <c:if test="${seekers.skills == 'CSS'}">selected</c:if>>CSS</option>
        <option value="Spring" <c:if test="${seekers.skills == 'Spring'}">selected</c:if>>Spring</option>
        <option value="Bootstrap" <c:if test="${seekers.skills == 'Bootstrap'}">selected</c:if>>Bootstrap</option>
        <option value="MySQL" <c:if test="${seekers.skills == 'MySQL'}">selected</c:if>>MySQL</option>
    </select>
    <div class="invalid-feedback">Please select your technical skills.</div>
</div>


					<div class="form-section add-experience-form">
						<h5>Experience Details</h5>
						<div class="experience-info">
							<!-- Company Name -->
							<div class="form-group">
								<label for="companyName">Company Name<span
									class="mandatory">*</span>:
								</label> <input type="text" class="form-control" id="companyName"
									name="company_Name" value="${seekers.company_Name}">
								<div class="invalid-feedback">Please enter your company
									name.</div>
							</div>

							<!-- Years of Experience -->
							<div class="form-group">
								<label for="yearsExperience">Years of Experience<span
									class="mandatory">*</span>:
								</label> <input type="number" class="form-control" id="yearsExperience"
									name="experience" value="${seekers.experience}">
								<div class="invalid-feedback">Please enter valid years of
									experience (0-50).</div>
							</div>
							<!-- Designation -->

						</div>

						<!-- Experience 
						<div class="form-group">
							<label for="experienceDescription">Experience Description<span
								class="mandatory">*</span>:
							</label>
							<textarea class="form-control" id="experienceDescription"
								name="experienceDescription"></textarea>
							<div class="invalid-feedback">Please enter your experience
								description.</div>
						</div>
 Description -->
					</div>
				</div>
                          

                 <div class="form-group">
					<label for="resume">Resume url <span class="mandatory">*</span>:</label> <input type="text"
						class="form-control" id="experienceDescription" name="resumes" value="${seekers.resumes}">
					<div class="invalid-feedback">Please upload your resume url(goole drive) </div>
				</div>

				<!-- Resume--> 
				<div class="form-group">
					<label for="resume">Resume</label> <input type="file"
						class="form-control" id="resume" name="resume">
					<div class="invalid-feedback">Please upload your resume (max
						5MB).</div>
				</div>






				<button type="submit" class="btn btn-primary ms-3">Submit</button>
				<!-- Submit Button -->

				<!-- Reset Button -->
				<button type="reset" class="btn  btn-secondary ms-3 float-right">Reset</button>
				<br> 



				<!-- Submit Button -->

			</form>
		</div>
	</div>


	<!-- Bootstrap and other scripts -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
    function updateSpecialization() {
        const course = document.getElementById('course').value;
        const specialization = document.getElementById('specialization');

        // Clear current options
        specialization.innerHTML = '<option value="">Select Specialization</option>';

        // Define specialization options based on selected course
        let options = [];
        if (course === 'BE') {
            options = ['CSE', 'IT', 'MECH', 'CEVIL'];
        } else if (course === 'ARTS') {
            options = ['History', 'Psychology', 'Literature'];
        } else if (course === 'EXTRA') {
            options = ['Skill Development', 'Other'];
        }

        // Populate specialization dropdown
        options.forEach(opt => {
            const option = document.createElement('option');
            option.value = opt;
            option.textContent = opt;
            specialization.appendChild(option);
        });
    }
</script>
	<script>
document.addEventListener('DOMContentLoaded', function() {
    // Function to validate Date of Birth
    function validateDateOfBirth() {
        var dobField = document.getElementById('dob');
        var selectedDate = new Date(dobField.value);
        var today = new Date();

        if (selectedDate >= today) {
            dobField.classList.add('is-invalid');
            dobField.nextElementSibling.style.display = 'block';
            return false;
        } else {
            dobField.classList.remove('is-invalid');
            dobField.nextElementSibling.style.display = 'none';
            return true;
        }
    }

    // Function to validate Gender selection
    function validateGender() {
        var genderInputs = document.getElementsByName('gender');
        var genderSelected = false;

        for (var i = 0; i < genderInputs.length; i++) {
            if (genderInputs[i].checked) {
                genderSelected = true;
                break;
            }
        }

        var genderFormGroup = document.querySelector('.form-group[name="gender"]');
        if (!genderSelected) {
            genderFormGroup.classList.add('is-invalid');
            genderFormGroup.querySelector('.invalid-feedback').style.display = 'block';
            return false;
        } else {
            genderFormGroup.classList.remove('is-invalid');
            genderFormGroup.querySelector('.invalid-feedback').style.display = 'none';
            return true;
        }
    }

    // Function to validate Experience Years
    function validateExperienceYears() {
        var yearsExperienceField = document.getElementById('yearsExperience');
        var years = parseInt(yearsExperienceField.value);

        if (isNaN(years) || years < 0 || years > 50) {
            yearsExperienceField.classList.add('is-invalid');
            return false;
        } else {
            yearsExperienceField.classList.remove('is-invalid');
            yearsExperienceField.classList.add('is-valid');
            return true;
        }
    }

    // Function to validate required fields
    function validateRequiredField(field) {
        var fieldValue = field.value.trim();

        if (fieldValue === '') {
            field.classList.add('is-invalid');
            field.nextElementSibling.style.display = 'block';
            return false;
        } else {
            field.classList.remove('is-invalid');
            field.nextElementSibling.style.display = 'none';
            return true;
        }
    }

    // Function to validate Passing Year
    function validatePassingYear(field) {
        var year = parseInt(field.value);

        if (isNaN(year) || year < 1900 || year > new Date().getFullYear()) {
            field.classList.add('is-invalid');
            field.nextElementSibling.style.display = 'block';
            return false;
        } else {
            field.classList.remove('is-invalid');
            field.nextElementSibling.style.display = 'none';
            return true;
        }
    }
    // Function to validate Phone Number
    function validatePhoneNumber(field) {
        var phonePattern = /^\d{10}$/; // Example pattern for 10-digit phone number

        if (!phonePattern.test(field.value)) {
            field.classList.add('is-invalid');
            field.nextElementSibling.style.display = 'block';
            return false;
        } else {
            field.classList.remove('is-invalid');
            field.nextElementSibling.style.display = 'none';
            return true;
        }
    }
    // Function to validate CGPA
    function validateCGPA(field) {
        var cgpa = parseFloat(field.value);
        var isValid = !isNaN(cgpa) && cgpa >= 1.0 && cgpa <= 10.0;

        if (!isValid) {
            field.classList.add('is-invalid');
            field.nextElementSibling.style.display = 'block';
            return false;
        } else {
            field.classList.remove('is-invalid');
            field.classList.add('is-valid');
            field.nextElementSibling.style.display = 'none';
            return true;
        }
    }

 <!--   // Function to validate Resume Upload
    function validateResume(field) {
        var file = field.files[0];
        var maxSize = 5 * 1024 * 1024; // 5MB in bytes

        if (file && file.size > maxSize) {
            field.setCustomValidity('File size exceeds 5MB limit.');
            field.classList.add('is-invalid');
            return false;
        } else {
            field.setCustomValidity('');
            field.classList.remove('is-invalid');
            return true;
        }
    }
-->
    // Function to validate Technical Skills selection
    function validateTechnicalSkills() {
        var technicalSkillsField = document.getElementById('technicalSkills');
        
        if (technicalSkillsField.value === '') {
            technicalSkillsField.classList.add('is-invalid');
            technicalSkillsField.nextElementSibling.style.display = 'block';
            return false;
        } else {
            technicalSkillsField.classList.remove('is-invalid');
            technicalSkillsField.nextElementSibling.style.display = 'none';
            return true;
        }
    }

    // Add event listeners for field validations on change
    document.getElementById('dob').addEventListener('change', validateDateOfBirth);
    document.getElementsByName('gender').forEach(function(input) {
        input.addEventListener('change', validateGender);
    });
    document.getElementById('yearsExperience').addEventListener('change', validateExperienceYears);
    document.getElementById('technicalSkills').addEventListener('change', validateTechnicalSkills);
    document.getElementById('phone').addEventListener('change', function() {
        validatePhoneNumber(this);
    });
    // Add other fields' event listeners as necessary
    document.getElementById('designation').addEventListener('change', function() {
        validateRequiredField(this);
    });
    document.getElementById('institute').addEventListener('change', function() {
        validateRequiredField(this);
    });
    document.getElementById('passingYear').addEventListener('change', function() {
        validatePassingYear(this);
    });
    document.getElementById('cgpa').addEventListener('input', function() {
        validateCGPA(this);
    });
    document.getElementById('address').addEventListener('change', function() {
        validateRequiredField(this);
    });
    document.getElementById('course').addEventListener('change', function() {
        validateRequiredField(this);
    });
    <!--
    document.getElementById('resume').addEventListener('change', function() {
        validateResume(this);
        -->
    });
    document.getElementById('specialization').addEventListener('change', function() {
        validateRequiredField(this);
    });
    document.getElementById('companyName').addEventListener('change', function() {
        validateRequiredField(this);
    });
    document.getElementById('experienceDescription').addEventListener('change', function() {
        validateRequiredField(this);
    });
    document.getElementById('courseType').addEventListener('change', function() {
        validateRequiredField(this);
    });

    // Form submission validation
    document.getElementById('registerForm').addEventListener('submit', function(event) {
        var isFormValid = true;

        // Validate all fields
         // Validate other required fields
          if (!validateRequiredField(document.getElementById('name'))) {
              isFormValid = false;
          }
          if (!validateRequiredField(document.getElementById('email'))) {
              isFormValid = false;
          }
        if (!validateDateOfBirth()) isFormValid = false;
        if (!validateGender()) isFormValid = false;
        if (!validateExperienceYears()) isFormValid = false;
        if (!validateTechnicalSkills()) isFormValid = false;
        if (!validateRequiredField(document.getElementById('dob'))) isFormValid = false;
        if (!validateRequiredField(document.getElementById('designation'))) isFormValid = false;
        if (!validateRequiredField(document.getElementById('institute'))) isFormValid = false;
        if (!validatePassingYear(document.getElementById('passingYear'))) isFormValid = false;
        if (!validateCGPA(document.getElementById('cgpa'))) isFormValid = false;
        if (!validateRequiredField(document.getElementById('address'))) isFormValid = false;
        if (!validateRequiredField(document.getElementById('course'))) isFormValid = false;
        <!--
        if (!validateResume(document.getElementById('resume'))) isFormValid = false;
        -->
        if (!validatePhoneNumber(document.getElementById('phone'))) {
            isFormValid = false;
        }
        if (!validateRequiredField(document.getElementById('specialization'))) isFormValid = false;
        if (!validateRequiredField(document.getElementById('companyName'))) isFormValid = false;
        if (!validateRequiredField(document.getElementById('experienceDescription'))) isFormValid = false;
        if (!validateRequiredField(document.getElementById('courseType'))) isFormValid = false;

        // Prevent form submission if not valid
        if (!isFormValid) {
            event.preventDefault();
            var firstInvalidField = document.querySelector('.is-invalid');
            if (firstInvalidField) {
                firstInvalidField.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        }
    });

    // Reset validation state on form reset
    document.getElementById('registerForm').addEventListener('reset', function() {
        var formInputs = this.querySelectorAll('input, select, textarea');
        formInputs.forEach(function(input) {
            input.classList.remove('is-invalid', 'is-valid');
        });
        var errorMessages = this.querySelectorAll('.invalid-feedback');
        errorMessages.forEach(function(message) {
            message.style.display = 'none';
        });
    });
});
</script>
    
 <!-- Success Modal -->
<div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content success">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">Success</h5>
               
            </div>
            <div class="modal-body text-center">
                <i class="fas fa-check-circle success-icon"></i>
                <p>Profile Update Successfully.</p>
            </div>
            <div class="modal-footer">
                <button type="button" id="successCloseBtn" class="btn btn-success" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>

<!-- Error Modal -->
<div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content error">
            <div class="modal-header">
                <h5 class="modal-title" id="errorModalLabel"> Message</h5>
                
            </div>
            <div class="modal-body text-center">
                <i class="fas fa-exclamation-circle error-icon"></i>
                <p>Email ID already exists.</p>
            </div>
            <div class="modal-footer">
                <button type="button" id="errorCloseBtn" class="btn btn-danger" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
        $('#successCloseBtn').click(function() {
            $('#successModal').modal('hide');
        });
        
        $('#errorCloseBtn').click(function() {
            $('#errorModal').modal('hide');
        });
        
      
    }
});
</script>

	<!-- Bootstrap and other scripts -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	



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
    
   
	<!-- Include jQuery and Bootstrap JS (already included in your code) -->



	<script src="${pageContext.request.contextPath}/assets/js/jobseeker.js"></script>
</body>

</html>
