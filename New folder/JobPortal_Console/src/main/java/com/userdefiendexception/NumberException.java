package com.userdefiendexception;

/**
 * Custom exception class for handling invalid number inputs.
 * This exception is thrown when a user provides an input that is not a valid number
 * or does not meet the expected criteria for number inputs.
 * 
 * Usage:
 * <pre>
 *     if (!isValidNumber(input)) {
 *         throw new NumberException("Invalid number input: " + input);
 *     }
 * </pre>
 */
	


public class NumberException extends Exception{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public NumberException(String message) {
        super(message);
    }
	
	
}