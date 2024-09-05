package com.jobportal.model;

public class JobApplication
{

	private int		application_id;

	private int		job_id;

	private int		job_Seeker_Id;

	private String	status;

	private int		emp_Id;

	private String	application_Date;

	public int getApplication_id()
	{
		return application_id;
	}

	public void setApplication_id(int application_id)
	{
		this.application_id = application_id;
	}

	public int getJob_id()
	{
		return job_id;
	}

	public void setJob_id(int job_id)
	{
		this.job_id = job_id;
	}

	public int getJob_Seeker_Id()
	{
		return job_Seeker_Id;
	}

	public void setJob_Seeker_Id(int job_Seeker_Id)
	{
		this.job_Seeker_Id = job_Seeker_Id;
	}

	public String getStatus()
	{
		return status;
	}

	public void setStatus(String status)
	{
		this.status = status;
	}

	public int getEmp_Id()
	{
		return emp_Id;
	}

	public void setEmp_Id(int emp_Id)
	{
		this.emp_Id = emp_Id;
	}

	public String getApplication_Date()
	{
		return application_Date;
	}

	public void setApplication_Date(String application_Date)
	{
		this.application_Date = application_Date;
	}
}
