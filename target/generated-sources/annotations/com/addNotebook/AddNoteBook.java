package com.addNotebook;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AddNoteBook extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String name = request.getParameter("name");
	
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		if(email==null || email.length()<0)
		{
			System.out.println("session expired");
		}
		else
		{
			
			NoteBookDao nd = new NoteBookDao();
			nd.storeNoteBookData(email, name);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("newNotebook.jsp");
			 
	        requestDispatcher.forward(request, response);
			
		}
		
		
	}

}
