package com.jobportal.users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InputMismatchException;
import java.util.Scanner;

import com.consolecolors.ConsoleColors;
import com.jdbcservice.JdbcConnection;
import com.jobportal.functionality.Main;
import com.userdefiendexception.CheckUserNameException;
import com.userdefiendexception.CompanyNameValidationException;
import com.userdefiendexception.JobIdAlreadyExistsException;
import com.userdefiendexception.OptionException;
import com.userdefiendexception.Validation;
import com.usersregisterlogin.LoginRegister;

public class Admin extends User {
	

	private int adminID;
	private String name;
    static Scanner sc=new Scanner(System.in);
	


	
	public Admin(String username, String email, String password, UserType userType) {
		super(username, email, password, userType);
	
	}

	public int getAdminID() {
		return adminID;
	}

	public Admin() {
		super();
		
	}


	
	public Admin(int adminId2, String username, String password, String email) {
		
	}

	public void setAdminID(int adminID) {
		this.adminID = adminID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public void adminUserCreate()
			throws ClassNotFoundException, SQLException, CheckUserNameException, OptionException, JobIdAlreadyExistsException, CompanyNameValidationException {
		String userName, email, password;
         sc.nextLine();
		while (true) {
			System.out.println(ConsoleColors.CYAN+
					"Enter the username : Usernames must be 3-20 characters long and can contain letters, digits, underscores, and hyphens."+ConsoleColors.RESET);
			userName = sc.nextLine();
			if (!Validation.checkUserName(userName)) {
				System.out.println(
						ConsoleColors.YELLOW+"Invalid username format! Usernames must be 3-20 characters long and can contain letters, digits, underscores, and hyphens."+ConsoleColors.RESET);
				continue;
			} else {
				new LoginRegister();
				if (LoginRegister.isSeekerUsernameExists(userName)) {
					System.out.println(ConsoleColors.RED+"Username already exists! Please choose a different username.!"+ConsoleColors.RESET);
					continue;
				} else {
					break;
				}
			}
		}
		while (true) {
			System.out.println(
					ConsoleColors.CYAN+"Enter the password : password format! Passwords must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character]"+ConsoleColors.RESET);

			password = sc.nextLine();

			if (!Validation.checkPassword(password)) {
				System.out.println(
						ConsoleColors.YELLOW+"Invalid password format! Passwords must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character !"+ConsoleColors.RESET);

			} else {
				break;
			}
		}
		while (true) { // Loop for entering and validating email

			System.out.println(ConsoleColors.CYAN + "Enter the email [ name@gmail.com] :" + ConsoleColors.RESET);
			email = sc.nextLine();
			if (!Validation.checkEmail(email)) {
				System.out.println(ConsoleColors.YELLOW + "Invalid email format! Please enter a valid email address in the format :[ name@gmail.com]" + ConsoleColors.RESET);

				continue;
			} else {

				break;
			}
		}
       
		LoginRegister.registerAdmin(new Admin(userName, email, password, UserType.ADMIN));
		
		userManagement();
		
		

	}
		     
		            public void adminLogin() throws ClassNotFoundException, SQLException, OptionException, CheckUserNameException, JobIdAlreadyExistsException, CompanyNameValidationException {
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
		        	        Object loggedIn = LoginRegister.userslogin(userName, password, UserType.ADMIN);

		        	        if (loggedIn instanceof Admin) {
//		        	            Admin admin = (Admin) loggedIn;

		        	            System.out.println(ConsoleColors.BLUE + "+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+");
		        	            System.out.println("                                              ");
		        	            System.out.println(ConsoleColors.GREEN + "        Welcome " + userName + "      [Admin]  " + ConsoleColors.RESET);
		        	            System.out.println("                                              ");
		        	            System.out.println(ConsoleColors.BLUE + "+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+" + ConsoleColors.RESET);
		        	            userManagement();
		        	            break;
		        	        } else {
		        	            attempts++;
		        	            int remainingAttempts = maxAttempts - attempts;
		        	            if (remainingAttempts > 0) {
		        	                System.out.println(ConsoleColors.RED + "Login failed. Incorrect username or password. " +
		        	                        "You have " + remainingAttempts + " attempt(s) left." + ConsoleColors.RESET);
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
		        							new Main().admins();
		        						} catch (JobIdAlreadyExistsException e) {
		        							// TODO Auto-generated catch block
		        							e.printStackTrace();
		        						} catch (CompanyNameValidationException e) {
		        							// TODO Auto-generated catch block
		        							e.printStackTrace();
		        						}
		        	                }
		        	            }
		        	        }
		        	    }
		        	    
		        	    
		        	    
		        	}
				  
		            public void userManagement() throws ClassNotFoundException, CheckUserNameException, SQLException, JobIdAlreadyExistsException, CompanyNameValidationException, OptionException {
		            	
		            	System.out.println(ConsoleColors.RED+""+ConsoleColors.UNDERLINE+"Admin, there's a warning indicating that the user hasn't fully compiled the program; it's showing an exception and some flow errors"+ConsoleColors.RESET);
		            	
		            	System.out.println("+------------------------------------+");
						System.out.println("|            Menu                    |");
						System.out.println("+------------------------------------+");
						System.out.println("| 1. Employer Management             |");
						System.out.println("| 2. Job Seekers Management          |");
						System.out.println("| 3. Job Management                  |");
						System.out.println("| 4. Admin User Create               |");
						System.out.println("| 5. Back                            |");
						System.out.println("| 6. Exit                            |");
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
						switch(option) {
						case 1:{
							  
							employerMangement();
							
						break;	
						}
						case 2:{
							
							
							jobSeeekersManagement();
							
						break;	
						}
						case 3:{
							jobManagement();
							
							
							break;
						}
                       case 4:{
                    	   adminUserCreate();
                    	 
							
							break;
						}
                       case 5:{
                    	   new Main().runProject();
                    	   
                    	   break;
                       }
                       case 6:{
                    	  
                    	   System.out.println(ConsoleColors.PURPLE + "Thank you for using Job Portal!  Have a great day!"
       							+ ConsoleColors.RESET);
       					System.exit(0);// Exiting the application
                    	   break;
                       }
                      
                    	   
                       default:
               			System.out.println(ConsoleColors.RED + "Enter The Correct Option :" + ConsoleColors.RESET);
               			userManagement();
                       
						}
	        	    	
	        	    	
	        	    }
		            public void employerMangement() throws ClassNotFoundException, CheckUserNameException, SQLException, JobIdAlreadyExistsException, CompanyNameValidationException, OptionException {
		            	Employer em = new Employer();
		            	System.out.println("+------------------------------------+");
		            	System.out.println("|            Employer Management     |");
		            	System.out.println("+------------------------------------+");
		            	System.out.println("| 1. Employer User create            |");
		            	System.out.println("| 2. Employer User Account Status    |");
		            	System.out.println("| 3. View Employer user              |");
		            	System.out.println("| 4. Profile Management              |");
		            	System.out.println("| 5. Back                            |");
		            	System.out.println("| 6. Exit                            |");
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
						switch(option) {
						case 1:{
							  
							em.emloyerUserCreate();
							
						break;	
						}
						case 2:{
							
							 new User().changeStatus(UserType.EMPLOYER);
							
							
						break;	
						}
						case 3:{
							
							profileView(); 
							break;
						}
                       case 4:{
                    	   profileManagement(em);
						
							
							break;
						}
                       case 5:{
                    	   userManagement();
                    	   
                    	   break;
                       }
                       case 6:{
                    	   System.out.println(ConsoleColors.PURPLE + "Thank you for using Job Portal!  Have a great day!"
       							+ ConsoleColors.RESET);
       					System.exit(0);// Exiting the application
                    	   
                    	   break;
                       }
                       default:
                  			System.out.println(ConsoleColors.RED + "Enter The Correct Option :" + ConsoleColors.RESET);
                  			employerMangement();
						}
		            	
		            	
		            	
		            	
		            }
		            
		            

		            public void viewAllEmployers() throws SQLException, ClassNotFoundException {
		                String sql = "SELECT USERNAME, EMAIL, PASSWORD, COMPANYNAME, REGISTERNUMBER, DOMAIN, ID, PHONE_NUMBER, STATUS, REGISTER_DATE FROM employers";
		                Connection con = null;
		                PreparedStatement statement = null;
		                ResultSet resultSet = null;
		                try {
		                    new JdbcConnection();
							con = JdbcConnection.connectdatabase();
		                    statement = con.prepareStatement(sql);
		                    resultSet = statement.executeQuery();

		                    System.out.println("===========================================================================================================================================================================================================================");
		                    System.out.printf("| %-20s | %-20s | %-30s | %-15s | %-15s | %-10s | %-15s | %-10s | %-20s |%n",
		                            "Username", "Email", "Company Name", "Register Number", "Domain", "ID", "Phone Number", "Status", "Register Date");
		                    System.out.println("===========================================================================================================================================================================================================================");

		                    int count = 0; // Counter for number of employers

		                    while (resultSet.next()) {
		                        count++; // Increment the count for each row

		                        String username = resultSet.getString("USERNAME");
		                        String email = resultSet.getString("EMAIL");
		                        String password = resultSet.getString("PASSWORD");
		                        String companyName = resultSet.getString("COMPANYNAME");
		                        int registerNumber = resultSet.getInt("REGISTERNUMBER");
		                        
		                        String domain = resultSet.getString("DOMAIN");
		                        int id = resultSet.getInt("ID");
		                        String phoneNumber = resultSet.getString("PHONE_NUMBER");
		                        String status = resultSet.getString("STATUS");
		                        String registerDate = resultSet.getString("REGISTER_DATE");

		                        System.out.printf("| %-20s | %-30s | %-20s | %-30s | %-15d | %-15s | %-10d | %-15s | %-10s | %-20s |%n",
		                                username, email, password, companyName, registerNumber, domain, id, phoneNumber, status, registerDate);
		                        System.out.println("---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
		                    }

		                    System.out.println("Number of Employers: " + count); // Print the number of employers
		                } finally {
		                    if (resultSet != null) {
		                        resultSet.close();
		                    }
		                    if (statement != null) {
		                        statement.close();
		                    }
		                    if (con != null) {
		                        con.close();
		                    }
		                }
		            }

		            public void viewAllJobSeekers() throws SQLException, ClassNotFoundException {
		                String sql = "SELECT JOB_SEEKER_ID, USERNAME, EMAIL, CONTACT_DETAILS, STATUS, REGISTER_DATE FROM job_seekers";
		                Connection con = null;
		                PreparedStatement statement = null;
		                ResultSet resultSet = null;
		                try {
		                    new JdbcConnection();
		                    con = JdbcConnection.connectdatabase();
		                    statement = con.prepareStatement(sql);
		                    resultSet = statement.executeQuery();

		                    System.out.println("===========================================================================================================================================================");
		                    System.out.printf("| %-5s | %-15s | %-20s | %-30s | %-15s | %-15s | %-15s |%n",
		                            "S.No", "Job Seeker ID", "Username", "Email", "Phone Number", "Status", "Register Date");
		                    System.out.println("===========================================================================================================================================================");

		                    int count = 0;

		                    while (resultSet.next()) {
		                        count++;
		                        int id = resultSet.getInt("JOB_SEEKER_ID");
		                        String username = resultSet.getString("USERNAME");
		                        String email = resultSet.getString("EMAIL");
		                        String phone = resultSet.getString("CONTACT_DETAILS");
		                        String status = resultSet.getString("STATUS");
		                        String registerDate = resultSet.getString("REGISTER_DATE");

		                        System.out.printf("| %-5d | %-15d | %-20s | %-30s | %-15s | %-15s | %-15s |%n",
		                                count, id, username, email, phone, status, registerDate);
		                        System.out.println("-----------------------------------------------------------------------------------------------------------------------------------------------------------");
		                    }

		                    System.out.println("Number of Seekers: " + count);
		                } finally {
		                    if (resultSet != null) {
		                        resultSet.close();
		                    }
		                    if (statement != null) {
		                        statement.close();
		                    }
		                    if (con != null) {
		                        con.close();
		                    }
		                }
		            }
		            public void profileView() throws ClassNotFoundException, SQLException, OptionException, CheckUserNameException, CompanyNameValidationException, JobIdAlreadyExistsException {
		          	  boolean flag =true;
		          	  do {
		          		  System.out.println("+------------------------------------+");
		          		  System.out.println("|            Message Menu            |");
		          		  System.out.println("+------------------------------------+");
		          		  System.out.println("| 1. All Employer Profile view       |");
		          		  System.out.println("| 2. Id based view                   |");
		          		  System.out.println("| 3. Go Back                         |");
		          		  System.out.println("| 4. Exit                            |");
		          		  System.out.println("+------------------------------------+");

		          		  
		          		  
		          		  int option = 0;

		          	        while (true) {
		          	            System.out.print(ConsoleColors.CYAN+"Enter Menu Option Number :"+ConsoleColors.RESET);
		          	            String input = sc.next();

		          	            try {
		          	                option = Validation.validateOption(input);
		          	                break;
		          	            } catch (OptionException e) {
		          	                System.out.println(ConsoleColors.RED+e.getMessage()+ConsoleColors.RESET);
		          	            }
		          	        }
		          		  switch(option) {
		          		  
		          		  case 1: {
		          			  
		          			viewAllEmployers();
		          			
		          			  break;
		          			  
		          		  }
		          		  case 2: {
		          			  System.out.println("Enter the employer id :");
		          			  int id =sc.nextInt();
		          			new Employer().viewProfile(id);
		          			
		          			  break;
		          		  }
		          		 case 3:{
			          			employerMangement();
			          			break;
			          			  
			          		  }
		          		  case 4: {
		          			  System.out.println(ConsoleColors.PURPLE+"Thank You For Using Job Portal!  Have a Great Day!"+ConsoleColors.RESET);
		          			  System.exit(0);
		          			  break;
		          		  }
		          		default:
		    				System.out.println(ConsoleColors.RED + "Enter The Correct Option :" + ConsoleColors.RESET);
		    				profileView();
		          		  
		          		  }
		          		  
		          	  }while(flag);
		          	  
		          	  
		          	  
		            }	
		            public void profileManagement(Employer em)
		        			throws ClassNotFoundException, OptionException, JobIdAlreadyExistsException, CheckUserNameException, SQLException, CompanyNameValidationException {
		        		boolean flag = true;
		        		do {
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
		        				int employerid;
		        				System.out.println(ConsoleColors.CYAN + "Enter The Employer Id : [Enter only numeric value]"
		        						+ ConsoleColors.RESET);
		        				while (true) {
		        					try {
		        						
		        						employerid = sc.nextInt();
		        						sc.nextLine(); // Consume the newline character after reading the integer
		        						break; // If no exception occurs, break out of the loop
		        					} catch (InputMismatchException e) {
		        						System.out.println(ConsoleColors.YELLOW + "Employer Id![Enter only numeric value]"
		        								+ ConsoleColors.RESET);
		        						sc.nextLine(); // Clear the invalid input
		        					}
		        				}
		        				em.viewProfile( employerid);// Viewing profile

		        				break;
		        			}
		        			case 2: {
		        				int employerid;
		        				System.out.println(ConsoleColors.CYAN + "Enter The Employer Id : [Enter only numeric value]"
		        						+ ConsoleColors.RESET);
		        				while (true) {
		        					try {
		        						
		        						employerid = sc.nextInt();
		        						sc.nextLine(); // Consume the newline character after reading the integer
		        						break; // If no exception occurs, break out of the loop
		        					} catch (InputMismatchException e) {
		        						System.out.println(ConsoleColors.YELLOW + "Employer Id![Enter only numeric value]"
		        								+ ConsoleColors.RESET);
		        						sc.nextLine(); // Clear the invalid input
		        					}
		        				}
		        				em.viewProfile( employerid);// Viewing profile
		        				sc.nextLine(); // Updating profile
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
		        				String phone ;
		        				while (true) {
		        					System.out.println(ConsoleColors.CYAN + "Enter The Update Phone Number :" + ConsoleColors.RESET);
		        					phone = sc.nextLine();
		        					if (!Validation.isValidPhoneNumber(phone)) {
		        						continue;
		        					} else {
		        						break;
		        					}
		        				}

		        				System.out.println(ConsoleColors.RESET + "Enter the domain :" + ConsoleColors.RESET);
		        				String domain = sc.nextLine();
		        				em.updateProfile(employerid, email, password, cName, cRegisterNumber, phone, domain);
		        				break;
		        			}
		        			case 3: {
		        				int employerid;
		        				System.out.println(ConsoleColors.CYAN + "Enter The Employer Id : [Enter only numeric value]"
		        						+ ConsoleColors.RESET);
		        				while (true) {
		        					try {
		        						
		        						employerid = sc.nextInt();
		        						sc.nextLine(); // Consume the newline character after reading the integer
		        						break; // If no exception occurs, break out of the loop
		        					} catch (InputMismatchException e) {
		        						System.out.println(ConsoleColors.YELLOW + "Employer Id![Enter only numeric value]"
		        								+ ConsoleColors.RESET);
		        						sc.nextLine(); // Clear the invalid input
		        					}
		        				}
		        				sc.nextLine();
		        				System.out.println(ConsoleColors.CYAN + "Enter the update password :" + ConsoleColors.RESET);
		        				String password = sc.nextLine();
		        				em.updatePassword(employerid, password); // Updating password
		        				break;
		        			}
		        			case 4: {
		        				int employerid;
		        				System.out.println(ConsoleColors.CYAN + "Enter The Employer Id : [Enter only numeric value]"
		        						+ ConsoleColors.RESET);
		        				while (true) {
		        					try {
		        						
		        						employerid = sc.nextInt();
		        						sc.nextLine(); // Consume the newline character after reading the integer
		        						break; // If no exception occurs, break out of the loop
		        					} catch (InputMismatchException e) {
		        						System.out.println(ConsoleColors.YELLOW + "Employer Id![Enter only numeric value]"
		        								+ ConsoleColors.RESET);
		        						sc.nextLine(); // Clear the invalid input
		        					}
		        				}
		        				sc.nextLine();
		        				System.out.println(ConsoleColors.CYAN + "Enter the update email :" + ConsoleColors.RESET);
		        				String email = sc.nextLine();
		        				em.updateEmail(employerid, email); // Updating email
		        				break;
		        			}
		        			case 5: {
		        				int employerid;
		        				System.out.println(ConsoleColors.CYAN + "Enter The Employer Id : [Enter only numeric value]"
		        						+ ConsoleColors.RESET);
		        				while (true) {
		        					try {
		        						
		        						employerid = sc.nextInt();
		        						sc.nextLine(); // Consume the newline character after reading the integer
		        						break; // If no exception occurs, break out of the loop
		        					} catch (InputMismatchException e) {
		        						System.out.println(ConsoleColors.YELLOW + "Employer Id![Enter only numeric value]"
		        								+ ConsoleColors.RESET);
		        						sc.nextLine(); // Clear the invalid input
		        					}
		        				}
		        				sc.nextLine();
		        				System.out.println(ConsoleColors.CYAN + "Enter the update company Name :" + ConsoleColors.RESET);
		        				String cName = sc.nextLine();
		        				em.updateCompanyName(employerid, cName); // Updating company name
		        				break;
		        			}
		        			case 6: {
		        				int employerid;
		        				System.out.println(ConsoleColors.CYAN + "Enter The Employer Id : [Enter only numeric value]"
		        						+ ConsoleColors.RESET);
		        				while (true) {
		        					try {
		        						
		        						employerid = sc.nextInt();
		        						sc.nextLine(); // Consume the newline character after reading the integer
		        						break; // If no exception occurs, break out of the loop
		        					} catch (InputMismatchException e) {
		        						System.out.println(ConsoleColors.YELLOW + "Employer Id![Enter only numeric value]"
		        								+ ConsoleColors.RESET);
		        						sc.nextLine(); // Clear the invalid input
		        					}
		        				}
		        				System.out.println(
		        						ConsoleColors.CYAN + "Enter the update company Register Number :" + ConsoleColors.RESET);// Updating
		        																													// company
		        																													// register
		        																													// number
		        				int cRegisterNumber = sc.nextInt();
		        				sc.nextLine();
		        				em.updateRegisterNumber(employerid, cRegisterNumber);
		        				break;

		        			}
		        			case 7: {
		        				int employerid;
		        				System.out.println(ConsoleColors.CYAN + "Enter The Employer Id : [Enter only numeric value]"
		        						+ ConsoleColors.RESET);
		        				while (true) {
		        					try {
		        						
		        						employerid = sc.nextInt();
		        						sc.nextLine(); // Consume the newline character after reading the integer
		        						break; // If no exception occurs, break out of the loop
		        					} catch (InputMismatchException e) {
		        						System.out.println(ConsoleColors.YELLOW + "Employer Id![Enter only numeric value]"
		        								+ ConsoleColors.RESET);
		        						sc.nextLine(); // Clear the invalid input
		        					}
		        				}
		        				sc.nextLine();
		        				String  phone ;
		        				while (true) {
		        					System.out.println(ConsoleColors.CYAN + "Enter The update Phone Number :" + ConsoleColors.RESET);// Updating
		        																														// phone
		        																														// number
		        																														// details
		        					phone = sc.nextLine();
		        					if (!Validation.isValidPhoneNumber(phone)) {
		        						continue;
		        					} else {
		        						break;
		        					}
		        				}
		        				// Updating contact details
		        				em.updateContact(employerid, phone);
		        				break;
		        			}
		        			case 8: {
		        				int employerid;
		        				System.out.println(ConsoleColors.CYAN + "Enter The Employer Id : [Enter only numeric value]"
		        						+ ConsoleColors.RESET);
		        				while (true) {
		        					try {
		        						
		        						employerid = sc.nextInt();
		        						sc.nextLine(); // Consume the newline character after reading the integer
		        						break; // If no exception occurs, break out of the loop
		        					} catch (InputMismatchException e) {
		        						System.out.println(ConsoleColors.YELLOW + "Employer Id![Enter only numeric value]"
		        								+ ConsoleColors.RESET);
		        						sc.nextLine(); // Clear the invalid input
		        					}
		        				}
		        				sc.nextLine();
		        				System.out.println(ConsoleColors.CYAN + "Enter the domain :" + ConsoleColors.RESET); // Updating domain
		        				String domain = sc.nextLine();
		        				em.updateDomain(employerid,domain);
		        				break;

		        			}
		        			case 9: {
		        				employerMangement();// Returning to employererManagement menu
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
		        				profileManagement(em);
		        			}
		        		} while (flag);
		        		
		        	}
		            public void jobSeeekersManagement() throws ClassNotFoundException, SQLException, CheckUserNameException, OptionException, JobIdAlreadyExistsException, CompanyNameValidationException {
		            do {
		            	JobSeeker seeker = new JobSeeker();
		            System.out.println("+------------------------------------+");
	            	System.out.println("|        Job Seeker Management       |");
	            	System.out.println("+------------------------------------+");
	            	System.out.println("| 1. Job Seeker User create          |");
	            	System.out.println("| 2. View Job Seekers                |");
	            	System.out.println("| 3. Job Seeker Account Ststus       |");
	            	System.out.println("| 4. Profile Management              |");
	            	System.out.println("| 5. Back                            |");
	            	System.out.println("| 6. Exit                            |");
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
					switch(option) {
					case 1:{
						  
				         seeker.jobSeekerRegister();
						
					break;	
					}
					case 2:{
						
						viewAllJobSeekers();
						break;
						
						
				
					}
					case 3:{
						viewAllJobSeekers();
						new User().changeStatus(UserType.JOBSEEKER);
						break;
					}
                   case 4:{
                	   viewAllJobSeekers();
                	   seeker.manageProfie(seeker.getJobSeekerId());
                	   System.out.println("JobSeeker Profile Management feature commin soon");
       				break;
			
						
						
					}
                   case 5:{
                	   userManagement();
                	   
                	   break;
                   }
                   case 6:{
                	   System.out.println(ConsoleColors.PURPLE + "Thank you for using Job Portal!  Have a great day!"
   							+ ConsoleColors.RESET);
   					System.exit(0);// Exiting the application
                	   
                	   break;
                   }
                   default:
              			System.out.println(ConsoleColors.RED + "Enter The Correct Option :" + ConsoleColors.RESET);
              			employerMangement();
					}
		            }while(true);
		            }
		            
		            public void jobManagement() throws ClassNotFoundException, CheckUserNameException, SQLException, JobIdAlreadyExistsException, CompanyNameValidationException, OptionException {
		            	Employer em = new Employer();
		            	System.out.println("+------------------------------------+");
		            	System.out.println("|          JobMangemnt               |");
		            	System.out.println("+------------------------------------+");
		            	System.out.println("| 1. Jobs view                       |");
		            	System.out.println("| 2. aplication view                 |");
		            	System.out.println("| 3. View Employer user              |");
		            	System.out.println("| 4. Profile Management              |");
		            	System.out.println("| 5. Back                            |");
		            	System.out.println("| 6. Exit                            |");
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
						switch(option) {
						case 1:{
							  
							viewjobs();
							
						break;	
						}
						case 2:{
							
							 
							
							
						break;	
						}
						case 3:{
							
							profileView(); 
							break;
						}
                       case 4:{
                    	   profileManagement(em);
//                    	   System.out.println("Enter the Emploer id");
//                    	   int id=sc.nextInt();
//                    	   sc.nextLine();
//                    	   System.out.println("Enter the job description");
//                    	  String name =sc.nextLine();
//                    	  em.updateCompanyName(id, name);
//							
							
							break;
						}
                       case 5:{
                    	   userManagement();
                    	   
                    	   break;
                       }
                       case 6:{
                    	   System.out.println(ConsoleColors.PURPLE + "Thank you for using Job Portal!  Have a great day!"
       							+ ConsoleColors.RESET);
       					System.exit(0);// Exiting the application
                    	   
                    	   break;
                       }
                       default:
                  			System.out.println(ConsoleColors.RED + "Enter The Correct Option :" + ConsoleColors.RESET);
                  			employerMangement();
						}
		            	
		            	
		            	
		            	
		            }
		            public void viewjobs() throws ClassNotFoundException, CheckUserNameException, SQLException, JobIdAlreadyExistsException, CompanyNameValidationException, OptionException{
				     	boolean flag = true;
					do {
						System.out.println("+------------------------------------+");
						System.out.println("|          Search Options            |");
						System.out.println("+------------------------------------+");
						System.out.println("| 1. View All Jobs                   |");
						System.out.println("| 2. Job Title-based  View           |");
						System.out.println("| 3. Location-based View             |");
						System.out.println("| 4. JobType-based View              |");
						System.out.println("| 5. CompanyName-based View          |");
				        System.out.println("| 6. Back                            |");
						System.out.println("| 7. Exit                            |");
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

							new JobSeeker().searchJob("alljobs");

							break;
						}
						case 2: {

							new JobSeeker().searchJob("jobTitle");
							break;
						}
						case 3: {

							new JobSeeker().searchJob("location");
							break;

						}
						case 4: {

							new JobSeeker().searchJob("jobtype");
							break;
						}
						case 5: {

							new JobSeeker().searchJob("companyname");
							break;

						}
						
						case 6: {
							jobManagement();
							break;

						}

						case 7: {
							System.out.println(ConsoleColors.PURPLE + "Thank You For Using Job Portal!  Have a Great Day!"
									+ ConsoleColors.RESET);
							System.exit(0);
							break;
						}
						default:
							System.out.println(ConsoleColors.RED + "[.....Enter The Corrct Option.....]" + ConsoleColors.RESET);
							
						}

					} while (flag);

				}

}  
