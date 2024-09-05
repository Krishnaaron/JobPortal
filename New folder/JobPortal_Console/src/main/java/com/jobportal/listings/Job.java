package com.jobportal.listings;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Collectors;

import com.consolecolors.ConsoleColors;
import com.jdbcservice.JdbcConnection;
import com.jobportal.users.Employer;
import com.userdefiendexception.CharachterSequenceException;
import com.userdefiendexception.JobIdAlreadyExistsException;
import com.userdefiendexception.NumberException;
import com.userdefiendexception.OptionException;
import com.userdefiendexception.Validation;

public class Job {
	private int jobId;
	private int employerId;
	private String jobTitle;
	private String jobDescription;
	private String location;
	private String requiredSkills;
	private String jobType;
	private String experienceLevel;
	private String applicationDeadline;
	private int numberOfOpenings;
	private String companyName;
	

	private String jobstatus;
	

	public String getJobstatus() {
		return jobstatus;
	}

	public void setJobstatus(String jobstatus) {
		this.jobstatus = jobstatus;
	}

	
	static Scanner sc = new Scanner(System.in);

	// Constructors

	public Job(int employerId, String jobTitle, String jobDescription, String location, String requiredSkills,
			String jobType, String experienceLevel, String applicationDeadline2, int numberOfOpenings) {

		this.employerId = employerId;
		this.jobTitle = jobTitle;
		this.jobDescription = jobDescription;
		this.location = location;
		this.requiredSkills = requiredSkills;
		this.jobType = jobType;
		this.experienceLevel = experienceLevel;
		this.applicationDeadline = applicationDeadline2;
		this.numberOfOpenings = numberOfOpenings;
	}

	public Job(int employerId, String companyName, String jobTitle, String jobDescription, String location, String requiredSkills, String jobType, String experienceLevel, String applicationDeadline, int numberOfOpenings) {
		this.employerId = employerId;
		this.companyName=companyName;
		this.jobTitle = jobTitle;
		this.jobDescription = jobDescription;
		this.location = location;
		this.requiredSkills = requiredSkills;
		this.jobType = jobType;
		this.experienceLevel = experienceLevel;
		this.applicationDeadline = applicationDeadline;
		this.numberOfOpenings = numberOfOpenings;
		// TODO Auto-generated constructor stub
	}

	public Job(int jobId, String jobTitle, String jobDescription, String location, String requiredSkills,
			String jobType, String experienceLevel, String applicationDeadline, int numberOfOpenings,
			String job_status,String companyName) {

		
		this.jobId = jobId;
		this.jobTitle = jobTitle;
		this.jobDescription = jobDescription;
		this.location = location;
		this.requiredSkills = requiredSkills;
		this.jobType = jobType;
		this.jobstatus=job_status;
		this.experienceLevel = experienceLevel;
		this.applicationDeadline = applicationDeadline;
		this.numberOfOpenings = numberOfOpenings;
		this.companyName=companyName;
		
		
		
		// TODO Auto-generated constructor stub
	}

	

	public Job() {
		// TODO Auto-generated constructor stub
	}

	Timestamp jobPosted; // New field for job posted date

    public Job(int jobId, String companyName, String jobTitle, String jobDescription, String location, 
               String requiredSkills, String jobType, String experienceLevel, String applicationDeadline, 
               int numberOfOpenings, String jobStatus, Timestamp jobPosted) {
        this.jobId = jobId;
        this.companyName = companyName;
        this.jobTitle = jobTitle;
        this.jobDescription = jobDescription;
        this.location = location;
        this.requiredSkills = requiredSkills;
        this.jobType = jobType;
        this.experienceLevel = experienceLevel;
        this.applicationDeadline = applicationDeadline;
        this.numberOfOpenings = numberOfOpenings;
        this.jobstatus = jobStatus;
        this.jobPosted = jobPosted; // Initialize the new field
    }
	// Getters and setters
	public int getJobId() {
		return jobId;
	}

