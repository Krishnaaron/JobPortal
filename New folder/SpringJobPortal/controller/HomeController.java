package com.jobportal.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jobportal.service.ContectService;

@Controller
public class HomeController {
	  @Autowired
	  private 	 ContectService contectService;
	// Handles requests to the about page
	@RequestMapping("/aboutController")
	public ModelAndView getAdminLogin() {

		ModelAndView mv = new ModelAndView();

		mv.setViewName("home/about");
		return mv;
	}

	// Handles requests to the job page
	@RequestMapping("/jobController")
	public ModelAndView getJobController() {

		ModelAndView mv = new ModelAndView();

		mv.setViewName("home/job");
		return mv;
	}

	@RequestMapping("/homeJsp")
	public ModelAndView getJobControlle() {

		ModelAndView mv = new ModelAndView();

		mv.setViewName("home/welcomepage");
		return mv;
	}

	@RequestMapping("/ContectController")
	public ModelAndView getContectController() {

		ModelAndView mv = new ModelAndView();

		mv.setViewName("home/Contect");
		return mv;
	}
    
	@PostMapping("/ContectDetails")
	public String contactInformation(@RequestParam("email")String  email,@RequestParam("name")String name,@RequestParam("subject")String subject,@RequestParam("message")String message) {
		System.out.println(email);
		contectService.contectInformation(email,name,message,subject);
		
		
		return "redirect:/ContectController";
		
		
	}
}