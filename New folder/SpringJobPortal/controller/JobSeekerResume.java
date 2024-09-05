package com.jobportal.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jobportal.model.JobSeekers;
import com.jobportal.service.JobSeekerService;

import jakarta.servlet.http.HttpSession;

@Controller
public class JobSeekerResume {
	@Autowired
	JobSeekerService jobSeekerService;

	// Handles the creation of job seeker profile
//	@RequestMapping("/ProfileCreating")
//
//	public String createJobSeekerProfile(@RequestParam("dob") String dob, @RequestParam("gender") String gender,
//			@RequestParam("JOB_SEEKER_ID") int JOB_SEEKER_ID, @RequestParam("address") String address,
//			@RequestParam("course") String course, @RequestParam("specialization") String specialization,
//			@RequestParam("institute") String institute, @RequestParam("passingYear") String passingYear,
//			@RequestParam("cgpa") String cgpa, @RequestParam("courseType") String courseType,
//			@RequestParam("experience") String experience, @RequestParam("company_Name") String companyName,
//			@RequestParam("objective") String objective, @RequestParam("skills") String skills,
//			@RequestParam("resumes") String resumes,
//
//			HttpSession session, Model model) {
//		JobSeekers seeker = new JobSeekers();
//		seeker.setCgpa(cgpa);
//		seeker.setDob(dob);
//		seeker.setGender(gender);
//		seeker.setJOB_SEEKER_ID(JOB_SEEKER_ID);
//		seeker.setAddress(address);
//		seeker.setCourse(course);
//		seeker.setCourseType(courseType);
//		seeker.setSpecialization(specialization);
//		seeker.setInstitute(institute);
//		seeker.setCompany_Name(companyName);
//		seeker.setExperience(experience);
//		seeker.setPassingYear(passingYear);
//		seeker.setSkills(skills);
//		seeker.setResumes(resumes);
//		
//
//		seeker.setObjective(objective);
//		System.out.println("DOB: " + dob);
//		System.out.println("Gender: " + gender);
//		System.out.println("JOB_SEEKER_ID: " + JOB_SEEKER_ID);
//		System.out.println("Address: " + address);
//		System.out.println("Course: " + course);
//		System.out.println("Specialization: " + specialization);
//		System.out.println("Institute: " + institute);
//		System.out.println("Passing Year: " + passingYear);
//		System.out.println("CGPA: " + cgpa);
//		System.out.println("Course Type: " + courseType);
//		System.out.println("Experience: " + experience);
//		System.out.println("Company Name: " + companyName);
//
//		System.out.println("Objective: " + objective);
//
//
//		
//		 jobSeekerService.updateProfile(seeker);
//
//		return "redirect:/seekerCart";
//
//	}
	 @RequestMapping(value = "/ProfileCreating", method = RequestMethod.POST)
	    public String createJobSeekerProfile(
	            @RequestParam("dob") String dob,
	            @RequestParam("gender") String gender,
	            @RequestParam("JOB_SEEKER_ID") int JOB_SEEKER_ID,
	            @RequestParam("address") String address,
	            @RequestParam("course") String course,
	            @RequestParam("specialization") String specialization,
	            @RequestParam("institute") String institute,
	            @RequestParam("passingYear") String passingYear,
	            @RequestParam("cgpa") String cgpa,
	            @RequestParam("courseType") String courseType,
	            @RequestParam("experience") String experience,
	            @RequestParam("company_Name") String companyName,
	            @RequestParam("objective") String objective,
	            @RequestParam("skills") String skills,
	            @RequestParam("resumes") String resumes,
	            @RequestParam("resume") MultipartFile resumeFile,
	            RedirectAttributes redirectAttributes) {

	        String resumePath = null;
	        if (resumeFile != null && !resumeFile.isEmpty()) {
	            try {
	                // Define the path where you want to save the uploaded file
	                String uploadDir = "uploads/";
	                File uploadDirectory = new File(uploadDir);
	                if (!uploadDirectory.exists()) {
	                    uploadDirectory.mkdirs();
	                }

	                // Save the file
	                String fileName = resumeFile.getOriginalFilename();
	                File destinationFile = new File(uploadDir + fileName);
	                resumeFile.transferTo(destinationFile);

	                // Set resume path
	                resumePath = destinationFile.getAbsolutePath();
	            } catch (IOException e) {
	                e.printStackTrace();
	                redirectAttributes.addFlashAttribute("message", "Failed to upload the file.");
	                return "redirect:/profile";
	            }
	        }

	        // Create a JobSeekers object and set its properties
	        JobSeekers seeker = new JobSeekers();
	        seeker.setCgpa(cgpa);
	        seeker.setDob(dob);
	        seeker.setGender(gender);
	        seeker.setJOB_SEEKER_ID(JOB_SEEKER_ID);
	        seeker.setAddress(address);
	        seeker.setCourse(course);
	        seeker.setCourseType(courseType);
	        seeker.setSpecialization(specialization);
	        seeker.setInstitute(institute);
	        seeker.setCompany_Name(companyName);
	        seeker.setExperience(experience);
	        seeker.setPassingYear(passingYear);
	        seeker.setSkills(skills);
	        seeker.setResumes(resumes);
	        seeker.setObjective(objective);
	        seeker.setResumePath(resumePath);

	        // Update the profile using the service
	        jobSeekerService.updateProfile(seeker);

	        return "redirect:/seekerCart";
	    }
	
	// Handles the editing of job seeker profile
	@PostMapping("/SeekerProfileEdit")

	public String jobSeekerProfileEdite(@RequestParam("fName") String fName, @RequestParam("email") String email,
			@RequestParam("dob") String dob, @RequestParam("gender") String gender,
			@RequestParam("JOB_SEEKER_ID") int JOB_SEEKER_ID, @RequestParam("address") String address,
			@RequestParam("course") String course, @RequestParam("specialization") String specialization,
			@RequestParam("institute") String institute, @RequestParam("passingYear") String passingYear,
			@RequestParam("cgpa") String cgpa, @RequestParam("course_Type") String courseType,
			@RequestParam("experience") String experience, @RequestParam("company_Name") String companyName,
			@RequestParam("objective") String objective,@RequestParam("resumes") String resumes, @RequestParam("skills") String skills,

			HttpSession session, Model model) {
		JobSeekers seeker = new JobSeekers();
		seeker.setfName(fName);
		seeker.setEmail(email);
		seeker.setCgpa(cgpa);
		seeker.setDob(dob);
		seeker.setGender(gender);
		seeker.setJOB_SEEKER_ID(JOB_SEEKER_ID);
		seeker.setAddress(address);
		seeker.setCourse(course);
		seeker.setCourseType(courseType);
		seeker.setSpecialization(specialization);
		seeker.setInstitute(institute);
		seeker.setCompany_Name(companyName);
		seeker.setExperience(experience);
		seeker.setPassingYear(passingYear);
		seeker.setSkills(skills);
		seeker.setResumes(resumes);
//	    seekers.setDesignation(designation);
		seeker.setObjective(objective);
		JobSeekers sessionSeeker =	(JobSeekers) session.getAttribute("seeker");
		boolean isCreated = jobSeekerService.editProfile(seeker,sessionSeeker.getEmail());

		System.out.println(isCreated);
		if (isCreated) {
			session.setAttribute("seeker", seeker);
			session.setAttribute("message", "Admin user created successfully.");
			session.setAttribute("messageType", "success");
		}
		else {
			 session.setAttribute("message", "Email ID already exists.");
	            session.setAttribute("messageType", "error");
		}
		return "redirect:/JobSeekerProfileEditController";

	}

}
