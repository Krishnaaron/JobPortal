<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Panel</title>
<!-- Bootstrap CSS -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<!-- Boxicons CSS for icons -->
<link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
	rel="stylesheet">
	<script src="https://code.highcharts.com/highcharts.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/@mdi/font/css/materialdesignicons.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<!-- Custom CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/adminDash.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

</head>

<%

   response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//http 1.1
   response.setHeader("Pragma","no-cache");//http1.0
   response.setHeader("Expires","0");// Proxies
   
   if(session.getAttribute("admin")==null){
	   
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

	<div class="container mt-5">
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


		<div>
			

<div id="filterPanel" style="display: none;">
				<form id="filterForm">
					<div class="form-action">
						<label for="filterCondition">Filter Condition:</label> <select
							id="filterCondition">
							<option value=""></option>
							<option value="lessthan">Less than</option>
							<option value="greaterthan">Greater than</option>
							<option value="equal">Equal</option>
						</select>
					</div>
					<div class="form-action">
						<label for="chartType">Choose chart type:</label> <select
							id="chartType">
							<option value="pie">Pie Chart</option>
							<option value="bar">Bar Chart</option>
							<option value="line">Line Chart</option>
							<option value="area">Area Chart</option>
						</select>
					</div>
					<div class="form-action">
						<label for="filterValue">Filter Value:</label> <input
							type="number" id="filterValue">
					</div>
					<button type="button" id="applyFilter">Apply Filter</button>
				</form>
			</div>

		</div>
		<div class="row chart-container">
			<div class="col-lg-5 col-md-12 chart">

				<div id="m1"></div>
				
			</div>
			<div class="col-lg-5 col-md-12 chart">
				<div>
					<label for="chartTypes">Choose chart type:</label> <select
						id="chartTypes">
						<option value="pie">3D Pie Chart</option>
						<option value="bar">3D Bar Chart</option>
						<option value="line">3D Line Chart</option>
					</select>
				</div>
				<div id="m2"></div>
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

	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/admin.js"></script>

	
	<script>
        // Static data
        const staticData = {
            numberOfEmployers: ${employe},
            numberOfJobSeekers : ${seekerSize},
            numberOfJobs: ${jobSize},
            numberOfApplications: ${jobApplicationSize}
        };

        // Initialize the chart with static data
        function initializeChart(type, data) {
            Highcharts.chart('m1', {
                chart: {
                    type: type
                },navigation: {
                    buttonOptions: {
                        theme: {
                            style: {
                                fontSize: '10px',
                                color: '#888'
                                	 
                            },
                            states: {
                                hover: {
                                    style: {
                                        color: '#000'
                                    }
                                }
                            }
                        },
                        useHTML: true
                    }
                },

                exporting: {
                    buttons: {
                        contextButton: {
                            enabled: false
                        },
                        
                            tableButton : {
                            	text: '<i class="fa fa-table" aria-hidden="true"></i>',
                            
                            onclick: function() {
                              if (this.dataTableDiv && this.dataTableDiv.style.display !== 'none') {
                                this.dataTableDiv.style.display = 'none';
                              } else {
                                this.viewData();
                                this.dataTableDiv.style.display = '';
                              }
                            }
                          },
                        filterButton: {
                        	text :'<i class="fa fa-filter"></i>',
                        		 onclick: function () {
                                     const filterPanel = document.getElementById('filterPanel');
                                     filterPanel.style.display = filterPanel.style.display === 'none' ? 'block' : 'none';
                                 }
                        },
                        
                      
                        
                        exportButton: {
                            text: '<i class="fa fa-download"></i>',
                            // Use only the download related menu items from the default
                            // context button
                            menuItems: [
                                'downloadPNG',
                                'downloadJPEG',
                                'downloadPDF',
                                'downloadSVG'
                            ]
                        },
                        printButton: {
                            text: '<i class="fa fa-print"></i>',
                            onclick: function () {
                                this.print();
                            }
                        }
                        
                        
                    }
                },
                title: {
                    text: 'Job Portal Data'
                },
                credits: {
                    enabled: false
                },
                xAxis: type === 'pie' ? undefined : { categories: ['Employers', 'Job Seekers', 'Jobs', 'Applications'] },
                yAxis: type === 'pie' ? undefined : { title: { text: 'Count' } },
                series: [{
                    name: 'Counts',
                    data: type === 'pie' ? [
                        ['Employers', data.numberOfEmployers],
                        ['Job Seekers', data.numberOfJobSeekers],
                        ['Jobs', data.numberOfJobs],
                        ['Applications', data.numberOfApplications]
                    ] : [
                        { name: 'Employers', y: data.numberOfEmployers },
                        { name: 'Job Seekers', y: data.numberOfJobSeekers },
                        { name: 'Jobs', y: data.numberOfJobs },
                        { name: 'Applications', y: data.numberOfApplications }
                    ],
                    colorByPoint: type === 'pie'
                }],
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '{point.name}: {point.y}'
                        }
                    },
                    bar: {
                        dataLabels: {
                            enabled: true
                        }
                    },
                    line: {
                        dataLabels: {
                            enabled: true
                        }
                    }
                }
            });
        }

        document.getElementById('applyFilter').addEventListener('click', function() {
            const filterCondition = document.getElementById('filterCondition').value;
            const filterValue = document.getElementById('filterValue').value;
            const chartType =document.getElementById('chartType').value;
            // You can add logic here to filter data based on the selected condition and value
            console.log(filterCondition);
            console.log(filterValue );
            
            
           
                initializeChart(chartType, staticData);
          
            // Re-render chart with new filter logic if needed
            // initializeChart(currentChartType, filteredData);
        });

        // Handle chart type selection
       

        // Initial chart load
        initializeChart('pie', staticData);  // Default to pie chart
        
        $('#logout-link').click(function () {
            $('#logoutModal').modal('show');
        });

        $('#confirmLogout').click(function () {
            window.location.href = "AdminLogOut";
        });
    </script>

	<script>
        // Static data
        const staticDatas = {
        		   numberOfEmployers: ${employe},
                   numberOfJobSeekers: ${seekerSize},
                   numberOfJobs: ${jobSize},
                   numberOfApplications: ${jobApplicationSize}
        };

        // Initialize the chart with static data
        function initializeChart3D(type, data) {
            Highcharts.chart('m2', {
                chart: {
                    type: type,
                    options3d: {
                        enabled: true,
                        alpha: 10,
                        beta: 25,
                        depth: 250
                    }
                },
                title: {
                    text: 'Job Portal Data'
                },
                xAxis: type === 'pie' ? undefined : { categories: ['Employers', 'Job Seekers', 'Jobs', 'Applications'] },
                yAxis: type === 'pie' ? undefined : { title: { text: 'Count' } },
                series: [{
                    name: 'Counts',
                    data: type === 'pie' ? [
                        ['Employers', data.numberOfEmployers],
                        ['Job Seekers', data.numberOfJobSeekers],
                        ['Jobs', data.numberOfJobs],
                        ['Applications', data.numberOfApplications]
                    ] : [
                        { name: 'Employers', y: data.numberOfEmployers },
                        { name: 'Job Seekers', y: data.numberOfJobSeekers },
                        { name: 'Jobs', y: data.numberOfJobs },
                        { name: 'Applications', y: data.numberOfApplications }
                    ],
                    colorByPoint: type === 'pie'
                }],
                plotOptions: {
                    pie: {
                        innerSize: 100,
                        depth: 150,
                        dataLabels: {
                            enabled: true,
                            format: '{point.name}: {point.y}'
                        }
                    },
                    bar: {
                        depth: 100,
                        dataLabels: {
                            enabled: true
                        }
                    },
                    line: {
                        depth: 100,
                        dataLabels: {
                            enabled: true
                        }
                    }
                }
            });
        }

        // Handle chart type selection
        document.getElementById('chartTypes').addEventListener('change', function() {
            initializeChart3D(this.value, staticDatas);
        });

        // Initial chart load
        initializeChart3D('line', staticDatas);  // Default to 3D pie chart
    </script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/highcharts-3d.js"></script>
	<script src="https://code.highcharts.com/modules/3d-pie.js"></script>
	<script src="https://code.highcharts.com/modules/3d-column.js"></script>
</body>

</html>
