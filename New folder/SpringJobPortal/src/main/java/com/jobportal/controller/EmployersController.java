package com.jobportal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jobportal.model.Employers;
import com.jobportal.service.EmployersService;
import com.jobportal.service.JobsService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestBody;
import com.jobportal.model.*;

@Controller
public class EmployersController
{
	@Autowired
	private EmployersService	employersService;

	@Autowired
	private JobsService			jobsService;

	@RequestMapping("/employersLogin")
	public ModelAndView employerLoginController()
	{

		ModelAndView mv = new ModelAndView();

		mv.setViewName("employers/employerLogin");
		return mv;
	}

	@PostMapping("/employerDash")
	public String employerDash(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session)
	{

		ModelAndView mv = new ModelAndView();
		Employers employers = employersService.employers(email, password);

		if (employers != null)
		{

			if (employers.getStatus().equals("Inactive"))
			{
				mv.addObject("errorMessage", "Your account has been blocked.");
				mv.setViewName("card");
				return "employers/employerDash";
			}
			else
			{
				session.setAttribute("employers", employers);
				return "redirect:/employercard";

			}
		}
		else
			mv.addObject("errorMessage", "Invalid email or password");
		return "employers/employerLogin";

	}

	@RequestMapping("/employercard")
	public ModelAndView dashCard(HttpSession session, HttpServletRequest request)
	{

		Employers employers = (Employers) session.getAttribute("employers");
		ModelAndView mv = new ModelAndView();
		if (employers != null)
		{

			int employer_Id = employers.getId();

			List<Jobs> jobList = jobsService.postedJobs(employer_Id);
			List<JobApplications> JobAppliations = jobsService.viewNumberApplicatio(employer_Id);

			long numberOfActiveJobs = jobList.stream().filter(job -> job.getJob_Status().equals("Active")).count();
			long numberOfInActiveJobs = jobList.stream().filter(job -> job.getJob_Status().equals("Inactive")).count();
			int numberOfPostedJob = jobList.size();

			long numberOfApllicationRecived = JobAppliations.stream().count();

			request.setAttribute("numberOfPostedJob", numberOfPostedJob);
			request.setAttribute("numberOfInActiveJobs", numberOfInActiveJobs);
			request.setAttribute("numberOfApllicationRecived", numberOfApllicationRecived);
			request.setAttribute("numberOfActiveJobs", numberOfActiveJobs);
			mv.setViewName("employers/employerDash");

		}
		else
			mv.setViewName("employers/employerLogin");
		return mv;
	}

	@RequestMapping("/EployerPasswordController")
	public ModelAndView getAdminPasswordPage()
	{
		System.out.println("welcome gopal");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("employers/ResetPassword");
		return mv;
	}

	@RequestMapping("/EmployerRegisterController")
	public ModelAndView employerRegister()
	{

		ModelAndView mv = new ModelAndView();
		mv.setViewName("employers/registerEmployer");
		return mv;
	}

	@RequestMapping("/employerPasswordRestController")
	public String AdminPasswordRest(HttpServletRequest request, HttpServletResponse responc, HttpSession session, Model model)
	{

		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		int id = Integer.parseInt(request.getParameter("emp_Id"));

		boolean isCreated = employersService.passwordReset(id, newPassword, oldPassword);

		if (isCreated)
		{
			session.setAttribute("message", "employer user created successfully.");
			session.setAttribute("messageType", "success");
		}
		else
		{
			session.setAttribute("message", "Email ID already exists.");
			session.setAttribute("messageType", "error");
		}
		return "redirect:/EployerPasswordController";

	}

	@RequestMapping("/postjob")
	public ModelAndView postJob()
	{

		ModelAndView mv = new ModelAndView();
		mv.setViewName("employers/postJob");
		return mv;

	}

	@RequestMapping("/employersLogout")
	public String AdminLogOut(HttpServletRequest request)
	{

		HttpSession session = request.getSession(false); // Get existing session
															// without creating
															// a new one

		if (session != null)
		{
			session.removeAttribute("employers"); // Remove specific attribute
													// 'admin' from session
			session.invalidate(); // Invalidate (remove) the entire session
		}

		return "redirect:/employersLogin";
	}

}
