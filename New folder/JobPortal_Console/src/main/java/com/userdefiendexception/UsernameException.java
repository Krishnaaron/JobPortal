package com.userdefiendexception;
/**
 * Custom exception class for handling invalid username scenarios.
 * This exception is thrown when a username does not meet the required criteria.
 * 
 * Usage:
 * <pre>
 *     if (!isValidUsername(username)) {
 *         throw new UsernameException("Invalid username: " + username);
 *     }
 * </pre>
 */

public class UsernameException extends Exception {
	private static final long serialVersionUID = 1L;
	/**
     * Constructs a new UsernameException with the specified detail message.
     * 
     * @param message The detail message, saved for later retrieval by the {@link #getMessage()} method.
     */
	public UsernameException(String message) {
        super(message);
    }

}
