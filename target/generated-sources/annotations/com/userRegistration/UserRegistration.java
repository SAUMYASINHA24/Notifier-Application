package com.userRegistration;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.userRegistration.LoginUserDao;

public class UserRegistration extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		
		
		LoginUserDao d1 = new LoginUserDao();
		Boolean b1 = d1.getUser(email);
		if(b1)
		{
			System.out.println("you are already registered");
			
			
		}
		else
		{
			System.out.println(" proceed to registration");
			d1.storeUserData(phone, email, username, password);
			System.out.println("Registration successful.");
		}
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}

}
