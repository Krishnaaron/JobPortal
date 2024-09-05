package com.jobportal.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import com.jobportal.model.JobApplications;
import com.jobportal.model.Jobs;

@Mapper
public interface JobsMapper
{
	// Retrieve all jobs from the database
	@Select("SELECT * FROM JOBS")
	List<Jobs> viewJobs();

	@Select("SELECT * FROM JOBS Where EMPLOYER_ID = #{employer_id}")
	List<Jobs> downloadJobs(int employer_id);
	
	// Get the employer ID associated with a specific job
	@Select("SELECT EMPLOYER_ID FROM jobs WHERE job_id = #{jobId}")
	int getEmployerIdForJob(@Param("jobId") int jobId);

	// Apply for a job by inserting a new application record
	@Insert("INSERT INTO job_applications (APPLICATION_ID, JOB_ID, JOB_SEEKER_ID, EMP_ID, APPLICATION_DATE) "
			+ "VALUES (app_id_seq.NEXTVAL, #{jobId}, #{seekerId}, #{employerId}, CURRENT_DATE)")
	boolean applyForJob(@Param("jobId") int jobId, @Param("seekerId") int seekerId, @Param("employerId") int employerId);

	@Select("SELECT ja.APPLICATION_ID, ja.JOB_ID, ja.status AS JOB_APPLICATION_STATUS," + "       j.JOB_ID AS JOB_ID, j.EMPLOYER_ID, j.JOB_TITLE, j.JOB_DESCRIPTION, j.LOCATION,"
			+ "       j.REQUIRED_SKILLS, j.JOB_TYPE, j.EXPERIENCE_LEVEL, j.APPLICATION_DEADLINE," + "       j.NUMBER_OF_OPENINGS, j.COMPANY_NAME, j.EDUCATION_QUALIFICATION,"
			+ "       j.EDUCATION_COURCE, j.GENDER, j.MINIMUM_AGE, j.ADDRESS, j.JOB_STATUS," + "       e.COMPANYNAME AS EMPLOYER_NAME, j.JOB_POSTED" + " FROM job_applications ja"
			+ " JOIN jobs j ON ja.JOB_ID = j.JOB_ID" + " JOIN employers e ON j.EMPLOYER_ID = e.ID" + " WHERE ja.JOB_SEEKER_ID = #{jobSeekerId}" + " ORDER BY j.JOB_ID ASC")
	List<Jobs> getJobApplicationsByJobSeekerId(@Param("jobSeekerId") int jobSeekerId);

	@Select("SELECT STATUS FROM job_applications WHERE JOB_ID = #{jobId} AND EMP_ID = #{empId} AND JOB_SEEKER_ID = #{jobSeekerId}")
	String getStatusByJobIdEmpIdJobSeekerId(@Param("jobId") int jobId, @Param("empId") int empId, @Param("jobSeekerId") int jobSeekerId);

	@Select("SELECT * FROM JOBS WHERE Employer_Id = #{employerId}")
	List<Jobs> viewPostedJobs(int employerId);

	@Select("SELECT * FROM JOB_Applications WHERE Emp_Id = #{emp_Id}")
	List<JobApplications> viewNumberApplication(int emp_Id);

	@Update("UPDATE employers SET password = #{newPassword} WHERE id = #{id} AND password = #{oldPassword}")
	boolean changePassword(@Param("id") int id, @Param("oldPassword") String oldPassword, @Param("newPassword") String newPassword);

	@Update("UPDATE JOBS SET JOB_TITLE = #{job_Title},JOB_DESCRIPTION = #{job_Description},LOCATION =#{location},REQUIRED_SKILLS = #{required_Skills},JOB_TYPE = #{job_Type},Experience_Level =#{experience_Level},NUMBER_OF_OPENINGS = #{number_Of_Openings},JOB_STATUS = #{job_Status},COMPANY_NAME = #{company_Name}  WHERE JOB_ID =#{job_Id} AND EMPLOYER_ID = #{employer_Id}")
	boolean updateJobs(Jobs jobs);
	
	@Insert("INSERT INTO JOBS (JOB_ID,EMPLOYER_ID,JOB_TITLE,JOB_DESCRIPTION,LOCATION,REQUIRED_SKILLS,JOB_TYPE,NUMBER_OF_OPENINGS,COMPANY_NAME)"+
	"VALUES(job_seq.NEXTVAL,#{employer_Id}, #{job_Title},#{job_Description},#{location},#{required_Skills},#{job_Type},#{number_Of_Openings},#{company_Name})" )
	boolean postNewJob(Jobs jobs);
}
