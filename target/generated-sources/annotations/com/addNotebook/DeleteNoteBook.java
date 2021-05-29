package com.addNotebook;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class DeleteNoteBook extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("notebookName");
		HttpSession session = request.getSession();
		String email =(String)( session.getAttribute("email"));
		NoteBookDao nd = new NoteBookDao();
		nd.deleteNoteBook(email, name);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("newNotebook.jsp");
		 
        requestDispatcher.forward(request, response);
	}

}
