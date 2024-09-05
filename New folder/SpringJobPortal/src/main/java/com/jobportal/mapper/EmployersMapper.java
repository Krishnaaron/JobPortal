package com.jobportal.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.jobportal.model.Admin;
import com.jobportal.model.Employers;

@Mapper
public interface EmployersMapper {
	
	 // Admin login method: Checks admin credentials and returns admin details if they match
    @Select("SELECT * FROM employers WHERE email = #{email} AND password = #{password}")
    Employers login(@Param("email") String email, @Param("password") String password);
    
    @Update("UPDATE employers SET password = #{newPassword} WHERE id = #{id} AND password = #{oldPassword}")
    boolean changePassword(@Param("id") int id, 
                       @Param("oldPassword") String oldPassword, 
                       @Param("newPassword") String newPassword);

}
