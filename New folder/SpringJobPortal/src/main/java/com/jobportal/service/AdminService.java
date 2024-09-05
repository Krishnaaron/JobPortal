package com.jobportal.service;

import java.util.List;

import com.jobportal.model.Admin;
import com.jobportal.model.Employers;
import com.jobportal.model.JobApplications;
import com.jobportal.model.JobSeekers;
import com.jobportal.model.Jobs;

public interface AdminService {
	Admin adminLogin(String email, String password);

	// Admin login method that takes email and password, returning an Admin object
	// if successful
	public List<JobSeekers> viewJobSeeker();

	// Retrieves a list of all job seekers
	public List<Employers> viewEmployers();

	// Retrieves a list of all employers
	public List<Jobs> viewJobs();

	// Retrieves a list of all Applications
	public List<JobApplications> viewApplications();

	public boolean updateStatus(String email, String status);

	// Updates the status of a job seeker based on their email
	public boolean updateEmloyerStatus(String email, String status);

	// Updates the status of an employer based on their email
	public boolean updateJobStatus(int job_id, int employer_Id, String job_Status);

	// Updates the status of a job based on job ID and employer ID
	public boolean updateAdminProfile(String name, String email, int admin_Id, String sessionEmail);

	// Updates the admin profile information
	public boolean createNewAdminUser(String name, String email, String password);

	// Creates a new admin user with the specified details
	public boolean updateAdminPassword(String oldpassword, String newPassword, int admin_id);

	// Updates the admin's password if the old password is correct
	public int resetPaaword(String email);

//     public boolean updateJobStatus(String email, String status); 

}
