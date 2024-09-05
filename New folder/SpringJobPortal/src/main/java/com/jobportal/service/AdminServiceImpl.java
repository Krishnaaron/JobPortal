package com.jobportal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.jobportal.mapper.AdminMapper;

import com.jobportal.model.Admin;
import com.jobportal.model.Employers;
import com.jobportal.model.JobApplications;
import com.jobportal.model.JobSeekers;
import com.jobportal.model.Jobs;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;

	@Override
	public Admin adminLogin(String email, String password) {
		// Calls the mapper to authenticate admin using provided email and password
		return adminMapper.login(email, password);
	}

	@Override
	public List<JobSeekers> viewJobSeeker() {
		// Retrieves a list of job seekers from the database via the mapper
		return adminMapper.viewJobSeeker();
	}

	@Override
	public boolean updateStatus(String email, String status) {
		// Updates the status of a job seeker identified by their email
		return adminMapper.updateSeekerStatus(email, status);
	}

	// Retrieves a list of employers from the database via the mapper
	@Override
	public List<Employers> viewEmployers() {
		// TODO Auto-generated method stub
		return adminMapper.viewEmployers();
	}
	// Updates the status of an employer identified by their email

	@Override
	public boolean updateEmloyerStatus(String email, String status) {
		// TODO Auto-generated method stub
		return adminMapper.updateEmployerStatus(email, status);
	}

	// Retrieves a list of jobs from the database via the mapper
	@Override
	public List<Jobs> viewJobs() {
		// TODO Auto-generated method stub
		return adminMapper.viewJobs();
	}

	// Updates the status of a job based on job ID and employer ID
	@Override
	public boolean updateJobStatus(int job_id, int employer_Id, String job_Status) {
		// TODO Auto-generated method stub
		return adminMapper.updateJobStatus(job_id, employer_Id, job_Status);
	}

	// Updates the admin's profile information (name and email)
	@Override
	public boolean updateAdminProfile(String name, String email, int admin_Id,String seesionEmail) {
		// TODO Auto-generated method stub
//		Admin adminSeesion =(Admin) session.getAttribute("admin");
		
		if(email.equals(seesionEmail)) {
			
			return adminMapper.updateAdminProfile(name, email, admin_Id);
			
			
		}
		
		int ckeck = adminMapper.emailChecker(email);
		
		
		 if(ckeck < 1) {
			return adminMapper.updateAdminProfile(name, email, admin_Id);
		
		}
		else if(ckeck == 1){
			
			return false;
		}
		
		else
			return false;
	}

//	@Override
//	public boolean createNewAdminUser(String name, String email, String password) {
//		// TODO Auto-generated method stub
//		return adminMapper.createNewAdmin(name, email, password);
//	}
	// Attempts to create a new admin user and handles potential unique constraint
	// violations
	@Override
	public boolean createNewAdminUser(String name, String email, String password) {
		try {
			return adminMapper.createNewAdmin(name, email, password);
		} catch (DataIntegrityViolationException e) {
			if (e.getCause() instanceof java.sql.SQLIntegrityConstraintViolationException) {
				java.sql.SQLIntegrityConstraintViolationException sqlException = (java.sql.SQLIntegrityConstraintViolationException) e
						.getCause();
				// Check for ORA-00001 error code for unique constraint violation
				if (sqlException.getErrorCode() == 1) { // ORA-00001 is Oracle's error code for unique constraint
														// violation
					System.err.println("Email ID already exists.");
					return false;
				}
			}
			// Log the exception and return false
			System.err.println("An error occurred while creating a new admin: " + e.getMessage());
			return false;
		} catch (Exception e) {
			// Log the exception and return false
			System.err.println("An unexpected error occurred: " + e.getMessage());
			return false;
		}
	}

	// Updates the admin's password by verifying the old password
	@Override
	public boolean updateAdminPassword(String oldpassword, String newPassword, int admin_id) {
		// TODO Auto-generated method stub
//		System.out.println("password update");
		return adminMapper.changePassword(admin_id, oldpassword, newPassword);
	}

	// Checks if an email exists in the system for password reset
	@Override
	public int resetPaaword(String email) {
		// TODO Auto-generated method stub
		return adminMapper.emailChecker(email);
	}

	@Override
	public List<JobApplications> viewApplications() {
		// TODO Auto-generated method stub
		return adminMapper.viewApplication();
	}

}
