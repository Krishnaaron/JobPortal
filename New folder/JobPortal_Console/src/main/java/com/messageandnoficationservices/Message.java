package com.messageandnoficationservices;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.Scanner;

import com.consolecolors.ConsoleColors;
import com.jdbcservice.JdbcConnection;

import com.jobportal.users.Employer;
import com.jobportal.users.JobSeeker;

import com.userdefiendexception.CheckUserNameException;
import com.userdefiendexception.CompanyNameValidationException;
import com.userdefiendexception.OptionException;
import com.userdefiendexception.Validation;

/**
 * This class handles messaging and notification services within the job portal.
 * Employers can send notifications to job seekers, and job seekers can receive notifications.
 */
public class Message {
	private int id;
    private int senderId;
    private int receiverId;
    private String content;
    
     
	static Scanner sc = new Scanner(System.in);
	 // Constructor to initialize the Message object
    public Message(int id, int senderId, int receiverId, String content) {
        this.id = id;
        this.senderId = senderId;
        this.receiverId = receiverId;
        this.content = content;
    }
   
    public Message() {
	
	}

	public int getId() {
        return id;
    }

    public int getSenderId() {
        return senderId;
    }

    public int getReceiverId() {
        return receiverId;
    }

    public String getContent() {
        return content;
    }
    
   
    		
    		
    /**
     * Displays the message menu for employers and handles their input.
     * 
     * @param em The Employer object.
     * @throws ClassNotFoundException If the JDBC driver class is not found.
     */	
 // Method to display the message menu for employers	
  public void messages(Employer em) throws ClassNotFoundException {
	  boolean flag =true;
	  do {
		// Display message menu
		  System.out.println("+------------------------------------+");
		  System.out.println("|            Message Menu            |");
		  System.out.println("+------------------------------------+");
		  System.out.println("| 1. NotificationSend                |");
		  System.out.println("| 2. Back                            |");
		  System.out.println("| 3. Exit                            |");
		  System.out.println("+------------------------------------+");

		// Read and validate user input for menu option
		  int option = 0;

	        while (true) {
	            System.out.print(ConsoleColors.CYAN+"Enter Menu Option Number :"+ConsoleColors.RESET);
	            String input = sc.next();

	            try {
	                option = Validation.validateOption(input);
	                break;
	            } catch (OptionException e) {
	                System.out.println(ConsoleColors.YELLOW+e.getMessage()+ConsoleColors.RESET);
	            }
	        }
	     // Handle the selected menu option

		  switch(option) {
		  case 1: {
			  
			  // Send a notification from employer to job seeker
			  
			  System.out.println(ConsoleColors.CYAN+"Enter Reciver Id :"+ConsoleColors.RESET);
			  int receiverId =sc.nextInt();
			  sc.nextLine();
			  System.out.println(ConsoleColors.CYAN+"Enter The Message : "+ConsoleColors.RESET);
              String content =sc.nextLine();
            
              sendEmployerToJobSeekerNotification(em.getId(),receiverId, content);
			  break;
			  
		  }
		  
		  case 2: {
			// Go back to the employer menu
			 
			new Employer().emoloyerMenu(em);
			  break;
		  }
		  case 3: {
			// Exit the application
			  System.out.println(ConsoleColors.PURPLE+"Thank You For Using Job Portal!  Have a Great Day!"+ConsoleColors.RESET);
			  System.exit(0);
			  break;
		  }
		  
		  
	  default:
		// Handle invalid menu option
			System.out.println(ConsoleColors.RED + "Enter The Correct Option :" + ConsoleColors.RESET);
			 messages(em); 
	  }
	  }while(flag);
	  
	  
	  
  }
  /**
   * Displays the message menu for job seekers and handles their input.
   * 
   * @param seeker The JobSeeker object.
   * @throws ClassNotFoundException If the JDBC driver class is not found.
   * @throws SQLException           If a database access error occurs.
   * @throws OptionException        If an invalid option is chosen.
   */
  // Method to display the message menu for job seekers
  public void message(JobSeeker seeker) throws ClassNotFoundException, SQLException, OptionException, CheckUserNameException, CompanyNameValidationException {
	  boolean flag =true;
	  do {
		// Display message menu
		  System.out.println("+------------------------------------+");
		  System.out.println("|            Message Menu            |");
		  System.out.println("+------------------------------------+");
		  System.out.println("| 1. Receive notification            |");
		  System.out.println("| 2. Back                            |");
		  System.out.println("| 3. Exit                            |");
		  System.out.println("+------------------------------------+");

		// Read and validate user input for menu option
		  
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
	     // Handle the selected menu option
		  switch(option) {
		  
		  case 1: {
			// Receive notifications for the job seeker
			  receiveNotificationsForJobSeeker(seeker);
			
			  break;
			  
		  }
		  case 2: {
			// Go back to the job seeker menu 
		     new JobSeeker().jobSeekerMenu(seeker);
			  break;
		  }
		  case 3: {
			  // Exit the application
			  System.out.println(ConsoleColors.PURPLE+"Thank You For Using Job Portal!  Have a Great Day!"+ConsoleColors.RESET);
			  System.exit(0);
			  break;
		  }
		  default:
			// Handle invalid menu option
				System.out.println(ConsoleColors.RED + "Enter The Correct Option :" + ConsoleColors.RESET);
				message(seeker);
		  
		  }
		  
	  }while(flag);
	  
	  
	  
  } 	
    
    
    


