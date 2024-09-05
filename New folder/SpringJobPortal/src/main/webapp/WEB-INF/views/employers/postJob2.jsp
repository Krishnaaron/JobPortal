
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored ="false"%>
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
       <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/employerDash.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Embedded CSS */
        body {
            background-color: #f4f6f9; /* Light background color */
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 800px; /* Increased width of the container */
          
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            padding: 20px; /* Increased padding */
            margin-top: 150px;
            height: auto; /* Adjust height to fit content */
        }
        h2 {
            margin-bottom: 20px;
            color: #343a40; /* Darker color for the header */
        }
        .form-group {
            margin-bottom: 30px;
        }
        .input-group {
            display: flex;
            align-items: center;
        }
        .form-group select {
    margin-right: 10px; /* Space between dropdown and button */
}
        
        select#templateOptions.form-control{
        padding-bottom: 8px !important;
        }
        
        .form-control-file {
            border: 1px solid #ced4da;
            border-radius: 10px;
            padding: 10px;
            flex: 1;
        }
        .btn-primary {
            background-color: #17a2b8; /* Teal color for the button */
            border-color: #17a2b8;
            transition: background-color 0.2s, border-color 0.2s;
            margin-left: 10px;
        }
        .btn-primary:hover {
            background-color: #138496; /* Darker teal color */
            border-color: #117a8b;
        }
        .form-control {
            border: 1px solid #ced4da;
            border-radius: 4px;
            padding: 10px;
        }
        select.form-control {
            background-color: #ffffff;
            width: 100%; /* Full width */
            max-width: 250px; /* Decrease dropdown width */
        }
        .download-info {
            margin-top: 20px;
        }
        .download-link {
            font-weight: bold;
            color: #007bff; /* Blue color for the link */
            text-decoration: none;
        }
        .download-link:hover {
            text-decoration: underline;
        }
    </style>
</head>



<body id="body-pd">
<%

   response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//http 1.1
   response.setHeader("Pragma","no-cache");//http1.0
   response.setHeader("Expires","0");// Proxies
   
   if(session.getAttribute("employers")==null){
	   
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
            <span class="admin_text">${employers.userName}</span>
            <div class="header_icons">
                <i class='bx bx-bell' id="notification-icon" title="Notifications"></i>
                <i class='bx bx-envelope' id="message-icon" title="Messages"></i>
                <i class='bx' id="logout-icon" title=""></i>
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
                    <a href="employercard" class="nav_link ">
                        <i class='bx bx-grid-alt nav_icon'></i>
                        <span class="nav_name">Dashboard</span>
                    </a>
                    <a href="postjob" class="nav_link active">
                        <i class='fas fa-briefcase fa-2x nav_icon'></i>
                        <span class="nav_name">	Post New Job</span>
                    </a>
                    <a href="#" class="nav_link">
                        <i class='fas fa-list-alt fa-2x nav_icon'></i>
                        <span class="nav_name">Posted Jobs</span>
                    </a>
                     <a href="#" class="nav_link">
                        <i class='fas fa-ban fa-2x nav_icon'></i>
                        <span class="nav_name">Blocked Jobs</span>
                    </a>
                    <a href="#" class="nav_link">
                        <i class='bx bx-user nav_icon'></i>
                        <span class="nav_name">My Profile</span>
                    </a>
                    <a href="EployerPasswordController" class="nav_link">
                        <i class='fas fa-key nav_icon' title="Reset Password"></i>
                        <span class="nav_name">Reset Password</span>
                    </a>
                     <a href="#" class="nav_link" id="logout-link">
                        <i class='bx bx-log-out nav_icon'></i>
                        <span class="nav_name">Sign Out</span>
                    </a>
                </div>
            </div>
        </nav>
    </div>
<div class="container">
    <label for="fileInput">Choose files (only .xlsx files allowed)</label>
    <form id="uploadForm">
        <div class="form-group">
            <div class="input-group">
                <input type="file" class="form-control-file" id="fileInput">
                <button type="button" id="uploadButton" class="btn btn-primary ms-2" disabled>Upload</button>
            </div>
        </div>
        <div class="form-group d-flex align-items-center">
            <label for="templateOptions" class="me-2">Select Template Type</label>
            <select id="templateOptions" class="form-control me-2">
                <option value="" disabled selected>Select an option</option>
                <option value="blank">Blank Template Download</option>
                <option value="existing">Template With Existing Data</option>
            </select>
            <button id="downloadButton" class="btn btn-primary" disabled>Download</button>
        </div>
    </form>
</div>



   


   
  <script>
  document.addEventListener('DOMContentLoaded', function () {
	    const fileInput = document.getElementById('fileInput');
	    const uploadButton = document.getElementById('uploadButton');
	    const templateOptions = document.getElementById('templateOptions');
	    const downloadButton = document.getElementById('downloadButton');
	    const uploadForm = document.getElementById('uploadForm');

	    // Enable upload button if a file is selected
	    fileInput.addEventListener('change', function () {
	        uploadButton.disabled = fileInput.files.length === 0;
	    });

	    // Handle file upload
	    uploadButton.addEventListener('click', function () {
	        const formData = new FormData(uploadForm);
	        formData.append('id', 123); // Replace with actual ID or logic to retrieve ID

	        fetch('/fileupload', { // Adjust URL to your server endpoint
	            method: 'POST',
	            body: formData
	        })
	        .then(response => response.json())
	        .then(data => {
	            console.log('File uploaded successfully:', data);
	            // Enable the download button after file upload
	            downloadButton.disabled = false;
	        })
	        .catch(error => {
	            console.error('Error uploading file:', error);
	        });
	    });

	    // Enable download button if a template option is selected
	    templateOptions.addEventListener('change', function () {
	        downloadButton.disabled = templateOptions.value === '';
	    });

	    // Handle download button click
	    downloadButton.addEventListener('click', function () {
	        const selectedOption = templateOptions.value;
	        let url;

	        switch (selectedOption) {
	            case 'blank':
	                url = '/sampl';
	                break;
	            case 'existing':
	                url = '/ModDataDownload'; // Assumes data is available; adjust as needed
	                break;
	            default:
	                return; // Exit if no valid option is selected
	        }

	        fetch(url, { method: 'POST' }) // Adjust method if needed
	        .then(response => {
	            if (!response.ok) {
	                throw new Error('Network response was not ok');
	            }
	            return response.blob();
	        })
	        .then(blob => {
	            const a = document.createElement('a');
	            const objectUrl = URL.createObjectURL(blob);
	            a.href = objectUrl;
	            a.download = selectedOption === 'blank' ? 'UserRegister.xlsx' : 'Jobs.xlsx';
	            document.body.appendChild(a);
	            a.click();
	            URL.revokeObjectURL(objectUrl);
	            document.body.removeChild(a);
	        })
	        .catch(error => {
	            console.error('Error downloading file:', error);
	        });
	    });
	});

</script>

 <!-- Ensure Chart.js is loaded after jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/admin.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
</body>

</html>
