<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored ="false"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <link rel="stylesheet" href="/css/style.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/adminlogin.css">
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
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
      background-color: #fff;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .login-box h4 {
      text-align: center;
      margin-bottom: 20px;
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
    .invalid-feedback,
    .valid-feedback {
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
</head>
<body>


  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#"><img src="..\..\assets\images\head.2.png" alt="Jobportal"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
      <ul class="navbar-nav h6">
        <li class="nav-item">
          <a class="nav-link" href="/html/index.html"></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/html/index.html"></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/html/about.html"></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"></a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link" href="#" id="loginDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            
          </a>
          <div class="dropdown-menu" aria-labelledby="loginDropdown">
            <a class="dropdown-item" href="employer_login.html">Employer</a>
            <a class="dropdown-item hi" href="#" data-toggle="modal" data-target="#loginModal">Job Seekers</a>
            <a class="dropdown-item" href="#">Admin</a>
          </div>
        </li>
      </ul>
    </div>
  </nav>
  <div class="login-container">
    <div class="login-box">
      <h4>Profile</h4>
      <form id="registerForm" action="../../SeekerProfileCreating" method="post">
        <!-- Personal Details Section -->
        <div class="form-group">
          <label for="name">Full Name <span class="mandatory">*</span>: <i class="input-icon fas fa-user"></i></label>
          <input type="text" class="form-control" id="name" name="name">
          <div class="invalid-feedback">Please enter your full name.</div>
        </div>
        <div class="form-group">
          <label for="dob">Date of Birth: <span class="mandatory">*</span></label>
          <input type="date" class="form-control" id="dob" name="dob">
          <div class="invalid-feedback">Please enter a valid date of birth.</div>
        </div>
        <div class="form-group">
          <label for="state">State <span class="mandatory">*</span>: <i class="input-icon fas fa-map-marker-alt"></i></label>
          <select class="form-control" id="state" name="state">
            <option value="">Select State</option>
            <option value="Tamil Nadu">Tamil Nadu</option>
            <option value="Kerala">Kerala</option>
            <option value="Karnataka">Karnataka</option>
            <!-- Add more states as needed -->
          </select>
          <div class="invalid-feedback">Please select your state.</div>
        </div>
        <div class="form-group">
          <label for="district">District: <i class="input-icon fas fa-map-marker-alt"></i></label>
          <select class="form-control" id="district" name="district">
            <option value="">Select District</option>
            <!-- Districts will be dynamically populated based on state selection using JavaScript -->
          </select>
          <div class="invalid-feedback">Please select your district.</div>
        </div>
        <div class="form-group">
          <label for="pincode">Pincode: <span class="mandatory">*</span></label>
          <input type="text" class="form-control" id="pincode" name="pincode">
          <div class="invalid-feedback">Please enter a valid 6-digit pincode.</div>
        </div>
        <div class="form-group">
          <label>Gender <span class="mandatory">*</span>:</label><br>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="gender" id="male" value="male" required>
            <label class="form-check-label" for="male">Male</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="gender" id="female" value="female">
            <label class="form-check-label" for="female">Female</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="gender" id="others" value="others">
            <label class="form-check-label" for="others">Others</label>
          </div>
        </div>

        <!-- Education Section -->
        <div class="form-section add-education-form">
          <h5>Education Details</h5>
          <div class="education-info">
            <div class="form-group">
              <label for="eduQualification">Education / Qualification <span class="mandatory">*</span>:</label>
              <select class="form-control" id="eduQualification" name="eduQualification" required>
                <option value="">Select</option>
                <option value="High School">High School</option>
                <option value="Diploma">Diploma</option>
                <option value="Bachelor's Degree">Bachelor's Degree</option>
                <option value="Master's Degree">Master's Degree</option>
                <option value="Ph.D.">Ph.D.</option>
              </select>
              <div class="invalid-feedback">Please select your education qualification.</div>
            </div>
            <div class="form-group">
              <label for="course">Course <span class="mandatory">*</span>:</label>
              <input type="text" class="form-control" id="course" name="course" required>
              <div class="invalid-feedback">Please enter your course.</div>
            </div>
            <div class="form-group">
              <label for="specialization">Specialization:</label>
              <input type="text" class="form-control" id="specialization" name="specialization">
            </div>
            <div class="form-group">
              <label for="passingYear">Passing Year <span class="mandatory">*</span>:</label>
              <input type="text" class="form-control" id="passingYear" name="passingYear" required>
              <div class="invalid-feedback">Please enter your passing year.</div>
            </div>
            <div class="form-group">
              <label for="institute">Institute Name <span class="mandatory">*</span>:</label>
              <input type="text" class="form-control" id="institute" name="institute" required>
              <div class="invalid-feedback">Please enter your institute name.</div>
            </div>
            <div class="form-group">
              <label for="cgpa">CGPA:</label>
              <input type="text" class="form-control" id="cgpa" name="cgpa">
            </div>
            <div class="form-group">
              <label for="courseType">Course Type:</label>
              <select class="form-control" id="courseType" name="courseType">
                <option value="">Select</option>
                <option value="Full-time">Full-time</option>
                <option value="Part-time">Part-time</option>
                <option value="Online">Online</option>
                <option value="Distance Learning">Distance Learning</option>
              </select>
            </div>
            <button type="button" class="btn btn-secondary add-education">Add Another Education</button>
          </div>
        </div>

        <!-- Experience Section -->
        <div class="form-section add-experience-form">
          <h5>Experience Details</h5>
          <div class="experience-info">
            <div class="form-group">
              <label for="yearsExperience">Years of Experience <span class="mandatory">*</span>:</label>
              <input type="text" class="form-control" id="yearsExperience" name="yearsExperience" required>
              <div class="invalid-feedback">Please enter your years of experience.</div>
            </div>
            <div class="form-group">
              <label for="designation">Designation <span class="mandatory">*</span>:</label>
              <input type="text" class="form-control" id="designation" name="designation" required>
              <div class="invalid-feedback">Please enter your designation.</div>
            </div>
            <button type="button" class="btn btn-secondary add-experience">Add Another Experience</button>
          </div>
        </div>

        <!-- Languages Known Section -->
        <div class="form-section add-language-form">
          <h5>Languages Known</h5>
          <div class="language-info">
            <div class="form-group">
              <label for="language">Language <span class="mandatory">*</span>:</label>
              <select class="form-control" id="language" name="language" required>
                <option value="">Select Language</option>
                <option value="English">English</option>
                <option value="Spanish">Spanish</option>
                <option value="French">French</option>
                <option value="German">German</option>
                <!-- Add more languages as needed -->
              </select>
              <div class="invalid-feedback">Please select a language.</div>
            </div>
            <div class="form-group">
              <label>Proficiency:</label><br>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="read" name="proficiency_read" value="read">
                <label class="form-check-label" for="read">Read</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="write" name="proficiency_write" value="write">
                <label class="form-check-label" for="write">Write</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="speak" name="proficiency_speak" value="speak">
                <label class="form-check-label" for="speak">Speak</label>
              </div>
            </div>
            <button type="button" class="btn btn-secondary add-language">Add Another Language</button>
          </div>
        </div>

        <!-- Certification Section -->
        <div class="form-section add-certification-form">
          <h5>Certification Details</h5>
          <div class="certification-info">
            <div class="form-group">
              <label for="certification">Certification <span class="mandatory">*</span>:</label>
              <input type="text" class="form-control" id="certification" name="certification" required>
              <div class="invalid-feedback">Please enter the certification name.</div>
            </div>
            <div class="form-group">
              <label for="certificationYear">Certification Year <span class="mandatory">*</span>:</label>
              <input typetype="text" class="form-control" id="certificationYear" name="certificationYear" required>
              <div class="invalid-feedback">Please enter the certification year.</div>
            </div>
            <div class="form-group">
              <label for="certificationInstitute">Institute Name <span class="mandatory">*</span>:</label>
              <input type="text" class="form-control" id="certificationInstitute" name="certificationInstitute" required>
              <div class="invalid-feedback">Please enter the institute name.</div>
            </div>
            <button type="button" class="btn btn-secondary add-certification">Add Another Certification</button>
          </div>
        </div>

        <!-- Register Profile Button -->
        <div class="sub">
          <button type="submit" class="btn btn-primary btn-block">Register Profile</button>
          <button type="reset" class="btn btn-secondary btn-block">Reset</button>
          <br>
          <a href="${pageContext.request.contextPath}/views/home/home.jsp"><i class="fas fa-sign-in-alt"></i> Back to Home</a>
        </div>
      </form>

       

       
    </div>
  </div>
  <footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <h5>ABOUT US</h5>
                <p>Job portal involves various aspects to engage both job seekers and employers effectively. Here's a breakdown of the types of content you might include.</p>
            </div>
            <div class="col-md-3">
                <h5>CONTACT INFO</h5>
                <p>Address: Salem, Tamil Nadu</p>
                <p>Phone: +91 9788336639</p>
                <p>Email: jobfinder@job.ac.com</p>
            </div>
            <div class="col-md-3">
                <h5>LINKS</h5>
                <p><a href="#">Terms & Conditions</a></p>
                <p><a href="#">Download Job Finder App</a></p>
                <p><a href="#">Vulnerability Disclosure Policy</a></p>
                <p><a href="#">International Jobs</a></p>
                <p><a href="#">Support</a></p>
            </div>
            <div class="col-md-3">
                <h5>FOLLOW US</h5>
                <p>Stay connected through our social media channels:</p>
                <p>
                  <a href="https://www.facebook.com" target="_blank" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                  <a href="https://www.twitter.com" target="_blank" class="social-icon"><i class="fab fa-twitter"></i></a>
                  <a href="https://www.linkedin.com" target="_blank" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
                  <a href="https://www.instagram.com" target="_blank" class="social-icon"><i class="fab fa-instagram"></i></a>
                </p>
            </div>
        </div>
    </div>
  </footer>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      // Function to dynamically load districts based on selected state
      document.getElementById('state').addEventListener('change', function() {
        var state = this.value;
        var districtSelect = document.getElementById('district');
        districtSelect.innerHTML = ''; // Clear existing options
        
        if (state === 'Tamil Nadu') {
          var districts = ['Chennai', 'Coimbatore', 'Madurai', 'Salem', 'Tiruchirappalli'];
        } else if (state === 'Kerala') {
          var districts = ['Thiruvananthapuram', 'Kochi', 'Kozhikode', 'Thrissur', 'Kollam'];
        } else if (state === 'Karnataka') {
          var districts = ['Bengaluru', 'Mysuru', 'Hubballi', 'Mangaluru', 'Belagavi'];
        } // Add options to the district select element based on the selected state
        

        districts.forEach(function (district) {
            var option = document.createElement('option');
            var option = document.createElement('option');
          option.textContent = district;
          option.value = district;
          districtSelect.appendChild(option);
        });
      });

      // Function to handle adding additional education fields
      var addEducationBtn = document.querySelector('.add-education');
      var educationContainer = document.querySelector('.add-education-form');

      addEducationBtn.addEventListener('click', function() {
        var newEducationField = `
          <div class="education-info">
            <div class="form-group">
              <label for="educationLevel">Education / Qualification <span class="mandatory">*</span>:</label>
              <select class="form-control" id="educationLevel" required>
                <option value="">Select</option>
                <option value="High School">High School</option>
                <option value="Associate's Degree">Associate's Degree</option>
                <option value="Bachelor's Degree">Bachelor's Degree</option>
                <option value="Master's Degree">Master's Degree</option>
                <option value="PhD">PhD</option>
              </select>
            </div>
            <div class="form-group">
              <label for="course">Course:</label>
              <input type="text" class="form-control" id="course"  name="course">
            </div>
            <div class="form-group">
              <label for="specialization">Specialization:</label>
              <input type="text" class="form-control" id="specialization" name="specialization">
            </div>
            <div class="form-group">
              <label for="passingYear">Passing Year:</label>
              <input type="text" class="form-control" id="passingYear" name="passingYear">
            </div>
            <div class="form-group">
              <label for="instituteName">Institute Name:</label>
              <input type="text" class="form-control" id="instituteName" name="instituteName">
            </div>
            <div class="form-group">
              <label for="cgpa">CGPA:</label>
              <input type="text" class="form-control" id="cgpa" name="cgpa">
            </div>
            <div class="form-group">
              <label for="courseType">Course Type:</label>
              <select class="form-control" id="courseType" name="courseType">
                <option value="">Select</option>
                <option value="Full-time">Full-time</option>
                <option value="Part-time">Part-time</option>
                <option value="Online">Online</option>
                <option value="Distance Learning">Distance Learning</option>
              </select>
            </div>
            <button type="button" class="btn btn-secondary remove-education">Remove</button>
          </div>
        `;
        educationContainer.insertAdjacentHTML('beforeend', newEducationField);
      });

      // Function to handle adding additional experience fields
      var addExperienceBtn = document.querySelector('.add-experience');
      var experienceContainer = document.querySelector('.add-experience-form');

      addExperienceBtn.addEventListener('click', function() {
        var newExperienceField = `
          <div class="experience-info">
            <div class="form-group">
              <label for="yearsExperience">Years of Experience <span class="mandatory">*</span>:</label>
             
              <input type="text" class="form-control" id="yearsExperience" name="yearsExperience" required>
            </div>
            <div class="form-group">
              <label for="designation">Designation <span class="mandatory">*</span>:</label>
              <input type="text" class="form-control" id="designation" required>
            </div>
            <button type="button" class="btn btn-secondary remove-experience">Remove</button>
          </div>
        `;
        experienceContainer.insertAdjacentHTML('beforeend', newExperienceField);
      });

      // Function to handle adding additional language fields
      var addLanguageBtn = document.querySelector('.add-language');
      var languageContainer = document.querySelector('.add-language-form');

      addLanguageBtn.addEventListener('click', function() {
        var newLanguageField = `
          <div class="language-info">
            <div class="form-group">
              <label for="language">Language <span class="mandatory">*</span>:</label>
              <select class="form-control" id="language" name="language" required>
                <option value="">Select Language</option>
                <option value="English">English</option>
                <option value="Spanish">Spanish</option>
                <option value="French">French</option>
                <option value="German">German</option>
                <!-- Add more languages as needed -->
              </select>
            </div>
            <div class="form-group">
              <label>Proficiency:</label><br>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="read" value="read">
                <label class="form-check-label" for="read">Read</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="write" value="write">
                <label class="form-check-label" for="write">Write</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="speak" value="speak">
                <label class="form-check-label" for="speak">Speak</label>
              </div>
            </div>
            <button type="button" class="btn btn-secondary remove-language">Remove</button>
          </div>
        `;
        languageContainer.insertAdjacentHTML('beforeend', newLanguageField);
      });

      // Function to handle adding additional certification fields
      var addCertificationBtn = document.querySelector('.add-certification');
      var certificationContainer = document.querySelector('.add-certification-form');

      addCertificationBtn.addEventListener('click', function() {
        var newCertificationField = `
          <div class="certification-info">
            <div class="form-group">
              <label for="certificationName">Certification Name <span class="mandatory">*</span>:</label>
              <input type="text" class="form-control" id="certificationName" name="certificationName" required>
            </div>
            <div class="form-group">
              <label for="certificationInstitute">Institute Name <span class="mandatory">*</span>:</label>
              <input type="text" class="form-control" id="certificationInstitute" name="certificationInstitute" required>
            </div>
            <div class="form-group">
              <label for="certificationYear">Year <span class="mandatory">*</span>:</label>
              <input type="text" class="form-control" id="certificationYear" name="certificationYear" required>
            </div>
            <button type="button" class="btn btn-secondary remove-certification">Remove</button>
          </div>
        `;
        certificationContainer.insertAdjacentHTML('beforeend', newCertificationField);
      });

      // Form submission
      var registerForm = document.getElementById('registerForm');

      registerForm.addEventListener('submit', function(event) {
        event.preventDefault();
        this.submit();
        // Perform additional validation if needed

        // Example: Form submission alert
       
        registerForm.reset();
        var inputs = document.querySelectorAll('.form-control');
        inputs.forEach(function(input) {
          input.classList.remove('is-valid', 'is-invalid');
        });
      });

      // Remove dynamically added education fields
      educationContainer.addEventListener('click', function(event) {
        if (event.target.classList.contains('remove-education')) {
          event.target.closest('.education-info').remove();
        }
      });

      // Remove dynamically added experience fields
      experienceContainer.addEventListener('click', function(event) {
        if (event.target.classList.contains('remove-experience')) {
          event.target.closest('.experience-info').remove();
        }
      });

      // Remove dynamically added language fields
      languageContainer.addEventListener('click', function(event) {
        if (event.target.classList.contains('remove-language')) {
          event.target.closest('.language-info').remove();
        }
      });

      // Remove dynamically added certification fields
      certificationContainer.addEventListener('click', function(event) {
        if (event.target.classList.contains('remove-certification')) {
          event.target.closest('.certification-info').remove();
        }
      });

    });
    
  </script>
</body>
</html>


    