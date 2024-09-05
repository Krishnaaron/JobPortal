package com.userdefiendexception;
/**
 * Custom exception class for handling invalid input scenarios.
 * This exception is thrown when an input provided by the user does not meet the required validation criteria.
 * 
 * Usage:
 * <pre>
 *     if (!isValidInput(input)) {
 *         throw new InvalidInputException("Invalid input: " + input);
 *     }
 * </pre>
 */

	
	public class InvalidInputException extends Exception  {
		 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		/**
	     * Constructs a new InvalidInputException with the specified detail message.
	     * 
	     * @param message The detail message, saved for later retrieval by the {@link #getMessage()} method.
	     */

		public InvalidInputException(String message) {
		        super(message);
		    }

	}


