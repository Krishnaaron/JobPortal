package com.userdefiendexception;

/**
 * 
 */


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


import com.consolecolors.ConsoleColors;


/**
 * The Validation class is the class that is used for the validation for all
 * the input entered by the customer.
 * @author GOPAL jamocha
 * @since 12 5 2024
 *
 */

public class Validation {
	public static int validateOption(String option) throws OptionException {
        if (!option.matches("\\d+")) {
            throw new OptionException("Invalid Option. Please enter a valid menu option number.");
        }
        return Integer.parseInt(option);
    }
	public static boolean isValidName(String name) {
	    // Check if the input name is not null
	    if (name == null) {
	        return false;
	    }
	    // Regular expression to match only letters (alphabetic characters)
	    String regex = "^[a-zA-Z]+$";
	    // Check if the name matches the regular expression
	    return name.matches(regex);
	}

	 public static boolean isValidEducation(String education) {
	        // Check if the education string is null or empty
	        if (education == null || education.trim().isEmpty()) {
	            return false;
	        }

	        // Split the education input by commas
	        String[] parts = education.split(",");

	        // Iterate through each part and check if it contains valid education
	        for (String part : parts) {
	            // Trim leading and trailing whitespaces
	            part = part.trim();
	            // Check if the part is empty or contains special characters
	            if (part.isEmpty() || !part.matches("[a-zA-Z0-9\\s]+")) {
	                return false;
	            }
	        }
	        // If all parts pass the validation, return true
	        return true;
	    }
	 public static boolean isValidLanguageSkills(String skills) {
	        // Check if the input is not null and contains at least one non-empty skill
	        if (skills == null || skills.isEmpty()) {
	            return false;
	        }
	        // Check if all individual skills are not null or empty after splitting by comma
	        String[] skillsArray = skills.split(",");
	        for (String skill : skillsArray) {
	            if (skill == null || skill.trim().isEmpty()) {
	                return false;
	            }
	        }
	        return true;
	    }
	 public static boolean isValidSkills(String skills) {
		    // Check if the input is not null and contains at least one non-empty skill
		    if (skills == null || skills.isEmpty()) {
		        return false;
		    }
		    // Check if all individual skills are not null or empty after splitting by comma
		    String[] skillsArray = skills.split(",");
		    for (String skill : skillsArray) {
		        if (skill == null || skill.trim().isEmpty()) {
		            return false;
		        }
		    }
		    return true;
		}
	 public static boolean isValidNotNull(String objective) {
		    // Check if the input is not null and not empty
		    return objective != null && !objective.trim().isEmpty();
		}
	 public static boolean isValidAchievements(String achievements) {
		    // Check if the input is not null
		    if (achievements == null) {
		        return false;
		    }
		    // Check if the input is not empty after trimming leading and trailing spaces
		    return !achievements.trim().isEmpty();
		}

	 public static boolean isValidExperience(String experience) {
	        try {
	            int exp = Integer.parseInt(experience);
	            return exp >= 0 && exp <= 70;
	        } catch (NumberFormatException e) {
	            return false;
	        }
	    }
	public static int experienceLevel(String option) {
	    try {
	        int experienceLevel = Integer.parseInt(option);
	        if (experienceLevel < 1 || experienceLevel > 60) {
	           
	            return -1;
	        }
	        return experienceLevel;
	    } catch (NumberFormatException e) {
	        // Print an error message for invalid input
	        System.out.println(ConsoleColors.YELLOW + " Please enter  number." + ConsoleColors.RESET);
	        // Return a special value indicating an error (e.g., -1)
	        return -1;
	    }
	}



	
public static boolean doesJobExist(Connection con, int jobId) throws SQLException {
	    String checkJobSql = "SELECT 1 FROM jobs WHERE JOB_ID = ?";
	    try (PreparedStatement checkJobStmt = con.prepareStatement(checkJobSql)) {
	        checkJobStmt.setInt(1, jobId);
	        try (ResultSet rs = checkJobStmt.executeQuery()) {
	            return rs.next();
	        }
	    }
	}
	public static boolean validateCompanyName(String companyName) throws CompanyNameValidationException {
	    // Check if the company name is null or empty
	    if (companyName == null || companyName.isEmpty() ||companyName =="") {
	        throw new CompanyNameValidationException(ConsoleColors.YELLOW+"Company name cannot be null or empty."+ConsoleColors.RESET);
	    }
	    
	    // Check if the company name contains only alphabetic characters
	    if (!companyName.matches("[a-zA-Z ]+")) {
	        throw new CompanyNameValidationException(ConsoleColors.YELLOW+"Company name should contain only alphabetic characters."+ConsoleColors.RESET);
	    }
	    
	    return true; // Return true if validation passes
	}
	public static boolean ValidateCharacterSequences(String charachterSequence) throws CharachterSequenceException {
	    // Check if the company name is null or empty
	    if ( charachterSequence== null || charachterSequence.isEmpty()) {
	        throw new CharachterSequenceException(ConsoleColors.YELLOW+"Invalid input. cannot be null or empty."+ConsoleColors.RESET);
	    }
	    
	    // Check if the company name contains  alphabetic characters and space
	    if (!charachterSequence.matches("[a-zA-Z, ]+")) {
	        throw new CharachterSequenceException(ConsoleColors.YELLOW+"Invalid input. contain only alphabetic characters "+ConsoleColors.RESET);
	    }
	    
	    return true; // Return true if validation passes
	}
		
	
	public static boolean checkUserName(String userName)throws CheckUserNameException{
		Pattern pattern=Pattern.compile("^[a-zA-Z0-9_-]{3,20}$");
		Matcher matcher=pattern.matcher(userName);
		return matcher.matches();
	}
	
//	public static boolean checkUserName(String userName) throws CheckUserNameException {
//	    Pattern pattern = Pattern.compile("^[a-zA-Z0-9_-]{3,20}$");
//	    Matcher matcher = pattern.matcher(userName);
//	    if (!matcher.matches()) {
//	        throw new CheckUserNameException("Invalid username format");
//	    }
//	    return true;
//	}

