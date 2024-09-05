package com.userdefiendexception;
/**
 * Custom exception class for handling invalid character sequence inputs.
 * This exception is thrown when a user provides an input that does not meet the expected criteria for character sequences.
 * 
 * Usage:
 * <pre>
 *     if (!isValidCharacterSequence(input)) {
 *         throw new CharachterSequenceException("Invalid character sequence input: " + input);
 *     }
 * </pre>
 */
public class CharachterSequenceException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6165356387717342991L;
	/**
     * Constructs a new CharachterSequenceException with the specified detail message.
     * 
     * @param message The detail message, saved for later retrieval by the {@link #getMessage()} method.
     */
	public  CharachterSequenceException (String message) {
		super(message);
		
		
		
	}

}
