package com.userdefiendexception;
/**
 * Custom exception class for handling invalid option selections in menus or prompts.
 * This exception is thrown when a user selects an option that is not valid or recognized.
 * 
 * Usage:
 * <pre>
 *     if (!isValidOption(option)) {
 *         throw new OptionException("Invalid option selected: " + option);
 *     }
 * </pre>
 */
//Unique identifier for this exception class (required for serialization)
public class OptionException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * Constructs a new OptionException with the specified detail message.
     * 
     * @param message The detail message, saved for later retrieval by the {@link #getMessage()} method.
     */
	public OptionException(String message) {
		
        super(message);
    }

}