	public static boolean checkPassword(String password) {
		Pattern pattern = Pattern.compile("(?=.*[a-z]+)(?=.*[A-Z]+)(?=.*[!@#$%^&*()_+]+)(?=.*[0-9]+).{8,}$");
		Matcher matcher=pattern.matcher(password);
		return matcher.matches();
	}
	
	 public static boolean validateNumberOfOpenings(int numberOfOpenings) throws NumberException {
	        if (numberOfOpenings <= 0) {
	            throw new NumberException(ConsoleColors.YELLOW+"Invalid input. Number of openings must be positive."+ConsoleColors.RESET);
	        }
	        if (numberOfOpenings > 1000) {
	            throw new NumberException(ConsoleColors.YELLOW+"Invalid input. Number of openings must be less than or equal to 1000."+ConsoleColors.RESET);
	        }
			return true;
	    }
	
	 public static boolean checkEmail(String email) {
		    // Regular expression pattern for validating email addresses
		    Pattern pattern = Pattern.compile("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$");
		    Matcher matcher = pattern.matcher(email);
		    return matcher.matches();
		}

	
	public static boolean validateName(String name) {
		String regex = "[a-zA-Z]+([ '-][a-zA-Z]+)*";
		return name.matches(regex);
	}
	
	public static boolean validateContactNumber(String contactNumber) {
		String regex = "^\\d{10}$";
		return contactNumber.matches(regex);
	}
	
	public static boolean validateEmail(String email) {
		String regex = "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$";
		return email.matches(regex);
	}
	
	public static boolean validateAddress(String address) {
		String regex = "^[#.0-9a-zA-Z\\s,-]+$";
		return address.matches(regex);
	}
	
	public static boolean validateCity(String city) {
		String regex = "[a-zA-Z]+(?:[\\s-][a-zA-Z]+)*";
		return city.matches(regex);
	}
	
	
	public static boolean validateCountry(String country) {
		String regex = "[a-zA-Z]+(?:[\\s-][a-zA-Z]+)*";
		return country.matches(regex);
	}
	
	
	
  
//	  public static boolean isValidPhoneNumber(String phoneNumber) {
//	      return Pattern.matches("\\d{10}", phoneNumber); // Basic pattern matching for 10-digit phone numbers
//	  }
	public static boolean isValidPhoneNumber(String phoneNumber) {
	    return Pattern.matches("(\\+91|00|0)?[7-9]\\d{9}", phoneNumber); // Allows optional country code +91, 00, or 0 followed by 9 digits
	}

	
	  public static boolean isValidGender(String gender) {
		    return gender.equalsIgnoreCase("male") || gender.equalsIgnoreCase("female") || gender.equalsIgnoreCase("other");
		}
	
	  public static boolean isValidJobType(String jobType) {
		    // Convert valid options to lowercase for comparison
		    String[] validOptions = {"full time", "part time", "intern"};
		    String lowercaseJobType = jobType.toLowerCase();
		    for (String option : validOptions) {
		        if (lowercaseJobType.equals(option)) {
		            return true;
		        }
		    }
		    return false;
		}
	
	public static boolean isValidPostalCode(String postalcode) {
	
	return Pattern.matches("^\\d{6}$", postalcode);// US Zip Code pattern matching
	}
	
	public static boolean isValidDate(String dateStr) {
	    String regex = "^\\d{2}-\\d{2}-\\d{4}$"; // Regex pattern for DD-MM-YYYY format
	    return dateStr.matches(regex);
	}

	public static boolean isValidAddress(String address) {
	////Regular expression pattern for address (allowing alphanumeric characters, spaces, commas, periods, and hyphens)
	String regex = "^[a-zA-Z0-9\\s,.\\-]*$";
	return address.matches(regex);
	}
	public static boolean isValidCity(String city) {
	////Regular expression pattern for city (allowing alphabetic characters and spaces)
	String regex = "^[a-zA-Z\\s]*$";
	return city.matches(regex);
	}

	public static boolean isValidCountry(String country) {
	////Regular expression pattern for country (allowing alphabetic characters and spaces)
	String regex = "^[a-zA-Z\\s]*$";
	return country.matches(regex);
	}
	public static boolean CheckValidLoginDetails(Connection con, String username, String password, String statement) {
	    try {
	        String Username = null, Password = null;
	        PreparedStatement pet = con.prepareStatement(statement);
	        ResultSet set = pet.executeQuery();
	        while (set.next()) {
	            Username = set.getString(3);
	            Password = set.getString(4);
	            if (Username!=null && Password!=null && username.equals(Username) && password.equals(Password)) {
	                return true;
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false;
	}
	public static boolean isValidNumber(String input) throws NumberException {
	    // Regular expression to match only digits
	    String regex = "\\d+"; // Match one or more digits
	    
	    if (input.matches(regex)) {
	        return true;
	    } else {
	        throw new NumberException(ConsoleColors.YELLOW+"Input should contain only numeric characters."+ConsoleColors.RESET);
	    }
	}
	public static int isValidJobId(String job_id) throws NumberException {
	    if (!job_id.matches("\\d+")) {
	        throw new NumberException(ConsoleColors.YELLOW+"Job ID should contain only numeric characters."+ConsoleColors.RESET);
	    }
	    return Integer.parseInt(job_id);
	}



}