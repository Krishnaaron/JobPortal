package com.userdefiendexception;
/**
 * Custom exception class for handling invalid username inputs.
 * This exception is thrown when a user provides a username that does not meet the required criteria.
 * 
 * Usage:
 * <pre>
 *     if (!isValidUsername(username)) {
 *         throw new CheckUserNameException("Invalid username: " + username);
 *     }
 * </pre>
 */
public class CheckUserNameException extends Exception {
	/**
     * Constructs a new CheckUserNameException with the specified detail message.
     * 
     * @param message The detail message, saved for later retrieval by the {@link #getMessage()} method.
     */
	private static final long serialVersionUID = 1L;

	public  CheckUserNameException(String message) {
        super(message);
    }

}
