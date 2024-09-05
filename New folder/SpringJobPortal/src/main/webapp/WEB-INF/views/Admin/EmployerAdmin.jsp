<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored ="false"%>
<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Boxicons CSS for icons -->
    <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/@mdi/font/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/simplePagination.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.min.js"></script>

    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        crossorigin="anonymous" />
    <!-- Custom CSS -->
    <!-- <link href="C:\Users\Aaaron\Desktop\jobportal\Admin new\css\style.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="/Admin new/css/style.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/adminprofile.css">
     
    <!--  -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- <link rel="stylesheet" href="C:\Users\Aaaron\Desktop\jobportal\html\style.css"> -->
    <!-- <link rel="stylesheet" href="/html/style.css"> -->


    <!-- <link rel="stylesheet" href="/html/style.css"> -->
    <style>
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
            /* Ensure the container can scroll horizontally */
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
            color: rgb(36, 43, 94)
        }

        /* #job-content{

            height: 700px;
        }
       #bordered-container{
        height: 600px;
       }
       .bordered-container {
        height: 500px;} */
        .bordered-container {
            min-height: 600px;

            /* padding: 10px; Add padding */
            /* padding-bottom: 15px; */
            margin-bottom: 20px;
            /* Add margin for spacing */
            display: flex;
            top: 111px;
            flex-direction: column;
            justify-content: space-between;
        }

        .table thead th {
            background-color: rgb(36, 43, 94);
            /* Table header background color */
            color: white;
            /* Table header text color */
        }

        .form-inline {
            padding: 10px;
            /* Add padding to form */
        }

        .pagination {
            margin-top: 1px;
            /* Add margin to pagination */
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
            /* Change color as needed */
            margin-left: 15px;
            cursor: pointer;
        }

        .header_img {
            margin-right: 10px;
        }

        .admin_text {
            margin-right: 10px;
        }
        #seeker-content{

padding-top: 90px !important;
}

    </style>
    <!-- logugut -->

</head>

<body id="body-pd">
<%

   response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//http 1.1
   response.setHeader("Pragma","no-cache");//http1.0
   response.setHeader("Expires","0");// Proxies
   
   if(session.getAttribute("admin")==null){
	   
	   response.sendRedirect("index.jsp");
		
   }

