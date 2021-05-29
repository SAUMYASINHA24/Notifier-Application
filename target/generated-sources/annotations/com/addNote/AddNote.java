package com.addNote;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.addNotebook.NoteBookDao;


public class AddNote extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String name = request.getParameter("name");
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		String reminder_date = request.getParameter("reminder_date");
		String status = request.getParameter("status");
		String tag = request.getParameter("tag");
		String description = request.getParameter("description");
		String notebookName = request.getParameter("notebookName");
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		if(email==null || email.length()<0)
		{
			System.out.println("session expired");
		}
		else
		{
			
			NoteDao nd = new NoteDao();
			nd.storeNoteData(email, notebookName, name, start_date, end_date, reminder_date, status, tag, description);
			System.out.println("note added");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("newNote.jsp");
			 
	        requestDispatcher.forward(request, response);
			
		}
		
	}

}
