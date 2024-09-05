<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bulk changes</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/@mdi/font/css/materialdesignicons.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/jobpost.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
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
				<img src="${pageContext.request.contextPath}/assets/images/user.png"
					alt="Profile Image">
			</div>
			<span class="admin_text">${employers.userName}</span>
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
					<a href="employercard" class="nav_link"> <i
						class='bx bx-grid-alt nav_icon'></i> <span class="nav_name">Dashboard</span>
					</a> <a href="postjob" class="nav_link active"> <i
						class='fas fa-briefcase fa-2x nav_icon'></i> <span
						class="nav_name"> Bulk Upload</span>
					</a> <a href="#" class="nav_link"> <i
						class='fas fa-list-alt fa-2x nav_icon'></i> <span class="nav_name">Posted
							Jobs</span>
					</a> <a href="#" class="nav_link"> <i
						class='fas fa-ban fa-2x nav_icon'></i> <span class="nav_name">Blocked
							Jobs</span>
					</a> <a href="#" class="nav_link"> <i class='bx bx-user nav_icon'></i>
						<span class="nav_name">My Profile</span>
					</a> <a href="#" class="nav_link"> <i class='fas fa-key nav_icon'
						title="Reset Password"></i> <span class="nav_name">Reset
							Password</span>
					</a> <a href="employersLogout" class="nav_link" id="logout-lin"> <i
						class='bx bx-log-out nav_icon'></i> <span class="nav_name">Sign
							Out</span>
					</a>
				</div>
			</div>
		</nav>
	</div>

	<div class="container">
    <div class="form-section">
        <h4>Bulk Upload</h4>
        <form method="post" action="fileupload" enctype="multipart/form-data">
            <div class="form-group">
                <label for="fileUpload">Choose file</label>
                <input type="file" name="file" id="fileUpload" class="form-control-file">
                 <button type="submit" id="uploadButton" class="btn btn-primary btn-xs" disabled>Upload</button>
            </div>
            <input type="hidden" id="employer_id" name="id" value="${employers.id}">
           
        </form>
    </div>
    
    <div class="form-section">
       
        <h6 class="mb-3">Download an Excel template to make bulk changes to the Job poated and also bulk New Job post : </h6>
        <form id="downloadForm" method="post" action="/your-endpoint">
            <div class="form-check">
                <input type="radio" id="preFilled" name="fileType" value="preFilled" class="form-check-input" checked>
                <label for="preFilled" class="form-check-label">Template With Existing Data</label>
            </div>
            <div class="form-check">
                <input type="radio" id="template" name="fileType" value="template" class="form-check-input">
                <label for="template" class="form-check-label">Blank Template</label>
            </div>
            <input type="hidden" id="employer_id" name="id" value="${employers.id}">
            <button type="submit" class="btn btn-primary btn-xs mt-3">Download</button>
        </form>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/admin.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jobpost.js"></script>
</body>
</html>