%>
    <header class="header" id="header">
        <div class="header_toggle">
            <i class='bx bx-menu' id="header-toggle"></i>
        </div>
        <div class="header_info">
            <div class="header_img">
                <!-- <img src="C:\Users\Aaaron\Desktop\jobportal\Admin - Copy\image\admin.png" alt="Profile Image"> -->
                <img src="${pageContext.request.contextPath}/assets/images/user.png" alt="Profile Image">

            </div>
            <span class="admin_text">${admin.name}</span>
            <div class="header_icons">
                <i class='bx bx-bell' id="notification-icon" title="Notifications"></i>
                <i class='bx bx-envelope' id="message-icon" title="Messages"></i>
                <i class='bx ' id="logout-icon" title=""></i>
            </div>
        </div>
    </header>
    <div class="l-navbar" id="nav-bar">
        <nav class="nav">
            <div>
                <a href="#" class="nav_logo">
                    <!-- <img src="C:\Users\Aaaron\Desktop\jobportal\image\head.2.png" alt=""> -->
                    <img src="${pageContext.request.contextPath}/assets/images/head.2.png" alt="">
                </a>
                <div class="nav_list">
                    <a href="cart" class="nav_link" id="dashboard-link">
                        <i class='bx bx-grid-alt nav_icon'></i>
                        <span class="nav_name">Dashboard</span>
                    </a>
                    <a href="AdminRetriveData" class="nav_link" id="job-link">
                        <i class='fas fa-users nav_icon'></i>
                        <span class="nav_name">Job Seekers</span>
                    </a>
                    <a href="AdminEmployerRetriveData" class="nav_link active" id="seeker-link">
                        <i class='fas fa-user-tie nav_icon'></i>
                        <span class="nav_name ">Employers</span>
                    </a>
                    <a href="AdminJobRetriveData" class="nav_link" id="employer-link">
                        <i class='fas fa-briefcase nav_icon'></i>
                        <span class="nav_name">Jobs</span>
                    </a>
                   
                    <a href="AdminProfileView" class="nav_link" id="profile-link">
                        <i class='bx bx-user nav_icon'></i>
                        <span class="nav_name">My Profile</span>
                    </a>
 <a href="adminPasswordController" class="nav_link">
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

    
<div id="seeker-content">
    <h4 class="text-center h4" style="border:1px solid black;">Employers information</h4>
    <div class="form-inline justify-content-between mt-6 border border-secondary bg-secondary">
        <input type="text" class="form-control form-control-sm ml-auto w-50" id="employerSearch" placeholder="Search Employers">
       
        <button id="exportButton" class="btn btn-primary ml-2">Export to Excel</button>
        
        
    </div>
    </div>
    <div class="table-responsive mt-3">
        <table class="table table-striped table-bordered" style="background-color: #b80e0e;">
            <thead>
                <tr class="text-center">
                    <th scope="col">Serial</th>
                    <th scope="col">Name</th>
                    <th scope="col">Company Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Status</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody id="employerTableBody">
                <c:forEach var="employer" items="${employer}" varStatus="loop">
                    <tr class="text-center">
                        <td>${loop.index + 1}</td>
                        <td>${employer.userName}</td>
                        <td>${employer.companyName}</td>
                        <td>${employer.email}</td>
                        <td>${employer.status}</td>
                        <td>
                            <button class="btn btn-info btn-sm btn-view" data-toggle="tooltip" title="View"
                                    data-name="${employer.userName}" data-company-name="${employer.companyName}"
                                    data-email="${employer.email}" data-status="${employer.status}" data-number="${employer.phone_Number}" 
                                    data-state="${employer.state}" data-district="${employer.district}"
                                    data-pincode="${employer.pinCode}" data-about-company="${employer.about_Company}">
                                <i class="fas fa-eye"></i>
                            </button>
                            <button class="btn btn-primary btn-sm btn-edit" data-toggle="tooltip" title="Edit"
                                    data-name="${employer.userName}" data-company-name="${employer.companyName}"
                                    data-email="${employer.email}" data-status="${employer.status}">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    

    <nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
    </li>
  </ul>
</nav>
    
    <!-- View Employer Modal -->
    <div class="modal fade" id="viewEmployerModal" tabindex="-1" aria-labelledby="viewEmployerModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background-color:rgb(36, 43, 94)">
                    <h5 class="modal-title" id="viewEmployerModalLabel" style="color:white">View Employer</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color:white">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="" >
                        <p><strong>Name:</strong> <span id="viewEmployerName"></span></p>
                        <p><strong>Email:</strong> <span id="viewEmployerEmail"></span></p>
                        <p><strong>Company Name:</strong> <span id="viewEmployerCompanyName"></span></p>
                        <p><strong>Status:</strong> <span id="viewEmployerStatus"></span></p>
                        <p><strong>Phone Number:</strong> <span id="viewEmployerPhoneNumber"></span></p>
                    </div>
                    <div class="">
                        <p><strong>Address:</strong> <span id="viewEmployerAddress"></span></p>
                        <p><strong>State:</strong> <span id="viewEmployerState"></span></p>
                        <p><strong>District:</strong> <span id="viewEmployerDistrict"></span></p>
                        <p><strong>Pincode:</strong> <span id="viewEmployerPincode"></span></p>
                        <p><strong>About Company:</strong> <span id="viewEmployerAboutCompany"></span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="editEmployerModal" tabindex="-1" aria-labelledby="editEmployerModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: rgb(36, 43, 94)">
                <h5 class="modal-title" id="editEmployerModalLabel" style="color: white">Edit Employer</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: white">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editEmployerForm" action="AdminEmployerEdit">
                    <div class="form-group">
                        <label for="editEmployerName">Name</label>
                        <input type="text" class="form-control" id="editEmployerName" name="name" readonly required>
                        <div id="nameError" class="error-message"></div>
                    </div>
                    <div class="form-group">
                        <label for="editEmployerCompanyName">Company Name</label>
                        <input type="text" class="form-control" id="editEmployerCompanyName" name="companyName" readonly required>
                        <div id="companyNameError" class="error-message"></div>
                    </div>
                    <div class="form-group">
                        <label for="editEmployerEmail">Email</label>
                        <input type="email" name="email" class="form-control" id="editEmployerEmail" readonly required>
                        <div id="emailError" class="error-message"></div>
                    </div>
                    <div class="form-group">
                        <label for="editEmployerStatus">Status</label>
                        <select class="form-control" id="editEmployerStatus" name="status" required>
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary" id="submitBtn">Save Changes</button>
                    <button type="button" class="btn btn-secondary" id="resetEditForm">Reset</button>
                </form>
            </div>
        </div>
    </div>
