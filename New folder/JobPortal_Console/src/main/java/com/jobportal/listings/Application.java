package com.jobportal.listings;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import java.util.Scanner;


import com.consolecolors.ConsoleColors;
import com.jdbcservice.JdbcConnection;
import com.jobportal.users.Employer;

import com.userdefiendexception.NumberException;
import com.userdefiendexception.OptionException;
import com.userdefiendexception.Validation;

/**
 * The Application class represents job applications submitted by job seekers.
 * It contains methods to view and update application status.
 * @author Gopal jamoca
 * @since 13-05-2024
 */
public class Application {
	static Scanner sc = new Scanner(System.in);

	public Application(int applicationId, int jobId, int jobSeekerId, String status, Date applicationDate) {

		super();
		this.applicationId = applicationId;
		this.jobId = jobId;
		this.jobSeekerId = jobSeekerId;
		this.status = status;

		this.applicationDate = applicationDate;
	}
	// Instance variables
	private int applicationId;
	private int jobId;
	private int jobSeekerId;
	private String status;
	private String email;
	private String name;
	private Date applicationDate;

	// Constructors
	public Application() {
	}

	public Application(int applicationId, int jobId, int jobSeekerId, Date applicationDate, String status) {
		this.applicationId = applicationId;
		this.jobId = jobId;
		this.jobSeekerId = jobSeekerId;
		this.applicationDate = applicationDate;

		this.status = status;
	}

	public Application(int applicationId, int jobId, int jobSeekerId, String name, String email, String status,
			Date applicationDate) {
		this.applicationId = applicationId;
		this.jobId = jobId;
		this.jobSeekerId = jobSeekerId;
		this.name = name;
		this.email = email;
		this.status = status;
		this.applicationDate = applicationDate;
	}

	// Getters and setters
	public int getApplicationId() {
		return applicationId;
	}

	public void setApplicationId(int applicationId) {
		this.applicationId = applicationId;
	}

	public int getJobId() {
		return jobId;
	}

	public void setJobId(int jobId) {
		this.jobId = jobId;
	}

	public int getJobSeekerId() {
		return jobSeekerId;
	}

	public void setJobSeekerId(int jobSeekerId) {
		this.jobSeekerId = jobSeekerId;
	}

	public Date getApplicationDate() {
		return applicationDate;
	}

