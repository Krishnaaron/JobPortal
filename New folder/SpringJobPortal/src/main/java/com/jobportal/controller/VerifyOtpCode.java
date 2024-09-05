//package com.jobportal.controller;
//
//
//import java.io.IOException;
//
//import com.jobportal.model.User;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
///**
// * Servlet implementation class verifyCode
// */
//public class verifyCode extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//    /**
//     * Default constructor. 
//     */
//    public verifyCode() {
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//		HttpSession session  =request.getSession();
//		User user = (User) session.getAttribute("authcode");
//		
//		String code =request.getParameter("authcode");
//		
//		
//		if(code.equals(user.getCode())) {
////			printWitter out =
//		 	System.out.println("verification done");
//			
//		}else {
//			
//			System.out.println("incorrect verification code");
//		}
//	}
//
//}
