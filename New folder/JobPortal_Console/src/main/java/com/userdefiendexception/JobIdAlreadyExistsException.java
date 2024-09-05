package com.userdefiendexception;
/**
* Custom exception class for handling cases where a job ID already exists in the system.
* This exception is thrown when attempting to create a new job with an ID that is already in use.
* 
* Usage:
* <pre>
*     if (jobIdAlreadyExists(jobId)) {
*         throw new JobIdAlreadyExistsException("Job ID " + jobId + " already exists.");
*     }
* </pre>
*/
public class JobIdAlreadyExistsException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * Constructs a new JobIdAlreadyExistsException with the specified detail message.
     * 
     * @param message The detail message, saved for later retrieval by the {@link #getMessage()} method.
     */
	public JobIdAlreadyExistsException(String message) {
        super(message);
    }

}

