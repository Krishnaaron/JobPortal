package com.jobportal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class SampleController {
  @PostMapping("/datachecker")
  public void dataChecker(){
	  System.out.println("dataChecker");
	  
  }
  {}
}
