package com.jobportal.controller;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jobportal.model.Admin;
import com.jobportal.model.Employers;
import com.jobportal.model.JobApplications;
import com.jobportal.model.JobSeekers;
import com.jobportal.model.Jobs;
import com.jobportal.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController
{
	@Autowired
	AdminService				adminService;

	/**
	 * Displays the admin login page.
	 * 
	 * @return ModelAndView with view name for admin login.
	 */
	private static final Logger	LOGGER	= LogManager.getLogger(AdminController.class);

	@RequestMapping("/adminlogincontroller")
	public ModelAndView getAdminLogin()
	{
		LOGGER.info("Entering getAdminLogin method");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Admin/AdminLogin");
		LOGGER.info("Exiting getAdminLogin method");
		return mv;
	}

	/**
	 * Handles admin login request.
	 * 
	 * @param email
	 *            Admin email.
	 * @param password
	 *            Admin password.
	 * @param session
	 *            HTTP session.
	 * @param model
	 *            Model for passing data to the view.
	 * @return Redirects to admin dashboard or login page with error message.
	 */

	@RequestMapping("/adminLogin")
	public String getSeekerDashboard(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session, Model model)
	{
		LOGGER.info("Admin login attempt for email: {}", email);
		Admin admin = adminService.adminLogin(email, password);

		if (admin != null)
		{
			LOGGER.info("Admin logged in successfully: {}", admin.getName());

			session.setAttribute("admin", admin);
			// Fetch and set other session attributes here
			return "redirect:/cart";
		}
		else
		{
			LOGGER.warn("Invalid login attempt for email: {}", email);
			model.addAttribute("errorMessage", "Invalid email or password");
			return "Admin/AdminLogin";
		}
	}

	/**
	 * Displays admin dashboard with job seeker, employer, and job counts.
	 * 
	 * @param model
	 *            Model for passing data to the view.
	 * @return View name for admin dashboard.
	 */
	@RequestMapping("/cart")
	public String adminCart(Model model)
	{
		try
		{
			LOGGER.info("Accessing admin dashboard");

			List<JobSeekers> jobSeekersList = adminService.viewJobSeeker();
			List<Employers> employer = adminService.viewEmployers();
			List<Jobs> jobsList = adminService.viewJobs();
			List<JobApplications> jobApplication = adminService.viewApplications();

			int employe = employer.size();
			int jobSize = jobsList.size();
			int seekerSize = jobSeekersList.size();
			int jobApplicationSize = jobApplication.size();
			model.addAttribute("jobSize", jobSize);
			model.addAttribute("employe", employe);
			model.addAttribute("seekerSize", seekerSize);
			model.addAttribute("jobApplicationSize", jobApplicationSize);
			LOGGER.info("Dashboard stats - Jobs: {}, Employers: {}, Seekers: {}, Applications: {}", jobSize, employe, seekerSize, jobApplicationSize);
			return "Admin/admin";
		}
		catch (Exception e)
		{

			LOGGER.error("Error accessing admin dashboard", e);
			return "Admin/admin";
		}
	}

	/**
	 * Retrieves and displays job seeker data.
	 * 
	 * @param model
	 *            Model for passing data to the view.
	 * @return View name for job seeker information.
	 */

	@RequestMapping("/AdminRetriveData")
	public String getJobSeekerData(Model model)
	{
		List<JobSeekers> SeekersList = adminService.viewJobSeeker();
		List<JobSeekers> jobSeekersList = SeekersList.stream().filter(j -> j.getfName() != null) // Filter
																									// out
																									// null
																									// first
																									// names
				.sorted(Comparator.comparing(JobSeekers::getfName)).collect(Collectors.toList());
		// ModelAndView mv = new ModelAndView();
		model.addAttribute("jobSeekersList", jobSeekersList);
		return "" + "/JobSeekerInfo";

	}

	/**
	 * Updates job seeker status.
	 * 
	 * @param email
	 *            Job seeker email.
	 * @param status
	 *            New status.
	 * @param session
	 *            HTTP session.
	 * @param model
	 *            Model for passing data to the view.
	 * @return Redirects to job seeker data retrieval.
	 */
	@RequestMapping("/JobSeekerEditController")
	public String JobSeekerEditController(@RequestParam("email") String email, @RequestParam("status") String status, HttpSession session, Model model)
	{
		LOGGER.info("Job seeker status updated successfully for email: {}", email);
		try
		{

			adminService.updateStatus(email, status);
			LOGGER.info("Job seeker status updated successfully for email: {}", email);
		}
		catch (Exception e)
		{
			LOGGER.error("Failed to update job seeker status for email: {}", email, e);
		}
		return "redirect:/AdminRetriveData";

	}

	/**
	 * Retrieves and displays employer data.
	 * 
	 * @param model
	 *            Model for passing data to the view.
	 * @return View name for employer information.
	 */
	@RequestMapping("/AdminEmployerRetriveData")
	public String getEmployerData(Model model)
	{

		List<Employers> employers = adminService.viewEmployers();
		List<Employers> employer = employers.stream().filter(emp -> emp.getUserName() != null).sorted(Comparator.comparing(Employers::getUserName)).collect(Collectors.toList());

		model.addAttribute("employer", employer);
		//// ModelAndView mv = new ModelAndView();
		// model.addAttribute("jobSeekersList", jobSeekersList);
		return "Admin/EmployerAdmin";

	}

	/**
	 * Updates employer status.
	 * 
	 * @param email
	 *            Employer email.
	 * @param status
	 *            New status.
	 * @param session
	 *            HTTP session.
	 * @param model
	 *            Model for passing data to the view.
	 * @return Redirects to employer data retrieval.
	 */

	@RequestMapping("/AdminEmployerEdit")
	public String JobEmployerditController(@RequestParam("email") String email, @RequestParam("status") String status, HttpSession session, Model model)
	{
		LOGGER.info("Entering employer statud edit");
		adminService.updateEmloyerStatus(email, status);

		return "redirect:/AdminEmployerRetriveData";

	}

	/**
	 * Retrieves and displays job data.
	 * 
	 * @param model
	 *            Model for passing data to the view.
	 * @return View name for job management information.
	 */
	@RequestMapping("/AdminJobRetriveData")
	public String getJobData(Model model)
	{
		long startTime = System.currentTimeMillis();
		LOGGER.info("Fetching job data");

		List<Jobs> jobsList = adminService.viewJobs();

		model.addAttribute("jobsList", jobsList);
		long endTime = System.currentTimeMillis();
		long duration = endTime - startTime;
		LOGGER.info("Job data fetched in {} ms", duration);
		//// ModelAndView mv = new ModelAndView();
		// model.addAttribute("jobSeekersList", jobSeekersList);
		return "Admin/JobSmangementForAdmin";

	}

	/**
	 * Updates job status.
	 * 
	 * @param job_Id
	 *            Job ID.
	 * @param employer_Id
	 *            Employer ID.
	 * @param job_Status
	 *            New job status.
	 * @param session
	 *            HTTP session.
	 * @param model
	 *            Model for passing data to the view.
	 * @return Redirects to job data retrieval.
	 */
	@RequestMapping("/AdminJobEdit")
	public String JobEditController(@RequestParam("job_id") int job_Id, @RequestParam("emp_id") int employer_Id, @RequestParam("job_Status") String job_Status, HttpSession session,
			Model model)
	{
		LOGGER.info("Entering employer status edit");
		adminService.updateJobStatus(job_Id, employer_Id, job_Status);

		return "redirect:/AdminJobRetriveData";

	}

	/**
	 * Displays admin profile view.
	 * 
	 * @return ModelAndView with view name for admin profile.
	 */
	@RequestMapping("/AdminProfileView")
	public ModelAndView adminProfileView()
	{
		LOGGER.info("Entering Admin profile view");

		ModelAndView mv = new ModelAndView();
		mv.setViewName("Admin/AdminProfile");
		return mv;
	}

	/**
	 * Edits admin profile.
	 * 
	 * @param name
	 *            Admin name.
	 * @param email
	 *            Admin email.
	 * @param admin_id
	 *            Admin ID.
	 * @param session
	 *            HTTP session.
	 * @param model
	 *            Model for passing data to the view.
	 * @return Redirects to admin profile view.
	 */
	@RequestMapping("/AdminProfileEdite")
	public String AdminProfileEdite(@RequestParam("name") String name, @RequestParam("email") String email, @RequestParam("admin_id") int admin_id, HttpSession session,
			Model model)
	{
		if (LOGGER.isDebugEnabled())
		{
			LOGGER.debug("Admin profile update request: name={}, email={}, admin_id={}", name, email, admin_id);
		}

		Admin adminSeesion = (Admin) session.getAttribute("admin");

		// System.out.println(adminSeesion.getEmail());

		boolean isCreated = adminService.updateAdminProfile(name, email, admin_id, adminSeesion.getEmail());
		if (isCreated)
		{
			LOGGER.info("Admin profile updated successfully for ID: {}", admin_id);
			Admin admin = new Admin();
			admin.setName(name);
			admin.setEmail(email);
			admin.setAdmin_id(admin_id);
			session.setAttribute("admin", admin);
			session.setAttribute("profile", "profile created successfully.");
			session.setAttribute("profileType", "success");
		}

		else
		{
			LOGGER.warn("Failed to update admin profile. Email already exists: {}", email);
			session.setAttribute("message", "Email ID already exists.");
			session.setAttribute("messageType", "error");
			System.out.println("email proplem");

		}
		return "redirect:/AdminProfileView";

	}

	/**
	 * Creates a new admin user.
	 * 
	 * @param name
	 *            Admin name.
	 * @param email
	 *            Admin email.
	 * @param password
	 *            Admin password.
	 * @param session
	 *            HTTP session.
	 * @param model
	 *            Model for passing data to the view.
	 * @return Redirects to admin profile view.
	 */
	@RequestMapping("/AdminNewUserController")
	public String AdminUserCreate(@RequestParam("name") String name, @RequestParam("email") String email, @RequestParam("password") String password, HttpSession session,
			Model model)
	{
		LOGGER.info("Entering AdminUserCreate method with name: {}, email: {}", name, email);
		boolean isCreated = adminService.createNewAdminUser(name, email, password);

		if (isCreated)
		{
			LOGGER.info("Admin user create SuccessFully:{},", email);
			session.setAttribute("message", "Admin user created successfully.");
			session.setAttribute("messageType", "success");
		}
		else
		{
			LOGGER.warn("Faild to create admin user.Email Alredt exixt", email);
			session.setAttribute("message", "Email ID already exists.");
			session.setAttribute("messageType", "error");
		}
		LOGGER.info("Exiting AdminUserCreate method");
		return "redirect:/AdminProfileView";
	}

	@RequestMapping("/adminPasswordController")
	public ModelAndView getAdminPasswordPage()
	{
		System.out.println("welcome gopal");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Admin/ResetPassword");
		return mv;
	}

	@RequestMapping("/AdminPasswordRestController")
	public String AdminPasswordRest(HttpServletRequest request, HttpServletResponse responc, HttpSession session, Model model)
	{
		LOGGER.info("Entering AdminPasswordRestController method");

		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		int admin_Id = Integer.parseInt(request.getParameter("admin_id"));

		boolean isCreated = adminService.updateAdminPassword(oldPassword, newPassword, admin_Id);

		if (isCreated)
		{
			session.setAttribute("message", "Admin user created successfully.");
			session.setAttribute("messageType", "success");
		}
		else
		{
			session.setAttribute("message", "Email ID already exists.");
			session.setAttribute("messageType", "error");
			LOGGER.error("Exception in AdminPasswordRestController method: ");
		}
		LOGGER.info("Exiting AdminPasswordRestController method");
		return "redirect:/adminPasswordController";

	}

	@RequestMapping("/ForgetPassword")
	public String forgetPassword()
	{

		return "Admin/ForgetPassword";

	}

	@PostMapping("/AdminPasswordForgetPassword")
	public String passwordReset(@RequestParam("email") String email)
	{
		LOGGER.info("Entering admin password rest");
		int n = adminService.resetPaaword(email);
		if (n > 0)
		{
			LOGGER.info("Admin password rest link send sucessfully");

			SendEmail sendEmail = new SendEmail();
			sendEmail.sendPasswordResetEmail(email);

			return "Admin/ForgetPasswordSuccuss";
		}
		LOGGER.warn("Email id not register :", email);
		return "Admin/ForgetPasswordError";
	}

	@RequestMapping("/AdminLogOut")
	public String AdminLogOut(HttpServletRequest request)
	{

		HttpSession session = request.getSession(false); // Get existing session
															// without creating
															// a new one
		LOGGER.info("Entering admin logout controller");
		if (session != null)
		{
			session.removeAttribute("admin"); // Remove specific attribute
												// 'admin' from session
			session.invalidate(); // Invalidate (remove) the entire session
		}

		LOGGER.info("admin logout successlly");
		return "redirect:/adminlogincontroller";
	}
}
