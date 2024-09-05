package com.jobportal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.jobportal.mapper.JobSeekerMapper;
import com.jobportal.model.JobSeekers;

@Service
public class JobSeekerSeviceImpl implements JobSeekerService {

	@Autowired
	private JobSeekerMapper jobSeekerMapper;

	/**
	 * Authenticates a job seeker using their email and password.
	 * 
	 * @param email    The email of the job seeker.
	 * @param password The password of the job seeker.
	 * @return The JobSeekers object if credentials are valid; otherwise, null.
	 */
	@Override
	public JobSeekers loginJobSeeker(String email, String password) {
		return jobSeekerMapper.findByEmailAndPassword(email, password);
	}

	/**
	 * Registers a new job seeker with the provided details.
	 * 
	 * @param fName       The first name of the job seeker.
	 * @param email       The email of the job seeker.
	 * @param password    The password for the job seeker's account.
	 * @param phoneNumber The phone number of the job seeker.
	 * @return True if registration is successful; false otherwise.
	 */

	public boolean registerJobSeeker(String fName, String email, String password, String phoneNumber) {
		JobSeekers seeker = new JobSeekers();
		seeker.setfName(fName);
		seeker.setEmail(email);
		seeker.setPassword(password);
		seeker.setPhoneNumber(phoneNumber);
		System.out.println(email + " " + password + " " + fName + " " + phoneNumber);

		try {
			// Assuming you have a method in JobSeekerMapper to insert the seeker
			int result = jobSeekerMapper.insertJobSeeker(seeker);
			return result > 0; // Return true if the insertion is successful
		} catch (DataIntegrityViolationException e) {
			if (e.getCause() instanceof java.sql.SQLIntegrityConstraintViolationException) {
				java.sql.SQLIntegrityConstraintViolationException sqlException = (java.sql.SQLIntegrityConstraintViolationException) e
						.getCause();
				// Check for ORA-00001 error code for unique constraint violation
				if (sqlException.getErrorCode() == 1) { // ORA-00001 is Oracle's error code for unique constraint
														// violation
					System.err.println("Email ID already exists.");
					return false; // Return false for unique constraint violation
				}
			}
			// Log the exception and return false for general
			// DataIntegrityViolationException
			System.err.println("An error occurred while creating a new job seeker: " + e.getMessage());
			return false;
		} catch (Exception e) {
			// Log the exception and return false for any other unexpected exceptions
			System.err.println("An unexpected error occurred: " + e.getMessage());
			
			return false;
		}
	}

	/**
	 * Updates the profile of an existing job seeker.
	 * 
	 * @param jobSeekers The JobSeekers object containing updated profile
	 *                   information.
	 * @return True if the profile is updated successfully; false otherwise.
	 */

	@Override
	public boolean updateProfile(JobSeekers jobSeekers) {
		// TODO Auto-generated method stub
		return jobSeekerMapper.updateJobSeekerProfile(jobSeekers);
	}

	/**
	 * Retrieves the profile details of a job seeker by their ID.
	 * 
	 * @param job_Seeker_Id The ID of the job seeker.
	 * @return The JobSeekers object containing the job seeker's profile details.
	 */
	@Override
	public JobSeekers jobSeekers(int job_Seeker_Id) {
		// TODO Auto-generated method stub
		return jobSeekerMapper.viewProfileData(job_Seeker_Id);
	}

	/**
	 * Edits the profile of a job seeker with the provided information.
	 * 
	 * @param jobSeekers The JobSeekers object containing the updated profile
	 *                   information.
	 * @return True if the profile is edited successfully; false otherwise.
	 */
	@Override
	public boolean editProfile(JobSeekers jobSeekers,String seesionEmail) {
		// TODO Auto-generated method stub
		if(jobSeekers.getEmail().equals(seesionEmail)) {
			
			
			return jobSeekerMapper.editeJobSeekerProfile(jobSeekers);
		}
		
		
		int check =jobSeekerMapper.emailChecker(jobSeekers.getEmail());
		System.out.println(check+"gopal");
		 if(check < 1) {
				return jobSeekerMapper.editeJobSeekerProfile(jobSeekers);
			
			}
			else if(check == 1){
				
				return false;
			}
			
			else
				return false;
	}

//	@Override
//	public boolean emailChecker(String email) {
//		// TODO Auto-generated method stub
//		return jobSeekerMapper.emailChecker(email);
//	}

	/**
	 * Checks if the provided email already exists in the system.
	 * 
	 * @param email The email to check.
	 * @return 1 if the email exists; 0 if it does not.
	 */
	@Override
	public int emailChecker(String email) {
		// TODO Auto-generated method stub
		return jobSeekerMapper.emailChecker(email);
	}

	/**
	 * Updates the password of a job seeker after verifying the old password.
	 * 
	 * @param oldpassword   The current password of the job seeker.
	 * @param newPassword   The new password to set.
	 * @param job_Seeker_Id The ID of the job seeker.
	 * @return True if the password is updated successfully; false otherwise.
	 */

	@Override
	public boolean updateSeekerPassword(String oldpassword, String newPassword, int job_Seeker_Id) {
		// TODO Auto-generated method stub
		return jobSeekerMapper.changePassword(job_Seeker_Id, oldpassword, newPassword);
	}

}
