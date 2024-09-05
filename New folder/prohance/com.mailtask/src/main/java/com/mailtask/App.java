package com.mailtask;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;
import java.util.Timer;

import com.mailtask.timerandtimertask.Schedule;

/**
 * Hello world!
 *
 */
public class App {
	static Scanner sc = new Scanner(System.in);

	public static void main(String[] args) throws ParseException {
		
		
		
		
		
		
        String report=null,fileType = null;
		Schedule schedule = new Schedule();

		System.out.println("Choose the  Mail scheduling option:");
		System.out.println("1. Minutes");
		System.out.println("2. Hours");
		System.out.println("3. Days");
		System.out.println("4. Months");
		int choice = sc.nextInt();
		sc.nextLine();

		String startDateTime;
		int gap;
		String timeUnit = "";

		switch (choice) {
		case 1:
			timeUnit = "minutes";
			System.out.println("Enter the start time in 'HH:mm' format (example 17:25)");
			String startTimeMinutes = sc.nextLine();

			System.out.println("Enter the gap in minutes:");
			gap = sc.nextInt();
			report =chooseReportType();
			fileType =reportFileType();
			startDateTime = combineDateAndTime(startTimeMinutes);
			break;

		case 2:
			timeUnit = "hours";
			System.out.println("Enter the start time in 'HH:mm' format (example 11:00):");
			String startTimeHours = sc.nextLine();

			System.out.println("Enter the gap in hours ");
			gap = sc.nextInt();
			report =chooseReportType();
			fileType =reportFileType();
			startDateTime = combineDateAndTime(startTimeHours);
			break;

		case 3:
			timeUnit = "days";
			System.out
					.println("Enter the start date and time in 'dd-MM-yyyy HH:mm' format (example 12-08-2024 17:25):");
			startDateTime = sc.nextLine();

			System.out.println("Enter the gap in days:");
			gap = sc.nextInt();
			break;

		case 4:
			timeUnit = "months";
			System.out.println(
					"Enter the start date and time in 'dd-MM-yyyy HH:mm:ss' format (example 12-08-2024 17:25:00):");
			startDateTime = sc.nextLine();

			System.out.println("Enter the gap in months:");
			gap = sc.nextInt();

//                System.out.println("Enter the additional day, hour, minute, and second for the schedule:");
//
//                System.out.println("Day:");
//                int day = sc.nextInt();
//
//                System.out.println("Hour:");
//                int hour = sc.nextInt();
//
//                System.out.println("Minute:");
//                int minute = sc.nextInt();
//
//                System.out.println("Second:");
//                int second = sc.nextInt();

			// Calculate the start date with additional time components
			//fileType =reportFileType();
			Calendar startCal = Calendar.getInstance();
			SimpleDateFormat dateTimeFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
			Date startDate = dateTimeFormat.parse(startDateTime);
			startCal.setTime(startDate);
//                startCal.set(Calendar.DAY_OF_MONTH, day);
//                startCal.set(Calendar.HOUR_OF_DAY, hour);
//                startCal.set(Calendar.MINUTE, minute);
//                startCal.set(Calendar.SECOND, second);
			report =chooseReportType();
			fileType =reportFileType();
			startDateTime = dateTimeFormat.format(startCal.getTime()); // Update the start date time with the chosen
																		// components
			break;
//            case 5: 
//            	timeUnit ="fixedDate";
//            	 System.out.println("Enter the start date and time in 'dd-MM-yyyy HH:mm:ss' format (example 12-08-2024 17:25:00):");
//                 startDateTime = sc.nextLine();
//                 Calendar startCal1 = Calendar.getInstance();
//                 SimpleDateFormat dateTimeFormat2 = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
//                 Date startDate1 = dateTimeFormat2.parse(startDateTime);
//                 startCal1.setTime(startDate1);
//                 break;
//                 
		default:
			System.out.println("Invalid choice. Please choose a valid option.");
			sc.close();
			return;
		}

		// Schedule the task
		schedule.scheduleTask(startDateTime, gap, timeUnit,fileType,report);

		sc.close();
	}

	public static String combineDateAndTime(String time) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		String currentDate = dateFormat.format(new Date());
		return currentDate + " " + time + ":00";
	}

	public static  String reportFileType() {
		String fileType;
		System.out.println("choose the Rebort file Type");
		System.out.println("1.csv");
		System.out.println("2.xlsx");
		System.out.println("3.xls");
		System.out.println("4.doc");
		int option= sc.nextInt();
		switch(option) {
		case 1: 
			fileType =" .csv";
				return fileType;
			
		case 2: 
		fileType =" .xlsx";
			return fileType;
		
		
		
	case 3: 
		fileType =" .xls";
			return fileType;

	case 4: 
		fileType =" .doc";
			return fileType;
    
	default:
		return null;
		
		}
	}
		public static  String chooseReportType() {
			String report;
			System.out.println("choose the Report");
			System.out.println("1.google");
			System.out.println("2.youtube");
			System.out.println("3.facebook");
			System.out.println("4.gmail");
			int option= sc.nextInt();
			switch(option) {
			case 1: 
				report ="google.com";
					return report;
				
			case 2: 
			report ="youtube.com";
				return report;
			
			
			
		case 3: 
			report ="facebook.com";
				return report;

		case 4: 
			report ="gmail.com";
				return report;
	    
		default:
			return null;
			
			
		}
}
}