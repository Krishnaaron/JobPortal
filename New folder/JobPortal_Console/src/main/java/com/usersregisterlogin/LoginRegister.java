package com.usersregisterlogin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import com.consolecolors.ConsoleColors;
import com.jdbcservice.JdbcConnection;
import com.jobportal.users.Admin;
import com.jobportal.users.Employer;
import com.jobportal.users.JobSeeker;
import com.jobportal.users.UserType;
/**
 * This class provides methods for registering different types of users (admin, employer, job seeker),
 * checking if a username exists in the database, and handling user login.
 */
public class LoginRegister {
	/**
     * Registers an admin user.
     * 
     * @param admin The Admin object containing admin details to be registered.
     * @throws ClassNotFoundException If the JDBC driver class is not found.
     */
    public static void registerAdmin(Admin admin) throws ClassNotFoundException {
    	
        Connection con = null;
        PreparedStatement statement = null;
        try {
            con = JdbcConnection.connectdatabase();
            String sql = "INSERT INTO Admins (ADMIN_ID,USERNAME, PASSWORD, EMAIL) VALUES (admin_id_seq.NEXTVAL,?, ?, ?)";
            statement = con.prepareStatement(sql);

            
            statement.setString(1, admin.getUsername());
            statement.setString(2, admin.getPassword());
            statement.setString(3, admin.getEmail());

            int rowsInserted = statement.executeUpdate();

            if (rowsInserted > 0) {
                System.out.println(ConsoleColors.GREEN+"Admin registered successfully."+ConsoleColors.RESET);
            } else {
                System.out.println(ConsoleColors.RED+"Failed to register admin."+ConsoleColors.RESET);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close statement and connection in finally block
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
     * Registers an employer user.
     * 
     * @param employer The Employer object containing employer details to be registered.
     * @throws ClassNotFoundException If the JDBC driver class is not found.
     */
    public static void registerEmployee(Employer employer) throws ClassNotFoundException {
        Connection con = null;
        PreparedStatement statement = null;
        try {
            con = JdbcConnection.connectdatabase();
            String sql = "INSERT INTO Employers (ID,USERNAME,EMAIL, PASSWORD,COMPANYNAME,REGISTERNUMBER,PHONE_NUMBER,DOMAIN) VALUES (emp_id_seq.NEXTVAL,?, ?, ?, ?, ?, ?, ?)";
            statement = con.prepareStatement(sql);
            statement.setString(1, employer.getUsername());
            statement.setString(2, employer.getEmail());
            statement.setString(3, employer.getPassword());
            statement.setString(4, employer.getCompanyName());
            statement.setInt(5, employer.getRegisterNumber());
            statement.setString(6, employer.getPhone());
            statement.setString(7, employer.getDomain());

            int rowsInserted = statement.executeUpdate();

            if (rowsInserted > 0) {
                System.out.println(ConsoleColors.GREEN+"Employee registered successfully."+ConsoleColors.RESET);
            } else {
                System.out.println(ConsoleColors.RED+"Failed to register employee."+ConsoleColors.RESET);
            }
        } catch (SQLIntegrityConstraintViolationException e) {
            System.out.println(ConsoleColors.RED+"Unique constraint violation: " + e.getMessage()+ConsoleColors.RESET);
            // Handle the violation here, maybe inform the user that the provided data violates a unique constraint
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close statement and connection in finally block
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
     * Checks if a username exists in the Employers table.
     * 
     * @param username The username to check.
     * @return True if the username exists; false otherwise.
     */
    public static boolean isUsernameExists(String username) throws ClassNotFoundException {
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            con = JdbcConnection.connectdatabase();
            String sql = "SELECT COUNT(*) FROM Employers WHERE USERNAME = ?";
            statement = con.prepareStatement(sql);
            statement.setString(1, username);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0; // Returns true if count > 0, indicating that the username exists
            }
        } catch (SQLException e) {
            e.printStackTrace();
       
        }
        return false; // Return false by default (in case of exceptions or no result)
    }

    /**
     * Registers a job seeker user.
     * 
     * @param jobseeker The JobSeeker object containing job seeker details to be registered.
     * @throws SQLException If an SQL exception occurs.
     * @throws ClassNotFoundException If the JDBC driver class is not found.
     */
    public static void registerJobSeeker( JobSeeker jobseeker) throws SQLException, ClassNotFoundException {
    	Connection con = null;
        PreparedStatement statement = null;
		try {
			 con = JdbcConnection.connectdatabase();
			 String sql = "INSERT INTO Job_Seekers (JOB_SEEKER_ID,USERNAME,PASSWORD, EMAIL) VALUES (job_see_seq.NEXTVAL, ?, ?, ?)";
			 statement = con.prepareStatement(sql);
		     statement.setString(1, jobseeker.getUsername());
	         statement.setString(2, jobseeker.getPassword());
	         statement.setString(3, jobseeker.getEmail());
	         int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
				System.out.println(ConsoleColors.GREEN+"Your registered successfully."+ConsoleColors.RESET);
			} else {
				System.out.println(ConsoleColors.RED+"Failed to register job seeker."+ConsoleColors.RESET);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
    public static boolean isSeekerUsernameExists(String username) throws ClassNotFoundException {
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            con = JdbcConnection.connectdatabase();
            String sql = "SELECT COUNT(*) FROM job_seekers WHERE USERNAME = ?";
            statement = con.prepareStatement(sql);
            statement.setString(1, username);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0; // Returns true if count > 0, indicating that the username exists
            }
        } catch (SQLException e) {
            e.printStackTrace();
       
        }
        return false; // Return false by default (in case of exceptions or no result)
    }
    /**
     * Validates user credentials and logs the user in.
     * 
     * @param username The username of the user.
     * @param password The password of the user.
     * @param userType The type of user (Admin, Employer, JobSeeker).
     * @return An object representing the logged-in user, or null if login fails.
     * @throws ClassNotFoundException If the JDBC driver class is not found.
     * @throws SQLException If an SQL exception occurs.
     */
    public static Object userslogin(String username, String password,UserType userType) throws ClassNotFoundException, SQLException {
    	Connection con = JdbcConnection.connectdatabase();
    	String sql ="";
    	switch(userType) {
		case ADMIN:
			 sql = "SELECT * FROM Admins WHERE USERNAME = ? AND PASSWORD = ? ";
			break;
		case EMPLOYER:
			sql = "SELECT * FROM employers WHERE USERNAME = ? AND PASSWORD = ? ";
			break;
		case JOBSEEKER:
			sql = "SELECT * FROM Job_Seekers WHERE USERNAME = ? AND PASSWORD = ? ";
			break;
		default:
			break;
			}
    	PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, username);
		st.setString(2, password);
		//st.setString(3, )
	    ResultSet rt = st.executeQuery();
	    
	    if (rt.next()) {
	    	 String status = rt.getString("STATUS");
	         if (status.equalsIgnoreCase("Active")) {
            switch (userType) {
            case EMPLOYER:
                Employer employer = new Employer();
                employer.setUsername(rt.getString("USERNAME"));
                employer.setCompanyName(rt.getString("COMPANYNAME"));
                employer.setEmail(rt.getString("EMAIL"));
                employer.setId(rt.getInt("ID"));
                employer.setPassword(rt.getString("PASSWORD"));
                employer.setRegisterNumber(rt.getInt("REGISTERNUMBER"));
               // employer.setCompanyName(rt.getString("CONTACT"));
                employer.setDomain(rt.getString("DOMAIN"));
                employer.setContact(rt.getString("CONTACT"));
                // Set other employer properties similarly
                
                return employer;
			case ADMIN:
				Admin admin =new Admin();
				admin.setAdminID(rt.getInt("ADMIN_ID"));
				admin.setUsername(rt.getString("USERNAME"));
				admin.setEmail(rt.getString("EMAIL"));
				admin.setPassword(rt.getString("PASSWORD"));
				return admin;
				
			case JOBSEEKER:
				JobSeeker jobseeker = new JobSeeker();
				jobseeker.setJobSeekerId(rt.getInt("JOB_SEEKER_ID"));
				jobseeker.setUsername(rt.getString("USERNAME"));
				jobseeker.setPassword(rt.getString("PASSWORD"));
				jobseeker.setEmail(rt.getString("EMAIL"));
				jobseeker.setContactDetails(rt.getString("CONTACT_DETAILS"));
				jobseeker.setEducation(rt.getString("EDUCATION"));
				jobseeker.setEducation(rt.getString("EXPERIENCE"));
				jobseeker.setSkills(rt.getString("SKILLS"));
				jobseeker.setGender(rt.getString("GENDER"));
				jobseeker.setAddress(rt.getString("ADDRESS"));
				jobseeker.setLanguageSkills(rt.getString("LANGUAGE"));
				jobseeker.setAchivements(rt.getString("ACHIVEMENTS"));
				jobseeker.setObjective(rt.getString("OBJECTIVE"));
				jobseeker.setFirstName(rt.getString("FNAME"));
				jobseeker.setLastName(rt.getString("LNAME"));
				return jobseeker;
			default:
				break;
            }
	    
	    }else {
            // Display message advising the user to contact the admin
	    	System.out.println(ConsoleColors.RED+"Your account is inactive. Please contact the admin for assistance."+ConsoleColors.RESET+""+ConsoleColors.WHITE+"[adminjob@gmail.com]"+ConsoleColors.RESET);
             // Return null as the user cannot log in
        }
	    }
		//return resultSet.next();
    
    		return null;
    	}
    
    
//    public static Object userslogin(String username, String password, UserType userType) throws ClassNotFoundException, SQLException {
//        Connection con = JdbcConnection.connectdatabase();
//        String sql = "";
//
//        switch (userType) {
//            case ADMIN:
//                sql = "SELECT * FROM Admins WHERE USERNAME = ? AND PASSWORD = ?";
//                break;
//            case EMPLOYER:
//                sql = "SELECT * FROM employers WHERE USERNAME = ? AND PASSWORD = ?";
//                break;
//            case JOBSEEKER:
//                sql = "SELECT * FROM Job_Seekers WHERE USERNAME = ? AND PASSWORD = ?";
//                break;
//            default:
//                break;
//        }
//
//        PreparedStatement st = con.prepareStatement(sql);
//        st.setString(1, username);
//        st.setString(2, password);
//        ResultSet rt = st.executeQuery();
//
//        if (rt.next()) {
//            String status = rt.getString("STATUS");
//            if (status.equalsIgnoreCase("Active")) {
//                switch (userType) {
//                    case EMPLOYER:
//                        Employer employer = new Employer();
//                        employer.setUsername(rt.getString("USERNAME"));
//                        employer.setCompanyName(rt.getString("COMPANYNAME"));
//                        employer.setEmail(rt.getString("EMAIL"));
//                        employer.setId(rt.getInt("ID"));
//                        employer.setPassword(rt.getString("PASSWORD"));
//                        employer.setRegisterNumber(rt.getInt("REGISTERNUMBER"));
//                        employer.setDomain(rt.getString("DOMAIN"));
//                        employer.setContact(rt.getString("CONTACT"));
//                        // Set other employer properties similarly
//                        return employer;
//
//                    case ADMIN:
//                        Admin admin = new Admin();
//                        admin.setAdminID(rt.getInt("ADMIN_ID"));
//                        admin.setUsername(rt.getString("USERNAME"));
//                        admin.setEmail(rt.getString("EMAIL"));
//                        admin.setPassword(rt.getString("PASSWORD"));
//                        return admin;
//
//                    case JOBSEEKER:
//                        JobSeeker jobseeker = new JobSeeker();
//                        jobseeker.setJobSeekerId(rt.getInt("JOB_SEEKER_ID"));
//                        jobseeker.setUsername(rt.getString("USERNAME"));
//                        jobseeker.setPassword(rt.getString("PASSWORD"));
//                        jobseeker.setEmail(rt.getString("EMAIL"));
//                        jobseeker.setContactDetails(rt.getString("CONTACT_DETAILS"));
//                        jobseeker.setEducation(rt.getString("EDUCATION"));
//                        jobseeker.setExperience(rt.getString("EXPERIENCE"));
//                        jobseeker.setSkills(rt.getString("SKILLS"));
//                        jobseeker.setGender(rt.getString("GENDER"));
//                        jobseeker.setAddress(rt.getString("ADDRESS"));
//                        jobseeker.setLanguageSkills(rt.getString("LANGUAGE"));
//                        jobseeker.setAchivements(rt.getString("ACHIEVEMENTS"));
//                        jobseeker.setObjective(rt.getString("OBJECTIVE"));
//                        jobseeker.setFirstName(rt.getString("FNAME"));
//                        jobseeker.setLastName(rt.getString("LNAME"));
//                        return jobseeker;
//
//                    default:
//                        break;
//                }
//            } else {
//                System.out.println(ConsoleColors.RED+"Your account is inactive. Please contact the admin for assistance."+ConsoleColors.RESET+""+ConsoleColors.WHITE+"[adminjob@gmail.com]"+ConsoleColors.RESET);
//            }
//        }
//
//        return null;
//    }


    

		

	}
