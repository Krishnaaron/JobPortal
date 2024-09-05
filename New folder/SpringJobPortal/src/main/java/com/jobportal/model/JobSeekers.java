package com.jobportal.model;

import java.util.Arrays;

public class JobSeekers
{

	@Override
	public String toString()
	{
		return "JobSeekers [email=" + email + ", password=" + password + ", fName=" + fName + ", phoneNumber=" + phoneNumber + ", experience=" + experience + ", skills=" + skills
				+ ", dob=" + dob + ", state=" + state + ", district=" + district + ", pincode=" + pincode + ", company_Name=" + company_Name + ", passingYear=" + passingYear
				+ ", designation=" + designation + ", courseType=" + courseType + ", cgpa=" + cgpa + ", institute=" + institute + ", specialization=" + specialization + ", course="
				+ course + ", gender=" + gender + ", address=" + address + ", resume=" + Arrays.toString(resume) + ", JOB_SEEKER_ID=" + JOB_SEEKER_ID + ", resumes=" + resumes
				+ ", language=" + language + ", objective=" + objective + ", status=" + status + ", register_Date=" + register_Date + "]";
	}

	private String	email;

	private String	password;

	private String	fName;

	private String	phoneNumber;

	private String	experience;

	private String	skills;

	private String	dob;

	private String	state;

	private String	district;

	private String	pincode;

	private String	company_Name;

	private String	passingYear;

	private String	designation;

	private String	courseType;

	private String	cgpa;

	private String	institute;

	private String	specialization;

	private String	course;

	private String	gender;

	private String	address;

	private byte[]	resume;			// Field for storing the resume as a byte
									// array

	private String	resumePath;

	public String getResumePath()
	{
		return resumePath;
	}

	public void setResumePath(String resumePath)
	{
		this.resumePath = resumePath;
	}

	private int		JOB_SEEKER_ID;

	private String	resumes;

	public String getResumes()
	{
		return resumes;
	}

	public void setResumes(String resumes)
	{
		this.resumes = resumes;
	}

	public int getJOB_SEEKER_ID()
	{
		return JOB_SEEKER_ID;
	}

	public void setJOB_SEEKER_ID(int jOB_SEEKER_ID)
	{
		JOB_SEEKER_ID = jOB_SEEKER_ID;
	}

	public String getExperience()
	{
		return experience;
	}

	public void setExperience(String experience)
	{
		this.experience = experience;
	}

	public String getSkills()
	{
		return skills;
	}

	public void setSkills(String skills)
	{
		this.skills = skills;
	}

	public String getDob()
	{
		return dob;
	}

	public void setDob(String dob)
	{
		this.dob = dob;
	}

	public String getState()
	{
		return state;
	}

	public void setState(String state)
	{
		this.state = state;
	}

	public String getDistrict()
	{
		return district;
	}

	public void setDistrict(String district)
	{
		this.district = district;
	}

	public String getPincode()
	{
		return pincode;
	}

	public void setPincode(String pincode)
	{
		this.pincode = pincode;
	}

	public String getCompany_Name()
	{
		return company_Name;
	}

	public void setCompany_Name(String company_Name)
	{
		this.company_Name = company_Name;
	}

	public String getPassingYear()
	{
		return passingYear;
	}

	public void setPassingYear(String passingYear)
	{
		this.passingYear = passingYear;
	}

	public String getDesignation()
	{
		return designation;
	}

	public void setDesignation(String designation)
	{
		this.designation = designation;
	}

	public String getCourseType()
	{
		return courseType;
	}

	public void setCourseType(String courseType)
	{
		this.courseType = courseType;
	}

	public String getCgpa()
	{
		return cgpa;
	}

	public void setCgpa(String cgpa)
	{
		this.cgpa = cgpa;
	}

	public String getInstitute()
	{
		return institute;
	}

	public void setInstitute(String institute)
	{
		this.institute = institute;
	}

	public String getSpecialization()
	{
		return specialization;
	}

	public void setSpecialization(String specialization)
	{
		this.specialization = specialization;
	}

	public String getCourse()
	{
		return course;
	}

	public void setCourse(String course)
	{
		this.course = course;
	}

	public String getGender()
	{
		return gender;
	}

	public void setGender(String gender)
	{
		this.gender = gender;
	}

	public String getAddress()
	{
		return address;
	}

	public void setAddress(String address)
	{
		this.address = address;
	}

	public String getLanguage()
	{
		return language;
	}

	public void setLanguage(String language)
	{
		this.language = language;
	}

	public String getObjective()
	{
		return objective;
	}

	public void setObjective(String objective)
	{
		this.objective = objective;
	}

	public String getStatus()
	{
		return status;
	}

	public void setStatus(String status)
	{
		this.status = status;
	}

	public String getRegister_Date()
	{
		return register_Date;
	}

	public void setRegister_Date(String register_Date)
	{
		this.register_Date = register_Date;
	}

	private String	language;

	private String	objective;

	private String	status;

	private String	register_Date;

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getPassword()
	{
		return password;
	}

	public String getfName()
	{
		return fName;
	}

	public void setfName(String fName)
	{
		this.fName = fName;
	}

	public String getPhoneNumber()
	{
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber)
	{
		this.phoneNumber = phoneNumber;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public byte[] getResume()
	{
		return resume;
	}

	public void setResume(byte[] resume)
	{
		this.resume = resume;
	}
}