	public void setJobId(int jobId) {
		this.jobId = jobId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public int getEmployerId() {
		return employerId;
	}

	public void setEmployerId(int employerId) {
		this.employerId = employerId;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public String getJobDescription() {
		return jobDescription;
	}

	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getRequiredSkills() {
		return requiredSkills;
	}

	public void setRequiredSkills(String requiredSkills) {
		this.requiredSkills = requiredSkills;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getExperienceLevel() {
		return experienceLevel;
	}

	public void setExperienceLevel(String experienceLevel) {
		this.experienceLevel = experienceLevel;
	}

	public String getApplicationDeadline() {
		return applicationDeadline;
	}

	public void setApplicationDeadline(String applicationDeadline) {
		this.applicationDeadline = applicationDeadline;
	}

	public int getNumberOfOpenings() {
		return numberOfOpenings;
	}

	public void setNumberOfOpenings(int numberOfOpenings) {
		this.numberOfOpenings = numberOfOpenings;
	}
	/**
	 * Manages job-related operations for a given employer.
	 * This method allows the employer to post new jobs, view existing jobs, edit job details,
	 * go back to the employer menu, or exit the system.
	 * @param emp The employer for whom the job management operations are performed.
	 * @throws ClassNotFoundException Thrown when the JDBC driver class is not found.
	 * @throws OptionException Thrown when an invalid menu option is entered.
	 * @throws JobIdAlreadyExistsException Thrown when a job with the same ID already exists.
	 * @throws NumberException Thrown when an invalid number is entered.
	 */
	public void jobManagement(Employer emp)
			throws ClassNotFoundException, OptionException, JobIdAlreadyExistsException, NumberException {
		try {
			// Establishing a database connection
			Connection con = JdbcConnection.connectdatabase();
			boolean flags = true;
			do {
				
				// Displaying the job management menu
				System.out.println("+------------------------------------+");
				System.out.println("|              Job Menu              |");
				System.out.println("+------------------------------------+");
				System.out.println("| 1. Post New Jobs                   |");
				System.out.println("| 2. Posted Jobs                     |");
				System.out.println("| 3. Edit Job Details                |");
				System.out.println("| 4. Back                            |");
				System.out.println("| 5. Exit                            |");
				System.out.println("+------------------------------------+");

				int option = 0;
				// Validating user input for menu option
				while (true) {
					System.out.print(ConsoleColors.CYAN+"Enter menu option number: "+ConsoleColors.RESET);
					String input = sc.next();

					try {
						option = Validation.validateOption(input);
						break;
					} catch (OptionException e) {
						System.out.println(ConsoleColors.YELLOW+e.getMessage()+ConsoleColors.RESET);
					}
				}
				switch (option) {
				case 1: {
					// Posting a new job
					System.out.println("**********************************************");

					System.out.println("post your job ");

					System.out.println("**********************************************");

					sc.nextLine();
					String title;
					// Validating job title input
					while (true) {
						System.out.println(ConsoleColors.CYAN+"Enter The Job Title :"+ConsoleColors.RESET);
						title = sc.nextLine();
						try {
							if (!Validation.ValidateCharacterSequences(title)) {
								continue;
							} else {
								break;
							}
						} catch (CharachterSequenceException e) {
						
							System.out.println(ConsoleColors.YELLOW+e.getMessage()+ConsoleColors.RESET);
						}
					}

					String jobDescription;
					while (true) {
						System.out.println(ConsoleColors.CYAN+"Enter The JobDescription :"+ConsoleColors.RESET);
						jobDescription = sc.nextLine();
						try {
							if (!Validation.ValidateCharacterSequences(jobDescription)) {
								continue;
							} else {
								break;
							}
						} catch (CharachterSequenceException e) {
							// TODO Auto-generated catch block
							System.out.println(ConsoleColors.YELLOW+e.getMessage()+ConsoleColors.RESET);
						}
					}

					String location;

					while (true) {
						System.out.println(ConsoleColors.CYAN+"Enter The Location :"+ConsoleColors.RESET);
						location = sc.nextLine();
						try {
							if (!Validation.ValidateCharacterSequences(location)) {
								continue;
							} else {
								break;
							}
						} catch (CharachterSequenceException e) {
							//
							System.out.println(ConsoleColors.YELLOW+e.getMessage()+ConsoleColors.RESET);
						}
					}

					String requiredSkills;
					;
					while (true) {
						System.out.println(ConsoleColors.CYAN+"Enter The RequiredSkills :"+ConsoleColors.RESET);
						requiredSkills = sc.nextLine();
						try {
							if (!Validation.ValidateCharacterSequences(requiredSkills)) {
								continue;
							} else {
								break;
							}
						} catch (CharachterSequenceException e) {
					
							System.out.println(e.getMessage());
						}
					}
					String jobType;
					while (true) {
					    System.out.println(ConsoleColors.CYAN + "Enter The Job Type: [Full time or part time or Intern]" + ConsoleColors.RESET);
					    jobType = sc.nextLine().toLowerCase(); // Convert input to lowercase
					    if (!Validation.isValidJobType(jobType)) {
					        System.out.println(ConsoleColors.YELLOW + "Invalid Job Type! Please enter 'Full Time', 'Part Time', or 'Intern'." + ConsoleColors.RESET);
					        continue;
					    } else {
					        break;
					    }
					}


					System.out.println(ConsoleColors.CYAN + "Enter The Experience Level: " + ConsoleColors.RESET);
					String experienceLevel;
					while (true) {
					    experienceLevel = sc.nextLine();
					    if (Validation.experienceLevel(experienceLevel) != -1) {
					        // If the experience level is valid (not equal to -1), break out of the loop
					        break;
					    } else {
					        // If the experience level is invalid (-1), display an error message and prompt again
					        System.out.println(ConsoleColors.YELLOW + "Invalid experience level. Please enter a value between 1 and 60." + ConsoleColors.RESET);
					    }
					}

					SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
					sdf.setLenient(false);

					while (true) {
						System.out.println(ConsoleColors.CYAN+"Application Deadline: Enter the date (dd-MM-yyyy)"+ConsoleColors.RESET);
						applicationDeadline = sc.nextLine();

						try {
							Date date = sdf.parse(applicationDeadline);
							if (date.after(new Date())) {
								break;
							} else {
								System.out.println(ConsoleColors.RED+"The date must be in the future. Please enter a future date."+ConsoleColors.RESET);
							}
						} catch (ParseException e) {
							System.out.println(ConsoleColors.YELLOW+"Invalid date format. Please enter the date in the format dd-MM-yyyy."+ConsoleColors.RESET);
						}
					}
					int numberOfOpenings =0;
					boolean isValid = false;
					
					while (!isValid) {
			            try {
			                System.out.println(ConsoleColors.CYAN+"Number of Openings :"+ConsoleColors.RESET);
			                String input = sc.nextLine();

			                // Check if the input is a number
			                try {
			                    numberOfOpenings = Integer.parseInt(input);
			                } catch (NumberFormatException e) {
			                    throw new NumberException(ConsoleColors.YELLOW+"Invalid input. Please enter a valid number."+ConsoleColors.RESET);
			                }

			                // Validate the number
			                if (Validation.validateNumberOfOpenings(numberOfOpenings)) {
			                    isValid = true;
			                }
			            } catch (NumberException e) {
			                System.out.println(ConsoleColors.YELLOW+e.getMessage()+ConsoleColors.RESET);
			            }
			        }

					int c = emp.getId();
					String companyName=emp.getCompanyName();
					//System.out.println(companyName);
					postNewJob(con, new Job(c,companyName, title, jobDescription, location, requiredSkills, jobType,
							experienceLevel, applicationDeadline, numberOfOpenings));

					break;
				}

				case 2: {
					// Viewing all posted jobs
					System.out.println(ConsoleColors.BLUE+"View all the job : "+ConsoleColors.RESET);
					viewJobs(con, emp);
					break;

				}
				case 3: {
					// Updating job information
					updateJobInformation(emp.getId());
					break;

				}

				case 4: {
					// Going back to employer menu
					emp.emoloyerMenu(emp);

					break;
				}
				case 5: {
					// Exiting the job portal
					System.out.println(ConsoleColors.PURPLE+"Thank you for using Job Portal!  Have a great day!"+ConsoleColors.RESET);
					System.exit(0);

				}
				default: {
					// Handling invalid input
					 System.out.println(ConsoleColors.RED+"Invalid choice. Please try again !"+ConsoleColors.RESET);

				}

				}

			} while (flags);

		} catch (SQLException e) {
			// Handling SQL exceptions
			e.printStackTrace();
		}
	}
	/**
	 * Inserts a new job into the database.
	 * This method takes a Connection object and a Job object as parameters,
	 * and inserts the job information into the database using JDBC.
	 * After insertion, it prints a success message with the generated job ID,
	 * or an error message if the job posting fails.
	 * @param con The Connection object representing the database connection.
	 * @param job The Job object containing the details of the job to be posted.
	 */

	public static void postNewJob(Connection con, Job job) {
		try {
			// Use JDBC to insert the job information into the database
			String sql = "INSERT INTO jobs (job_id, employer_id, job_title, job_description, location, required_skills, job_type, experience_level, application_deadline, number_of_openings,COMPANY_NAME) VALUES (job_seq.NEXTVAL,?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement insertStatement = con.prepareStatement(sql, new String[] { "job_id" });

			// Set the parameters for the INSERT statement
			insertStatement.setInt(1, job.getEmployerId());
			
			insertStatement.setString(2, job.getJobTitle());
			insertStatement.setString(3, job.getJobDescription());
			insertStatement.setString(4, job.getLocation());
			insertStatement.setString(5, job.getRequiredSkills());
			insertStatement.setString(6, job.getJobType());
			insertStatement.setString(7, job.getExperienceLevel());
			insertStatement.setString(8, job.getApplicationDeadline());
			insertStatement.setInt(9, job.getNumberOfOpenings());
			insertStatement.setString(10, job.getCompanyName());

			// Execute the INSERT statement
			int rowsInserted = insertStatement.executeUpdate();

			if (rowsInserted > 0) {
				// Retrieve the generated keys (job ID)
				ResultSet generatedKeys = insertStatement.getGeneratedKeys();
				if (generatedKeys.next()) {
					int jobId = generatedKeys.getInt(1);
					System.out.println(ConsoleColors.GREEN+"Job posted successfully. Job ID : " + jobId+ConsoleColors.RESET);
				} else {
					System.out.println(ConsoleColors.RED+"Failed to retrieve job ID."+ConsoleColors.RESET);
				}
			} else {
				System.out.println(ConsoleColors.RED+"Failed to post job."+ConsoleColors.RESET);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * Checks if a job ID exists in the database.
	 * This method takes a job ID as parameter, queries the database to check if any job exists with the given ID,
	 * and returns a boolean indicating whether the job ID exists or not.
	 * @param job_id The job ID to check for existence.
	 * @return true if the job ID exists in the database, false otherwise.
	 * @throws SQLException Thrown when an SQL exception occurs.
	 * @throws ClassNotFoundException Thrown when the JDBC driver class is not found.
	 */
	public static boolean isJobIdExists(int job_id) throws SQLException, ClassNotFoundException {
		Connection con = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		boolean exists = false;
		try {
			 // Establish database connection
			con = JdbcConnection.connectdatabase();
			// SQL query to count rows with the given job ID
			String query = "SELECT COUNT(*) AS count FROM jobs WHERE job_id = ?";
			statement = con.prepareStatement(query);
			statement.setInt(1, job_id);
			// Execute query and retrieve result set
			resultSet = statement.executeQuery();
			resultSet.next(); // Move cursor to first row
			int count = resultSet.getInt("count");
			  // Set exists to true if count is greater than 0
			exists = (count > 0);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return exists;
	}

	/**
	 * Retrieves and displays the jobs posted by a specific employer.
	 * This method takes a database Connection object and the employer's ID as parameters,
	 * queries the database to retrieve the jobs posted by the employer,
	 * and prints the details of each job.
	 * @param con The Connection object representing the database connection.
	 * @param employee_id The ID of the employer whose posted jobs are to be viewed.
	 */
	public  void viewJobs(Connection con, int employee_id) {
	    try {
	        String sql = "SELECT * FROM jobs WHERE EMPLOYER_ID = ?";
	        PreparedStatement statement = con.prepareStatement(sql);
	        statement.setInt(1, employee_id);
	        ResultSet rs = statement.executeQuery();

	        if (!rs.isBeforeFirst()) {
	            System.out.println(ConsoleColors.YELLOW + "You Have Not Posted Any Jobs" + ConsoleColors.RESET);
	        } else {
	            // Printing table header
	            System.out.println("+-------+----------------------+------------------+-------------------+---------------------+---------------------+-----------------------+------------+");
	            System.out.println("| JobID |       Job Title      |     Location     |  Required Skills  |      Job Type       | Application Deadline|    Job Posted Date    |  Job Status|");
	            System.out.println("+-------+----------------------+------------------+-------------------+---------------------+---------------------+-----------------------+------------+");

	            // Printing each job's details
	            while (rs.next()) {
	                int jobId = rs.getInt("job_id");
	                String jobTitle = rs.getString("job_title");
	                String location = rs.getString("location");
	                String requiredSkills = rs.getString("required_skills");
	                String jobType = rs.getString("job_type");
	                String applicationDeadline = rs.getString("application_deadline");
	                Timestamp jobPosted = rs.getTimestamp("job_posted");
	                String jobStatus = rs.getString("Job_status");

	                System.out.printf("| %-5d | %-20s | %-16s | %-17s | %-19s | %-19s | %-21s | %-10s |%n",
	                        jobId, jobTitle, location, requiredSkills, jobType, applicationDeadline, jobPosted, jobStatus);
	            }

	            // Printing table footer
	            System.out.println("+-------+----------------------+------------------+-------------------+---------------------+---------------------+-----------------------+------------+");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); // or handle the exception as needed
	    }
	}


	/**
	 * Displays the jobs posted by a specific employer, with options to filter and sort the jobs.
	 * This method takes a database Connection object and an Employer object as parameters,
	 * queries the database to retrieve the jobs posted by the employer,
	 * and provides options to view all jobs, active jobs, or inactive jobs.
	 * It also allows sorting the jobs by job ID in descending order.
	 * @param con The Connection object representing the database connection.
	 * @param em The Employer object whose posted jobs are to be viewed.
	 * @throws ClassNotFoundException Thrown when the JDBC driver class is not found.
	 * @throws OptionException Thrown when an invalid menu option is entered.
	 * @throws JobIdAlreadyExistsException Thrown when a job with the same ID already exists.
	 * @throws NumberException Thrown when an invalid number is entered.
	 */
	
	public static void viewJobs(Connection con, Employer em) throws ClassNotFoundException, OptionException, JobIdAlreadyExistsException, NumberException {
        try {
        	// SQL query to select jobs posted by the specified employer
            String sql = "SELECT * FROM jobs WHERE EMPLOYER_ID = ?";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, em.getId());
            ResultSet rs = statement.executeQuery();

            List<Job> jobs = new ArrayList<>();

           

            // Collecting all results into a list of Job objects
            while (rs.next()) {
            	// Retrieve job details from the result set
                int jobId = rs.getInt("job_id");
                String companyName = rs.getString("COMPANY_NAME");
                String jobTitle = rs.getString("job_title");
                String jobDescription = rs.getString("job_description");
                String location = rs.getString("location");
                String requiredSkills = rs.getString("required_skills");
                String jobType = rs.getString("job_type");
                String experienceLevel = rs.getString("experience_level");
                String applicationDeadline = rs.getString("application_deadline");
                int numberOfOpenings = rs.getInt("number_of_openings");
                String jobStatus = rs.getString("Job_status");
                Timestamp jobPosted = rs.getTimestamp("job_posted");
             // Create a Job object and add it to the list
                jobs.add(new Job(jobId, companyName, jobTitle, jobDescription, location, requiredSkills, jobType,
                        experienceLevel, applicationDeadline, numberOfOpenings, jobStatus, jobPosted));
            }
         // Check if the employer has posted any jobs
            if (jobs.isEmpty()) {
                System.out.println(ConsoleColors.YELLOW + "You have not posted any jobs" + ConsoleColors.RESET);
            } else {
                // Filtering jobs based on the selected option
            	do {
                List<Job> filteredJobs = null;
                System.out.println("+------------------------------------+");
				System.out.println("|              Job Menu              |");
				System.out.println("+------------------------------------+");
				System.out.println("| 1. View All jobs                   |");
				System.out.println("| 2. View Active jobs                |");
				System.out.println("| 3. View inactive jobs              |");
				System.out.println("| 4. Back                            |");
				System.out.println("| 5. Exit                            |");
				System.out.println("+------------------------------------+");
                int option;
                while (true) {
					System.out.print(ConsoleColors.CYAN+"Enter menu option number: "+ConsoleColors.RESET);
					String input = sc.next();

					try {
						option = Validation.validateOption(input);
						break;
					} catch (OptionException e) {
						System.out.println(ConsoleColors.YELLOW+e.getMessage()+ConsoleColors.RESET);
					}
				}
                switch (option) {
                    case 1: // View all jobs
                        filteredJobs = jobs;
                        break;
                    case 2: // View active jobs
                        filteredJobs = jobs.stream()
                                .filter(job -> job.jobstatus.equalsIgnoreCase("Active")) // Modify according to your job status criteria
                                .collect(Collectors.toList());
                        break;
                    case 3: // View inactive jobs
                        filteredJobs = jobs.stream()
                                .filter(job -> job.jobstatus.equalsIgnoreCase("Inactive")) // Modify according to your job status criteria
                                .collect(Collectors.toList());
                        break;
                    case 4:{
                    	// Back to employer menu
                    	new Job().jobManagement(em);
                    	break;
                    	
                    } 
                    case 5:{
                    	// Exit
                    	System.out.println(ConsoleColors.PURPLE+"Thank you for using Job Portal!  Have a great day!"+ConsoleColors.RESET);
    					System.exit(0);
    					break;
                    }
                    
                    default:
                        System.out.println("Invalid option.");
                        return;
                }
                

                // Sorting the list by jobId in descending order
                List<Job> sortedJobs = filteredJobs.stream()
                        .sorted((j1, j2) -> Integer.compare(j1.jobId, j2.jobId))
                        .collect(Collectors.toList());

                // Printing the table header
                String format = "| %-4s | %-7s | %-12s | %-15s | %-12s | %-15s | %-8s | %-15s | %-10s | %-10s | %-10s | %-19s |%n";
                System.out.format("+------+---------+--------------+-----------------+--------------+-----------------+----------+-----------------+------------+------------+------------+---------------------+%n");
                System.out.format("| S.No | Job ID  | Company Name | Job Title       | Location     | Required Skills | Job Type | Experience      | Deadline   | Openings   | Job Status | Job Posted          |%n");
                System.out.format("+------+---------+--------------+-----------------+--------------+-----------------+----------+-----------------+------------+------------+------------+---------------------+%n");

                
                // Printing each job's details in a table row with S.No
                int serialNumber = 1;
                for (Job job : sortedJobs) {
                    System.out.format(format, serialNumber++, job.jobId, job.companyName, job.jobTitle, job.location, job.requiredSkills,
                            job.jobType, job.experienceLevel, job.applicationDeadline, job.numberOfOpenings, job.jobstatus, job.jobPosted);
                }
                System.out.format("+------+---------+--------------+-----------------+--------------+-----------------+----------+-----------------+%n");
               // System.out.format("+------+---------+--------------+-----------------+--------------+-----------------+----------+-----------------");
            }while(true);
            }
        } catch (SQLException e) {
            System.out.println("An error occurred while retrieving the job details.");
            e.printStackTrace(); // Consider logging the exception in a real application
        }
	}
	/**
	 * Allows an employer to update information related to a specific job posting,
	 * such as title, description, location, skills, job type, experience level,
	 * application deadline, number of openings, and job status.
	 * This method takes the employer's ID as input, retrieves the jobs posted by that employer,
	 * and provides a menu to select the job and the type of information to update.
	 * It then prompts for the updated information and updates the corresponding fields in the database.
	 * @param employee_id The ID of the employer whose job information is to be updated.
	 * @throws SQLException Thrown when an error occurs while interacting with the database.
	 * @throws NumberException Thrown when an invalid number is entered.
	 */
	public static void updateJobInformation(int employee_id) throws SQLException, NumberException {
		try {
			Connection con = JdbcConnection.connectdatabase();

			boolean lap = true;
			do {
				// Displaying jobs posted by the employer
			new Job().viewJobs( con, employee_id);
				System.out.println("╔═══════════════════════════════╗");
				System.out.println("║   Job Modification Menu       ║");
				System.out.println("╠═══════════════════════════════╣");
				System.out.println("║ 1. Update job title           ║");
				System.out.println("║ 2. Update job description     ║");
				System.out.println("║ 3. Update job location        ║");
				System.out.println("║ 4. Update required skills     ║");
				System.out.println("║ 5. Update job type            ║");
				System.out.println("║ 6. Update experience level    ║");
				System.out.println("║ 7. Update application deadline║");
				System.out.println("║ 8. Update number of openings  ║");
				System.out.println("║ 9. Update Change Job status   ║");
				System.out.println("║ 10.Back                       ║");
				System.out.println("╚═══════════════════════════════╝");
				
				int option=0;
				// Prompting user to enter menu option
	            // Validating user input for menu option
					while (true) {
		            System.out.print(ConsoleColors.CYAN+"Enter menu option number: "+ConsoleColors.RESET);
		            String input = sc.next();

		            try {
		                option = Validation.validateOption(input);
		                break;
		            } catch (OptionException e) {
		                System.out.println(ConsoleColors.YELLOW+e.getMessage()+ConsoleColors.RESET);
		            }
		        }
					
				int job_id = 0;
				switch (option) {
				
				case 1: {
					/**
					 Update job title
                     Prompting for job ID
                     Validating job ID
                     Prompting for updated job title
                     Validating updated job title
                     Updating job title in the database
                     */

					String title;
                    while(true) {
                      System.out.println(ConsoleColors.CYAN+"Enter the job_Id :"+ConsoleColors.RESET);
						String id = sc.next();
						try {
							job_id = Validation.isValidJobId(id);
							
						break;
						}
						catch(NumberException e){
							System.out.println(ConsoleColors.YELLOW+e.getMessage()+ConsoleColors.RESET);
						}
							
						}
						
						
					
					while (true) {
						sc.nextLine();
						System.out.println(ConsoleColors.CYAN+"Enter The update Job Title :"+ConsoleColors.RESET);
						title = sc.nextLine();
						try {
							if (!Validation.ValidateCharacterSequences(title)) {
								continue;
							} else {
								break;
							}
						} catch (CharachterSequenceException e) {
							// TODO Auto-generated catch block
							System.out.println(ConsoleColors.YELLOW+e.getMessage()+ConsoleColors.RESET);
						}
					}
					updateJobTitle(con, job_id, title, employee_id);
					break;
				}
				case 2: {
					/**
					 Update job description
                     Prompting for job ID
                     Validating job ID
                     Prompting for updated job description
                     Validating updated job description
                     Updating job description in the database
                     */
//					System.out.println(ConsoleColors.CYAN+"Enter the job_Id :"+ConsoleColors.RESET);
//					job_id = sc.nextInt();
					 while(true) {
	                      System.out.println(ConsoleColors.CYAN+"Enter the job_Id :"+ConsoleColors.RESET);
							String id = sc.next();
							try {
								job_id = Validation.isValidJobId(id);
								
							break;
							}
							catch(NumberException e){
								System.out.println(ConsoleColors.YELLOW+e.getMessage()+ConsoleColors.RESET);
							}
								
							}
					
					String jobDescription;
					System.out.println(ConsoleColors.CYAN+"Enter The JobDescription :"+ConsoleColors.RESET);
					while (true) {
						sc.nextLine();
						jobDescription = sc.nextLine();
						try {
							if (!Validation.ValidateCharacterSequences(jobDescription)) {
								continue;
							} else {
								break;
							}
						} catch (CharachterSequenceException e) {
							// TODO Auto-generated catch block
							System.out.println(ConsoleColors.YELLOW+e.getMessage()+ConsoleColors.RESET);
						}

					
				}
					updatejobDescription(con, job_id, jobDescription, employee_id);
					break;
				}
				case 3: {
					/**
					 Update job location
                     Prompting for job ID
                     Validating job ID
                     Prompting for updated job location
                     Validating updated job location
                     Updating job location in the database
                     */
					while(true) {
	                      System.out.println(ConsoleColors.CYAN+"Enter the job_Id :"+ConsoleColors.RESET);
							String id = sc.next();
							try {
								job_id = Validation.isValidJobId(id);
								
							break;
							}
							catch(NumberException e){
								System.out.println(ConsoleColors.YELLOW+e.getMessage()+ConsoleColors.RESET);
							}
								
							}
					
					String location;

					while (true) {
						sc.nextLine();
						System.out.println(ConsoleColors.CYAN+"Enter The Location :"+ConsoleColors.RESET);
						location = sc.nextLine();
						try {
							if (!Validation.ValidateCharacterSequences(location)) {
								continue;
							} else {
								break;
							}
						} catch (CharachterSequenceException e) {
						
							System.out.println(ConsoleColors.YELLOW+e.getMessage()+ConsoleColors.RESET);
						}
					}

					updateJobLocation(con, job_id, location, employee_id);
					break;
				}
				case 4: {
					/**
					 Update required skills
                     Prompting for job ID
                     Validating job ID
                     Prompting for updated required skills
                     Validating updated required skills
                     Updating required skills in the database
                     */
					while(true) {
	                      System.out.println(ConsoleColors.CYAN+"Enter the job_Id :"+ConsoleColors.RESET);
							String id = sc.next();
							try {
								job_id = Validation.isValidJobId(id);
								
							break;
							}
							catch(NumberException e){
								System.out.println(ConsoleColors.YELLOW+e.getMessage()+ConsoleColors.RESET);
							}
								
							}
					String skill;
					while (true) {
						sc.nextLine();
						System.out.println(ConsoleColors.CYAN+"Enter The RequiredSkills :"+ConsoleColors.RESET);
						skill = sc.nextLine();
						try {
							if (!Validation.ValidateCharacterSequences(skill)) {
								continue;
							} else {
								break;
							}
						} catch (CharachterSequenceException e) {
							// TODO Auto-generated catch block
							System.out.println(ConsoleColors.YELLOW+e.getMessage()+ConsoleColors.RESET);
						}
					}
					
					updateRequiredSkills(con, job_id, skill, employee_id);
					break;
				}
				case 5: {
					/**
					 Update job type
                     Prompting for job ID
                     Validating job ID
                     Prompting for updated job type
                     Validating updated job type
                     Updating job type in the database
                     */
					while(true) {
	                      System.out.println(ConsoleColors.CYAN+"Enter the job_Id :"+ConsoleColors.RESET);
							String id = sc.next();
							try {
								job_id = Validation.isValidJobId(id);
								
							break;
							}
							catch(NumberException e){
								System.out.println(ConsoleColors.YELLOW+e.getMessage()+ConsoleColors.RESET);
							}
								
							}
					
					String jobType;
					while (true) {
						sc.nextLine();
						System.out.println(ConsoleColors.CYAN+"Enter The JobType :[Full time or part time or Intern]"+ConsoleColors.RESET);
						jobType = sc.nextLine();
						if (!Validation.isValidJobType(jobType)) {
							 System.out.println(ConsoleColors.YELLOW + "Invalid Job Type! Please enter 'Full Time', 'Part Time', or 'Intern'." + ConsoleColors.RESET);
							continue;
						} else {
							break;
						}
					}

					updateJobType(con, job_id, jobType, employee_id);
					break;
				}
				case 6: {
					/**
					 Update experience level
                     Prompting for job ID
                     Validating job ID
                     Prompting for updated experience level
                     Validating updated experience level
                     Updating experience level in the database
                     */
					while(true) {
	                      System.out.println(ConsoleColors.CYAN+"Enter the job_Id :"+ConsoleColors.RESET);
							String id = sc.next();
							try {
								job_id = Validation.isValidJobId(id);
								
							break;
							}
							catch(NumberException e){
								System.out.println(ConsoleColors.YELLOW+e.getMessage()+ConsoleColors.RESET);
							}
								
							}
					
					
					String experience;
					while (true) {
						sc.nextLine();
						System.out.println(ConsoleColors.CYAN + "Enter The Experience Level: " + ConsoleColors.RESET);
					    experience = sc.nextLine();
					    if (Validation.experienceLevel(experience) != -1) {
					        // If the experience level is valid (not equal to -1), break out of the loop
					        break;
					    } else {
					        // If the experience level is invalid (-1), display an error message and prompt again
					        System.out.println(ConsoleColors.YELLOW + "Invalid experience level. Please enter a value between 1 and 60." + ConsoleColors.RESET);
					    }
					}
					updateExperienceLevel(con, job_id, experience, employee_id);
					break;
				}
				case 7: {
					/**
					 Update application deadline
                     Prompting for job ID
                     Validating job ID
                     Prompting for updated application deadline
                     Validating updated application deadline
                     Updating application deadline in the database
                     */
					while(true) {
	                      System.out.println(ConsoleColors.CYAN+"Enter the job_Id :"+ConsoleColors.RESET);
							String id = sc.next();
							try {
								job_id = Validation.isValidJobId(id);
								
							break;
							}
							catch(NumberException e){
								System.out.println(ConsoleColors.YELLOW+e.getMessage()+ConsoleColors.RESET);
							}
								
							}
					

					String applicationDeadline;

					SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
					sdf.setLenient(false);

					while (true) {
						sc.nextLine();
						System.out.println(ConsoleColors.CYAN+"Application Deadline: Enter the date (dd-MM-yyyy)"+ConsoleColors.RESET);
						applicationDeadline = sc.nextLine();

						try {
							Date date = sdf.parse(applicationDeadline);
							if (date.after(new Date())) {
								break;
							} else {
								System.out.println(ConsoleColors.YELLOW+"The date must be in the future. Please enter a future date."+ConsoleColors.RESET);
							}
						} catch (ParseException e) {
							System.out.println(ConsoleColors.RED+"Invalid date format. Please enter the date in the format dd-MM-yyyy."+ConsoleColors.RESET);
						}
					}

					updateApplicationDeadLine(con, job_id, applicationDeadline, employee_id);
					break;
				}
				case 8: {
					/**
					 Update number of openings
                     Prompting for job ID
                     Validating job ID
                     Prompting for updated number of openings
                     Validating updated number of openings
                     Updating number of openings in the database
                     */
					while(true) {
	                      System.out.println(ConsoleColors.CYAN+"Enter the job_Id :"+ConsoleColors.RESET);
							String id = sc.next();
							try {
								job_id = Validation.isValidJobId(id);
								
							break;
							}
							catch(NumberException e){
								System.out.println(ConsoleColors.YELLOW+e.getMessage()+ConsoleColors.RESET);
							}
								
							}
					 int numberOfOpenings =0;
					
					boolean isValid=false;
					
					while (!isValid) {
			            try {
			                System.out.println(ConsoleColors.CYAN+"Enter Number of Openings :"+ConsoleColors.RESET);
			                String input = sc.nextLine();

			                // Check if the input is a number
			                try {
			                    numberOfOpenings = Integer.parseInt(input);
			                } catch (NumberFormatException e) {
			                    throw new NumberException(ConsoleColors.YELLOW+"Invalid input. Please enter a valid number."+ConsoleColors.RESET);
			                }

			                // Validate the number
			                if (Validation.validateNumberOfOpenings(numberOfOpenings)) {
			                    isValid = true;
			                }
			            } catch (NumberException e) {
			                System.out.println(ConsoleColors.YELLOW+e.getMessage()+ConsoleColors.RESET);
			            }
			        }

					updateNumberOfOpenigs(con, job_id,numberOfOpenings, employee_id);
					break;
				}
				case 9: {
					/**
					 Update job status
                     Prompting for job ID
                     Validating job ID
                     Updating job status in the database
                     */
					while(true) {
	                      System.out.println(ConsoleColors.CYAN+"Enter the job_Id :"+ConsoleColors.RESET);
							String id = sc.next();
							try {
								job_id = Validation.isValidJobId(id);
								
							break;
							}
							catch(NumberException e){
								System.out.println(ConsoleColors.YELLOW+e.getMessage()+ConsoleColors.RESET);
							}
								
							}
					
					updateJobStatus(job_id,employee_id);
					break;
					

				}
				case 10: {
					// Back
					lap = false;

					break;

				}
				default: {
					System.out.println(ConsoleColors.RED+"Enter The Correct Option :"+ConsoleColors.RESET);
					updateJobInformation(employee_id);

				}

				}
				
			} while (lap);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());

		}

	}
	/**
	 * Updates the title of a job posting in the database.
	 * @param con The connection to the database.
	 * @param job_id The ID of the job to be updated.
	 * @param jobTitle The new title of the job.
	 * @param employer_id The ID of the employer who posted the job.
	 * @throws SQLException Thrown when an error occurs while interacting with the database.
	 */
	public static void updateJobTitle(Connection con, int job_id, String jobTitle, int employer_id)
			throws SQLException {
		try {
			// SQL query to update job title
			String sql = "UPDATE JOBS SET JOB_TITLE = ? WHERE JOB_ID = ? AND employer_id = ?";
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, jobTitle);
			statement.setInt(2, job_id);
			statement.setInt(3, employer_id);
			// Executing the SQL query
			int rs = statement.executeUpdate();
			// Checking if the update was successful
			if (rs > 0) {
				System.out.println(ConsoleColors.GREEN+"Job With ID " + job_id + " Updated Successfully."+ConsoleColors.RESET);
			} else {
				System.out.println(ConsoleColors.RED+"Failed To Update Job With ID " + job_id + "."+ConsoleColors.RESET);
			}
		} catch (SQLException e) {
			e.printStackTrace();// or handle the exception as needed
		}
	}
	/**
	 * Updates the description of a job posting in the database.
	 * @param con The connection to the database.
	 * @param job_id The ID of the job to be updated.
	 * @param jobDescription The new description of the job.
	 * @param employer_id The ID of the employer who posted the job.
	 * @throws SQLException Thrown when an error occurs while interacting with the database.
	 */
	public static void updatejobDescription(Connection con, int job_id, String jobDescription, int employer_id)
			throws SQLException {

		try {
			// SQL query to update job description
			String sql = "UPDATE JOBS SET JOB_DESCRIPTION = ?  WHERE JOB_ID = ? AND employer_id = ?";
			// Setting parameters for the SQL query
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, jobDescription);
			statement.setInt(2, job_id);
			statement.setInt(3, employer_id);
			// Executing the SQL query
			int rs = statement.executeUpdate();
			// Checking if the update was successful
			if (rs > 0) {
				System.out.println(ConsoleColors.GREEN+"Job With ID " + job_id + " Updated Successfully."+ConsoleColors.RESET);
			} else {
				System.out.println(ConsoleColors.RED+"Failed To Update Job With ID " + job_id + "."+ConsoleColors.RESET);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
	/**

	Updates the location of a job in the database.
	@param con the database connection
	@param job_id the ID of the job to update
	@param location the new location of the job
	@param employer_id the ID of the employer who owns the job
	@throws SQLException if a database access error occurs
	*/
	public static void updateJobLocation(Connection con, int job_id, String location, int employer_id)
			throws SQLException {

		try {
			String sql = "UPDATE JOBS SET Location = ?  WHERE JOB_ID = ? AND employer_id = ?";
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, location);
			statement.setInt(2, job_id);
			statement.setInt(3, employer_id);

			int rs = statement.executeUpdate();

			if (rs > 0) {
				System.out.println(ConsoleColors.GREEN+"Job With ID " + job_id + " Updated Successfully."+ConsoleColors.RESET);
			} else {
				System.out.println(ConsoleColors.RED+"Failed To Update Job With ID " + job_id + "."+ConsoleColors.RESET);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}


/**

Updates the required skills for a job in the database.
@param con the database connection
@param job_id the ID of the job to update
@param skills the new required skills for the job
@param employer_id the ID of the employer who owns the job
@throws SQLException if a database access error occurs
*/
	public static void updateRequiredSkills(Connection con, int job_id, String skills, int employer_id)
			throws SQLException {

		try {
			String sql = "UPDATE JOBS SET REQUIRED_SKILLS = ?  WHERE JOB_ID = ? AND employer_id = ?";
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, skills);
			statement.setInt(2, job_id);
			statement.setInt(3, employer_id);
			int rs = statement.executeUpdate();

			if (rs > 0) {
				System.out.println(ConsoleColors.GREEN+"Job With ID " + job_id + " updated successfully."+ConsoleColors.RESET);
			} else {
				System.out.println(ConsoleColors.RED+"Failed To Update Job With ID " + job_id + "."+ConsoleColors.RESET);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
	/**

	Updates the type of a job in the database.
	@param con the database connection
	@param job_id the ID of the job to update
	@param jobType the new type of the job
	@param employer_id the ID of the employer who owns the job
	@throws SQLException if a database access error occurs
	*/



	public static void updateJobType(Connection con, int job_id, String jobType, int employer_id) throws SQLException {

		try {
			String sql = "UPDATE JOBS SET JOB_TYPE = ?  WHERE JOB_ID = ? AND employer_id = ?";
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, jobType);
			statement.setInt(2, job_id);
			statement.setInt(3, employer_id);
			int rs = statement.executeUpdate();

			if (rs > 0) {
				System.out.println(ConsoleColors.GREEN+"Job with ID " + job_id + " Updated Successfully."+ConsoleColors.RESET);
			} else {
				System.out.println(ConsoleColors.RED+"Failed To Update Job With ID " + job_id + "."+ConsoleColors.RESET);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}


/**

Updates the experience level required for a job in the database.
@param con the database connection
@param job_id the ID of the job to update
@param experienceLevel the new experience level required for the job
@param employer_id the ID of the employer who owns the job
@throws SQLException if a database access error occurs
*/
	public static void updateExperienceLevel(Connection con, int job_id, String experienceLevel, int employer_id)
			throws SQLException {

		try {
			String sql = "UPDATE JOBS SET EXPERIENCE_LEVEL = ?  WHERE JOB_ID = ? AND employer_id = ?";
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, experienceLevel);
			statement.setInt(2, job_id);
			statement.setInt(3, employer_id);

			int rs = statement.executeUpdate();

			if (rs > 0) {
				System.out.println(ConsoleColors.GREEN+"Job With ID " + job_id + " Updated Successfully."+ConsoleColors.RESET);
			} else {
				System.out.println(ConsoleColors.GREEN+"Failed To Update Job With ID " + job_id + "."+ConsoleColors.RESET);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}


/**

Updates the application deadline for a job in the database.
@param con the database connection
@param job_id the ID of the job to update
@param applicationDeadLine the new application deadline for the job
@param employer_id the ID of the employer who owns the job
@throws SQLException if a database access error occurs
*/
	public static void updateApplicationDeadLine(Connection con, int job_id, String applicationDeadLine,
			int employer_id) throws SQLException {

		try {
			String sql = "UPDATE JOBS SET APPLICATION_DEADLINE = ?  WHERE JOB_ID = ? AND employer_id = ?";
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, applicationDeadLine);
			statement.setInt(2, job_id);
			statement.setInt(3, employer_id);
			int rs = statement.executeUpdate();

			if (rs > 0) {
				System.out.println(ConsoleColors.GREEN+"Job With ID " + job_id + " Updated Successfully."+ConsoleColors.RESET);
			} else {
				System.out.println(ConsoleColors.RED+"Failed To Update Job with ID " + job_id + "."+ConsoleColors.RESET);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
	/**

	Updates the number of openings for a job in the database.
	@param con the database connection
	@param job_id the ID of the job to update
	@param numberOfOpenings the new number of openings for the job
	@param employer_id the ID of the employer who owns the job
	@throws SQLException if a database access error occurs
	*/




	public static void updateNumberOfOpenigs(Connection con, int job_id, int numberOfOpenings, int employer_id)
			throws SQLException {

		try {
			String sql = "UPDATE JOBS SET number_of_openings = ?  WHERE JOB_ID = ? AND employer_id = ?";
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setInt(1, numberOfOpenings);
			statement.setInt(2, job_id);
			statement.setInt(3, employer_id);

			int rs = statement.executeUpdate();

			if (rs > 0) {
				System.out.println(ConsoleColors.GREEN+"Job with ID " + job_id + " Updated Successfully."+ConsoleColors.RESET);
			} else {
				System.out.println(ConsoleColors.RED+"Failed To Update Job With ID " + job_id + "."+ConsoleColors.RESET);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
	/**

	Updates all details of a job record in the database.
	@param con the database connection
	@param job_id the ID of the job to update
	@param jobTitle the new title of the job
	@param jobDescription the new description of the job
	@param location the new location of the job
	@param requiredSkills the new required skills for the job
	@param jobType the new type of the job
	@param experienceLevel the new experience level required for the job
	@param applicationDeadline the new application deadline for the job
	@param numberOfOpenings the new number of openings for the job
	@param employer_id the ID of the employer who owns the job
	*/




	public static void updateAllRecord(Connection con, int job_id, String jobTitle, String jobDescription,
			String location, String requiredSkills, String jobType, String experienceLevel, String applicationDeadline,
			int numberOfOpenings, int employer_id) {

		try {
			String sql = "UPDATE JOBS SET job_title = ?, job_description = ?, location = ?, required_skills = ?, job_type = ?, experience_level = ?, application_deadline = ?, number_of_openings = ? WHERE JOB_ID = ? AND employer_id = ?";

			PreparedStatement statement = con.prepareStatement(sql);

			statement.setString(1, jobTitle); // Set the new job title
			statement.setString(2, jobDescription); // Set the new job description
			statement.setString(3, location); // Set the new location
			statement.setString(4, requiredSkills); // Set the new required skills
			statement.setString(5, jobType); // Set the new job type
			statement.setString(6, experienceLevel); // Set the new experience level
			statement.setString(7, applicationDeadline); // Set the new application deadline
			statement.setInt(8, numberOfOpenings); // Set the new number of openings
			statement.setInt(9, job_id);
			statement.setInt(10, employer_id);

			int rs = statement.executeUpdate();

			if (rs > 0) {
				System.out.println(ConsoleColors.GREEN+"Job With ID " + job_id + " Updated Successfully."+ConsoleColors.RESET);
			} else {
				System.out.println(ConsoleColors.RED+"Failed To Update Job With ID " + job_id + "."+ConsoleColors.RESET);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}
	/**
Updates the status of a job in the database.
@param jobId the ID of the job to update
*/

	public static void updateJobStatus(int jobId ,int employee_Id) {
		Connection con = null;
		PreparedStatement statement = null;
		int choice;
		String status;
		try {
			con = JdbcConnection.connectdatabase();
			String sql = "UPDATE jobs SET job_status = ? WHERE job_id = ? AND EMPLOYER_ID = ?";
			statement = con.prepareStatement(sql);

			System.out.println("1. Set job status to Active");
			System.out.println("2. Set job status to Inactive");
			choice = sc.nextInt();

			switch (choice) {
			case 1:
				status = "ACTIVE";

				break;
			case 2:
				status = "INACTIVE";
				break;
			default:
				System.out.println(ConsoleColors.RED+"Invalid choice."+ConsoleColors.RESET);
				return;
			}

			statement.setString(1, status);
			statement.setInt(2, jobId);
			statement.setInt(3, employee_Id);

			int rowsUpdated = statement.executeUpdate();
			//System.out.println(rowsUpdated);

			if (rowsUpdated > 0) {
				System.out.println(ConsoleColors.GREEN+"Job status updated successfully."+ConsoleColors.RESET);
			} else {
				System.out.println(ConsoleColors.RED+"No job found with the given ID Pleace check job id."+ConsoleColors.RESET);
			}

		} catch (SQLException | ClassNotFoundException | InputMismatchException e) {
			e.printStackTrace();
		}
	}

	// toString method to display Job information
	@Override
	public String toString() {
		return "Job{" + "jobId=" + jobId + ", employerId=" + employerId + ", jobTitle='" + jobTitle + '\''
				+ ", jobDescription='" + jobDescription + '\'' + ", location='" + location + '\'' + ", requiredSkills='"
				+ requiredSkills + '\'' + ", jobType='" + jobType + '\'' + ", experienceLevel='" + experienceLevel
				+ '\'' + ", applicationDeadline=" + applicationDeadline + ", numberOfOpenings=" + numberOfOpenings
				+ '}';
	}

}
