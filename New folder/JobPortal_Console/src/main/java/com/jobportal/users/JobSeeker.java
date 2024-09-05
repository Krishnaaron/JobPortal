package com.jobportal.users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import java.util.stream.Collectors;
import java.util.*;

import com.consolecolors.ConsoleColors;
import com.jdbcservice.JdbcConnection;
import com.jobportal.functionality.Main;
import com.jobportal.listings.Application;
import com.jobportal.listings.Job;
import com.jobportal.listings.Search;
import com.messageandnoficationservices.Message;
import com.userdefiendexception.*;
import com.usersregisterlogin.LoginRegister;
/**
 * Represents a job seeker, extending the User class and implementing the Search interface.
 */
public class JobSeeker extends User implements Search {
	private int jobSeekerId;

	private String contactDetails;
	private String education;
	private String experience;
	private String skills;
	private String firstname;
	private String lastName;
	private int jobId;
	private int applicationId;
	private String exprience;
	private String gender;
	private String Address;
	private String languageSkills;
	private String achivements;
	private String objective;
	private long phoneNumber;

	public long getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(long phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	static Scanner sc = new Scanner(System.in);
	/**
	 * Constructs a new JobSeeker with the specified details.
	 *
	 * @param jobSeekerId   The ID of the job seeker.
	 * @param objective     The job seeker's career objective.
	 * @param firstName     The first name of the job seeker.
	 * @param lastName      The last name of the job seeker.
	 * @param gender        The gender of the job seeker.
	 * @param email         The email address of the job seeker.
	 * @param language      The language skills of the job seeker.
	 * @param achievements  The achievements of the job seeker.
	 * @param skills        The skills of the job seeker.
	 * @param education     The education background of the job seeker.
	 * @param experience    The work experience of the job seeker.
	 * @param phoneNumber   The phone number of the job seeker.
	 * @param address       The address of the job seeker.
	 */

	public JobSeeker(int applicationId, int jobId, String fName, String lName, String gender, String education,
			String language, String skills, String exprience, String achivements, String conatcDetails,
			String address) {
		this.applicationId = applicationId;
		this.jobId = jobId;
		this.firstname = fName;
		this.lastName = lName;
		this.gender = gender;
		this.education = education;
		this.languageSkills = language;
		this.skills = skills;
		this.achivements = achivements;
		this.contactDetails = conatcDetails;
		this.Address = address;
		this.exprience = exprience;
	}

	public int getJobId() {
		return jobId;
	}

	public void setJobId(int jobId) {
		this.jobId = jobId;
	}

	public int getApplicationId() {
		return applicationId;
	}

	public void setApplicationId(int applicationId) {
		this.applicationId = applicationId;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String fastname) {
		this.firstname = fastname;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getExprience() {
		return exprience;
	}

	public void setExprience(String exprience) {
		this.exprience = exprience;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getLanguageSkills() {
		return languageSkills;
	}

	public void setLanguageSkills(String languageSkills) {
		this.languageSkills = languageSkills;
	}

	public String getAchivements() {
		return achivements;
	}

	public void setAchivements(String achivements) {
		this.achivements = achivements;
	}

	public String getObjective() {
		return objective;
	}

	public void setObjective(String objective) {
		this.objective = objective;
	}

	public JobSeeker(String username, String email, String password, UserType userType) {
		super(username, email, password, userType);

	}

	public JobSeeker() {
		
	}

	public JobSeeker(String objective, String firstName, String lastName, String gender, String education,
			String languageSkills, String exprience, String skills, String achievements, String contactDetails,
			String address) {
	
		//this.jobSeekerId = jobSeekerId;
		this.contactDetails = contactDetails;
		this.education = education;
		this.skills = skills;
		this.firstname = firstName;
		this.lastName = lastName;
		this.exprience = exprience;
		this.gender = gender;
		this.Address = address;
		this.languageSkills = languageSkills;
		this.achivements = achievements;
		this.objective = objective;
	}

	public JobSeeker(int jobSeekerId2, String username, String email, String skills2, String education2,
			String experience2) {

	}

	public JobSeeker(int jobSeekerId, String objective, String fName, String lName, String gender, String email,
			String language, String achivements, String skills, String education, String experience,
			String contactDetails, String address) {
		this.jobSeekerId = jobSeekerId;
		this.objective = objective;
		this.education = education;
		this.skills = skills;

		this.firstname = fName;
		this.lastName = lName;
		this.experience = experience;
		this.education = education;
		this.gender = gender;
		this.Address = address;
		this.email = email;
		// this.phoneNumber=contactDetails;
		this.languageSkills = language;
		this.achivements = achivements;
		this.objective = objective;
		
	}

	public JobSeeker(int jobSeekerId, String objective, String fName, String lName, String gender, String email,
			String language, String achivements, String skills, String education, String experience, long phoneNumber,
			String address) {

		this.jobSeekerId = jobSeekerId;
		this.objective = objective;
		this.education = education;
		this.skills = skills;

		this.firstname = fName;
		this.lastName = lName;
		this.experience = experience;
		this.education = education;
		this.gender = gender;
		this.Address = address;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.languageSkills = language;
		this.achivements = achivements;
		this.objective = objective;
		// TODO Auto-generated constructor stub
	}

	public JobSeeker(int jobSeekerId, int applicationId, int jobId, String objective, String fName, String lName,
			String gender, String email, String education, String language, String skills, String experience,
			String achievements, String contactDetails, String address) {
		// TODO Auto-generated constructor stub
		this.jobSeekerId = jobSeekerId;
		this.objective = objective;
		this.education = education;
		this.skills = skills;

		this.firstname = fName;
		this.lastName = lName;
		this.experience = experience;
		this.education = education;
		this.gender = gender;
		this.Address = address;
		this.email = email;
		//this.phoneNumber = phoneNumber;
		this.languageSkills = language;
		this.achivements = achievements;
		this.objective = objective;
	}

	public static Scanner getSc() {
		return sc;
	}

	public static void setSc(Scanner sc) {
		JobSeeker.sc = sc;
	}

	public int getJobSeekerId() {
		return jobSeekerId;
	}

	public void setJobSeekerId(int jobSeekerId) {
		this.jobSeekerId = jobSeekerId;
	}

	public String getContactDetails() {
		return contactDetails;
	}

	public void setContactDetails(String contactDetails) {
		this.contactDetails = contactDetails;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}
	/**
	 * Registers a new job seeker in the system.
	 * 
	 * This method prompts the user to enter a username, password, and email, 
	 * validates the inputs, and then registers the job seeker if all inputs 
	 * are valid. It ensures the username is unique and adheres to format 
	 * constraints, the password meets security requirements, and the email 
	 * is in a valid format.
	 * 
	 * @throws ClassNotFoundException      If the JDBC driver class is not found.
	 * @throws SQLException                If a database access error occurs.
	 * @throws CheckUserNameException      If there is an issue with the username format.
	 * @throws OptionException             If there is an issue with selecting options.
	 * @author Gopal jamocha
	 * @since  19-05-2024
	 */
	public void jobSeekerRegister()
			throws ClassNotFoundException, SQLException, CheckUserNameException, OptionException {
		String userName, email, password;

		while (true) {
			// Loop for entering and validating username
			System.out.println(ConsoleColors.CYAN
					+ "Enter the username : Usernames must be 3-20 characters long and can contain letters, digits, underscores, and hyphens."
					+ ConsoleColors.RESET);
			userName = sc.nextLine();
			// Check if username meets the validation criteria
			if (!Validation.checkUserName(userName)) {
				System.out.println(ConsoleColors.YELLOW
						+ "Invalid username format! Usernames must be 3-20 characters long and can contain letters, digits, underscores, and hyphens."
						+ ConsoleColors.RESET);
				continue;
			} else {
				// Check if username already exists
				new LoginRegister();
				if (LoginRegister.isSeekerUsernameExists(userName)) {
					System.out.println(ConsoleColors.RED
							+ "Username already exists! Please choose a different username.!" + ConsoleColors.RESET);
					continue;
				} else {
					break;
				}
			}
		}
		 // Loop for entering and validating password
		while (true) {
			System.out.println(ConsoleColors.CYAN
					+ "Enter the password : password format! Passwords must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character]"
					+ ConsoleColors.RESET);

			password = sc.nextLine();
			// Check if password meets the validation criteria
			if (!Validation.checkPassword(password)) {
				System.out.println(ConsoleColors.YELLOW
						+ "Invalid password format! Passwords must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character !"
						+ ConsoleColors.RESET);

			} else {
				break;
			}
		}
		while (true) { // Loop for entering and validating email

			System.out.println(ConsoleColors.CYAN + "Enter the email [ name@gmail.com] :" + ConsoleColors.RESET);
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
		// Create a new JobSeeker object
		JobSeeker jobseeker = new JobSeeker(userName, email, password, UserType.JOBSEEKER);

		LoginRegister.registerJobSeeker(jobseeker);

		// jobSeekerLogin();

	}
	/**
	 * Logs in a job seeker.
	 * 
	 * This method prompts the user to enter their username and password, validates the credentials,
	 * and provides access to the job seeker menu if the login is successful. It allows up to three
	 * login attempts, after which it offers the user the option to change their password.
	 * 
	 * @throws ClassNotFoundException If the JDBC driver class is not found.
	 * @throws SQLException If a database access error occurs.
	 * @throws CheckUserNameException If there is an issue with the username format.
	 * @throws OptionException If there is an issue with selecting options.
	 * @throws CompanyNameValidationException If there is an issue with the company name format.
	 * @author Gopal 
	 * 
	 */
	public void jobSeekerLogin() throws ClassNotFoundException, SQLException, CheckUserNameException, OptionException,
			CompanyNameValidationException {

		String userName, password;

		int maxAttempts = 3;// Maximum number of login attempts
		int attempts = 0;// Current number of attempts

		while (attempts < maxAttempts) {
			 // Prompt for username
			System.out.println(ConsoleColors.CYAN + "Enter the username :" + ConsoleColors.RESET);

			userName = sc.nextLine();
			// Prompt for password
			System.out.println(ConsoleColors.CYAN + "Enter the password :" + ConsoleColors.RESET);
			password = sc.nextLine();
			// Attempting user login
			Object loggedIn = LoginRegister.userslogin(userName, password, UserType.JOBSEEKER);

			if (loggedIn instanceof JobSeeker) {
				JobSeeker seeker = (JobSeeker) loggedIn;

				System.out.println(ConsoleColors.BLUE + "+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+");
				System.out.println("                                              ");
				System.out.println(
						ConsoleColors.GREEN + "     Welcome " + userName + " [Job Seeker]    " + ConsoleColors.RESET);
				System.out.println(ConsoleColors.BLUE + "                                              ");
				System.out.println("+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+" + ConsoleColors.RESET);
				 // Redirecting to job seeker menu
				jobSeekerMenu(seeker);

//		} else {
//			System.out.println(ConsoleColors.RED+"Login failed. Incorrect username or password !"+ConsoleColors.RESET);

			} else {
				attempts++;
				int remainingAttempts = maxAttempts - attempts;
				if (remainingAttempts > 0) {
					System.out.println(
							ConsoleColors.RED + "Login failed. Incorrect username, password, or account inactive. "
									+ "You have " + remainingAttempts + " attempt(s) left." + ConsoleColors.RESET);
				} else {
	                // If login fails three times, offer the option to change password

					System.out.println(
							ConsoleColors.BLUE + "Would you like to change your password? (Y/N)" + ConsoleColors.RESET);
					String changeOption = sc.nextLine();
					if (changeOption.equalsIgnoreCase("Y")) {
						// Implement your logic for password change here
						System.out.println("Redirecting to password change page...");
					} else {
						System.out.println("Exiting...");
						new Main().jobSeeker();
					}
				}
			}
		}
	}
	/**
	 * Displays the job seeker menu and handles user input based on the selected option.
	 * @param seeker The job seeker object representing the logged-in user.
	 * @author Gopal jamocha
	 */
	public void jobSeekerMenu(JobSeeker seeker) throws ClassNotFoundException, SQLException, OptionException,
			CheckUserNameException, CompanyNameValidationException {
		boolean flag = false;
		do {

			System.out.println("+-----------------------------------------+");
			System.out.println("|          Job Seeker Menu                |");
			System.out.println("+-----------------------------------------+");
			System.out.println("| 1. Resume                               |");
			System.out.println("| 2. Search Jobs And Apply for Jobs       |");
			System.out.println("| 3. Application Status                   |");
			System.out.println("| 4. Profile Management                   |");
			System.out.println("| 5. Notification                         |");
			System.out.println("| 6. LogOut                               |");
			System.out.println("| 7. Exit                                 |");
			System.out.println("+-----------------------------------------+");

			int option = 0;
			// Validate and handle user input for menu option selection
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
				// View and manage resume
				seeker.profile(seeker);
				break;

			}
			case 2: {
				// Search jobs and apply
				seeker.seachjobs(seeker);
				break;
			}

			case 3: {
				 // View application status
				new Application();
				Application.viewApplicationStatus(seeker.getJobSeekerId());
				jobSeekerMenu(seeker);// Return to the job seeker menu
				break;
			}
			case 4: {
				// Manage profile
				seeker.manageProfie(seeker.getJobSeekerId());
				break;

			}
			case 5: {
				 // View notifications
				new Message().message(seeker);

				break;
			}
			case 6: {
				 // Log out
				System.out.println(ConsoleColors.PURPLE + "Logged out successfully. Thank you for using Job Portal!"
						+ ConsoleColors.RESET);
				sc.nextLine();
				new Main().jobSeeker(); // Return to the job seeker login/signup menu

				break;

			}
			case 7: {
				// Exit the application
				System.out.println(ConsoleColors.PURPLE + "Thank You For Using Job Portal!  Have a Great Day!"
						+ ConsoleColors.RESET);

				System.exit(0);
				break;
			}
			default:
				  // Handle invalid option
				System.out.println(ConsoleColors.RED + "Pleace Enter The Correct Option :" + ConsoleColors.RESET);
				jobSeekerMenu(this);

			}
		} while (flag); // Loop until flag is true
	}
	/**
	 * Displays the resume menu for the job seeker and handles user interactions based on the selected options.
	 * @param seeker The job seeker object representing the logged-in user.
	 * @author Gopal jamocha
	 */
	public void profile(JobSeeker seeker) throws ClassNotFoundException, SQLException, OptionException,
			CheckUserNameException, CompanyNameValidationException {
		boolean flag = true;
		do {
			  // Display the resume menu options
			System.out.println("+------------------------------------+");
			System.out.println("|          Resume Menu               |");
			System.out.println("+------------------------------------+");
			System.out.println("| 1. Create Resume                   |");
			System.out.println("| 2. View Resume                     |");
			System.out.println("| 3. Update Resume                   |");
			System.out.println("| 4. Back                            |");
			System.out.println("| 5. Exit                            |");
			System.out.println("+------------------------------------+");

			int option = 0;
			// Validate and handle user input for menu option selection
			while (true) {
				System.out.print(ConsoleColors.CYAN + "Enter menu option number: " + ConsoleColors.RESET);
				String input = sc.next();

				try {
					option = Validation.validateOption(input);
					break;
				} catch (OptionException e) {
					System.out.println(ConsoleColors.RED + e.getMessage() + ConsoleColors.RESET);
				}
			} // Switch case for handling user selection

			switch (option) {
			case 1: {
				sc.nextLine();
				 // Create resume
				resume(seeker);

				break;
			}
			case 2: {
				// View resume if exists
				String checking = view(seeker.getJobSeekerId());

				if (checking == null) {
					System.out.println(ConsoleColors.YELLOW + "[Pleace created resume ]" + ConsoleColors.RESET);
				} else {
					viewResume(seeker.getJobSeekerId());
				}
				break;
			}
			case 3: {

				sc.nextLine();
				if (view(seeker.getJobSeekerId()) == null) {
					System.out.println(ConsoleColors.YELLOW + "[Please create a resume ]" + ConsoleColors.RESET);
				} else {

					resume(seeker);// Update resume

				}
				break;

			}
			case 4: {
				// Go back to job seeker menu
				jobSeekerMenu(this);
				break;
			}
			case 5: {
				// Exit the application
				System.out.println(ConsoleColors.PURPLE + "Thank You For Using Job Portal!  Have a Great Day!"
						+ ConsoleColors.RESET);

				System.exit(0);
				break;

			}
			default:
				System.out.println(ConsoleColors.RED + "Enter The Correct Option !" + ConsoleColors.RESET);
				profile(this);// Re-display the resume menu

			}
		} while (flag);
	}
	/**
	 * Allows the job seeker to create or update their resume by inputting various details.
	 * 
	 * @param seeker The JobSeeker object representing the logged-in user.
	 * @author Gopal jamocha
	 */
	public void resume(JobSeeker seeker) {
		String objective;
		while (true) {
			System.out.println(ConsoleColors.CYAN + "Enter Your Objective :" + ConsoleColors.RESET);
			objective = sc.nextLine();

			// Validate the achievements input
			if (!Validation.isValidAchievements(objective)) {
				System.out.println(ConsoleColors.YELLOW + "Invalid achievements! Please provide a non-null value."
						+ ConsoleColors.RESET);
				// Prompt the user to enter the achievements again
			} else {
				// If the achievements input is valid, break out of the loop
				break;
			}
		}

		String firstName;
		while (true) {
			System.out.println(ConsoleColors.CYAN + "Enter Your First Name :" + ConsoleColors.RESET);
			firstName = sc.nextLine();

			// Validate the first name
			if (!Validation.isValidName(firstName)) {
				System.out.println(ConsoleColors.YELLOW + "Invalid first name! Please enter a name with only letters."
						+ ConsoleColors.RESET);
				// Prompt the user to enter the first name again
			} else {
				// If the first name is valid, break out of the loop
				break;
			}
		}

		String lastName;
		while (true) {
			System.out.println(ConsoleColors.CYAN + "Enter Your Last Name :" + ConsoleColors.RESET);
			lastName = sc.nextLine();

			// Validate the first name
			if (!Validation.isValidName(lastName)) {
				System.out.println(ConsoleColors.YELLOW + "Invalid last name! Please enter a name with only letters."
						+ ConsoleColors.RESET);
				// Prompt the user to enter the first name again
			} else {
				// If the first name is valid, break out of the loop
				break;
			}
		}
		String gender;
		while (true) {
			System.out.println(
					ConsoleColors.CYAN + "Enter your gender:['male', 'female', or 'other] " + ConsoleColors.RESET);
			gender = sc.nextLine();
			if (!Validation.isValidGender(gender)) {
				System.out.println(ConsoleColors.YELLOW + "Invalid gender! Please enter 'male', 'female', or 'other'."
						+ ConsoleColors.RESET);
			} else {
				break;
			}
		}

		String education;
		while (true) {
			System.out.println(ConsoleColors.CYAN + "Enter Your Education (comma-separated): [BE CSE, BSc IT OR Nill]:"
					+ ConsoleColors.RESET);
			;
			education = sc.nextLine();

			// Validate the education input
			if (!Validation.isValidEducation(education)) {
				System.out.println(ConsoleColors.YELLOW
						+ "Invalid education format! Please enter comma-separated values." + ConsoleColors.RESET);
				// Prompt the user to enter the education again
			} else {
				// If the education input is valid, break out of the loop
				break;
			}
		}

		String languageSkills;
		while (true) {
			System.out.println(ConsoleColors.CYAN + "Enter Your Language Skills (comma-separated): English,Hindi...:"
					+ ConsoleColors.RESET);
			;
			languageSkills = sc.nextLine();

			// Validate the education input
			if (!Validation.isValidLanguageSkills(languageSkills)) {
				System.out.println(ConsoleColors.YELLOW
						+ "Invalid languageSkills format! Please enter comma-separated values." + ConsoleColors.RESET);
				// Prompt the user to enter the education again
			} else {
				// If the education input is valid, break out of the loop
				break;
			}
		}

		String experience;
		while (true) {
			// Prompt the user to enter experience
			System.out.println(ConsoleColors.CYAN + "Enter Your Experience[0 to 70] :" + ConsoleColors.RESET);
			experience = sc.nextLine();

			// Validate the experience input
			if (Validation.isValidExperience(experience)) {

				break; // Break out of the loop if input is valid
			} else {
				System.out.println(
						"Invalid experience input! Please enter a positive number within the range of 0 to 70.");
				// Ask the user to enter experience again
			}
		}

		String skills;
		while (true) {
			System.out.println(
					ConsoleColors.CYAN + "Enter Your Language Skills (comma-separated):[Java,c,c++,python OR NILL]:"
							+ ConsoleColors.RESET);
			;
			skills = sc.nextLine();

			// Validate the education input
			if (!Validation.isValidSkills(skills)) {
				System.out.println(ConsoleColors.YELLOW
						+ "Invalid education format! Please enter comma-separated values." + ConsoleColors.RESET);
				// Prompt the user to enter the education again
			} else {
				// If the education input is valid, break out of the loop
				break;
			}
		}

		String achievements;
		while (true) {
			System.out.println(ConsoleColors.CYAN + "Enter Your Achievements :" + ConsoleColors.RESET);
			achievements = sc.nextLine();

			// Validate the achievements input
			if (!Validation.isValidAchievements(achievements)) {
				System.out.println(ConsoleColors.YELLOW + "Invalid achievements! Please provide a non-null value."
						+ ConsoleColors.RESET);
				// Prompt the user to enter the achievements again
			} else {
				// If the achievements input is valid, break out of the loop
				break;
			}
		}
//	System.out.println(ConsoleColors.CYAN+"Enter Your Contact Details :"+ConsoleColors.RESET);
//	String contactDetails = sc.nextLine();
		String contactDetails;
		System.out.println(ConsoleColors.CYAN
				+ "Enter The Phone Number : [ Contact number should be 10 digits long and start with 9, 7, 8]"
				+ ConsoleColors.RESET);
		while (true) {
			contactDetails = sc.nextLine();
			if (!Validation.isValidPhoneNumber(contactDetails)) {
				System.out.println(ConsoleColors.YELLOW
						+ "[ Contact number should be 10 digits long and start with 9, 7, 8]" + ConsoleColors.RESET);
				continue;
			} else {
				break;
			}
		}

		String address;
		while (true) {
			System.out.println(ConsoleColors.CYAN + "Enter Your Address :" + ConsoleColors.RESET);
			address = sc.nextLine();

			// Validate the achievements input
			if (!Validation.isValidAchievements(address)) {
				System.out.println(
						ConsoleColors.YELLOW + "Please Address provide a non-null value." + ConsoleColors.RESET);
				// Prompt the user to enter the address again
			} else {
				// If the address input is valid, break out of the loop
				break;
			}
		}
		 // Create a JobSeeker object with the collected information
		JobSeeker jobseeker = new JobSeeker(objective, firstName, lastName, gender, education, languageSkills,
				experience, skills, achievements, contactDetails, address);

		try {
			 // Create or update the job seeker's profile with the provided information
			profileCreating(jobseeker, seeker.getJobSeekerId());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * Updates the profile of a job seeker in the database.
	 *
	 * @param js The JobSeeker object containing the updated profile information.
	 * @param id The ID of the job seeker whose profile is being updated.
	 * @throws ClassNotFoundException If the JDBC driver class is not found.
	 * @author Gopal jamocha
	 */
	public void profileCreating(JobSeeker js, int id) throws ClassNotFoundException {
		Connection con = null;
		PreparedStatement statement = null;

		try {
			// Establish a database connection
			con = JdbcConnection.connectdatabase();
			// Prepare the SQL statement
			String sql = "UPDATE job_seekers SET OBJECTIVE = ?, FNAME = ?, LNAME = ?, GENDER = ?, EDUCATION = ?, LANGUAGE = ?, EXPERIENCE = ?, SKILLS = ?, ACHIVEMENTS = ?, CONTACT_DETAILS = ?, ADDRESS = ? WHERE  JOB_SEEKER_ID = ?";

			statement = con.prepareStatement(sql);
            // Set the parameters for the prepared statement
			statement.setString(1, js.getObjective());
			statement.setString(2, js.getFirstname());
			statement.setString(3, js.getLastName());
			statement.setString(4, js.getGender());
			statement.setString(5, js.getEducation());
			statement.setString(6, js.getLanguageSkills());
			statement.setString(7, js.getExprience());
			statement.setString(8, js.getSkills());
			statement.setString(9, js.getAchivements());
			statement.setString(10, js.getContactDetails());
			statement.setString(11, js.getAddress());
			statement.setInt(12, id);
			// Execute the update statement
			int rowsUpdated = statement.executeUpdate();

			if (rowsUpdated > 0) {
				System.out.println(ConsoleColors.GREEN + "Profile updated successfully." + ConsoleColors.RESET);
			} else {
				System.out.println(ConsoleColors.RED + "Failed to update profile. User not found or no changes made."
						+ ConsoleColors.RESET);
			}

		} catch (SQLException e) {
			e.printStackTrace();// Print any SQL exceptions that occur
		}

	}
	/**
	 * Retrieves and displays the resume of a job seeker from the database.
	 *
	 * @param id The ID of the job seeker whose resume is being viewed.
	 * @throws ClassNotFoundException If the JDBC driver class is not found.
	 * @author Gopal jamocha
	 */
	public void viewResume(int id) throws ClassNotFoundException {
		Connection con = null;
		PreparedStatement statement = null;
		ResultSet rs = null;

		try {
			// Establish a database connection
			con = JdbcConnection.connectdatabase();
			String sql = "SELECT OBJECTIVE, FNAME, LNAME, GENDER, EDUCATION, LANGUAGE,EXPERIENCE,SKILLS,ACHIVEMENTS,CONTACT_DETAILS,ADDRESS FROM JOB_SEEKERS WHERE JOB_SEEKER_ID = ?";
			// Prepare the SQL statement
			statement = con.prepareStatement(sql);
			// Set the ID parameter
			statement.setInt(1, id);
			// Execute the query
			rs = statement.executeQuery();
			// Iterate over the result set and print the resume details
			while (rs.next()) {

				String objective = rs.getString("OBJECTIVE");
				String fName = rs.getString("FNAME");
				String lName = rs.getString("LNAME");
				String gender = rs.getString("GENDER");
				String education = rs.getString("EDUCATION");
				String language = rs.getString("LANGUAGE");
				String experience = rs.getString("EXPERIENCE");
				String skills = rs.getString("SKILLS");
				String achivements = rs.getString("ACHIVEMENTS");
				String contactDetils = rs.getString("CONTACT_DETAILS");
				String address = rs.getString("ADDRESS");
				// Print resume details
				System.out.println("------------------------------------");
				System.out.println("Objective                : " + objective);
				System.out.println("FirstName                : " + fName);
				System.out.println("LastName                 : " + lName);
				System.out.println("Gender                   : " + gender);
				System.out.println("Education                : " + education);
				System.out.println("Language                 : " + language);
				System.out.println("Experience               : " + experience);
				System.out.println("Skills                   : " + skills);
				System.out.println("Achievements             : " + achivements);
				System.out.println("ContactDetails           : " + contactDetils);
				System.out.println("Address                  : " + address);
				System.out.println("------------------------------------");

			}

		} catch (SQLException e) {
			e.printStackTrace();//Print any SQL exceptions that occur
		}

	}

	public String view(int id) throws ClassNotFoundException {
		Connection con = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		String checking = null;

		try {

			con = JdbcConnection.connectdatabase();
			String sql = "SELECT GENDER FROM JOB_SEEKERS WHERE JOB_SEEKER_ID = ?";
			statement = con.prepareStatement(sql);
			statement.setInt(1, id);
			rs = statement.executeQuery();
			while (rs.next()) {

				checking = rs.getString("GENDER");

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return checking;
	}
	/**
	 * Allows job seekers to search for available jobs based on various criteria.
	 *
	 * @param seeker The job seeker performing the job search.
	 * @throws ClassNotFoundException     If the JDBC driver class is not found.
	 * @author Gopal jamocha
	 */
	public void seachjobs(JobSeeker seeker) throws ClassNotFoundException, SQLException, OptionException,
			CheckUserNameException, CompanyNameValidationException {
		boolean flag = true;
		do {
			System.out.println("+------------------------------------+");
			System.out.println("|          Search Options            |");
			System.out.println("+------------------------------------+");
			System.out.println("| 1. View All Jobs                   |");
			System.out.println("| 2. Job Title-based Search          |");
			System.out.println("| 3. Location-based Search           |");
			System.out.println("| 4. JobType-based Search            |");
			System.out.println("| 5. CompanyName-based Search        |");
			System.out.println("| 6. Apply for Jobs                  |");
			System.out.println("| 7. Back                            |");
			System.out.println("| 8. Exit                            |");
			System.out.println("+------------------------------------+");

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
			} // Switch case for handling user selection
			switch (option) {
			case 1: {

				searchJob("alljobs");

				break;
			}
			case 2: {

				searchJob("jobTitle");
				break;
			}
			case 3: {

				searchJob("location");
				break;

			}
			case 4: {

				searchJob("jobtype");
				break;
			}
			case 5: {

				searchJob("companyname");
				break;

			}
			case 6: {
				if (view(seeker.getJobSeekerId()) == null) {
					System.out.println(ConsoleColors.YELLOW + "[...Please create a resume before applying for a job...]"
							+ ConsoleColors.RESET);
				} else {
					// System.out.println("Enter the job id:");
					// int jobId = sc.nextInt();
					int job;
					while (true) {
						System.out.println(ConsoleColors.CYAN + "Enter The Job_Id :" + ConsoleColors.RESET);
						String id = sc.next();
						try {
							job = Validation.isValidJobId(id);

							break;
						} catch (NumberException e) {
							System.out.println(ConsoleColors.YELLOW + e.getMessage() + ConsoleColors.RESET);
						}

					}
					seeker.applyForJob(job, seeker);
					// Assuming you want to exit the loop after applying for a job
				}
				break;
			}
			case 7: {
				try {
					jobSeekerMenu(this);
				} catch (ClassNotFoundException | SQLException | OptionException | CheckUserNameException
						| CompanyNameValidationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;

			}

			case 8: {
				System.out.println(ConsoleColors.PURPLE + "Thank You For Using Job Portal!  Have a Great Day!"
						+ ConsoleColors.RESET);
				System.exit(0);
				break;
			}
			default:
				System.out.println(ConsoleColors.RED + "[.....Enter The Corrct Option.....]" + ConsoleColors.RESET);
				seachjobs(seeker);
			}

		} while (flag);

	}
	/**
	 * Retrieves all available jobs from the database.
	 *
	 * @return A list of Job objects representing the available jobs.
	 * @author Gopal jamocha
	 */
	public List<Job> viewAllJobs() throws ClassNotFoundException, SQLException {
		ArrayList<Job> jobs = new ArrayList<Job>();
		Connection con = null;
		PreparedStatement statement = null;
		ResultSet rs = null;

		try {
			// Establish database connection
			con = JdbcConnection.connectdatabase();
			// SQL query to retrieve all jobs
			String sqlBuilder = "SELECT * FROM jobs ";
			 // Execute query
			statement = con.prepareStatement(sqlBuilder);

			rs = statement.executeQuery();

			boolean foundJobs = false; // Flag to check if any jobs are found

			while (rs.next()) {
				foundJobs = true; // At least one job is found
				int jobId = rs.getInt("job_id");
				 // Retrieve job details from the result set
				// String companyName =rs.getString(jobId);
				String jobTitle = rs.getString("job_title");
				String jobDescription = rs.getString("job_description");
				String location = rs.getString("location");
				String requiredSkills = rs.getString("required_skills");
				String jobType = rs.getString("job_type");
				String experienceLevel = rs.getString("experience_level");
				String applicationDeadline = rs.getString("application_deadline");
				int numberOfOpenings = rs.getInt("number_of_openings");
				String job_status = rs.getString("Job_status");
				String companyName = rs.getString("COMPANY_NAME");
				 // Create a Job object with the retrieved details

				Job job = new Job(jobId, jobTitle, jobDescription, location, requiredSkills, jobType, experienceLevel,
						applicationDeadline, numberOfOpenings, job_status, companyName);
				// Add the job to the list
				jobs.add(job);
			}
			// Print a message if no jobs are found
			if (!foundJobs) {
				System.out.println(ConsoleColors.RED + "No jobs available." + ConsoleColors.RESET);
			}

		} catch (SQLException e) {
			 // Handle any SQL exceptions
			System.out.println(ConsoleColors.CYAN + e.getMessage() + ConsoleColors.RESET);
		} finally {
			// Close resources in the finally block
			if (rs != null) {
				rs.close();
			}
			if (statement != null) {
				statement.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return jobs;
	}
//
//	public void searchJob(String searchType) throws ClassNotFoundException, SQLException {
//		List<Job> allJob = new JobSeeker().viewAllJobs();
//		List<Job> matchingJobs = new ArrayList<>();
//
//		switch (searchType.toLowerCase()) {
//
//		case "alljobs": {
//			matchingJobs = allJob;
//			break;
//		}
//		case "companyname": {
//			sc.nextLine();
//			System.out.print(ConsoleColors.CYAN + "Enter The CompanyName : " + ConsoleColors.RESET);
//			String companyName = sc.nextLine();
//			matchingJobs = allJob.stream().filter(job -> {
//				String company = job.getCompanyName();
//				return (company != null && company.contains(companyName));
//			}).collect(Collectors.toList());
//
//			break;
//		}
//		case "location": {
//			sc.nextLine();
//			System.out.print(ConsoleColors.CYAN + "Enter The Location : " + ConsoleColors.RESET);
//			String locat = sc.nextLine();
//			matchingJobs = allJob.stream().filter(job -> {
//				String location = job.getLocation();
//				return (location != null && location.contains(locat));
//			}).collect(Collectors.toList());
//			break;
//		}
//		case "jobtitle": {
//			sc.nextLine();
//			System.out.print(ConsoleColors.CYAN + "Enter The JobTitle Name :" + ConsoleColors.RESET);
//			String jobTitle = sc.nextLine();
//			matchingJobs = allJob.stream().filter(job -> {
//				String jobT = job.getJobTitle();
//				return (jobT != null && jobT.contains(jobTitle));
//			}).collect(Collectors.toList());
//			break;
//		}
//		case "jobtype": {
//			sc.nextLine();
//			System.out.print(
//					ConsoleColors.CYAN + "Enter The Job Type [full time,part Time,intern ] :" + ConsoleColors.RESET);
//			String jobType = sc.nextLine();
//			matchingJobs = allJob.stream().filter(job -> {
//				String jobTy = job.getJobType();
//				return (jobTy != null && jobTy.contains(jobType));
//			}).collect(Collectors.toList());
//			break;
//		}
//		default: {
//			throw new IllegalArgumentException(ConsoleColors.RED + "Invalid search option." + ConsoleColors.RESET);
//
//		}
//
//	}
//
//		// Print the details of matching job seekers
//		if (!matchingJobs.isEmpty()) {
//			System.out.println("Matching Job Seekers:");
//			for (Job job : matchingJobs) {
//				System.out.println("------------------------------------");
//				System.out.println("Job ID               : " + job.getJobId());
//				System.out.println("Company Name         : " + job.getCompanyName());
//				System.out.println("Job Title            : " + job.getJobTitle());
//				System.out.println("Description          : " + job.getJobDescription());
//				System.out.println("Location             : " + job.getLocation());
//				System.out.println("Required Skills      : " + job.getRequiredSkills());
//				System.out.println("Job Type             : " + job.getJobType());
//				System.out.println("Experience Level     : " + job.getExperienceLevel());
//				System.out.println("Application Deadline : " + job.getApplicationDeadline());
//				System.out.println("Number of Openings   : " + job.getNumberOfOpenings());
//				// System.out.println("Job Status: " + job.getJobStatus());
//				System.out.println("------------------------------------");
//
//			}
//		} else {
//			System.out.println(ConsoleColors.RED + "No Job  Found For The Given Criteria." + ConsoleColors.RESET);
//		}
//	}
	/**
	 * Searches for jobs based on the specified search type.
	 *
	 * @param searchType The type of search to perform (e.g., "alljobs", "companyname", etc.)
	 * @author Gopal jamocah
	 */
	public void searchJob(String searchType) throws ClassNotFoundException, SQLException {
		// Retrieve all jobs from the database
	    List<Job> allJob = new JobSeeker().viewAllJobs();
	    List<Job> matchingJobs = new ArrayList<>();
	    // Perform search based on the specified search type
         switch (searchType.toLowerCase()) {
	        case "alljobs": {
	        	 // Return all jobs
	            //matchingJobs = allJob;
	        	 matchingJobs = allJob.stream()
                         .filter(job -> job.getJobstatus().equalsIgnoreCase("active"))
                         .collect(Collectors.toList());
	            break;
	        }
	        case "companyname": {
	        	// Search by company name
	            sc.nextLine();
	            System.out.print(ConsoleColors.CYAN + "Enter The CompanyName : " + ConsoleColors.RESET);
	            String companyName = sc.nextLine();
	            matchingJobs = allJob.stream()
	                                 .filter(job -> job.getCompanyName() != null && job.getCompanyName().contains(companyName) && job.getJobstatus().equalsIgnoreCase("active"))
	                                 .collect(Collectors.toList());
	            break;
	        }
	        case "location": {
	        	 // Search by location
	            sc.nextLine();
	            System.out.print(ConsoleColors.CYAN + "Enter The Location : " + ConsoleColors.RESET);
	            String locat = sc.nextLine();
	            matchingJobs = allJob.stream()
	                                 .filter(job -> job.getLocation() != null && job.getLocation().contains(locat) && job.getJobstatus().equalsIgnoreCase("active"))
	                                 .collect(Collectors.toList());
	            break;
	        }
	        case "jobtitle": {
	        	// Search by job title
	            sc.nextLine();
	            System.out.print(ConsoleColors.CYAN + "Enter The JobTitle Name :" + ConsoleColors.RESET);
	            String jobTitle = sc.nextLine();
	            matchingJobs = allJob.stream()
	                                 .filter(job -> job.getJobTitle() != null && job.getJobTitle().contains(jobTitle) && job.getJobstatus().equalsIgnoreCase("active"))
	                                 .collect(Collectors.toList());
	            break;
	        }
	        case "jobtype": {
	        	// Search by job type
	            sc.nextLine();
	            System.out.print(ConsoleColors.CYAN + "Enter The Job Type [full time, part time, intern] :" + ConsoleColors.RESET);
	            String jobType = sc.nextLine();
	            matchingJobs = allJob.stream()
	                                 .filter(job -> job.getJobType() != null && job.getJobType().contains(jobType) && job.getJobstatus().equalsIgnoreCase("active"))
	                                 .collect(Collectors.toList());
	            break;
	        }
	        default: {
	            throw new IllegalArgumentException(ConsoleColors.RED + "Invalid search option." + ConsoleColors.RESET);
	        }
	    }

	    System.out.println(ConsoleColors.GREEN+"Number of  Jobs Find Given Criteria :" + matchingJobs.size() +""+ConsoleColors.RESET);

	    // Sort the matching jobs by Job ID
	    matchingJobs.sort(Comparator.comparing(Job::getJobId));

	    // Print the details of matching job seekers
	    if (!matchingJobs.isEmpty()) {
	        System.out.println("Matching Job Seekers:");
	        for (Job job : matchingJobs) {
	            System.out.println("------------------------------------");
	            System.out.println("Job ID               : " + job.getJobId());
	            System.out.println("Company Name         : " + job.getCompanyName());
	            System.out.println("Job Title            : " + job.getJobTitle());
	            System.out.println("Description          : " + job.getJobDescription());
	            System.out.println("Location             : " + job.getLocation());
	            System.out.println("Required Skills      : " + job.getRequiredSkills());
	            System.out.println("Job Type             : " + job.getJobType());
	            System.out.println("Experience Level     : " + job.getExperienceLevel());
	            System.out.println("Application Deadline : " + job.getApplicationDeadline());
	            System.out.println("Number of Openings   : " + job.getNumberOfOpenings());
	            System.out.println("Job Status           : " + job.getJobstatus());
	            System.out.println("------------------------------------");
	        }
	    } else {
	        System.out.println(ConsoleColors.RED + "No Job Found For The Given Criteria." + ConsoleColors.RESET);
	    }
	}


	/**
	 * Manages the user's profile by providing options to update password and email.
	 * Allows the user to navigate back to the previous menu or exit the application.
	 *
	 * @param userId The ID of the user whose profile is being managed
	 */

	public void manageProfie(int userId) throws ClassNotFoundException, SQLException, OptionException,
			CheckUserNameException, CompanyNameValidationException {
		boolean lap = true;
		do {
			System.out.println("╔═══════════════════════════════════╗");
			System.out.println("║      Profile Management Menu      ║");
			System.out.println("╠═══════════════════════════════════╣");
			System.out.println("║ 1. Update Password                ║");
			System.out.println("║ 2. Update Email                   ║");
			System.out.println("║ 3. Back                           ║");
			System.out.println("║ 4. Exit                           ║");
			System.out.println("╚═══════════════════════════════════╝");
			
			int option ;
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
				// Update password
				String password;
				System.out.println(ConsoleColors.CYAN
						+ "[Enter the Update password :[ password format! Passwords must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character.]"
						+ ConsoleColors.RESET);
				sc.nextLine();
				while (true) {
					 // Validate password format
					// System.out.println(ConsoleColors.CYAN+"Enter The Password
					// :"+ConsoleColors.RESET);

					password = sc.nextLine();
					if (!Validation.checkPassword(password)) {
						System.out.println(ConsoleColors.YELLOW
								+ "[.....Invalid password format! Passwords must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character......]"
								+ ConsoleColors.RESET);

					} else {
						break;
					}
				}
				updatePassword(userId, password);
				break;
			}

			case 2: {
				  //  update email
				String email;
				sc.nextLine();
				while (true) {
					System.out.println(ConsoleColors.CYAN + "Enter The Udate Email :" + ConsoleColors.RESET);
					email = sc.nextLine();
					if (!Validation.checkEmail(email)) {
						System.out.println(ConsoleColors.YELLOW
								+ "[.....Invalid email format! Please enter valid email.....]" + ConsoleColors.RESET);

					} else {
						break;
					}
				}
				updateEmail(userId, email);
				break;
			}
			case 3: {
				  // Go back to previous menu
				jobSeekerMenu(this);

				break;
			}
			case 4: {
				 // Exit the application
				System.out.println(ConsoleColors.PURPLE + "Thank You For Using Job Portal!  Have a Great Day!"
						+ ConsoleColors.RESET);
				System.exit(0);
				break;
			}
			default: {
				 // Display error message for invalid option
				System.out.println(ConsoleColors.RED + "[....Enter the correct option....]" + ConsoleColors.RESET);
				// Call the method recursively to handle incorrect input
				new JobSeeker().manageProfie(userId);

			}

			}

		} while (lap);
	}
	/**
	 * Updates the password of a job seeker in the database.
	 *
	 * @param userId   The ID of the job seeker whose password needs to be updated.
	 * @param password The new password to be set for the job seeker.
	 * @throws ClassNotFoundException If the JDBC connection class is not found.
	 */
	public static void updatePassword(int userId, String password) throws ClassNotFoundException {

		Connection con = null;
		PreparedStatement statement = null;
		try {
			con = JdbcConnection.connectdatabase();
			String sql = "UPDATE JOB_SEEKERS SET PASSWORD = ? WHERE JOB_SEEKER_ID = ? ";

			statement = con.prepareStatement(sql);

			statement.setString(1, password);
			statement.setInt(2, userId);

			int rowsInserted = statement.executeUpdate();

			if (rowsInserted > 0) {
				System.out.println(ConsoleColors.GREEN + "Password Update Successfully !" + ConsoleColors.RESET);
			} else {
				System.out.println(ConsoleColors.RED + "[.....Failed to  Password update.....]" + ConsoleColors.RESET);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * Updates the email of a job seeker in the database.
	 *
	 * @param userId The ID of the job seeker whose email needs to be updated.
	 * @param email  The new email to be set for the job seeker.
	 * @throws ClassNotFoundException If the JDBC connection class is not found.
	 */
	public static void updateEmail(int userId, String email) throws ClassNotFoundException {

		Connection con = null;
		PreparedStatement statement = null;
		try {
			con = JdbcConnection.connectdatabase();
			String sql = "UPDATE JOB_SEEKERS SET Email = ? WHERE JOB_SEEKER_ID = ? ";

			statement = con.prepareStatement(sql);

			statement.setString(1, email);
			statement.setInt(2, userId);

			int rowsInserted = statement.executeUpdate();

			if (rowsInserted > 0) {
				System.out.println(ConsoleColors.CYAN + "Email Update successfully !" + ConsoleColors.RESET);
			} else {
				System.out.println(ConsoleColors.CYAN + "[.....Failed to Email Update.....]" + ConsoleColors.RESET);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * Checks if a job seeker has already applied for a specific job.
	 *
	 * @param jobId        The ID of the job.
	 * @param jobSeekerId  The ID of the job seeker.
	 * @return             True if the job seeker has already applied for the job, otherwise false.
	 * @throws ClassNotFoundException If the JDBC connection class is not found.
	 */
	private boolean isAlreadyApplied(int jobId, int jobSeekerId) throws ClassNotFoundException {
		Connection con = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		boolean alreadyApplied = false;

		try {
			con = JdbcConnection.connectdatabase();
			String query = "SELECT COUNT(*) FROM job_applications WHERE JOB_ID = ? AND JOB_SEEKER_ID = ?";
			statement = con.prepareStatement(query);
			statement.setInt(1, jobId);
			statement.setInt(2, jobSeekerId);
			resultSet = statement.executeQuery();

			if (resultSet.next()) {
				int count = resultSet.getInt(1);
				alreadyApplied = count > 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
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

		return alreadyApplied;
	}
	/**
	 * Allows a job seeker to apply for a job.
	 *
	 * @param jobId   The ID of the job the seeker is applying for.
	 * @param seeker  The JobSeeker object applying for the job.
	 * @throws ClassNotFoundException If the JDBC connection class is not found.
	 */
	public void applyForJob(int jobId, JobSeeker seeker) throws ClassNotFoundException {
		// System.out.println(jobSeekerId);
		Connection con = null;
		PreparedStatement statement = null;
		int employerId = Employer.getEmployerIdForJob(jobId);
		if (isAlreadyApplied(jobId, seeker.getJobSeekerId())) {
			System.out.println(ConsoleColors.RED + "You have already applied for this job." + ConsoleColors.RESET);
			return;
		}

		try {
			con = JdbcConnection.connectdatabase();
			if (!Validation.doesJobExist(con, jobId)) {
				System.out.println(ConsoleColors.RED + "Job ID " + jobId + " Does Not Exist." + ConsoleColors.RESET);
				return;
			}
			String sql = "INSERT INTO job_applications (APPLICATION_ID, JOB_ID, JOB_SEEKER_ID, EMP_ID, APPLICATION_DATE) VALUES (app_id_seq.NEXTVAL, ?, ?, ?, CURRENT_DATE)";
			statement = con.prepareStatement(sql);
			statement.setInt(1, jobId);
			statement.setInt(2, seeker.getJobSeekerId());
			statement.setInt(3, employerId);

			int rowsInserted = statement.executeUpdate();

			if (rowsInserted > 0) {
				System.out.println(ConsoleColors.GREEN + "Application Submitted Successfully." + ConsoleColors.RESET);
			} else {
				System.out.println(ConsoleColors.RED + "Failed To Submit Application." + ConsoleColors.RESET);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
	 * Fetches all job seekers from the database.
	 *
	 * @return A list of JobSeeker objects representing all candidates.
	 * @throws ClassNotFoundException If the JDBC connection class is not found.
	 */
	public List<JobSeeker> fetchAllCandidatesFromDatabase() throws ClassNotFoundException {
		List<JobSeeker> allCandidates = new ArrayList<>();
		String sql = "SELECT * FROM job_seekers";

		try (Connection con = JdbcConnection.connectdatabase();
				PreparedStatement statement = con.prepareStatement(sql);
				ResultSet rs = statement.executeQuery()) {

			while (rs.next()) {
				int jobSeekerId = rs.getInt("JOB_SEEKER_ID");
				String email = rs.getString("EMAIL");
				String skills = rs.getString("SKILLS");
				String education = rs.getString("EDUCATION");
				String experience = rs.getString("EXPERIENCE");
				String objective = rs.getString("OBJECTIVE");
				String fName = rs.getString("FNAME");
				String lName = rs.getString("LNAME");
				String gender = rs.getString("GENDER");
				String language = rs.getString("LANGUAGE");
				String achievements = rs.getString("ACHIVEMENTS");
				String phoneNumber = rs.getString("CONTACT_DETAILS");
				String address = rs.getString("ADDRESS");

				// Create JobSeeker object with additional attributes
				JobSeeker jobSeeker = new JobSeeker(jobSeekerId, objective, fName, lName, gender, email, language,
						achievements, skills, education, experience, phoneNumber, address);

				allCandidates.add(jobSeeker);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			// System.err.println("Error while fetching candidates from database: " +
			// e.getMessage());
		}

		return allCandidates;
	}

	@Override
	public String toString() {
		return "JobSeeker [jobSeekerId=" + jobSeekerId + ", contactDetails=" + contactDetails + ", education="
				+ education + ", experience=" + experience + ", skills=" + skills + ", firstname=" + firstname
				+ ", lastName=" + lastName + ", jobId=" + jobId + ", applicationId=" + applicationId + ", exprience="
				+ exprience + ", gender=" + gender + ", Address=" + Address + ", languageSkills=" + languageSkills
				+ ", achivements=" + achivements + ", objective=" + objective + ", phoneNumber=" + phoneNumber + "]";
	}

	@Override
	public void search(String string, String string1, String string2) {
		// TODO Auto-generated method stub

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
	public void searchUsers(String searchType) throws ClassNotFoundException {
		// TODO Auto-generated method stub

	}

	@Override
	public void searchJobs(String string) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub

	}

}
