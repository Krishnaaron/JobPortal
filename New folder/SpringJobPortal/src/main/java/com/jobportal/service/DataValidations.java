package com.jobportal.service;

import com.jobportal.model.Jobs;

public class DataValidations
{

	public DataValidations()
	{

	}

	public boolean dataValidation(Jobs job)
	{
	    if(job.getJob_Title() == null || job.getJob_Title().isEmpty()) {
	    	return false;
	    }

		if (job.getLocation() == null || job.getLocation().isEmpty())
		{
			return false;
		}
		if (job.getRequired_Skills() == null || job.getRequired_Skills().isEmpty())
		{

			return false;
		}
		if (job.getJob_Type() == null || job.getJob_Type().isEmpty())
		{
			return false;
		}
		if (job.getExperience_Level() == 0 || job.getExperience_Level() < 0 && job.getExperience_Level() > 60)
		{

			return false;
		}

		if (job.getNumber_Of_Openings() == 0 || job.getNumber_Of_Openings() > 100000)
		{

			return false;
		}
		if (job.getCompany_Name() == null || job.getCompany_Name().isEmpty())
		{

			return false;
		}
		if (job.getJob_Description() == null || job.getJob_Description().isEmpty())
		{
			return false;
		}
		

		if (job.getOperation() == null || job.getOperation().isEmpty())
		{

			return false;
		}
        if(job.getJob_Status() == null || job.getJob_Status().isEmpty()) {
        	
        	return false;
        }
		return true;
	}

	public boolean dataValidations(Jobs job)
	{
	    if(job.getJob_Title() == null || job.getJob_Title().isEmpty()) {
	    	return false;
	    }

		if (job.getLocation() == null || job.getLocation().isEmpty())
		{
			return false;
		}
		if (job.getRequired_Skills() == null || job.getRequired_Skills().isEmpty())
		{

			return false;
		}
		if (job.getJob_Type() == null || job.getJob_Type().isEmpty())
		{
			return false;
		}
		if (job.getExperience_Level() == 0 || job.getExperience_Level() < 0 && job.getExperience_Level() > 60)
		{

			return false;
		}

		if (job.getNumber_Of_Openings() == 0 || job.getNumber_Of_Openings() > 100000)
		{

			return false;
		}
		if (job.getCompany_Name() == null || job.getCompany_Name().isEmpty())
		{

			return false;
		}
		if (job.getJob_Description() == null || job.getJob_Description().isEmpty())
		{
			return false;
		}
		

		if (job.getOperation() == null || job.getOperation().isEmpty())
		{

			return false;
		}
       
		return true;
	}
	
	public boolean experienceLevel(Jobs jobs)
	{
		try
		{
			int experienceLevel = jobs.getExperience_Level();
			if (experienceLevel < 1 || experienceLevel > 60)
			{

				return false;
			}

		}
		catch (NumberFormatException e)
		{

			return false;
		}
		return false;
	}

	public boolean numberOfPosting(int i)
	{
		try
		{
			int experienceLevel = i;
			if (experienceLevel < 1 || experienceLevel > 10000)
			{

				return false;
			}
			return true;
		}
		catch (NumberFormatException e)
		{

			return true;
		}
	}

	public boolean validateAddress(String address)
	{
		String regex = "^[#.0-9a-zA-Z\\s,-]+$";
		return address.matches(regex);
	}

	public boolean validateCompanyName(String companyName)
	{
		// Check if the company name is null or empty
		if (companyName == null || companyName.isEmpty() || companyName == "")
		{
			return false;
		}

		// Check if the company name contains only alphabetic characters
		if (!companyName.matches("[a-zA-Z ]+"))
		{
			return false;
		}

		return true; // Return true if validation passes
	}
}
