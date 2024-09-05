package com.jobportal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobportal.mapper.EmployersMapper;
import com.jobportal.model.Employers;
@Service
public class EmployersServiceImp implements EmployersService {
	
	@Autowired
	private EmployersMapper employersMapper;

	@Override
	public Employers employers(String email, String password) {
		// TODO Auto-generated method stub
		return employersMapper.login(email, password);
	}

	@Override
	public boolean passwordReset(int id, String newPassword, String oldPassword) {
		// TODO Auto-generated method stub
		return employersMapper.changePassword(id, oldPassword, newPassword);
	}

}
