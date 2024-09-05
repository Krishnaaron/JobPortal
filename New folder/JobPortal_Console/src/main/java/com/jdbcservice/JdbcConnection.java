  package com.jdbcservice;
import java.sql.Connection;


import java.sql.DriverManager;


import java.sql.SQLException;
import java.util.Scanner;

import com.consolecolors.ConsoleColors;

/**
 * This class manages JDBC connections to the database and provides methods for database operations.
 */
public class JdbcConnection {
	static Scanner sc = new Scanner(System.in);
	static String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	static String userName = "JOBPORTAL";
	static String password = "ORACLE1234";
	/**
     * Establishes a connection to the database.
     *
     * @return The database connection.
     * @throws ClassNotFoundException If the Oracle JDBC driver class is not found.
     * @throws SQLException           If an SQL exception occurs while establishing the connection.
     */

	public static Connection connectdatabase() throws ClassNotFoundException, SQLException {
		Connection con = null;
		// Step1: Register the class.
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// Step2 - Create Connections.
		con = DriverManager.getConnection(URL, userName, password);
		// checking connection established or not.
	

		if (con ==null)
		{
			System.out.println(ConsoleColors.RED+"DB Connection Not Established!"+ConsoleColors.RESET);
		}
		else {
			//System.out.println("Connection established!");
		}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		return con;

	}
	/**
     * Closes the given database connection.
     *
     * @param con The database connection to be closed.
     */
	 public static void closeConnection(Connection con) {
	        try {
	            if (con != null) {
	                con.close();
	                System.out.println(ConsoleColors.GREEN+"DB Connection Closed!"+ConsoleColors.RESET);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

		
	}
	

	
	


