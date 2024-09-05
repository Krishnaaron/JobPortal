package com.jobportal.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

import java.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.jobportal.model.JobSeekers;
import com.jobportal.model.Jobs;
import com.jobportal.model.User;
import com.jobportal.service.JobSeekerService;
import com.jobportal.service.JobsService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	@Autowired
	JobSeekerService jobSeekerService;
	@Autowired
	JobsService jobsService;

	// Display the login form

	@RequestMapping("/login")
	public ModelAndView getHome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("JobSeekers/seekerlogin");
		return mv;
	}

	// Process the login and redirect based on gender field presence
	@RequestMapping("/seekerdash")
	public String getSeekerDashboard(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpSession session, Model model) {
		JobSeekers seeker = jobSeekerService.loginJobSeeker(email, password);
          
		 if (seeker != null) {
			  
				if(seeker.getStatus().equals("Inactive")) {
					model.addAttribute("errorMessage", "Your account has been blocked.");
					return "JobSeekers/seekerlogin";
				}
			 
				else if (seeker.getGender() != null) {
				session.setAttribute("seeker", seeker);
				model.addAttribute("seeker", seeker);
				return "redirect:/seekerCart";
			} else {
				session.setAttribute("seeker", seeker);
				model.addAttribute("seeker", seeker);
				return "JobSeekers/RegisterProfile";
			}
		} else {
			model.addAttribute("errorMessage", "Invalid email or password");
			return "JobSeekers/seekerlogin";
		}
	}

	// Display the seeker's cart (dashboard)

	@RequestMapping("/seekerCart")
	public String adminCart(Model model, HttpSession session) {

		JobSeekers seeker = (JobSeekers) session.getAttribute("seeker");
		if (seeker == null) {
	        // Handle the case where the seeker is not logged in or session has expired
	        return "redirect:/login"; // Redirect to the login page or another appropriate page
	    }
	    
		int job_seeker_id = seeker.getJOB_SEEKER_ID();
		JobSeekers jobSeekers = jobSeekerService.jobSeekers(job_seeker_id);
		List<Jobs> jobsList = jobsService.appliedJobs(job_seeker_id);

		List<Jobs> filteredJobList = jobsService.viewJobs();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy"); // Adjust the pattern to match your
																					// date format
////		   session.setAttribute("seekers", seekers);
//		   

		List<Jobs> jobList = filteredJobList.stream().filter(j -> "Active".equals(j.getJob_Status()))

				.filter(j -> {
					try {
						LocalDate applicationDeadline = LocalDate.parse(j.getApplication_Deadline(), formatter);
						return !applicationDeadline.isBefore(LocalDate.now());
					} catch (Exception e) {
						// Handle parsing exception if needed
						return false;
					}
				}).filter(j -> jobSeekers.getSkills() != null && j.getRequired_Skills() != null)
				.filter(j -> jobSeekers.getSkills().equals(j.getRequired_Skills())).collect(Collectors.toList());
		int recomeder = jobList.size();
		int applied =jobsList.size();
		System.out.println(recomeder);
		session.setAttribute("recomeder", recomeder);
		session.setAttribute("applied", applied);
		model.addAttribute("jobList", jobList);


		return "JobSeekers/sample";
	}
	@PostMapping("/applyCartJob")
	public String applyCartController(Model model, HttpSession session, HttpServletRequest req) {
//		   JobSeekers seeker = (JobSeekers) session.getAttribute("seeker");
//		   int job_seeker_id =seeker.getJOB_SEEKER_ID();
//
		int job_id = Integer.parseInt(req.getParameter("job_id"));
		int job_Seeker_Id = Integer.parseInt(req.getParameter("seeker_id"));

//		   List<Jobs> jobList =jobsService.viewJobs();
////		   session.setAttribute("seekers", seekers);
//		   
		int employer_id = jobsService.getEmployerIdForJob(job_id);
		System.out.println(employer_id + "employer id " + "edit");

		boolean isCreated = jobsService.applyJob(job_id, job_Seeker_Id, employer_id);

		if (isCreated) {
			session.setAttribute("message", "Admin user created successfully.");
			session.setAttribute("messageType", "success");
		} else {
			session.setAttribute("message", "Email ID already exists.");
			session.setAttribute("messageType", "error");
		}
		return "redirect:/seekerCart";

//		   boolean value=jobsService
//		   model.addAttribute("jobList",jobList);

//		   return "JobSeekers/SearchJob";   

	}
	// Display the registration form
	@Controller
	public class RegisterController {

		@GetMapping("/registerc")
		public String showRegistrationForm() {
			System.out.println("hi gopal");
			return "JobSeekers/Register"; // Assuming this is the correct view name
		}
	}

	// Handle registration form submission and email verification
	@RequestMapping("/seekerRegister")
	public String registrationForm(@RequestParam("email") String email, @RequestParam("password") String password,
			@RequestParam("phoneNumber") String phoneNumber, @RequestParam("name") String fName, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) throws IOException

	{
		int value = jobSeekerService.emailChecker(email);

		if (value <= 0) {

			SendEmail sendEmail = new SendEmail();
			String code = sendEmail.getRandom(); // Generate random code
			User user = new User(fName, email, code); // Create user object with name, email, and code
			boolean emailSent = sendEmail.sendEmail(user); // Send email
			System.out.println(user + "gopals");

			if (emailSent) {
				// Store user object in session for verification
				session = request.getSession();
				session.setAttribute("authcode", user);
				JobSeekers jobSeekersRegister = new JobSeekers();
				jobSeekersRegister.setfName(fName);
				jobSeekersRegister.setPhoneNumber(phoneNumber);
				jobSeekersRegister.setEmail(email);
				jobSeekersRegister.setPassword(password);
				session.setAttribute("jobSeekersRegister", jobSeekersRegister);

				// Redirect to verification page
				return "JobSeekers/OtpVerify2";
			} else {
				// Handle email sending failure (optional)
				// Example: redirect to an error page
				response.sendRedirect("error.jsp");
			}

		}
//	        boolean isCreated = jobSeekerService.registerJobSeeker(fName, email, password, phoneNumber);

//	        if (isCreated) {
//	        	 System.out.println("login sucess");
//	            return "JobSeekers/RegisterSuccess";
//	        } 

		session.setAttribute("message", "Email ID already exists.");
		session.setAttribute("messageType", "error");
//	        
		return "redirect:/registerc";

	}

	// Verify OTP and complete registration
	@RequestMapping("/OtpVerfiy")
	public String otpVerif(HttpServletRequest request) {

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("authcode");
		JobSeekers jobSeekersRegister = (JobSeekers) session.getAttribute("jobSeekersRegister");

		String fName = jobSeekersRegister.getfName();
		String email = jobSeekersRegister.getEmail();
		String password = jobSeekersRegister.getPassword();
		String phoneNumber = jobSeekersRegister.getPhoneNumber();
		String code = request.getParameter("authcode");
		System.out.println(code);
		System.out.println(user.getCode());

		if (code.equals(user.getCode())) {
//				printWitter out =
			jobSeekerService.registerJobSeeker(fName, email, password, phoneNumber);
			return "JobSeekers/RegisterSuccess";
		}

		return "JobSeekers/OtpVerify2";

	}

	// Retrieve job seeker's profile
	@RequestMapping("/JobSeekerProfileRetriveController")
	public String profileRetrive(Model model, HttpSession session) {
		JobSeekers seeker = (JobSeekers) session.getAttribute("seeker");
		if (seeker == null) {
			// Handle the case where the seeker object is null, redirect to login page
			return "redirect:/login";
		}

		int job_seeker_id = seeker.getJOB_SEEKER_ID();

		JobSeekers seekers = jobSeekerService.jobSeekers(job_seeker_id);
//		   session.setAttribute("seekers", seekers);
              System.out.println(seekers.getObjective() +"welcome");
		model.addAttribute("seekers", seekers);
		return "JobSeekers/MyProfile";

	}

	// Edit job seeker's profile
	@RequestMapping("/JobSeekerProfileEditController")
	public String profileEdit(Model model, HttpSession session) {
		JobSeekers seeker = (JobSeekers) session.getAttribute("seeker");
		if (seeker == null) {
			// Handle the case where the seeker object is null, redirect to login page
			return "redirect:/login";
		}

		int job_seeker_id = seeker.getJOB_SEEKER_ID();

		JobSeekers seekers = jobSeekerService.jobSeekers(job_seeker_id);
//		   session.setAttribute("seekers", seekers);

		model.addAttribute("seekers", seekers);

		return "JobSeekers/EditProfile";

	}

	// Search for jobs
	@RequestMapping("/jobSearchController")
	public String jobSearchController(Model model, HttpSession session) {
//		   JobSeekers seeker = (JobSeekers) session.getAttribute("seeker");
//		   int job_seeker_id =seeker.getJOB_SEEKER_ID();
//
		List<Jobs> filteredJobList = jobsService.viewJobs();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy"); // Adjust the pattern to match your
																					// date format
////		   session.setAttribute("seekers", seekers);
//		   

		List<Jobs> jobList = filteredJobList.stream().filter(j -> "Active".equals(j.getJob_Status())).filter(j -> {
			try {
				LocalDate applicationDeadline = LocalDate.parse(j.getApplication_Deadline(), formatter);
				return !applicationDeadline.isBefore(LocalDate.now());
			} catch (Exception e) {
				// Handle parsing exception if needed
				return false;
			}
		}).collect(Collectors.toList());

		model.addAttribute("jobList", jobList);

//		model.addAttribute("jobList", jobList);

		return "JobSeekers/SearchJob";

	}
	
	

	// Apply for a job
	@PostMapping("/applyJob")
	public String applyController(Model model, HttpSession session, HttpServletRequest req) {
//		   JobSeekers seeker = (JobSeekers) session.getAttribute("seeker");
//		   int job_seeker_id =seeker.getJOB_SEEKER_ID();
//
		int job_id = Integer.parseInt(req.getParameter("job_id"));
		int job_Seeker_Id = Integer.parseInt(req.getParameter("seeker_id"));

//		   List<Jobs> jobList =jobsService.viewJobs();
////		   session.setAttribute("seekers", seekers);
//		   
		int employer_id = jobsService.getEmployerIdForJob(job_id);
		System.out.println(employer_id + "employer id " + "edit");

		boolean isCreated = jobsService.applyJob(job_id, job_Seeker_Id, employer_id);

		if (isCreated) {
			session.setAttribute("message", "Admin user created successfully.");
			session.setAttribute("messageType", "success");
		} else {
			session.setAttribute("message", "Email ID already exists.");
			session.setAttribute("messageType", "error");
		}
		return "redirect:/jobSearchController";

//		   boolean value=jobsService
//		   model.addAttribute("jobList",jobList);

//		   return "JobSeekers/SearchJob";   

	}

	// View applied jobs
	@RequestMapping("/appliedJobController")
	public String appliedJobController(Model model, HttpSession session) {
		JobSeekers seeker = (JobSeekers) session.getAttribute("seeker");
		if (seeker == null) {
			// Handle the case where the seeker object is null, redirect to login page
			return "redirect:/login";
		}

		int job_seeker_id = seeker.getJOB_SEEKER_ID();
		System.out.println(job_seeker_id);

		List<Jobs> jobsList = jobsService.appliedJobs(job_seeker_id);

		for (Jobs j : jobsList) {
			System.out.println(j.getJob_Application_Status());
		}
		model.addAttribute("jobsList", jobsList);

////		   JobSeekers seekers = jobSeekerService.jobSeekers(job_seeker_id);
//////		   session.setAttribute("seekers", seekers);
////		   
////		   model.addAttribute("seekers",seekers);
//
		return "JobSeekers/AppliedJob";
//
	}

	// Check job application status
	@PostMapping("/checkStatus")

	public String jobStatus(Model model, HttpSession session, HttpServletRequest req) {
//		   JobSeekers seeker = (JobSeekers) session.getAttribute("seeker");
//		   int job_seeker_id =seeker.getJOB_SEEKER_ID();
//
		int job_id = Integer.parseInt(req.getParameter("job_id"));
		int job_Seeker_Id = Integer.parseInt(req.getParameter("seeker_id"));

//		   List<Jobs> jobList =jobsService.viewJobs();
////		   session.setAttribute("seekers", seekers);
//		   
		int employer_id = jobsService.getEmployerIdForJob(job_id);
		
		String status = jobsService.jobStatus(job_id, job_Seeker_Id, employer_id);
		System.out.println(status);
		return "redirect:/appliedJobController";

	}

	@RequestMapping("/SeekerPasswordController")
	public ModelAndView getAdminPasswordPage() {

		ModelAndView mv = new ModelAndView();
		System.out.println("seeker reset ");
		mv.setViewName("JobSeekers/SeekerPasswordReset");
		return mv;
	}
	// Display password reset form

	@PostMapping("/SeekerPasswordRestController")

	public String AdminPasswordRest(HttpServletRequest request, HttpServletResponse responc, HttpSession session,
			Model model) {

		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		int job_Seeker_Id = Integer.parseInt(request.getParameter("seeker_id"));
		System.out.println(oldPassword + "seekepasssskssks");
		boolean isCreated = jobSeekerService.updateSeekerPassword(oldPassword, newPassword, job_Seeker_Id);

		if (isCreated) {
			session.setAttribute("message", "Admin user created successfully.");
			session.setAttribute("messageType", "success");
		} else {
			session.setAttribute("message", "Email ID already exists.");
			session.setAttribute("messageType", "error");
		}
		return "redirect:/SeekerPasswordController";

	}

	@RequestMapping("/seekerLogOut")
	public String AdminLogOut(HttpServletRequest request) {

		HttpSession session = request.getSession(false); // Get existing session without creating a new one

		if (session != null) {
			session.removeAttribute("seeker"); // Remove specific attribute 'admin' from session
			session.invalidate(); // Invalidate (remove) the entire session
		}

		return "JobSeekers/seekerlogin";
	}

	@RequestMapping("/ForgetPasswordForSeeker")
	public String forgetPassword() {

		return "JobSeekers/ForgetPassword";

	}

	// Handle password reset form submission
	@PostMapping("/SeekerPasswordForgetPassword")
	public String passwordReset(@RequestParam("email") String email) {

		int n = jobSeekerService.emailChecker(email);
		if (n > 0) {
			SendEmail sendEmail = new SendEmail();
			sendEmail.sendPasswordResetEmail(email);

			return "JobSeekers/ForgetPasswordSuccuss";
		}

		return "JobSeekers/ForgetPasswordError";
	}
}
