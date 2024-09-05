package com.jobportal.model;

public class JobApplications
{
	private int		application_Id;

	private int		job_Id;

	private int		job_Seeker_id;

	private String	application_Date;

	private String	job_Application_Status;

	public int getApplication_Id()
	{
		return application_Id;
	}

	public void setApplication_Id(int application_Id)
	{
		this.application_Id = application_Id;
	}

	public int getJob_Id()
	{
		return job_Id;
	}

	public void setJob_Id(int job_Id)
	{
		this.job_Id = job_Id;
	}

	public int getJob_Seeker_id()
	{
		return job_Seeker_id;
	}

	public void setJob_Seeker_id(int job_Seeker_id)
	{
		this.job_Seeker_id = job_Seeker_id;
	}

	public String getApplication_Date()
	{
		return application_Date;
	}

	public void setApplication_Date(String application_Date)
	{
		this.application_Date = application_Date;
	}

	public String getJob_Application_Status()
	{
		return job_Application_Status;
	}

	public void setJob_Application_Status(String job_Application_Status)
	{
		this.job_Application_Status = job_Application_Status;
	}

	public int getEmp_Id()
	{
		return emp_Id;
	}

	public void setEmp_Id(int emp_Id)
	{
		this.emp_Id = emp_Id;
	}

	private int emp_Id;

}
