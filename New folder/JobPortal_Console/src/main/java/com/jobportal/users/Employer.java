package com.jobportal.users;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;


import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Collectors;

import com.userdefiendexception.*;
import com.usersregisterlogin.LoginRegister;
import com.consolecolors.ConsoleColors;
import com.jdbcservice.JdbcConnection;
import com.jobportal.functionality.Main;
import com.jobportal.listings.Application;
import com.jobportal.listings.Job;
import com.jobportal.listings.Search;
import com.messageandnoficationservices.Message;

public class Employer extends User implements Search {

	private String companyName;

	public Employer(String username, String email, String password, UserType userType, String companyName,
			int registerNumber, String domain, String contact, String phone, LocalDate date, List<Job> jobs, int id) {
		super(username, email, password, userType);
		this.companyName = companyName;
		this.registerNumber = registerNumber;
		this.domain = domain;
		this.contact = contact;
		this.phone = phone;
		this.date = date;
		this.jobs = jobs;
		this.id = id;
	}

	private int registerNumber;
	private String domain;
	private String contact;
	private String phone;
	private LocalDate date;
	private List<Job> jobs;

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	static Scanner sc = new Scanner(System.in);

	public Employer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getRegisterNumber() {
		return registerNumber;
	}

	public void setRegisterNumber(int registerNumber) {
		this.registerNumber = registerNumber;
	}

	public Employer(String username, String email, String password, UserType userType, String domain,
			String companyName, int registerNumber, String phone) {
		super(username, email, password, userType);
		this.domain = domain;
		this.companyName = companyName;
		this.registerNumber = registerNumber;
		this.phone = phone;
		this.jobs = new ArrayList<>();
		// TODO Auto-generated constructor stub
	}

	public List<Job> getJobs() {
		return jobs;
	}

	public void setJobs(List<Job> jobs) {
		this.jobs = jobs;
	}

	public Employer(int id, String username, String password, String email) {
		// TODO Auto-generated constructor stub
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}
	/**
	 * Creates a new employer user by taking input from the console and validating the input.
	 *
	 * @throws CheckUserNameException          If the username does not meet the validation criteria.
	 * @throws ClassNotFoundException          If the JDBC driver class is not found.
	 * @throws SQLException                    If a database access error occurs.
	 * @throws JobIdAlreadyExistsException     If the job ID already exists in the database.
	 * @throws CompanyNameValidationException  If the company name does not meet the validation criteria.
	 * @author Gopal jamocha
	 * @since 11-05-2024
	 */
	public void emloyerUserCreate() throws CheckUserNameException, ClassNotFoundException, SQLException,
			JobIdAlreadyExistsException, CompanyNameValidationException {

		String userName, email, password, phone;
		// Loop for entering and validating username
		System.out.println(ConsoleColors.CYAN
				+ "Enter the username : [Usernames must be 3-20 characters long and can contain letters, digits, underscores, and hyphens.]"
				+ ConsoleColors.RESET);

		while (true) {

			userName = sc.nextLine();
			// Check if username meets the validation criteria
			if (!Validation.checkUserName(userName)) {
				// Prompt user for valid username
				System.out.println(ConsoleColors.YELLOW
						+ " [Usernames must be 3-20 characters long and can contain letters, digits, underscores, and hyphens.] :"
						+ ConsoleColors.RESET);

				continue;
			} else {
				 // Check if username already exists
				new LoginRegister();
				if (LoginRegister.isUsernameExists(userName)) {
					System.out.println(ConsoleColors.YELLOW
							+ "Username already exists! Please choose a different username." + ConsoleColors.RESET);
					continue;
				} else {

					break;
				}
			}
		}
		// Loop for entering and validating password
		System.out.println(ConsoleColors.CYAN
				+ "Enter the password : [password format! Passwords must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character.]"
				+ ConsoleColors.RESET);
		while (true) {

			password = sc.nextLine();
			if (!Validation.checkPassword(password)) {
				// Prompt user for valid password
				System.out.println(ConsoleColors.YELLOW
						+ "[password format! Passwords must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character.]"
						+ ConsoleColors.RESET);

			} else {
				break;
			}
		}

		String cName;
		 // Loop for entering and validating company name
		while (true) {
			System.out.println(ConsoleColors.CYAN
					+ "Enter The Company Name :[ name contain only alphabetic characters.]" + ConsoleColors.RESET);
			cName = sc.nextLine();
			try {
				if (!Validation.validateCompanyName(cName)) {

					continue;
				} else {

					break;
				}
			} catch (CompanyNameValidationException e) {
				System.out.println(ConsoleColors.YELLOW + e.getMessage() + ConsoleColors.RESET);

			}
		}
		while (true) { // Loop for entering and validating email

			System.out.println(ConsoleColors.CYAN + "Enter the email [ name@gmail.com] :" + ConsoleColors.RESET);
			email = sc.nextLine();
			if (!Validation.checkEmail(email)) {
				// Prompt user for valid email
				System.out.println(ConsoleColors.YELLOW
						+ "Invalid email format! Please enter a valid email address in the format :[ name@gmail.com]"
						+ ConsoleColors.RESET);

				continue;
			} else {

				break;
			}
		}

		int cRegisterNumber;
		// Loop for entering and validating company register number
		System.out.println(ConsoleColors.CYAN + "Enter The CompanyRegisterNumber : [Enter only numeric value]"
				+ ConsoleColors.RESET);
		while (true) {
			try {

				cRegisterNumber = sc.nextInt();
				sc.nextLine(); // Consume the newline character after reading the integer
				break; // If no exception occurs, break out of the loop
			} catch (InputMismatchException e) {
				System.out.println(ConsoleColors.YELLOW + " !CompanyRegisterNumber[Enter only numeric value]"
						+ ConsoleColors.RESET);
				sc.nextLine(); // Clear the invalid input
			}
		}
		String domain;
		while (true) {
			// Loop for entering and validating domain
			System.out.println(
					ConsoleColors.CYAN + "Enter The domain :[Enter only charachter Sequence]" + ConsoleColors.RESET);
			domain = sc.nextLine();
			try {
				if (!Validation.ValidateCharacterSequences(domain)) {

					continue;
				} else {
					break;

				}
			} catch (CharachterSequenceException e) {
				System.out.println(ConsoleColors.YELLOW + e.getMessage() + ConsoleColors.RESET);
			}
		}
		System.out.println(ConsoleColors.CYAN
				+ "Enter The Phone Number : [ Contact number should be 10 digits long and start with 9, 7, 8]"
				+ ConsoleColors.RESET);
		while (true) {
			 // Loop for entering and validating phone number
			phone = sc.nextLine();
			if (!Validation.isValidPhoneNumber(phone)) {
				 // Prompt user for valid phone number
				System.out.println(ConsoleColors.YELLOW
						+ "[ Contact number should be 10 digits long and start with 9, 7, 8]" + ConsoleColors.RESET);
				continue;
			} else {
				break;
			}
		}
		// Registering the employer user
		LoginRegister.registerEmployee(new Employer(userName, email, password, UserType.EMPLOYER, domain, cName,

				cRegisterNumber, phone));
		new Main().employee();

	}
	/**
	 * Handles the login process for employer users.
	 *
	 * @throws ClassNotFoundException      If the JDBC driver class is not found.
	 * @throws SQLException                If a database access error occurs.
	 * @throws CheckUserNameException      If there is an issue with the username format.
	 * @author Gopal jamocha
	 * @since  11-05-2024
	 */