</div>
    
    
    <!-- Success Message Card -->
    <div class="container">
        <div id="successMessageCard" class="alert alert-success alert-dismissible fade show text-center" role="alert"
            style="display: none; position: fixed; top: 100px; left: 50%; transform: translateX(-50%); width:300px;">
            <i class="fas fa-check-circle"></i> Updated successfully!
        </div>
    </div>
    <div id="logoutModal" class="modal"> <!-- Changed class to "modal" -->
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- <div class="modal-header" style="background-color:rgb(36, 43, 94)"> -->
                <div class="modal-header" style="background-color:rgb(36, 43, 94)">
                    <h5 class="modal-title" style="color:white">Logout</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to logout?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" id="confirmLogout" class="btn btn-primary"
                        style="color:white">Logout</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#logout-link').click(function () {
                $('#logoutModal').modal('show');
            });

            $('#confirmLogout').click(function () {
                // Perform logout action here

                // window.location.href = '';
            	window.location.href = "AdminLogOut";


            });
        });



    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script>
    $(document).ready(function () {
        // View Button Click
        $(document).on('click', '.btn-view', function () {
            var name = $(this).data('name');
            var companyName = $(this).data('company-name');
            var email = $(this).data('email');
            var status = $(this).data('status');
            var number =$(this).data('number');
            var address = $(this).data('address');
            var state = $(this).data('state');
            var district = $(this).data('district');
            var pincode = $(this).data('pincode');
            var aboutCompany = $(this).data('about-company');
            
            $('#viewEmployerName').text(name);
            $('#viewEmployerCompanyName').text(companyName);
            $('#viewEmployerEmail').text(email);
            $('#viewEmployerStatus').text(status);
            $('#viewEmployerPhoneNumber').text(number);
            $('#viewEmployerAddress').text(address);
            $('#viewEmployerState').text(state);
            $('#viewEmployerDistrict').text(district);
            $('#viewEmployerPincode').text(pincode);
            $('#viewEmployerAboutCompany').text(aboutCompany);
            $('#viewEmployerModal').modal('show');
           
        });

      

        // Reset form handling
        $('#resetEditForm').on('click', function () {
            $('#editEmployerForm')[0].reset();
            $('.error-message').text('');
        });
        
        //search
        $(document).ready(function() {
            $('#employerSearch').on('keyup', function() {
                var value = $(this).val().toLowerCase();
                $("#employerTableBody tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                });
            });
        });
        
        
        //page
        $(document).ready(function () {
            // View Button Click
            $(document).on('click', '.btn-view', function () {
            	  var name = $(this).data('name');
                var companyName = $(this).data('company-name');
                var email = $(this).data('email');
                var status = $(this).data('status');

                $('#viewEmployerName').text(name);
                $('#viewEmployerCompanyName').text(companyName);
                $('#viewEmployerEmail').text(email);
                $('#viewEmployerStatus').text(status);

                $('#viewEmployerModal').modal('show');
            });

            // Edit Button Click
            $(document).on('click', '.btn-edit', function () {
            	 var name = $(this).data('name');
                var companyName = $(this).data('company-name');
                var email = $(this).data('email');
                var status = $(this).data('status');

                $('#editEmployerName').val(name);
                $('#editEmployerCompanyName').val(companyName);
                $('#editEmployerEmail').val(email);
                $('#editEmployerStatus').val(status);

                $('#editEmployerModal').modal('show');
            });

            // Form submission handling (example)
            $('#editEmployerForm').on('submit', function (e) {
               
                $('#editEmployerModal').modal('hide');
            });

            // Reset form handling
            $('#resetEditForm').on('click', function () {
                $('#editEmployerForm')[0].reset();
                $('.error-message').text('');
            });
            //search
           

            // Pagination functionality
            var itemsPerPage =5;
            var $table = $('#employerTableBody');
            var $pagination = $('.pagination');
            var totalItems = $table.find('tr').length;
            var totalPages = Math.ceil(totalItems / itemsPerPage);

            function updatePagination() {
                $pagination.find('li').not(':first, :last').remove();
                for (var i = 1; i <= totalPages; i++) {
                    $('<li class="page-item"><a class="page-link" href="#">' + i + '</a></li>').insertBefore($pagination.find('li:last'));
                }
                showPage(1);
            }

            function showPage(page) {
                $table.find('tr').hide();
                var start = (page - 1) * itemsPerPage;
                var end = start + itemsPerPage;
                $table.find('tr').slice(start, end).show();
                $pagination.find('li').removeClass('active');
                $pagination.find('li').eq(page).addClass('active');
            }

            $pagination.on('click', 'a', function(e) {
                e.preventDefault();
                var $parent = $(this).parent();
                if ($parent.hasClass('disabled') || $parent.hasClass('active')) return;

                var page = $parent.index();
                if ($parent.find('.page-link').attr('aria-label') === 'Previous') {
                    page = $pagination.find('li.active').index() - 1;
                } else if ($parent.find('.page-link').attr('aria-label') === 'Next') {
                    page = $pagination.find('li.active').index() + 1;
                }
                if (page > 0 && page <= totalPages) {
                    showPage(page);
                }
            });

            updatePagination();
        });

    });
</script>
   <script>
// Export to PDF functionality
   $("#exportButton").click(function () {
       // Convert the table data to a string format
       var tableData = "Name,Company Name,Email,Status\n"; // CSV header

       $("#employerTableBody tr").each(function () {
           var row = $(this);
           var rowData = row.find("td:eq(1)").text() + "," + row.find("td:eq(2)").text() + "," +
               row.find("td:eq(3)").text() + "," + row.find("td:eq(4)").text() + "\n";
           tableData += rowData;
       });

       // Create a Blob object with the CSV data
       var blob = new Blob([tableData], { type: "text/csv" });

       // Create a link element
       var link = document.createElement("a");
       link.href = URL.createObjectURL(blob);
       link.download = "employers.csv";

       // Programmatically trigger the download
       link.click();
   });
  
</script>
<!-- jsPDF library -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>
<!-- html2canvas library -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>

        <!-- Include jQuery and simplePagination.js -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.min.js"></script>

<script>
function setupPagination() {
    var itemsPerPage = 5; // Adjust as needed
    var $tableBody = $('#employerTableBody');
    
    $tableBody.pagination({
        items: $tableBody.children('tr').length,
        itemsOnPage: itemsPerPage,
        cssStyle: 'light-theme',
        onPageClick: function(pageNumber) {
            var start = itemsPerPage * (pageNumber - 1);
            var end = start + itemsPerPage;
            $tableBody.children('tr').hide().slice(start, end).show();
        }
    });
}


</script>
        
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>


        <!-- seeker -->
        <!-- <script src="C:\Users\Aaaron\Desktop\jobportal\html\script.js"></script> -->
        <script src="/html/script.js"></script>

        <!--  -->
        <!-- External JS libraries -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <!-- Local JS file -->
        <!-- <script src="C:\Users\Aaaron\Desktop\jobportal\Admin new\script\script.js"></script> -->
        <script src="${pageContext.request.contextPath}/assets/js/admincontent.js"></script>
        <script src="/Admin new/script/script.js"></script>
</body>

</html>