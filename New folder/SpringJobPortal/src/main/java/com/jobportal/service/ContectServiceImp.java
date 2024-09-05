package com.jobportal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.jobportal.mapper.ContectMapper;

@Service
public class ContectServiceImp implements ContectService{
	@Autowired
	private ContectMapper contectMapper;
	
	@Override
	public boolean contectInformation(String email, String name, String message, String subject) {
		// TODO Auto-generated method stub
		return contectMapper.addMessage(subject, name, email, message);
	}

}
