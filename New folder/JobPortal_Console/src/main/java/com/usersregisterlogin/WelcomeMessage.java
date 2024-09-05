package com.usersregisterlogin;

import com.consolecolors.ConsoleColors;

/**
* This class provides a method to print a welcome message with decorative borders.
* The message is displayed after a delay of 3 seconds and is enclosed between top and bottom borders.
* After displaying the message, there is an additional delay of 4 seconds.
*@author Gopal
*@since 20-05-2024
*/
public class WelcomeMessage {

	public void printWelcomeMessage() {
		String message = "WELCOME TO JOBPORTAL";

		// Wait for 3 seconds before showing the message
		try {
			Thread.sleep(3000); // 3000 milliseconds = 3 seconds
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		// Print top border
		System.out.println(ConsoleColors.BLUE + "         ************************");

		// Print message with borders
		System.out.println("          *" + message + "*");

		// Print bottom border
		System.out.println("         ************************" + ConsoleColors.RESET);

		// Wait for 4 seconds
		try {
			Thread.sleep(4000); // 4000 milliseconds = 4 seconds
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}