	public void setApplicationDate(Date applicationDate) {
		this.applicationDate = applicationDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	/**
     * Displays the application status of a job seeker.
     *
     * @param id The ID of the job seeker.
     */

	public static void viewApplicationStatus(int id) {
		Connection con = null;
		PreparedStatement statement = null;
		PreparedStatement totalCountStatement = null;

		try {
			con = JdbcConnection.connectdatabase();

			// Query to get the total number of jobs applied by the job seeker
			String totalCountSql = "SELECT COUNT(*) AS total_applications FROM job_applications WHERE JOB_SEEKER_ID = ?";
			totalCountStatement = con.prepareStatement(totalCountSql);
			totalCountStatement.setInt(1, id);
			int totalApplications = 0;

			try (ResultSet totalCountResultSet = totalCountStatement.executeQuery()) {
				if (totalCountResultSet.next()) {
					totalApplications = totalCountResultSet.getInt("total_applications");
				}
			}

			System.out.println(
					ConsoleColors.PURPLE + "Total Number Of Jobs Applied :" + totalApplications + ConsoleColors.RESET);
			System.out.println("***************************************");

			String sql = "SELECT ja.APPLICATION_ID, ja.JOB_ID, ja.status, j.job_title, e.COMPANYNAME "
					+ "FROM job_applications ja " + "JOIN jobs j ON ja.JOB_ID = j.job_id "
					+ "JOIN employers e ON j.employer_id = e.id " + "WHERE ja.JOB_SEEKER_ID = ?";

			statement = con.prepareStatement(sql);
			statement.setInt(1, id);

			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next()) {
					do {
						int aId = resultSet.getInt("APPLICATION_ID");
						int jobId = resultSet.getInt("JOB_ID");
						String status = resultSet.getString("status");
						String jobTitle = resultSet.getString("job_title");
						String companyName = resultSet.getString("COMPANYNAME");

						System.out.println("Job Title: " + jobTitle);
						System.out.println("Company Name: " + companyName);
						System.out.println("Job ID: " + jobId);
						System.out.println("Application ID: " + aId);
						System.out.println("Application Status: " + status);
						System.out.println("***************************************");

					} while (resultSet.next());
				} else {
					System.out.println("No applications found ");
				}
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				if (totalCountStatement != null) {
					totalCountStatement.close();
				}
				if (statement != null) {
					statement.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	 /**
     * Updates the status of a job application.
     *
     * @param applicationId The ID of the job application.
     * @param jobId          The ID of the job.
     * @throws ClassNotFoundException If the Oracle JDBC driver class is not found.
     */


	public void applicationView(Employer em) throws ClassNotFoundException {
		boolean flag = true;
		do {
			System.out.println("+------------------------------------+");
			System.out.println("|            Application Menu        |");
			System.out.println("+------------------------------------+");
			System.out.println("| 1. View applications               |");
			System.out.println("| 2. Updated apllication status      |");
			System.out.println("| 3. view Short Listed               |");
			System.out.println("| 4. view Waiting Listed             |");
			System.out.println("| 5. view Rejacted Listed            |");
			System.out.println("| 6. Go Back                         |");
			System.out.println("| 7. Exit                            |");
			System.out.println("+------------------------------------+");
			String jobId;
			int jobI, seekerId;

			int option = 0;

			while (true) {
				System.out.print(ConsoleColors.CYAN + "Enter Menu Option Number :" + ConsoleColors.RESET);
				String input = sc.next();

				try {
					option = Validation.validateOption(input);
					break;
				} catch (OptionException e) {
					System.out.println(ConsoleColors.YELLOW + e.getMessage() + ConsoleColors.RESET);
				}
			}

			switch (option) {

			case 1: {

				sc.nextLine();
				while (true) {

					System.out.println(ConsoleColors.CYAN + "Enter The job Id   :" + ConsoleColors.RESET);
					jobId = sc.nextLine();

					try {
						jobI = Validation.isValidJobId(jobId);

						break; // Exit the loop if a valid job ID is entered
					} catch (NumberException e) {
						System.out.println(e.getMessage());
						// Continue the loop to prompt the user for a valid job ID
					}
				}
				new Employer().fetchJobSeekersInfo(em, jobI);
				;
				break;
			}
			case 2: {

				sc.nextLine();
				while (true) {

					System.out.println(ConsoleColors.CYAN + "Enter The job Id   :" + ConsoleColors.RESET);
					jobId = sc.nextLine();

					try {
						jobI = Validation.isValidJobId(jobId);

						break; // Exit the loop if a valid job ID is entered
					} catch (NumberException e) {
						System.out.println(e.getMessage());
						// Continue the loop to prompt the user for a valid job ID
					}
				}

				while (true) {

					System.out.println(ConsoleColors.CYAN + "Enter The SeekerId :" + ConsoleColors.RESET);
//					seekerI = sc.nextLine();

					try {
						seekerId = Validation.isValidJobId(jobId);

						break; // Exit the loop if a valid job ID is entered
					} catch (NumberException e) {
						System.out.println(e.getMessage());
						// Continue the loop to prompt the user for a valid job ID
					}
				}
				boolean validStatus = false;

		        // Loop until a valid status is entered
		        while (!validStatus) {
		            System.out.println(ConsoleColors.CYAN + "Enter The Status (Shortlisted, Waiting, Rejected): " + ConsoleColors.RESET);
		            status = sc.nextLine();

		            // Check if the entered status is one of the valid options
		            if (status.equalsIgnoreCase("Shortlisted") || status.equalsIgnoreCase("Waiting") || status.equalsIgnoreCase("Rejected")) {
		                validStatus = true;
		                System.out.println("Status entered: " + status);
		            } else {
		                System.out.println(ConsoleColors.RED + "Invalid status entered. Please enter either 'Shortlisted', 'Waiting', or 'Rejected'." + ConsoleColors.RESET);
		            }
		        }
//				System.out.println(ConsoleColors.CYAN + "Enter The Status  : " + ConsoleColors.RESET);
//				String status = sc.nextLine();
				updateJobReviewStatus(em, jobI, seekerId, status);
				break;

			}
			case 3: {
				sc.nextLine();
				while (true) {

					System.out.println(ConsoleColors.CYAN + "Enter The job Id   :" + ConsoleColors.RESET);
					jobId = sc.nextLine();

					try {
						jobI = Validation.isValidJobId(jobId);

						break; // Exit the loop if a valid job ID is entered
					} catch (NumberException e) {
						System.out.println(e.getMessage());
						// Continue the loop to prompt the user for a valid job ID
					}
				}

				fetchAndDisplayJobApplicationStatus(em, jobI, "Shortlisted");
				break;
			}
			case 4: {
				sc.nextLine();
				while (true) {

					System.out.println(ConsoleColors.CYAN + "Enter The job Id   :" + ConsoleColors.RESET);
					jobId = sc.nextLine();

					try {
						jobI = Validation.isValidJobId(jobId);

						break; // Exit the loop if a valid job ID is entered
					} catch (NumberException e) {
						System.out.println(e.getMessage());
						// Continue the loop to prompt the user for a valid job ID
					}
				}

				fetchAndDisplayJobApplicationStatus(em, jobI, "Rejected");
				break;
			}
			case 5: {
				sc.nextLine();
				while (true) {

					System.out.println(ConsoleColors.CYAN + "Enter The job Id   :" + ConsoleColors.RESET);
					jobId = sc.nextLine();

					try {
						jobI = Validation.isValidJobId(jobId);

						break; // Exit the loop if a valid job ID is entered
					} catch (NumberException e) {
						System.out.println(e.getMessage());
						// Continue the loop to prompt the user for a valid job ID
					}
				}

				fetchAndDisplayJobApplicationStatus(em, jobI, "Waiting");
				break;
			}
			case 6: {
				new Employer().emoloyerMenu(em);
				break;
			}
			case 7: {
				System.out.println(ConsoleColors.PURPLE + "Thank You For Using Job Portal!  Have a Great Day!"
						+ ConsoleColors.RESET);
				System.exit(0);

				break;
			}

			default:
				System.out.println(ConsoleColors.RED + "Enter The Correct Option :" + ConsoleColors.RESET);
				applicationView(em);
			}
		} while (flag);

	}
	/**
     * Updates the review status of a job application by an employer.
     *
     * @param employer The employer object.
     * @param jobId    The ID of the job.
     * @param seekerId The ID of the job seeker.
     * @param status   The new status of the job application.
     * @throws ClassNotFoundException If the Oracle JDBC driver class is not found.
     */
	public void updateJobReviewStatus(Employer employer, int jobId, int seekerId, String status)
			throws ClassNotFoundException {
		Connection con = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		try {
			con = JdbcConnection.connectdatabase();

			// Update the status of the job application
			String updateSql = "UPDATE job_applications SET STATUS = ? WHERE job_id = ? AND EMP_ID = ? AND JOB_SEEKER_ID = ?";
			statement = con.prepareStatement(updateSql);
			statement.setString(1, status);
			statement.setInt(2, jobId);
			statement.setInt(3, employer.getId());
			statement.setInt(4, seekerId);

			int rowsUpdated = statement.executeUpdate();
			if (rowsUpdated > 0) {
				System.out.println(
						ConsoleColors.GREEN + "Job application status updated successfully." + ConsoleColors.RESET);
			} else {
				System.out.println(ConsoleColors.RED
						+ "Failed to update job application status. Please check the job ID and job seeker ID."
						+ ConsoleColors.RESET);
				return;
			}
		} catch (SQLException e) {
			// Handle SQLException to differentiate between invalid job ID or seeker ID
			if (e.getMessage().contains("foreign key")) {
				// Handle invalid job ID or seeker ID exception
				System.out.println(ConsoleColors.RED
						+ "Invalid job ID or seeker ID entered. Please check the provided IDs." + ConsoleColors.RESET);
			} else {
				e.printStackTrace(); // Print other SQL exceptions
			}
		} catch (Exception e) {
			e.printStackTrace(); // Print other exceptions
		} finally {
			// Close resources in finally block
			try {
				if (rs != null)
					rs.close();
				if (statement != null)
					statement.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	/**
     * Displays the application status of job seekers for a specific job.
     *
     * @param employer      The employer object.
     * @param jobId         The ID of the job.
     * @param statusToDisplay The status of the applications to display.
     * @throws ClassNotFoundException If the Oracle JDBC driver class is not found.
     */
	public static void fetchAndDisplayJobApplicationStatus(Employer employer, int jobId, String statusToDisplay)
			throws ClassNotFoundException {
		Connection con = null;
		PreparedStatement statement = null;
		ResultSet rs = null;

		try {
			con = JdbcConnection.connectdatabase();
			String fetchSql = "SELECT ja.APPLICATION_ID, ja.JOB_ID, js.JOB_SEEKER_ID, js.FNAME, js.EMAIL, ja.STATUS, ja.APPLICATION_DATE "
					+ "FROM job_applications ja " + "JOIN job_seekers js ON ja.JOB_SEEKER_ID = js.JOB_SEEKER_ID "
					+ "WHERE ja.JOB_ID = ? AND ja.EMP_ID = ?";

			statement = con.prepareStatement(fetchSql);
			statement.setInt(1, jobId);
			statement.setInt(2, employer.getId());
			rs = statement.executeQuery();

			List<Application> applications = new ArrayList<>();

			while (rs.next()) {
				int applicationId = rs.getInt("APPLICATION_ID");
				int jsId = rs.getInt("JOB_SEEKER_ID");
				String username = rs.getString("FNAME");
				String email = rs.getString("EMAIL");
				String status = rs.getString("STATUS");
				Date applicationDate = rs.getDate("APPLICATION_DATE");

				applications.add(new Application(applicationId, jobId, jsId, username, email, status, applicationDate));
			}

			// Sort the list by application ID
			Collections.sort(applications, Comparator.comparingInt(Application::getApplicationId));

			// Switch case to handle different statuses
			switch (statusToDisplay) {
			case "Shortlisted":
				printJobApplications("Shortlisted Job Seekers", applications, "Shortlisted");
				break;
			case "Rejected":
				printJobApplications("Rejected Job Seekers", applications, "Rejected");
				break;
			case "Waiting":
				printJobApplications("Waiting Job Seekers", applications, "Waiting");
				break;
			default:
				System.out.println("Invalid status provided.");
				break;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// Close resources in finally block
			try {
				if (rs != null)
					rs.close();
				if (statement != null)
					statement.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	private static void printJobApplications(String header, List<Application> applications, String status) {
		System.out.println(header + ":");
		System.out.printf("%-5s %-15s %-10s %-15s %-20s %-30s %-15s %-20s%n", "S.No", "Application ID", "Job ID",
				"Job Seeker ID", "Name", "Email", "Status", "Application Date");
		System.out.println(
				"-------------------------------------------------------------------------------------------------------------------------------");

		int serialNo = 1;
		boolean found = false;
		for (Application app : applications) {
			if (app.getStatus().equals(status)) {
				found = true;
				if (found) {
					System.out.printf("%-5d %-15d %-10d %-15d %-20s %-30s %-15s %-20s%n", serialNo++,
							app.getApplicationId(), app.getJobId(), app.getJobSeekerId(), app.getName(), app.getEmail(),
							app.getStatus(), app.getApplicationDate());
				}
			}
		}
		if (!found) {
			System.out.println(ConsoleColors.RED + "No applicants found for status: " + ConsoleColors.RESET);
		}
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	// toString method to display Application information
	@Override
	public String toString() {
		return "Application{" + "applicationId=" + applicationId + ", jobId=" + jobId + ", jobSeekerId=" + jobSeekerId
				+ ", applicationDate=" + applicationDate + ", resume= [byte array]" +

				", status='" + status + '\'' + '}';
	}
}
