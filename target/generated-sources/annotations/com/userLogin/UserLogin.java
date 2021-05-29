package com.userLogin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.userRegistration.LoginUserDao;

public class UserLogin extends HttpServlet {
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		LoginUserDao d1 = new LoginUserDao();
		boolean b1 = d1.login(email, password);
		if(b1)
		{
			
			HttpSession session = request.getSession();
			session.setAttribute("email", email);
			System.out.println(session.getAttribute("email"));
			response.sendRedirect("dashboard.jsp");  
		}
		else
		{
			System.out.println("wrong credentials");
		}
				
		
		
		
	}

}
