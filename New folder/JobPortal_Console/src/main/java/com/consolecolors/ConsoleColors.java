package com.consolecolors;
/**
 * This class provides ANSI escape codes for text colors in the console, as well as methods to print colored text.
 */

public class ConsoleColors {
	 // ANSI escape codes for colors
    public static final String RESET = "\033[0m";  // Text Reset
    public static final String RED = "\033[0;31m";     // RED
    public static final String GREEN = "\033[0;32m";   // GREEN
    public static final String YELLOW = "\033[0;33m";  // YELLOW
    public static final String BLUE = "\033[0;34m";    // BLUE
    public static final String PURPLE = "\033[0;35m";  // PURPLE
    public static final String CYAN = "\033[0;36m";    // CYAN
    public static final String WHITE = "\033[0;37m";   // WHITE
    public static final String BOLD = "\033[1m";   // BOLD
    public static final String UNDERLINE = "\033[4m";   // UNDERLINE

    /**
     * Method to print colored text.
     * 
     * @param color The ANSI escape code for the desired color.
     * @param message The message to be printed.
     */
    // Method to print colored text
    public static void printColored(String color, String message) {
        System.out.println(color + message + RESET);
    }
    /**
     * Overloaded method to return colored string without printing.
     * 
     * @param color The ANSI escape code for the desired color.
     * @param message The message to be colored.
     * @return The colored string.
     */
    // Overloaded method to return colored string without printing
    public static String getColoredString(String color, String message) {
        return color + message + RESET;
    }

}
