package com.jobportal.service;

import com.jobportal.model.Employers;

public interface EmployersService {
   public Employers employers (String email ,String password);
   
   public boolean passwordReset(int id,String newPassword,String oldPassword);
}
