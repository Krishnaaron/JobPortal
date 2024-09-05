package com.jobportal.service;

import java.io.ByteArrayInputStream;
import java.util.List;
import com.jobportal.model.JobApplications;
import com.jobportal.model.Jobs;

public interface JobsService
{

	/**
	 * Retrieves a list of all available jobs.
	 * 
	 * @return A list of Jobs objects representing the available job postings.
	 */

	public ByteArrayInputStream downloadJobs(int employerId);

	public ByteArrayInputStream updateJobs(String filePath, int id);

	public ByteArrayInputStream createFile();

	public List<Jobs> viewJobs();

	/**
	 * Retrieves a list of jobs that a specific job seeker has applied for.
	 * 
	 * @param job_Seeker_Id
	 *            The ID of the job seeker.
	 * @return A list of Jobs objects that the job seeker has applied to.
	 */
	/**
	 * Retrieves the employer ID for a specific job.
	 * 
	 * @param job_Id
	 *            The ID of the job.
	 * @return The employer ID associated with the given job.
	 */
	public List<Jobs> appliedJobs(int job_Seeker_Id);

	/**
	 * Retrieves the employer ID for a specific job.
	 * 
	 * @param job_Id
	 *            The ID of the job.
	 * @return The employer ID associated with the given job.
	 */
	public int getEmployerIdForJob(int job_Id);

	/**
	 * Retrieves the status of a specific job application for a job seeker.
	 * 
	 * @param job_Id
	 *            The ID of the job.
	 * @param job_Seeker_Id
	 *            The ID of the job seeker.
	 * @param employer_id
	 *            The ID of the employer.
	 * @return The status of the job application (e.g., "Pending", "Accepted",
	 *         "Rejected").
	 */
	public String jobStatus(int job_Id, int job_Seeker_Id, int employer_id);

	/**
	 * Allows a job seeker to apply for a specific job.
	 * 
	 * @param job_Id
	 *            The ID of the job to apply for.
	 * @param job_Seeker_Id
	 *            The ID of the job seeker applying for the job.
	 * @param employer_id
	 *            The ID of the employer offering the job.
	 * @return True if the application is successful; false otherwise.
	 */
	boolean applyJob(int job_Id, int job_Seeker_Id, int employer_id);

	public List<Jobs> postedJobs(int employer_id);

	boolean postJob(Jobs jobs);

	public List<JobApplications> viewNumberApplicatio(int employer_id);
}
