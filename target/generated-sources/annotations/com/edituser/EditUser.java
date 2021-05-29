package com.edituser;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.userRegistration.LoginUserDao;

/**
 * Servlet implementation class EditUser
 */
public class EditUser extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		
		LoginUserDao ld = new LoginUserDao();
		boolean b1 = ld.login(email, password);
		if(b1)
		{
			ld.update(username, phone, email);
			System.out.println("update done");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("newNotebook.jsp");
			 
	        requestDispatcher.forward(request, response);
		}
		else
		{
			System.out.println("credentials wrong");
		}
		
	}

}