	public void employersUserLogin() throws ClassNotFoundException, SQLException, CheckUserNameException {
	    String userName, password;
	    int maxAttempts = 3;
	    int attempts = 0;

	    while (attempts < maxAttempts) {
	        // Prompt for username and password
	        System.out.println(ConsoleColors.CYAN + "Enter The Username :" + ConsoleColors.RESET);
	        userName = sc.nextLine();
	        System.out.println(ConsoleColors.CYAN + "Enter the password :" + ConsoleColors.RESET);
	        password = sc.nextLine();

	        // Attempting user login
	        Object loggedIn = LoginRegister.userslogin(userName, password, UserType.EMPLOYER);

	        if (loggedIn instanceof Employer) {
	            Employer employer = (Employer) loggedIn;

	            System.out.println(ConsoleColors.BLUE + "+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+");
	            System.out.println("                                              ");
	            System.out.println(ConsoleColors.GREEN + "        Welcome " + userName + "      [Employer]  " + ConsoleColors.RESET);
	            System.out.println("                                              ");
	            System.out.println(ConsoleColors.BLUE + "+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+" + ConsoleColors.RESET);
	            
	            // Redirecting to employer menu
	            emoloyerMenu(employer);
	            // Break out of the loop if login is successful
	            break;
	        } else {
	            attempts++;
	            int remainingAttempts = maxAttempts - attempts;
	            if (remainingAttempts > 0) {
	                System.out.println(ConsoleColors.RED + "Login failed. Incorrect username, password, or account inactive. "
	                        + "You have " + remainingAttempts + " attempt(s) left." + ConsoleColors.RESET);
	            } else {
	                // At least two wrong attempts, provide the "Change Password" option
	                System.out.println(ConsoleColors.RED + "Would you like to change your password? (Y/N)" + ConsoleColors.RESET);
	                String changeOption = sc.nextLine();
	                if (changeOption.equalsIgnoreCase("Y")) {
	                    // Implement your logic for password change here
	                    System.out.println("Redirecting to password change page...");
	                } else {
	                    System.out.println("Exiting...");
	                    try {
	                        new Main().employee();
	                    } catch (JobIdAlreadyExistsException | CompanyNameValidationException e) {
	                        e.printStackTrace();
	                    }
	                }
	            }
	        }
	    }
	}
	/**
	 * Displays the employer menu and handles user selections.
	 *
	 * @param employer The employer object.
	 * @author Gopal Jamocha
	 * @since 11-05-2024
	 */
	public void emoloyerMenu(Employer employer) {

		try {
			Connection con = JdbcConnection.connectdatabase();
			boolean flags = false;
			do { // Displaying the menu options
				System.out.println("+------------------------------------+");
				System.out.println("|            Service Menu            |");
				System.out.println("+------------------------------------+");
				System.out.println("| 1. Job Management                  |");
				System.out.println("| 2. Candidate Search                |");
				System.out.println("| 3. Application                     |");
				System.out.println("| 4. Notification send  to seekers   |");
				System.out.println("| 5. Profile Management              |");
				System.out.println("| 6. LogOut                          |");
				System.out.println("| 7. Exit                            |");
				System.out.println("+------------------------------------+");

				int option = 0;

				while (true) {
					System.out.print(ConsoleColors.CYAN + "Enter menu option number: " + ConsoleColors.RESET);
					String input = sc.next();

					try {
						option = Validation.validateOption(input);
						break;
					} catch (OptionException e) {
						System.out.println(ConsoleColors.YELLOW + e.getMessage() + ConsoleColors.RESET);
					}
				} // Switch case for handling user selection
				switch (option) {
				case 1: {
					// Calling job management method
					new Job().jobManagement(employer); 
					break;
				}
				case 2: {
					// Calling candidate search method
					employer.userSearch(employer);
					break;

				}
				case 3: {
					new Job().viewJobs(con, employer.getId());
                    new Application().applicationView(employer);
					emoloyerMenu(employer);// Returning to employer menu
					break;
				}
				case 4: {

					new Message().messages(employer);// Managing Notifications
					break;

				}
				case 5: {

					employer.profileManagement(employer);// Managing employer profile
					break;

				}
				case 6: {
					System.out.println(ConsoleColors.PURPLE + "Logged out successfully. Thank you for using Job Portal!"
							+ ConsoleColors.RESET);
					sc.nextLine();
					new Main().employee();// Logging out

					break;

				}
				case 7: {
					System.out.println(ConsoleColors.PURPLE + "Thank you for using Job Portal!  Have a great day!"
							+ ConsoleColors.RESET);
					System.exit(0);// Exiting the application

					break;

				}

				default: {
					// Handling invalid choice
					System.out.println(ConsoleColors.RED + "Invalid choice. Please try again !" + ConsoleColors.RESET);
					sc.nextLine();
					emoloyerMenu(this);
				}

				}

			} while (flags);// Loop continues until 'flags' is true
		} catch (Exception e) {

		}

	}

