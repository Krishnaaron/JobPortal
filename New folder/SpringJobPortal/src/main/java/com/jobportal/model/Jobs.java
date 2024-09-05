package com.jobportal.model;

public class Jobs
{
	private int		job_Id;

	private int		employer_Id;

	private String	employerEmail;

	private String	job_Title;

	private String	job_Description;

	private String	location;

	private String	required_Skills;

	private String	job_Type;

	private int		experience_Level;

	private String	application_Deadline;

	private int		number_Of_Openings;

	private String	company_Name;

	private String	job_Status;

	private String	job_Application_Status;

	private String	job_Category;

	private String	operation;

	public String getJob_category()
	{
		return job_Category;
	}

	public String getOperation()
	{
		return operation;
	}

	public void setOperation(String operation)
	{
		this.operation = operation;
	}

	public void setJob_category(String job_category)
	{
		this.job_Category = job_category;
	}

	public String getSalary()
	{
		return salary;
	}

	public void setSalary(String salary)
	{
		this.salary = salary;
	}

	private String salary;

	public String getJob_Application_Status()
	{
		return job_Application_Status;
	}

	public void setJob_Application_Status(String job_Application_Status)
	{
		this.job_Application_Status = job_Application_Status;
	}

	// private int applicationId;
	private String	education_Qualification;

	private String	gender;

	private String	education_Cource;

	public String getEducation_Cource()
	{
		return education_Cource;
	}

	public void setEducation_Cource(String education_Cource)
	{
		this.education_Cource = education_Cource;
	}

	private String job_Posted;
	// private String address;

	public int getJob_Id()
	{
		return job_Id;
	}

	public void setJob_Id(int job_Id)
	{
		this.job_Id = job_Id;
	}

	public int getEmployer_Id()
	{
		return employer_Id;
	}

	public void setEmployer_Id(int employer_Id)
	{
		this.employer_Id = employer_Id;
	}

	public String getEmployerEmail()
	{
		return employerEmail;
	}

	public void setEmployerEmail(String employerEmail)
	{
		this.employerEmail = employerEmail;
	}

	public String getJob_Title()
	{
		return job_Title;
	}

	public void setJob_Title(String job_Title)
	{
		this.job_Title = job_Title;
	}

	public String getJob_Description()
	{
		return job_Description;
	}

	public void setJob_Description(String job_Description)
	{
		this.job_Description = job_Description;
	}

	public String getLocation()
	{
		return location;
	}

	public void setLocation(String location)
	{
		this.location = location;
	}

	public String getRequired_Skills()
	{
		return required_Skills;
	}

	public void setRequired_Skills(String required_Skills)
	{
		this.required_Skills = required_Skills;
	}

	public String getJob_Type()
	{
		return job_Type;
	}

	public void setJob_Type(String job_Type)
	{
		this.job_Type = job_Type;
	}

	public int getExperience_Level()
	{
		return experience_Level;
	}

	public void setExperience_Level(int experience_Level)
	{
		this.experience_Level = experience_Level;
	}

	public String getApplication_Deadline()
	{
		return application_Deadline;
	}

	public void setApplication_Deadline(String application_Deadline)
	{
		this.application_Deadline = application_Deadline;
	}

	public int getNumber_Of_Openings()
	{
		return number_Of_Openings;
	}

	public void setNumber_Of_Openings(int number_Of_Openings)
	{
		this.number_Of_Openings = number_Of_Openings;
	}

	public String getCompany_Name()
	{
		return company_Name;
	}

	public void setCompany_Name(String company_Name)
	{
		this.company_Name = company_Name;
	}

	public String getJob_Status()
	{
		return job_Status;
	}

	public void setJob_Status(String job_Status)
	{
		this.job_Status = job_Status;
	}

	public String getEducation_Qualification()
	{
		return education_Qualification;
	}

	public void setEducation_Qualification(String education_Qualification)
	{
		this.education_Qualification = education_Qualification;
	}

	public String getGender()
	{
		return gender;
	}

	public void setGender(String gender)
	{
		this.gender = gender;
	}

	public String getJob_Posted()
	{
		return job_Posted;
	}

	public void setJob_Posted(String job_Posted)
	{
		this.job_Posted = job_Posted;
	}
}
