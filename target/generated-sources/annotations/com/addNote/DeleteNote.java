package com.addNote;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.addNotebook.NoteBookDao;

public class DeleteNote extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oldDeleteData = request.getParameter("oldDeleteData");
		String noteName = oldDeleteData.split(",")[0];
		String notebookName = oldDeleteData.split(",")[1];
		HttpSession session = request.getSession();
		String email =(String)( session.getAttribute("email"));
		NoteDao nd = new NoteDao();
		nd.deleteNote(email, noteName,notebookName);
		System.out.println("deleted success");
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("newNote.jsp");
		 
        requestDispatcher.forward(request, response);
	}

}