	public void candidateSearch(Employer employer) throws ClassNotFoundException, OptionException {
		employer.searchUsers();
	}
	
	/**
	 * Manages the profile of an employer, allowing various profile updates.
	 * 
	 * @param employer The employer whose profile is being managed.
	 * @throws ClassNotFoundException        If the JDBC driver class is not found.
	 * @throws OptionException                If an invalid menu option is chosen.
	 * @throws JobIdAlreadyExistsException    If the job ID already exists in the database.
	 * @author Gopal jamocha
	 * @since 11-05-2024
	 */
	public void profileManagement(Employer employer)
			throws ClassNotFoundException, OptionException, JobIdAlreadyExistsException {
		boolean flag = true;
		do {
			 // Displaying the profile management menu
			System.out.println("╔═══════════════════════════════════╗");
			System.out.println("║      Profile Management Menu      ║");
			System.out.println("╠═══════════════════════════════════╣");
			System.out.println("║ 1. View Profile                   ║");
			System.out.println("║ 2. Update Profile                 ║");
			System.out.println("║ 3. Update Password                ║");
			System.out.println("║ 4. Update Email                   ║");
			System.out.println("║ 5. Update Company Name            ║");
			System.out.println("║ 6. Update Company Register Number ║");
			System.out.println("║ 7. Update PhoneNumber             ║");
			System.out.println("║ 8. Update Domain                  ║");
			System.out.println("║ 9. Back                           ║");
			System.out.println("║ 10.Exit                           ║");
			System.out.println("╚═══════════════════════════════════╝");
			int employerId = employer.getId();
			int option = 0;
			while (true) {
				System.out.print(ConsoleColors.CYAN + "Enter menu option number: " + ConsoleColors.RESET);
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

				viewProfile(employer.getId());// Viewing profile

				break;
			}
			case 2: {
				sc.nextLine();// Consume the newline character
				// Updating profile
				System.out.println(ConsoleColors.CYAN + "Enter the update email :" + ConsoleColors.RESET);
				String email = sc.nextLine();
				System.out.println(ConsoleColors.CYAN + "Enter the update password :" + ConsoleColors.RESET);
				String password = sc.nextLine();
				System.out.println(ConsoleColors.CYAN + "Enter the update company Name :" + ConsoleColors.RESET);
				String cName = sc.nextLine();
				System.out.println(
						ConsoleColors.CYAN + "Enter the update company Register Number :" + ConsoleColors.RESET);
				int cRegisterNumber = sc.nextInt();
				sc.nextLine();
				// Validating and updating phone number
				while (true) {
					System.out.println(ConsoleColors.CYAN + "Enter The Update Phone Number :" + ConsoleColors.RESET);
					phone = sc.nextLine();
					if (!Validation.isValidPhoneNumber(phone)) {
						continue;
					} else {
						break;
					}
				}
				 // Updating domain
				System.out.println(ConsoleColors.RESET + "Enter the domain :" + ConsoleColors.RESET);
				String domain = sc.nextLine();
				updateProfile(employerId, email, password, cName, cRegisterNumber, phone, domain);
				break;
			}
			case 3: {
				sc.nextLine();
                // Updating password

				String password;

				System.out.println(ConsoleColors.CYAN
						+ "Enter the update password : [password format! Passwords must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character.]"
						+ ConsoleColors.RESET);
				while (true) {

					password = sc.nextLine();
					if (!Validation.checkPassword(password)) {
						System.out.println(ConsoleColors.YELLOW
								+ "[password format! Passwords must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character.]"
								+ ConsoleColors.RESET);

					} else {
						break;
					}
				}
				updatePassword(employerId, password); // Updating password
				break;
			}
			case 4: {
				sc.nextLine();
				 // Updating email
				String email;

				while (true) { // Loop for entering and validating email

					System.out.println(
							ConsoleColors.CYAN + "Enter the update email [ name@gmail.com] :" + ConsoleColors.RESET);
					email = sc.nextLine();
					if (!Validation.checkEmail(email)) {
						System.out.println(ConsoleColors.YELLOW
								+ "Invalid email format! Please enter a valid email address in the format :[ name@gmail.com]"
								+ ConsoleColors.RESET);

						continue;
					} else {

						break;
					}
				}
				updateEmail(employerId, email); // Updating email
				break;
			}
			case 5: {
				sc.nextLine();
				System.out.println(ConsoleColors.CYAN + "Enter the update company Name :" + ConsoleColors.RESET);
				String cName = sc.nextLine();
				updateCompanyName(employerId, cName); // Updating company name
				break;

			}
			case 6: {
				int cRegisterNumber;// Updating company regiter number
				System.out.println(ConsoleColors.CYAN
						+ "Enter the update  CompanyRegisterNumber : [Enter only numeric value]" + ConsoleColors.RESET);
				while (true) {
					try {

						cRegisterNumber = sc.nextInt();
						sc.nextLine(); // Consume the newline character after reading the integer
						break; // If no exception occurs, break out of the loop
					} catch (InputMismatchException e) {
						System.out.println(ConsoleColors.YELLOW + " !CompanyRegisterNumber[Enter only numeric value]"
								+ ConsoleColors.RESET);
						sc.nextLine(); // Clear the invalid input
					}
				}
				updateRegisterNumber(employerId, cRegisterNumber);
				break;
			}
			case 7: {
				sc.nextLine();
				// Validating and updating phone number

				System.out.println(ConsoleColors.CYAN
						+ "Enter The  Update Phone Number : [ Contact number should be 10 digits long and start with 9, 7, 8]"
						+ ConsoleColors.RESET);
				while (true) {
					phone = sc.nextLine();
					if (!Validation.isValidPhoneNumber(phone)) {
						System.out.println(ConsoleColors.YELLOW
								+ "[ Contact number should be 10 digits long and start with 9, 7, 8]"
								+ ConsoleColors.RESET);
						continue;
					} else {
						break;
					}
				}
				// Updating phonenumber
				updateContact(employerId, phone);
				break;
			}
			case 8: {
				sc.nextLine();
				 // Updating domain
				System.out.println(ConsoleColors.CYAN + "Enter the domain :" + ConsoleColors.RESET); // Updating domain
				String domain = sc.nextLine();
				updateDomain(employerId, domain);
				break;

			}
			case 9: {
				emoloyerMenu(this);// Returning to employer menu
				break;
			}
			case 10: {
				System.out.println(ConsoleColors.PURPLE + "Thank you for using Job Portal!  Have a great day!"
						+ ConsoleColors.RESET);
				System.exit(0);// Exiting the application
				break;

			}
			default:
				System.out.println(ConsoleColors.RED + "Enter The Correct Option :" + ConsoleColors.RESET);
				profileManagement(employer);
				// Exiting the application
			}
		} while (flag);
	}

