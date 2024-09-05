package com.jobportal.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ContectMapper {
	
	@Insert("INSERT INTO contect (subject, NAME, EMAIL, message) VALUES (#{subject}, #{name}, #{email}, #{message})")
    boolean addMessage(@Param("subject") String subject, @Param("name") String name, @Param("email") String email,@Param("message") String message);
		
		
	

}
