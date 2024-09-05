package com.jobportal.controller;



import java.io.IOException;

import com.jobportal.model.User;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class UserVerif
 */
public class UserVerifi extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public UserVerifi() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
        String name =request.getParameter("name");
        String email =request.getParameter("email");
        System.out.println("hello");
        SendEmail sm = new SendEmail();
        String code =sm.getRandom();
        User user = new User(name, email, code);
        boolean test =sm.sendEmail(user);
        if(test) {
        	HttpSession session = request.getSession();
        	session.setAttribute("authcode", user);
        	response.sendRedirect("vefify.jsp");
        }
        
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}
