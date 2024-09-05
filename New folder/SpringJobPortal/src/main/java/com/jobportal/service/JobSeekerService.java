package com.jobportal.service;

import com.jobportal.model.JobSeekers;

public interface JobSeekerService {
	/**
	 * Authenticates a job seeker using their email and password.
	 * 
	 * @param email    The email of the job seeker.
	 * @param password The password of the job seeker.
	 * @return The JobSeekers object if credentials are valid; otherwise, null.
	 */
	public JobSeekers loginJobSeeker(String email, String password);

	/**
	 * Registers a new job seeker with the provided details.
	 * 
	 * @param fName       The first name of the job seeker.
	 * @param email       The email of the job seeker.
	 * @param password    The password for the job seeker's account.
	 * @param phoneNumber The phone number of the job seeker.
	 * @return True if registration is successful; false otherwise.
	 */
	boolean registerJobSeeker(String fName, String email, String password, String phoneNumber);

	/**
	 * Updates the profile of an existing job seeker.
	 * 
	 * @param jobSeekers The JobSeekers object containing updated profile
	 *                   information.
	 * @return True if the profile is updated successfully; false otherwise.
	 */
	boolean updateProfile(JobSeekers jobSeekers);

	/**
	 * Edits the profile of a job seeker with the provided information.
	 * 
	 * @param jobSeekers The JobSeekers object containing the updated profile
	 *                   information.
	 * @param sessionEmail 
	 * @return True if the profile is edited successfully; false otherwise.
	 */
	boolean editProfile(JobSeekers jobSeekers, String sessionEmail);

	/**
	 * Updates the password of a job seeker after verifying the old password.
	 * 
	 * @param oldpassword   The current password of the job seeker.
	 * @param newPassword   The new password to set.
	 * @param job_Seeker_Id The ID of the job seeker.
	 * @return True if the password is updated successfully; false otherwise.
	 */
	public JobSeekers jobSeekers(int job_Seeker_Id);

//   boolean emailChecker(String email);
	public boolean updateSeekerPassword(String oldpassword, String newPassword, int job_Seeker_Id);

	/**
	 * Checks if the provided email already exists in the system.
	 * 
	 * @param email The email to check.
	 * @return 1 if the email exists; 0 if it does not.
	 */
	int emailChecker(String email);

}
