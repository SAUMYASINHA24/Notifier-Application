package com.addNote;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class EditNote extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oldEditdata = request.getParameter("oldEditData");
		System.out.println(oldEditdata);
		String oldName = oldEditdata.split(",")[0];
		String name = request.getParameter("name");
		
		String oldNoteBook = oldEditdata.split(",")[1] ;
		System.out.println(oldName);
		System.out.println(oldNoteBook);
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		String reminder_date = request.getParameter("reminder_date");
		String status = request.getParameter("status");
		String tag = request.getParameter("tag");
		String description = request.getParameter("description");
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		if(email==null || email.length()<0)
		{
			System.out.println("session expired");
		}
		else
		{
			
			NoteDao nd = new NoteDao();
			nd.updateNote(email, oldName,oldNoteBook, name, start_date, end_date, reminder_date, status, tag, description);
			System.out.println("note updated");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("newNote.jsp");
			 
	        requestDispatcher.forward(request, response);
			
		}
	}

}
