package com.jobportal.users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import com.consolecolors.ConsoleColors;
import com.jdbcservice.JdbcConnection;
import com.userdefiendexception.CheckUserNameException;
import com.userdefiendexception.CompanyNameValidationException;
import com.userdefiendexception.JobIdAlreadyExistsException;
import com.userdefiendexception.OptionException;

/**
 * Represents a user in the system with basic information such as username, email, password, and user type.
 * @author Gopal jamocha
 */
public class User {
	private String firstName;
    private String lastName;
    private long phoneNumber;
    private String dateOfBirth;
    private String gender;
    protected String address;
	private String username;
	protected String email;
	private String password;
	private UserType userType;
    static Scanner sc = new Scanner(System.in);
	public User(String username, String email, String password, UserType userType) {
		super();
		this.username = username;
		this.email = email;
		this.password = password;
		this.userType = userType;
	}
	/**
     * Constructs a User object with the specified username, email, password, and user type.
     * @param username The username of the user.
     * @param email The email address of the user.
     * @param password The password of the user.
     * @param userType The type of user (ADMIN, EMPLOYER, or JOBSEEKER).
     * @author Gopal jamocha
     */
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public long getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(long phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public UserType getUserType() {
		return userType;
	}

	public void setUserType(UserType userType) {
		this.userType = userType;
	}

	public User() {

	}

	public String getUsername() {
		return username;
	}

	

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public UserType getUserTybe() {
		return userType;
	}

	public void setUserTybe(UserType userTybe) {
		this.userType = userTybe;
	}
    
//	public void changeStatus(UserType userType) throws ClassNotFoundException, SQLException, CheckUserNameException, JobIdAlreadyExistsException, CompanyNameValidationException, OptionException {
//	    Scanner sc = new Scanner(System.in); // Create a scanner object
//
//	    do {
//	        System.out.println("+------------------------------------+");
//	        System.out.println("|            Message Menu            |");
//	        System.out.println("+------------------------------------+");
//	        System.out.println("| 1. Change User Status              |");
//	        System.out.println("| 2. Back                            |");
//	        System.out.println("| 3. Exit                            |");
//	        System.out.println("+------------------------------------+");
//
//	        int option = 0;
//
//	        // Read input and validate the option
//	        while (true) {
//	            try {
//	                System.out.print(ConsoleColors.CYAN + "Enter Menu Option Number: " + ConsoleColors.RESET);
//	                option = Integer.parseInt(sc.nextLine()); // Read the entire line
//	                break;
//	            } catch (NumberFormatException e) {
//	                System.out.println(ConsoleColors.YELLOW + "Please enter a valid number." + ConsoleColors.RESET);
//	            }
//	        }
//
//	        switch (option) {
//	            case 1:
//	            	
//	                changeUserStatus(userType);
//	                break;
//	            case 2:
//	            	if(userType.equals("EMPLOYER")) {
//	                new Admin().employerMangement();
//	            	}
//	            	else if(userType.equals("JOBSEEKER")) {
//	                new Admin().jobSeeekersManagement();;
//	            	}
//	                break;
//	            case 3:
//	                System.out.println(ConsoleColors.PURPLE + "Thank You For Using Job Portal! Have a Great Day!" + ConsoleColors.RESET);
//	                System.exit(0);
//	                break;
//	            default:
//	                System.out.println(ConsoleColors.RED + "Invalid option. Please enter a valid option." + ConsoleColors.RESET);
//	        }
//	    } while (true);
//	}
	
	/**
	 * Displays the message menu for changing user status and handles user input.
	 */
	 
	 public void changeStatus(UserType userType) throws ClassNotFoundException, SQLException, CheckUserNameException, JobIdAlreadyExistsException, CompanyNameValidationException, OptionException {
	       // Scanner sc = new Scanner(System.in); // Create a scanner object

	        do {
	            System.out.println("+------------------------------------+");
	            System.out.println("|            Message Menu            |");
	            System.out.println("+------------------------------------+");
	            System.out.println("| 1. Change User Status              |");
	            System.out.println("| 2. Back                            |");
	            System.out.println("| 3. Exit                            |");
	            System.out.println("+------------------------------------+");

	            int option = 0;

	            // Read input and validate the option
	            while (true) {
	                try {
	                    System.out.print(ConsoleColors.CYAN + "Enter Menu Option Number: " + ConsoleColors.RESET);
	                    option = Integer.parseInt(sc.nextLine()); // Read the entire line
	                    break;
	                } catch (NumberFormatException e) {
	                    System.out.println(ConsoleColors.YELLOW + "Please enter a valid number." + ConsoleColors.RESET);
	                }
	            }

	            switch (option) {
	                case 1:
	                    changeUserStatus(userType);
	                    break;
	                case 2:
	                    if (userType == UserType.EMPLOYER) {
	                        new Admin().employerMangement();
	                    } else if (userType == UserType.JOBSEEKER) {
	                        new Admin().jobSeeekersManagement();
	                    }
	                    return; // Return to break the loop after going back
	                case 3:
	                    System.out.println(ConsoleColors.PURPLE + "Thank You For Using Job Portal! Have a Great Day!" + ConsoleColors.RESET);
	                    System.exit(0);
	                    break;
	                default:
	                    System.out.println(ConsoleColors.RED + "Invalid option. Please enter a valid option." + ConsoleColors.RESET);
	            }
	        } while (true);
	    }
	 /**
	  * Changes the status of a user.
	  * @param userType The type of user (EMPLOYER or JOBSEEKER).
	  */ 
	public void changeUserStatus(UserType userType) throws ClassNotFoundException, SQLException {
	    if (userType == UserType.ADMIN) {
	        System.out.println("Admin status cannot be changed.");
	        return;
	    }

	    // Prompt for username
	    System.out.println("Enter the username of the user whose status you want to change:");
	    String username = sc.nextLine();

	    // Check if the user exists
	    // If the user does not exist, display an error message and return
	    if (!userExists(username, userType)) {
	        System.out.println("User with username '" + username + "' does not exist.");
	        return;
	    }

	    // Prompt for the new status
	    System.out.println("Enter the new status (ACTIVE or INACTIVE):");
	    String newStatus = sc.nextLine().toUpperCase();

	    // Validate the new status
	    if (!newStatus.equals("ACTIVE") && !newStatus.equals("INACTIVE")) {
	        System.out.println("Invalid status. Please enter either ACTIVE or INACTIVE.");
	        return;
	    }
	    

	    // Update the user's status in the database
	    try {
	        boolean success = updateUserStatus(username, userType, newStatus);
	        if (success) {
	            System.out.println("User status updated successfully.");
	        } else {
	            System.out.println("Failed to update user status.");
	        }
	    } catch (SQLException e) {
	        System.out.println("An error occurred while updating user status: " + e.getMessage());
	    }
	}
	/**
	 * Checks if the user exists in the database.
	 * @param username The username of the user.
	 * @param userType The type of user (EMPLOYER or JOBSEEKER).
	 * @return True if the user exists, otherwise false.
	 */
	private boolean userExists(String username, UserType userType) throws SQLException, ClassNotFoundException {
	    String tableName;
	    switch (userType) {
	        case EMPLOYER:
	            tableName = "employers";
	            break;
	        case JOBSEEKER:
	            tableName = "Job_Seekers";
	            break;
	        default:
	            return false;
	    }

	    Connection con = JdbcConnection.connectdatabase();
	    String sql = "SELECT COUNT(*) FROM " + tableName + " WHERE USERNAME = ?";
	    PreparedStatement st = con.prepareStatement(sql);
	    st.setString(1, username);
	    ResultSet rs = st.executeQuery();
	    rs.next();
	    int count = rs.getInt(1);
	    return count > 0;
	}
	/**
	 * Updates the status of a user in the database.
	 * @param username The username of the user.
	 * @param userType The type of user (EMPLOYER or JOBSEEKER).
	 * @param newStatus The new status to be set (ACTIVE or INACTIVE).
	 */
	private boolean updateUserStatus(String username, UserType userType, String newStatus) throws SQLException, ClassNotFoundException {
	    String tableName;
	    switch (userType) {
	        case EMPLOYER:
	            tableName = "employers";
	            break;
	        case JOBSEEKER:
	            tableName = "Job_Seekers";
	            break;
	        default:
	            return false;
	    }

	    Connection con = JdbcConnection.connectdatabase();
	    String sql = "UPDATE " + tableName + " SET STATUS = ? WHERE USERNAME = ?";
	    PreparedStatement st = con.prepareStatement(sql);
	    st.setString(1, newStatus);
	    st.setString(2, username);
	    int rowsAffected = st.executeUpdate();
	    return rowsAffected > 0;
	}
	

}
