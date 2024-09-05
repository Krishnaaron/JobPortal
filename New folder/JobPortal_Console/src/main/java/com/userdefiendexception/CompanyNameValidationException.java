package com.userdefiendexception;
/**
 * Custom exception class for handling invalid company name inputs.
 * This exception is thrown when a company name does not meet the required validation criteria.
 * 
 * Usage:
 * <pre>
 *     if (!isValidCompanyName(companyName)) {
 *         throw new CompanyNameValidationException("Invalid company name: " + companyName);
 *     }
 * </pre>
 */
public class CompanyNameValidationException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * Constructs a new CompanyNameValidationException with the specified detail message.
     * 
     * @param message The detail message, saved for later retrieval by the {@link #getMessage()} method.
     */
    public CompanyNameValidationException(String message) {
        super(message);
    }
}

