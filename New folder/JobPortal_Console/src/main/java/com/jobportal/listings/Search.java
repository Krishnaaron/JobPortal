package com.jobportal.listings;

import java.sql.SQLException;

public interface Search {
	
	public void searchJobs(String string) throws ClassNotFoundException, SQLException;
	public void search(String string ,String string1 ,String string2);
	public void searchUsers(String criteria, String searchType) throws ClassNotFoundException;
	void searchUsers(String education, String skills, String experience) throws ClassNotFoundException;
	void searchUsers(String education, String skills, String experience, int option) throws ClassNotFoundException;
	void searchUsers() throws ClassNotFoundException;
	void searchUsers(String searchType) throws ClassNotFoundException;
}
