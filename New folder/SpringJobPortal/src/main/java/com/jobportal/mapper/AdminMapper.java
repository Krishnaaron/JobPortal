package com.jobportal.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.jobportal.model.Admin;
import com.jobportal.model.Employers;
import com.jobportal.model.JobApplications;
import com.jobportal.model.JobSeekers;
import com.jobportal.model.Jobs;

@Mapper
public interface AdminMapper
{
	// Admin login method: Checks admin credentials and returns admin details if
	// they match
	@Select("SELECT ADMIN_ID, name, email, password FROM admins WHERE email = #{email} AND password = #{password}")
	Admin login(@Param("email") String email, @Param("password") String password);

	// View all job seekers: Retrieves a list of all job seekers from the
	// database
	@Select("SELECT * FROM JOB_SEEKERS")
	List<JobSeekers> viewJobSeeker();

	// Update job seeker status: Updates the status of a job seeker based on
	// their email
	@Update("UPDATE job_seekers SET status = #{status} WHERE email = #{email}")
	boolean updateSeekerStatus(@Param("email") String email, @Param("status") String status);

	// View all employers: Retrieves a list of all employers from the database
	@Select("SELECT * FROM EMPLOYERS")
	List<Employers> viewEmployers();

	// Update employer status: Updates the status of an employer based on their
	// email
	@Update("UPDATE EMPLOYERS SET status = #{status} WHERE email = #{email}")
	boolean updateEmployerStatus(@Param("email") String email, @Param("status") String status);

	// View all jobs: Retrieves a list of all jobs from the database
	@Select("SELECT * FROM JOBS")
	List<Jobs> viewJobs();

	// View all jobs: Retrieves a list of all jobs from the database
	@Select("SELECT * FROM JOB_APPLICATIONS")
	List<JobApplications> viewApplication();
	// Update job status: Updates the status of a job based on job ID and
	// employer ID

	@Update("UPDATE JOBS SET JOB_STATUS	 = #{job_Status} WHERE  JOB_ID = #{job_Id} AND  EMPLOYER_ID = #{employer_Id}")
	boolean updateJobStatus(@Param("job_Id") int job_Id, @Param("employer_Id") int employer_Id, @Param("job_Status") String job_Status);

	// Update admin profile: Updates the name and email of an admin based on
	// their admin ID
	@Update("UPDATE admins SET name = #{name}, email = #{email} WHERE admin_id = #{admin_Id}")
	boolean updateAdminProfile(@Param("name") String name, @Param("email") String email, @Param("admin_Id") int adminId);
	// Create new admin: Inserts a new admin into the database with a generated
	// admin ID

	@Insert("INSERT INTO Admins (admin_Id, NAME, EMAIL, PASSWORD) VALUES (job_see_seq.NEXTVAL, #{name}, #{email}, #{password})")
	boolean createNewAdmin(@Param("name") String name, @Param("email") String email, @Param("password") String password);

	// Change admin password: Updates the password of an admin if the old
	// password matches
	@Update("UPDATE Admins SET password = #{newPassword} WHERE admin_id = #{admin_id} AND password = #{oldPassword}")
	boolean changePassword(@Param("admin_id") int admin_id, @Param("oldPassword") String oldPassword, @Param("newPassword") String newPassword);

	// Email checker: Checks if an email already exists in the database
	@Select("SELECT COUNT(*) FROM Admins WHERE email = #{email}")
	int emailChecker(@Param("email") String email);
}