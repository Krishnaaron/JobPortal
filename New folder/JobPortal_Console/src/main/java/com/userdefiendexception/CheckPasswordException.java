package com.userdefiendexception;
/**
 * Custom exception class for handling invalid password inputs.
 * This exception is thrown when a user provides a password that does not meet the required criteria.
 * 
 * Usage:
 * <pre>
 *     if (!isValidPassword(password)) {
 *         throw new CheckPasswordException("Invalid password: " + password);
 *     }
 * </pre>
 */
public class CheckPasswordException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * Constructs a new CheckPasswordException with the specified detail message.
     * 
     * @param message The detail message, saved for later retrieval by the {@link #getMessage()} method.
     */

	public CheckPasswordException(String message) {
		super(message);
	}

}
