package com.jobportal.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.jobportal.model.JobSeekers;

@Mapper
public interface JobSeekerMapper {
	// Retrieve a job seeker by email and password
	@Select("SELECT * FROM JOB_SEEKERS WHERE EMAIL = #{email} AND PASSWORD = #{password}")
	JobSeekers findByEmailAndPassword(@Param("email") String email, @Param("password") String password);
//	  @Select("SELECT * FROM JOB_SEEKERS WHERE EMAIL = #{email} AND PASSWORD = #{password} AND STATUS = 'Active'")
//	    JobSeekers findByEmailAndPassword(@Param("email") String email, @Param("password") String password);

	// Insert a new job seeker into the database and return the generated ID
	@Insert("INSERT INTO job_seekers (JOB_SEEKER_ID, FNAME, EMAIL, PASSWORD, PHONENUMBER) "
			+ "VALUES (job_see_seq.NEXTVAL, #{fName}, #{email}, #{password}, #{phoneNumber})")
	@Options(useGeneratedKeys = true, keyProperty = "seeker_id", keyColumn = "JOB_SEEKER_ID")
	int insertJobSeeker(JobSeekers seeker);

	// Update the profile of an existing job seeker
//	@Update("UPDATE JOB_SEEKERS SET dob = #{dob}, gender = #{gender}, address = #{address}, course = #{course}, "
//			+ "specialization = #{specialization}, institute = #{institute}, passingYear = #{passingYear}, cgpa = #{cgpa}, "
//			+ "courseType = #{courseType}, experience = #{experience}, company_Name = #{company_Name}, objective = #{objective}, "
//			+ "resumes = #{resumes},skills =#{skills}" + "WHERE JOB_SEEKER_ID = #{JOB_SEEKER_ID}")
//	boolean updateJobSeekerProfile(JobSeekers jobSeekers);

	@Update("UPDATE JOB_SEEKERS SET dob = #{dob}, gender = #{gender}, address = #{address}, course = #{course}, "
	        + "specialization = #{specialization}, institute = #{institute}, passingYear = #{passingYear}, cgpa = #{cgpa}, "
	        + "courseType = #{courseType}, experience = #{experience}, company_Name = #{company_Name}, objective = #{objective}, "
	        + "resumes = #{resumes}, skills = #{skills}, resume_path = #{resumePath} "
	        + "WHERE JOB_SEEKER_ID = #{JOB_SEEKER_ID}")
	boolean updateJobSeekerProfile(JobSeekers jobSeekers);


	// Another method to update the profile of a job seeker
	@Update("UPDATE JOB_SEEKERS SET email = #{email}, fName = #{fName}, dob = #{dob}, gender = #{gender}, address = #{address}, course = #{course}, "
			+ "specialization = #{specialization}, institute = #{institute}, passingYear = #{passingYear}, cgpa = #{cgpa}, "
			+ "courseType = #{courseType}, experience = #{experience}, company_Name = #{company_Name},resumes = #{resumes}, objective = #{objective},skills =#{skills} "
			+ "WHERE JOB_SEEKER_ID = #{JOB_SEEKER_ID}")
	boolean editeJobSeekerProfile(JobSeekers jobSeekers);

	// Retrieve job seeker profile data by their ID
	@Select("SELECT * FROM JOB_SEEKERS WHERE JOB_SEEKER_ID = #{job_Seeker_Id} ")
	JobSeekers viewProfileData(int job_Seeker_Id);

	// Check if an email already exists in the job seekers table

//    @Select("SELECT * FROM JOB_SEEKERS WHERE email = #{email}")
//    boolean emailChecker(@Param("email") String email);
	@Select("SELECT COUNT(*) FROM JOB_SEEKERS WHERE email = #{email}")
	Integer emailChecker(@Param("email") String email);

	// Change the password of a job seeker if the old password matches
	@Update("UPDATE Job_Seekers SET password = #{newPassword} WHERE JOB_SEEKER_ID = #{job_Seeker_Id} AND password = #{oldPassword}")
	boolean changePassword(@Param("job_Seeker_Id") int job_Seeker_Id, @Param("oldPassword") String oldPassword,
			@Param("newPassword") String newPassword);

}
