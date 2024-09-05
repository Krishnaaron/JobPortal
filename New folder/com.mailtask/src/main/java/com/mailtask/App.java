package com.mailtask;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;
import com.mailtask.timerandtimertask.Schedule;
public class App {
	static Scanner sc = new Scanner(System.in);
	public static void main(String[] args) throws ParseException {
		String report = null, fileType = null;
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
			report = chooseReportType();
			fileType = reportFileType();
			startDateTime = combineDateAndTime(startTimeMinutes);
			break;

		case 2:
			timeUnit = "hours";
			System.out.println("Enter the start time in 'HH:mm' format (example 11:00):");
			String startTimeHours = sc.nextLine();
			System.out.println("Enter the gap in hours ");
			gap = sc.nextInt();
			report = chooseReportType();
			fileType = reportFileType();
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
			Calendar startCal = Calendar.getInstance();
			SimpleDateFormat dateTimeFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
			//Date startDate = dateTimeFormat.parse(startDateTime);
			report = chooseReportType();
			fileType = reportFileType();
			startDateTime = dateTimeFormat.format(startCal.getTime()); // Update the start date time with the chosen
			break;
		default:
			System.out.println("Invalid choice. Please choose a valid option.");
			sc.close();
			return;
		}
		// Schedule the task
		schedule.scheduleTask(startDateTime, gap, timeUnit, fileType, report);
		sc.close();
	}

	public static String combineDateAndTime(String time) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		String currentDate = dateFormat.format(new Date());
		return currentDate + " " + time + ":00";
	}

	public static String reportFileType() {
		String fileType;
		System.out.println("choose the Rebort file Type");
		System.out.println("1.csv");
		System.out.println("2.xlsx");
		System.out.println("3.xls");

		int option = sc.nextInt();
		switch (option) {
		case 1:
			fileType = " .csv";
			return fileType;

		case 2:
			fileType = " .xlsx";
			return fileType;

		case 3:
			fileType = " .xls";
			return fileType;

		default:
			return null;

		}
	}

	public static String chooseReportType() {
		System.out.println("Enter the website name");
		String report = sc.next();
		return report;
	}
}