  /**
   * Sends a notification from an employer to a job seeker.
   * 
   * @param employerId         The ID of the employer sending the notification.
   * @param jobSeekerId        The ID of the job seeker receiving the notification.
   * @param notificationContent The content of the notification.
   */
  public static void sendEmployerToJobSeekerNotification(int employerId, int jobSeekerId, String notificationContent) {
	    Connection con = null;
	    PreparedStatement preparedStatement = null;

	    try {
	        // Establish database connection
	        con = JdbcConnection.connectdatabase();

	        // SQL statement to insert notification
	        String sql = "INSERT INTO notifications (id, employer_id, job_seeker_id, notification_content) " +
	                "VALUES (not_seq.NEXTVAL, ?, ?, ?)";
	        // Create prepared statement
	        preparedStatement = con.prepareStatement(sql);
	        preparedStatement.setInt(1, employerId);
	        preparedStatement.setInt(2, jobSeekerId);
	        preparedStatement.setString(3, notificationContent);

	        // Execute the insert statement
	        int rowsAffected = preparedStatement.executeUpdate();
	        if (rowsAffected > 0) {
	            System.out.println(ConsoleColors.GREEN + "Notification sent successfully." + ConsoleColors.RESET);
	        } else {
	            System.out.println(ConsoleColors.YELLOW + "Failed to send notification." + ConsoleColors.RESET);
	        }
	    } catch (SQLException e) {
	        // Check if the error is related to a foreign key constraint violation
	        if (e.getErrorCode() == 2291) {
	            // Display message for wrong job seeker ID
	            System.out.println(ConsoleColors.RED + "Error: Invalid job seeker ID. Please enter a valid job seeker ID." + ConsoleColors.RESET);
	        } else {
	            // Print other SQL exceptions
	            e.printStackTrace();
	        }
	    } catch (ClassNotFoundException e) {
	        // Print error message for class not found exception
	        e.printStackTrace();
	    } finally {
	        // Close resources in the finally block
	        try {
	            if (preparedStatement != null) {
	                preparedStatement.close();
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
   * Receives notifications for a given job seeker.
   * 
   * @param seeker The JobSeeker object.
   */

  public void receiveNotificationsForJobSeeker(JobSeeker seeker) {
      Connection con = null;
      PreparedStatement preparedStatement = null;
      ResultSet resultSet = null;

      try {
          // Establish database connection
          con = JdbcConnection.connectdatabase();

          // SQL statement to retrieve notifications for the job seeker
          String sql = "SELECT * FROM notifications WHERE job_seeker_id = ?";

          // Create prepared statement
          preparedStatement = con.prepareStatement(sql);
          preparedStatement.setInt(1, seeker.getJobSeekerId());

          // Execute the query
          resultSet = preparedStatement.executeQuery();

          // Check if any notifications are found
          boolean hasNotifications = false;
          while (resultSet.next()) {
              hasNotifications = true;
              int notificationId = resultSet.getInt("id");
              int employerId = resultSet.getInt("employer_id");
              String notificationContent = resultSet.getString("notification_content");

              // Print or process the notification data
              System.out.println("Notification ID: " + notificationId);
              System.out.println("Employer ID: " + employerId);
              System.out.println("Notification Content: " + notificationContent);
              System.out.println("----------------------");
          }

          // If no notifications were found, print a message
          if (!hasNotifications) {
              System.out.println(ConsoleColors.GREEN+"No notifications found : " + seeker.getJobSeekerId()+ConsoleColors.RESET);
          }
      } catch (ClassNotFoundException | SQLException e) {
          System.err.println(ConsoleColors.RED+"Error receiving notifications for job seeker: " + e.getMessage()+ConsoleColors.RESET);
      } finally {
          // Close resources in the finally block
          try {
              if (resultSet != null) {
                  resultSet.close();
              }
              if (preparedStatement != null) {
                  preparedStatement.close();
              }
              if (con != null) {
                  con.close();
              }
          } catch (SQLException ex) {
              ex.printStackTrace();
          }
      }
  }




  
}
	

	