//	public void viewProfile(int emid) throws ClassNotFoundException {
//		Connection con = null;
//		PreparedStatement statement = null;
//		ResultSet rs = null;
//		try {
//			con = JdbcConnection.connectdatabase(); // Establishing database connection
//			String sql = "SELECT ID, EMAIL, COMPANYNAME, REGISTERNUMBER, PHONE_NUMBER, DOMAIN FROM EMPLOYERS WHERE ID = ?";
//			statement = con.prepareStatement(sql);
//			statement.setInt(1, emid);
//			rs = statement.executeQuery(); // Executing the query
//
//			if (rs.next()) {
//				// User found with the provided ID
//				int id = rs.getInt("id");
//				String email = rs.getString("EMAIL");
//				String companyName = rs.getString("COMPANYNAME");
//				int registerNumber = rs.getInt("REGISTERNUMBER");
//				String phone = rs.getString("PHONE_NUMBER");
//				String domain = rs.getString("DOMAIN");
//
//				// Displaying the profile information
//				System.out.println("------------------------------------");
//				System.out.println("User ID               : " + id);
//				System.out.println("Email                 : " + email);
//				System.out.println("CompanyName           : " + companyName);
//				System.out.println("Company RegisterNumber: " + registerNumber);
//				System.out.println("Contact Number        : " + phone);
//				System.out.println("Domain                : " + domain);
//				System.out.println("------------------------------------");
//			} else {
//				// No user found with the provided ID
//				System.out.println("No user found with ID: " + emid);
//			}
//		} catch (SQLException e) {
//			System.out.println(e.getMessage());
//		}
//	}
	/**
	 * Displays the profile information of an employer.
	 *
	 * @param emid The ID of the employer whose profile is to be viewed.
	 * @throws ClassNotFoundException If the JDBC driver class is not found.
	 * @author Gopal Jamoca
	 * @since 11-05-2024
	 */
	public void viewProfile(int emid) throws ClassNotFoundException {
	    Connection con = null;
	    PreparedStatement statement = null;
	    ResultSet rs = null;
	    try {
	        con = JdbcConnection.connectdatabase(); // Establishing database connection
	        String sql = "SELECT ID, EMAIL, COMPANYNAME, REGISTERNUMBER, PHONE_NUMBER, DOMAIN FROM EMPLOYERS WHERE ID = ?";
	        statement = con.prepareStatement(sql);
	        statement.setInt(1, emid);
	        rs = statement.executeQuery(); // Executing the query

	        // Printing table header
	        System.out.println("==============================================================================================================================");
	        System.out.printf("| %-5s | %-10s | %-30s | %-30s | %-20s | %-20s | %-15s |%n",
	                "S.No", "ID", "Email", "Company Name", "Register Number", "Phone Number", "Domain");
	        System.out.println("==============================================================================================================================");

	        int serialNumber = 1;

	        if (rs.next()) {
	            // User found with the provided ID
	            int id = rs.getInt("ID");
	            String email = rs.getString("EMAIL");
	            String companyName = rs.getString("COMPANYNAME");
	            int registerNumber = rs.getInt("REGISTERNUMBER");
	            String phone = rs.getString("PHONE_NUMBER");
	            String domain = rs.getString("DOMAIN");

	            // Printing table row with user data
	            System.out.printf("| %-5d | %-10d | %-30s | %-30s | %-20d | %-20s | %-15s |%n",
	                    serialNumber++, id, email, companyName, registerNumber, phone, domain);
	        } else {
	            // No user found with the provided ID
	            System.out.println("No user found with ID: " + emid);
	        }

	        System.out.println("==============================================================================================================================");
	    } catch (SQLException e) {
	        System.out.println(e.getMessage());
	    }
	}
	/**
	 * Updates the profile information of an employer in the database.
	 *
	 * @param id            The ID of the employer whose profile is to be updated.
	 * @param email         The updated email address of the employer.
	 * @param password      The updated password of the employer.
	 * @param companyName   The updated company name of the employer.
	 * @param registerNumber The updated register number of the employer's company.
	 * @param phone         The updated phone number of the employer.
	 * @param domain        The updated domain of the employer's company.
	 * @throws ClassNotFoundException If the JDBC driver class is not found.
	 * @author Gopal jamocah
	 * @since 14-05-2024
	 */

	public void updateProfile(int id, String email, String password, String companyName, int registerNumber,
			String phone, String domain) throws ClassNotFoundException {
		Connection con = null;
		PreparedStatement statement = null;
		try {
			// Establishing database connection
			con = JdbcConnection.connectdatabase();
			// SQL query to update the employer's profile
			String sql = "UPDATE EMPLOYERS SET Email = ?, PASSWORD = ?,COMPANYNAME = ?,REGISTERNUMBER =?, PHONE_NUMBER= ?,DOMAIN =? WHERE ID = ? ";
			statement = con.prepareStatement(sql);
			// Setting parameters in the prepared statement
			statement.setString(1, email);
			statement.setString(2, password);
			statement.setString(3, companyName);
			statement.setInt(4, registerNumber);
			statement.setString(5, phone);
			statement.setString(6, domain);
			statement.setInt(7, id);
			// Executing the update query
			int rowsInserted = statement.executeUpdate();
			if (rowsInserted > 0) {
				System.out.println(ConsoleColors.GREEN + "profile Update  successfully." + ConsoleColors.RESET);
			} else {
				System.out.println(ConsoleColors.RED + "Failed to  profile update." + ConsoleColors.RESET);
			}
		} catch (SQLException e) {
			 // Handling SQL exceptions
			if (e.getErrorCode() == 1) {
				 // Duplicate value found error
				System.out.println(
						ConsoleColors.RED + "Failed to update profile: Duplicate values found." + ConsoleColors.RESET);
			} else {
				e.printStackTrace(); // For other SQL errors, print the stack trace
			}
		}

	}
	/**
	 * Updates the email address of an employer in the database.
	 *
	 * @param id    The ID of the employer whose email is to be updated.
	 * @param email The updated email address of the employer.
	 * @throws ClassNotFoundException If the JDBC driver class is not found.
	 * @author Gopal jamocah
	 * @since 14-05-2024
	 */

	public void updateEmail(int id, String email) throws ClassNotFoundException {
		Connection con = null;
		PreparedStatement statement = null;
		try {
			// Establishing database connection
			con = JdbcConnection.connectdatabase();// Establishing database connection
			// SQL query to update the employer's email
			String sql = "UPDATE EMPLOYERS SET Email = ? WHERE ID = ? ";
			statement = con.prepareStatement(sql);
			// Setting parameters in the prepared statement
			statement.setString(1, email);
			statement.setInt(2, id);
			 // Executing the update query
			int rowsInserted = statement.executeUpdate();
			// Checking if the update was successful
			if (rowsInserted > 0) {
			System.out.println(ConsoleColors.GREEN + "Email Update  successfully." + ConsoleColors.RESET);
			} else {
				System.out.println(ConsoleColors.RED + "Failed to  Email update." + ConsoleColors.RESET);
			}
		} catch (SQLException e) {
			// Handling SQL exceptions
			e.printStackTrace();
		}
	}
	/**
	 * Updates the phone number of an employer in the database.
	 *
	 * @param  id    The ID of the employer whose phone number is to be updated.
	 * @param  phone The updated phone number of the employer.
	 * @throws ClassNotFoundException If the JDBC driver class is not found.
	 * @Author Gopal Jamocha
     * @since 12-5-2024
	 */
	public void updateContact(int id, String phone) throws ClassNotFoundException {
		Connection con = null;
		PreparedStatement statement = null;
		try {
			// Establishing database connection
			con = JdbcConnection.connectdatabase();
			// SQL query to update the employer's phone number
			String sql = "UPDATE EMPLOYERS SET PHONE_NUMBER = ? WHERE ID = ? ";
			statement = con.prepareStatement(sql);
			 // Setting parameters in the prepared statement
			statement.setString(1, phone);
			statement.setInt(2, id);
			// Executing the update query
			int rowsUpdated = statement.executeUpdate();
			// Checking if the update was successful
			if (rowsUpdated > 0) {
				System.out.println(ConsoleColors.GREEN + "Contact updated successfully." + ConsoleColors.RESET);
			} else {
				System.out.println(
						ConsoleColors.RED + "Failed to update contact. User ID not found." + ConsoleColors.RESET);
			}
		} catch (SQLException e) {
			// Handling SQL exceptions
			if (e.getSQLState().equals("23000")) {
				// Duplicate phone number error
				System.out.println(
						ConsoleColors.RED + "Failed to update contact: Duplicate phone number." + ConsoleColors.RESET);
			} else {
				e.printStackTrace();
			}
		} finally {
			// Close resources in finally block
			try {
				if (statement != null) {
					statement.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
	}
	/**
	 * Updates the company name of an employer in the database.
	 *
	 * @param id The ID of the employer whose company name is to be updated.
	 * @param cName The updated company name of the employer.
	 * @throws ClassNotFoundException If the JDBC driver class is not found.
	 * @Author Gopal Jamocha
     * @since 12-5-2024
	 */

	public void updateCompanyName(int id, String cName) throws ClassNotFoundException {
		Connection con = null;
		PreparedStatement statement = null;
		try {
			con = JdbcConnection.connectdatabase();
			String sql = "UPDATE EMPLOYERS SET COMPANYNAME = ? WHERE ID = ? ";
			statement = con.prepareStatement(sql);
			statement.setString(1, cName);
			statement.setInt(2, id);
			int rowsInserted = statement.executeUpdate();
			if (rowsInserted > 0) {
				System.out.println(ConsoleColors.GREEN + "Compay Name Update  successfully." + ConsoleColors.RESET);
			} else {
				System.out.println(ConsoleColors.RED + "Failed to  profile update." + ConsoleColors.RESET);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Updates the password of an employer in the database.
	 *
	 * @param id  The ID of the employer whose password is to be updated.
	 * @param password The updated password of the employer.
	 * @throws ClassNotFoundException If the JDBC driver class is not found.
	 * @Author Gopal Jamocha
     * @since 12-5-2024
	 */
	public void updatePassword(int id, String password) throws ClassNotFoundException {
		Connection con = null;
		PreparedStatement statement = null;
		try {
			con = JdbcConnection.connectdatabase();
			String sql = "UPDATE EMPLOYERS SET PASSWORD = ? WHERE ID = ? ";
			statement = con.prepareStatement(sql);
			statement.setString(1, password);
			statement.setInt(2, id);
			int rowsInserted = statement.executeUpdate();
			if (rowsInserted > 0) {
				System.out.println(ConsoleColors.GREEN + " Password Update  successfully." + ConsoleColors.RESET);
			} else {
				System.out.println(ConsoleColors.RED + "Failed to  Password update." + ConsoleColors.RESET);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * Updates the company register number of an employer in the database.
	 *
	 * @param  id      The ID of the employer whose company register number is to be updated.
	 * @param  rNumber The updated company register number of the employer.
	 * @throws ClassNotFoundException If the JDBC driver class is not found.
	 * @Author Gopal Jamocha
     * @since  12-5-2024
	 */

	public void updateRegisterNumber(int id, int rNumber) throws ClassNotFoundException {
		Connection con = null;
		PreparedStatement statement = null;
		try {
			con = JdbcConnection.connectdatabase();
			String sql = "UPDATE EMPLOYERS SET REGISTERNUMBER = ? WHERE Id = ? ";
			statement = con.prepareStatement(sql);
			statement.setInt(1, rNumber);
			statement.setInt(2, id);
			int rowsInserted = statement.executeUpdate();
			if (rowsInserted > 0) {
				System.out.println(
						ConsoleColors.GREEN + " Company Register Number  Update  successfully." + ConsoleColors.RESET);
			} else {
				System.out.println(
						ConsoleColors.RED + "Failed to  Company Register Number update." + ConsoleColors.RESET);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * Updates the domain of an employer in the database.
	 *
	 * @param id     The ID of the employer whose domain is to be updated.
	 * @param domain The updated domain of the employer.
	 * @throws ClassNotFoundException If the JDBC driver class is not found.
	 * @Author Gopal Jamocha
     * @since  12-5-2024
	 */
	public void updateDomain(int id, String domin) throws ClassNotFoundException {
		Connection con = null;
		PreparedStatement statement = null;
		try {
			con = JdbcConnection.connectdatabase();
			String sql = "UPDATE EMPLOYERS SET DOMAIN = ? WHERE Id = ? ";
			statement = con.prepareStatement(sql);
			statement.setString(1, domin);
			statement.setInt(2, id);
			int rowsInserted = statement.executeUpdate();
			if (rowsInserted > 0) {
				System.out.println(ConsoleColors.GREEN + "Domain Update Successfully." + ConsoleColors.RESET);
			} else {
				System.out.println(ConsoleColors.RED + "Failed to  Domain update." + ConsoleColors.RESET);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * Retrieves the employer ID associated with a given job ID from the database.
	 *
	 * @param jobId The ID of the job for which to retrieve the employer ID.
	 * @return The employer ID associated with the given job ID, or -1 if no employer is found.
	 * @throws ClassNotFoundException If the JDBC driver class is not found.
	 * @Author Gopal Jamocha
     * @since  12-5-2024
	 */
	public static int getEmployerIdForJob(int jobId) throws ClassNotFoundException {
		Connection con = null;
		PreparedStatement statement = null;
		// ResultSet rs = null;
		int employerId = -1; // Default value if no employer found

		try {
			con = JdbcConnection.connectdatabase();
			String query = "SELECT EMPLOYER_ID FROM jobs WHERE job_id = ?";
			statement = con.prepareStatement(query);
			statement.setInt(1, jobId);
			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) {
				employerId = resultSet.getInt("EMPLOYER_ID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return employerId;
	}
	/**
	 * Fetches information about job seekers who have applied for a specific job posted by the employer.
	 *
	 * @param employer The employer for whom the job seeker information is being fetched.
	 * @param jobId    The ID of the job for which to fetch job seeker information.
	 * @throws ClassNotFoundException If the JDBC driver class is not found.
	 * @author Gopal jamocha
	 * @since 17-5-2024 
	 */
	public void fetchJobSeekersInfo(Employer employer, int jobId) throws ClassNotFoundException {
		Connection con = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
//		boolean hasApplications = false; // Flag to check if any applications are found
		try {
			con = JdbcConnection.connectdatabase();
			// Checking the number of applications for the job
			String sq = "SELECT COUNT(*) AS num_applications FROM job_applications WHERE job_id = ? AND EMP_ID = ?";
			statement = con.prepareStatement(sq);
			statement.setInt(1, jobId);
			statement.setInt(2, employer.getId());
			rs = statement.executeQuery();

			if (rs.next()) {
				int numApplications = rs.getInt("num_applications");
				if (numApplications > 0) {
//					hasApplications = true; // Set the flag if applications are found
					System.out.println(ConsoleColors.GREEN + "Number of applications received for job " + jobId + ": "
							+ numApplications + ConsoleColors.RESET);
				} else {
					// No applications found
					// System.out.println("No applications received for job with ID " + jobId);
					System.out.println(ConsoleColors.RED + "Invalid job ID entered: " + jobId + ConsoleColors.RESET);
					System.out.println("+------------------------------------+");
					return;
				}
			} else {
				System.out.println(ConsoleColors.RED + "Invalid job ID entered: " + jobId + ConsoleColors.RESET);
				System.out.println("+------------------------------------+");
				return;
			}
			// Query to fetch job seeker information for the specified job
			String sql = "SELECT js.job_seeker_id, js.FName AS job_seeker_firstname, "
					+ "js.LName AS job_seeker_lastname, js.GENDER, js.EDUCATION, "
					+ "js.LANGUAGE, js.SKILLS, js.EXPERIENCE, js.ACHIVEMENTS, "
					+ "js.CONTACT_DETAILS, js.ADDRESS, js.EMAIL, js.OBJECTIVE, j.job_title "
					+ "FROM job_applications ja " + "JOIN job_seekers js ON ja.job_seeker_id = js.job_seeker_id "
					+ "JOIN jobs j ON ja.job_id = j.job_id " + "WHERE ja.job_id = ? AND j.employer_id = ?";

			statement = con.prepareStatement(sql);
			statement.setInt(1, jobId);
			statement.setInt(2, employer.getId());
			rs = statement.executeQuery();
			// Iterate over the result set and print job seeker information
			while (rs.next()) {
				// Fetch and print job seeker information
				int jobSeekerId = rs.getInt("job_seeker_id");
				String fName = rs.getString("job_seeker_firstname");
				String lName = rs.getString("job_seeker_lastname");
				String gender = rs.getString("GENDER");
				String education = rs.getString("EDUCATION");
				String language = rs.getString("LANGUAGE");
				String skills = rs.getString("SKILLS");
				String experience = rs.getString("EXPERIENCE");
				String achievements = rs.getString("ACHIVEMENTS");
				String contactDetails = rs.getString("CONTACT_DETAILS");
				String address = rs.getString("ADDRESS");
				String email = rs.getString("EMAIL");
				String objective = rs.getString("OBJECTIVE");
				String jobTitle = rs.getString("job_title");
				// Printing job seeker information
				System.out.println("Job_id     :  " + jobId);
				System.out.println("Job Title  : " + jobTitle);
				System.out.println(".....................................");
				System.out.println("Job Seeker ID     : " + jobSeekerId);
				System.out.println("Name              : " + fName + " " + lName);
				System.out.println("Gender            : " + gender);
				System.out.println("Email             : " + email);
				System.out.println("Objective         : " + objective);

				System.out.println("Education         : " + education);
				System.out.println("Language          : " + language);
				System.out.println("Skills            : " + skills);
				System.out.println("Experience        : " + experience);
				System.out.println("Achievements      : " + achievements);
				System.out.println("Contact Details   : " + contactDetails);
				System.out.println("Address           : " + address);
				System.out.println("--------------------");
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

	/**
	 * Allows the employer to perform various types of searches on job seekers based on different criteria.
	 *
	 * @param employer The employer performing the search.
	 * @throws ClassNotFoundException If the JDBC driver class is not found.
	 * @author Gopal jamocha
	 * @since  28-05-2024
	 */
	public void userSearch(Employer employer) throws ClassNotFoundException {
		boolean flag = true;
		do {
			System.out.println("+-----------------------------------------------------------+");
			System.out.println("|                        Search Menu                        |");
			System.out.println("+-----------------------------------------------------------+");
			System.out.println("| 1. Education, skill, and experience based search          |");
			System.out.println("| 2. Skill and experience based search                      |");
			System.out.println("| 3. Education based search                                 |");
			System.out.println("| 4. Notification send                                      |");
			System.out.println("| 5. Back                                                   |");
			System.out.println("| 6. Exit                                                   |");
			System.out.println("+-----------------------------------------------------------+");

			int option = 0;
			while (true) {
				System.out.print(ConsoleColors.CYAN + "Enter menu option number: " + ConsoleColors.RESET);
				String input = sc.next();

				try {
					option = Validation.validateOption(input);
					break;
				} catch (OptionException e) {
					System.out.println(ConsoleColors.YELLOW + e.getMessage() + ConsoleColors.RESET);
				}
			}
			// Consume the newline character
			sc.nextLine();

			switch (option) {
			case 1: {
				searchUsers("education,skillandexperiencebasedsearch");
				break;
			}
			case 2: {
				searchUsers("skill and experience based search");
				break;
			}
			case 3: {
				searchUsers("education based search");
				break;
			}
			case 4: {

				new Message().messages(employer);// Managing Notifications
				break;

			}
			case 5: {
				emoloyerMenu(this);// Returning to employer menu

				break;
			}
			case 6: {
				System.out.println(ConsoleColors.PURPLE + "Thank you for using Job Portal! Have a great day!"
						+ ConsoleColors.RESET);
				System.exit(0);
				break;
			}
			default: {
				System.out.println(
						ConsoleColors.RED + "Invalid option. Please enter a valid menu option." + ConsoleColors.RESET);
				break;
			}
			}
		} while (flag);
	}


	/**
	 * Overrides the searchUsers method to perform specific search types for job seekers.
	 *
	 * @param searchType The type of search to be performed.
	 * @throws ClassNotFoundException If the JDBC driver class is not found.
	 * @author Gopal jamocha
	 * @since  19-5-2024
	 */
	public void searchUsers(String searchType) throws ClassNotFoundException {
	    // Fetch all job seekers from the database
	    List<JobSeeker> allJobSeekers = new JobSeeker().fetchAllCandidatesFromDatabase();
	    List<JobSeeker> matchingJobSeekers = new ArrayList<>();

	    // Prompt the user based on the search type
	    switch (searchType.toLowerCase()) {
	        case "education,skillandexperiencebasedsearch": {
	            // Education, skill, and experience-based search
	            System.out.print(ConsoleColors.CYAN + "Enter The Education : " + ConsoleColors.RESET);
	            String education = sc.nextLine();
	            
	            System.out.print(ConsoleColors.CYAN + "Enter The Skills : " + ConsoleColors.RESET);
	            String skills = sc.nextLine();
	            
	            System.out.print(ConsoleColors.CYAN + "Enter the experience : " + ConsoleColors.RESET);
	            String experience = sc.nextLine();

	            // Filter job seekers based on education, skills, and experience criteria
	            matchingJobSeekers = allJobSeekers.stream()
	                .filter(candidate -> candidate.getEducation() != null && Arrays.stream(candidate.getEducation().split(",")).anyMatch(edu -> edu.contains(education))
	                        && candidate.getSkills() != null && Arrays.asList(candidate.getSkills().split(",")).contains(skills)
	                        && candidate.getExperience() != null && candidate.getExperience().equals(experience))
	                .collect(Collectors.toList());
	            break;
	        }
	        case "skill and experience based search": {
	            // Skill and experience-based search
	            System.out.print(ConsoleColors.CYAN + "Enter The Skills : " + ConsoleColors.RESET);
	            String skills = sc.nextLine();
	            
	            System.out.print(ConsoleColors.CYAN + "Enter the experience : " + ConsoleColors.RESET);
	            String experience = sc.nextLine();
	            
	            // Filter job seekers based on skills and experience criteria
	            matchingJobSeekers = allJobSeekers.stream()
	                .filter(candidate -> candidate.getSkills() != null && Arrays.stream(candidate.getSkills().split(",")).anyMatch(edu -> edu.contains(skills))
	                        && candidate.getExperience() != null && candidate.getExperience().equals(experience))
	                .collect(Collectors.toList());
	            break;
	        }
	        case "education based search": {
	            // Education-based search
	            System.out.print(ConsoleColors.CYAN + "Enter the education: [ex: BE]" + ConsoleColors.RESET);
	            String education = sc.nextLine();
	            
	            // Filter job seekers based on education criteria
	            matchingJobSeekers = allJobSeekers.stream()
	                .filter(candidate -> {
	                    String candidateEducation = candidate.getEducation();
	                    return candidateEducation != null && candidateEducation.equalsIgnoreCase(education);
	                }).collect(Collectors.toList());
	            break;
	        }
	        default:
	            // Throw an exception for an invalid search option
	            throw new IllegalArgumentException(ConsoleColors.RED + "Invalid search option." + ConsoleColors.RESET);
	    }
	    
	    // Print the details of matching job seekers
	    if (!matchingJobSeekers.isEmpty()) {
	        System.out.println("Matching Job Seekers:");
	        for (JobSeeker jobSeeker : matchingJobSeekers) {
	            // Print job seeker details
	            System.out.println("Job Seeker ID  : " + jobSeeker.getJobSeekerId());
	            System.out.println("Objective      : " + jobSeeker.getObjective());
	            System.out.println("FirtName       : " + jobSeeker.getFirstname());
	            System.out.println("LastName       : " + jobSeeker.getLastName());
	            System.out.println("Gender         : " + jobSeeker.getGender());
	            System.out.println("Email          : " + jobSeeker.getEmail());
	            System.out.println("Education      : " + jobSeeker.getEducation());
	            System.out.println("Skills         : " + jobSeeker.getSkills());
	            System.out.println("Language       : " + jobSeeker.getLanguageSkills());
	            System.out.println("Achievements   : " + jobSeeker.getAchivements());
	            System.out.println("Experience     : " + jobSeeker.getExperience());
	            //System.out.println("PhoneNumber : " + jobSeeker.getContactDetails());
	            System.out.println("Address        : " + jobSeeker.getAddress());
	            System.out.println("--------------------------------------");
	        }
	    } else {
	        // Print a message if no job seekers are found
	        System.out.println(ConsoleColors.RED + "No job seekers found for the given criteria." + ConsoleColors.RESET);
	    }
	}



	@Override
	public void searchUsers(String criteria, String searchType) throws ClassNotFoundException {
		// TODO Auto-generated method stub

	}

	@Override
	public void searchUsers(String education, String skills, String experience) throws ClassNotFoundException {
		// TODO Auto-generated method stub

	}

	@Override
	public void searchUsers(String education, String skills, String experience, int option)
			throws ClassNotFoundException {
		// TODO Auto-generated method stub

	}

	@Override
	public void searchUsers() throws ClassNotFoundException {
		// TODO Auto-generated method stub

	}

	@Override
	public void searchJobs(String string) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void search(String string, String string1, String string2) {
		// TODO Auto-generated method stub

	}

}
