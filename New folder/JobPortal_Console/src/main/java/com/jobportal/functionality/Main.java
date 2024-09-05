package com.jobportal.functionality;

import java.sql.*;
import java.util.Scanner;

import com.consolecolors.ConsoleColors;
import com.jdbcservice.JdbcConnection;
import com.jobportal.users.*;

import com.usersregisterlogin.WelcomeMessage;

import com.userdefiendexception.*;

public class Main {
	static Scanner sc = new Scanner(System.in);
	private Connection connection;
	/**
	 * Runs the Job Portal project, displaying the main menu and handling user selections.
	 * <p>
	 * This method presents a menu to the user with options to access different functionalities
	 * of the Job Portal system, such as administration, employer, and job seeker functionalities.
	 * It continuously prompts the user to make a selection until the user chooses to exit.
	 * </p>
	 *
	 * @throws ClassNotFoundException     If the JDBC driver class is not found.
	 * @throws CheckUserNameException      If there's an issue with the username during authentication.
	 * @throws SQLException                If an SQL exception occurs.
	 * @author Gopal jamocah
	 * @since 11-05-2024
	 */
	public void runProject() throws ClassNotFoundException, CheckUserNameException, SQLException {

		boolean flag = true; // Display main menu
		do {

			try {
				System.out.println("+------------------------------------+");
				System.out.println("|             Main Menu              |");
				System.out.println("+------------------------------------+");
				System.out.println("| 1. Admin                           |");
				System.out.println("| 2. Employer                        |");
				System.out.println("| 3. Jobseeker                       |");
				System.out.println("| 4. Exit                            |");
				System.out.println("+------------------------------------+");
				System.out.print(ConsoleColors.CYAN + "Please select an option: " + ConsoleColors.RESET);
				// Validate the option selected by the user
				int option = Validation.validateOption(sc.next());
				sc.nextLine();
				switch (option) {
				case 1: {

					admins();
					break;
				}
				case 2: {

					employee();

					break;
				}
				case 3: {

					jobSeeker();

					break;
				}
				case 4: {
					System.out.println(ConsoleColors.PURPLE + "Thank you for using Job Portal!  Have a great day!"
							+ ConsoleColors.RESET);
					System.exit(0); // Exit the program

					break;

				}
				default:
					System.out.println(ConsoleColors.RED + "Invalid choice. Please try again." + ConsoleColors.RESET); // Handle
																														// invalid
																														// choice

				}

			} catch (OptionException | CompanyNameValidationException | JobIdAlreadyExistsException e) {
				System.out.println(ConsoleColors.RED + e.getMessage() + ConsoleColors.RESET);
			}
		} while (flag);
	}
	/**
	 * Provides access to administration functionalities in the Job Portal system.
	 * <p>
	 * This method displays the menu for admin users, allowing them to log in,
	 * return to the main menu, or exit the system. It handles user input
	 * validation and exception handling for various scenarios.
	 * </p>
	 *
	 * @throws JobIdAlreadyExistsException   If a job ID already exists in the system.
	 * @throws CompanyNameValidationException If there's an issue with validating the company name.
	 * @throws OptionException               If an invalid menu option is selected.
	 * @author Gopal jamocah
	 * @since 11-05-2024
	 */
	public void admins() throws com.userdefiendexception.JobIdAlreadyExistsException, CompanyNameValidationException, OptionException {
		boolean flag = false;
		try {
			do {
				try {

					System.out.println("+------------------------------------+");
					System.out.println("|        Employer Menu               |");
					System.out.println("+------------------------------------+");
					System.out.println("| 1. Admin User Login                |");
					System.out.println("| 2. Back                            |");
					System.out.println("| 3. Exit                            |");
					System.out.println("+------------------------------------+");
				
					Admin admin = new Admin();
					int option = 0;

					while (true) {
						System.out.print(ConsoleColors.CYAN+"Enter menu option number: "+ConsoleColors.RESET);
						String input = sc.next();

						try {
							option = Validation.validateOption(input);
							break;
						} catch (OptionException e) {
							System.out.println(ConsoleColors.RED+e.getMessage() +ConsoleColors.RESET);
						}
					} // Switch case for handling user selection

					switch (option) {

				

					case 1: {

						admin.adminLogin();

						break;
					}
					case 2: {

						new Main().runProject();
						break;
					}
					case 3: {
						System.out.println(ConsoleColors.PURPLE+"Thank you for using Job Portal!  Have a great day!"+ConsoleColors.RESET);
						System.exit(0);

						break;
					}
					default: {

						System.out.println(ConsoleColors.YELLOW+"Pleace Enter the correct option"+ConsoleColors.RESET);
						admins();

					}
					}
				} catch (ClassNotFoundException | SQLException | CheckUserNameException e) {
					System.out.println(e.getMessage());

				}

			} while (flag);
		} finally {

			JdbcConnection.closeConnection(connection);
		}
	}
	/**
	 * Provides access to employer functionalities in the Job Portal system.
	 * <p>
	 * This method displays the menu for employer users, allowing them to sign up,
	 * log in, return to the main menu, or exit the system. It handles user input
	 * validation and exception handling for various scenarios.
	 * </p>
	 *
	 * @throws JobIdAlreadyExistsException   If a job ID already exists in the system.
	 * @throws CompanyNameValidationException If there's an issue with validating the company name.
	 * @author Gopal jamocah
	 * @since 11-05-2024
	 */
	public void employee() throws com.userdefiendexception.JobIdAlreadyExistsException, CompanyNameValidationException {
		boolean flag = false;
		try {
			do {
				try {

					System.out.println("+------------------------------------+");
					System.out.println("|        Employer Menu               |");
					System.out.println("+------------------------------------+");
					System.out.println("| 1. Employer User Signup            |");
					System.out.println("| 2. Employer User Login             |");
					System.out.println("| 3. Back                            |");
					System.out.println("| 4. Exit                            |");
					System.out.println("+------------------------------------+");

					Employer em = new Employer();
					int option = 0;

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
						em.emloyerUserCreate();
						break;

					}

					case 2: {

						em.employersUserLogin();

						break;
					}
					case 3: {

						new Main().runProject();
						break;
					}
					case 4: {
						System.out.println(ConsoleColors.PURPLE + "Thank you for using Job Portal!  Have a great day!"
								+ ConsoleColors.RESET);
						System.exit(0);

						break;
					}
					default: {

						System.out.println(
								ConsoleColors.YELLOW + "Pleace Enter the correct option" + ConsoleColors.RESET);
						employee();

					}
					}
				} catch (ClassNotFoundException | SQLException | CheckUserNameException e) {
					System.out.println(e.getMessage());

				}

			} while (flag);
		} finally {

			JdbcConnection.closeConnection(connection);
		}
	}
	/**
	 * Provides access to job seeker functionalities in the Job Portal system.
	 * <p>
	 * This method displays the menu for job seekers, allowing them to sign up,
	 * log in, return to the main menu, or exit the system. It handles user input
	 * validation and exception handling for various scenarios.
	 * </p>
	 * @author Gopal jamocah
	 * @since 11-05-2024
	 */
	public void jobSeeker() {
		try {
			boolean flag = true;
			do {
				try { // Display the Job Seeker menu options
					System.out.println("+------------------------------------+");
					System.out.println("|        jobSeeker Menu              |");
					System.out.println("+------------------------------------+");
					System.out.println("| 1. Job Seeker Signup               |");
					System.out.println("| 2. Job Seeker Login                |");
					System.out.println("| 3. Back                            |");
					System.out.println("| 4. Exit                            |");
					System.out.println("+------------------------------------+");
					System.out.print(ConsoleColors.CYAN + "Please select an option: " + ConsoleColors.RESET);
					JobSeeker seeker = new JobSeeker();

					int option = 0;

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

						seeker.jobSeekerRegister();
						break;

					}
					case 2: {
						seeker.jobSeekerLogin();

						break;
					}
					case 3: {

						runProject();

						break;
					}
					case 4: {
						// Exit the application with a thank you message
						System.out.println(ConsoleColors.PURPLE + "Thank you for using Job Portal!  Have a great day!"
								+ ConsoleColors.RESET);
						System.exit(0);
						break;
					}
					default: {

						System.out.println(ConsoleColors.RED + "Pleace Enter the correct option" + ConsoleColors.RESET);

					}

					}
					// Print any exceptions that occur during the process
				} catch (ClassNotFoundException | SQLException | CheckUserNameException | OptionException
						| CompanyNameValidationException e) {
					System.out.println(e.getMessage());

				}
			} while (flag);
		} finally {
			// Ensure the database connection is closed at the end of the method
			JdbcConnection.closeConnection(connection);
		}
	}
	/**
	 * The entry point of the Job Portal application.
	 * <p>
	 * This method initializes the main class, prints a welcome message, and starts
	 * the project by invoking the {@code runProject()} method.
	 * </p>
	 *
	 * @param args The command line arguments.
	 * @throws ClassNotFoundException        If the JDBC driver class is not found.
	 * @throws SQLException                  If an SQL exception occurs.
	 * @throws InvalidInputException         If an invalid input is encountered.
	 * @throws CheckUserNameException        If there's an issue with the username during authentication.
	 * @throws JobIdAlreadyExistsException   If a job ID already exists in the system.
	 * @throws CompanyNameValidationException If there's an issue with validating the company name.
	 * @author Gopal Jamocha
	 */
	public static void main(String[] arg) throws ClassNotFoundException, SQLException, InvalidInputException,
			CheckUserNameException, JobIdAlreadyExistsException, CompanyNameValidationException {
		Main main = new Main();
		new WelcomeMessage().printWelcomeMessage();
		main.runProject();

	}

}
