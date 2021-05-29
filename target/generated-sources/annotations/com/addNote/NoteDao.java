package com.addNote;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
public class NoteDao {

	public void storeNoteData(String email, String notebookName,String name,String start_date, String end_date, String reminder_date,String status,String tag, String description )
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notifierapp?useSSL=false","root","1234");
			Statement st=conn.createStatement();
			
			int j=st.executeUpdate("insert into note(email,notebookName,name,start_date,end_date,reminder_date,status,tag,description)values('"+email+"','"+notebookName+"','"+name+"','"+start_date+"','"+end_date+"','"+reminder_date+"','"+status+"','"+tag+"','"+description+"')");
			PreparedStatement pt = null;
			pt = conn.prepareStatement("select notesCount from notebook where email = ? and name =? ");
			pt.setString(1, email);
			pt.setString(2, notebookName);
			ResultSet rs = pt.executeQuery();
			rs.next();
			pt = conn.prepareStatement("update notebook set notesCount = ? where email=? and name = ?");
			pt.setString(1, String.valueOf(Integer.parseInt(rs.getString("notesCount"))+1));
			pt.setString(2, email);
			pt.setString(3, notebookName);
			pt.executeUpdate();
			
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
		}
	}
	
	public List<ArrayList<String>> getNote(String email)
	{
		List<ArrayList<String>> listOfLists = new ArrayList<ArrayList<String>>();
     	
     	
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notifierapp?useSSL=false","root","1234");
			PreparedStatement pt = null;
			
			pt = conn.prepareStatement("select * from note where email = ?");
			pt.setString(1, email);
			
            ResultSet rs = pt.executeQuery();
           
            while(rs.next())
            {
            	String name = rs.getString("name");
            	String start_date = rs.getString("start_date");
            	String end_date = rs.getString("end_date");
            	String reminder_date = rs.getString("reminder_date");
            	String status = rs.getString("status");
            	String tag = rs.getString("tag");
            	String description = rs.getString("description");
            	String notebookName = rs.getString("notebookName");
            	ArrayList<String> anotherList = new ArrayList<String>();
            	anotherList.add(name);
            	anotherList.add(start_date);
            	anotherList.add(end_date);
            	anotherList.add(reminder_date);
            	anotherList.add(status);
            	anotherList.add(tag);
            	anotherList.add(description);
            	anotherList.add(notebookName);
            	System.out.println(anotherList);
            	listOfLists.add(anotherList);   
            } 
            return listOfLists;          
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
			System.out.println("mistake!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			
        	return listOfLists;
		}
	}
	
	public void updateNote(String email,String oldNoteName ,String notebookName, String name, String start_date, String end_date, String reminder_date, String status, String tag, String description)
	{

		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notifierapp?useSSL=false","root","1234");
			PreparedStatement pt = null;
			pt = conn.prepareStatement("update note set name = ?,start_date =?, end_date =?, reminder_date =?, status =?, tag =?, description =? where email=? and name = ? and notebookName = ?");
			pt.setString(1, name);
			pt.setString(2, start_date);
			pt.setString(3, end_date);
			pt.setString(4, reminder_date);
			pt.setString(5, status);
			pt.setString(6, tag);
			pt.setString(7, description);
			pt.setString(8, email);
			pt.setString(9, oldNoteName);
			pt.setString(10, notebookName);
			pt.executeUpdate();
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
		}
	}
	public void deleteNote(String email,String name,String notebookName)
	{

		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String sql = "delete from note where email=? and name = ? and notebookName = ?";
			
			try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notifierapp?useSSL=false","root","1234"); 
			        PreparedStatement stmt = conn.prepareStatement(sql)) {
			      
			      stmt.setString(1, email);
			      stmt.setString(2, name);
			      stmt.setString(3, notebookName);
			      stmt.executeUpdate();
			      
			      System.out.println("Record deleted successfully");
			}
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
		}
	}
	public List<ArrayList<String>> todayTasks(String email)
	{
		List<ArrayList<String>> listOfLists = new ArrayList<ArrayList<String>>();
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notifierapp?useSSL=false","root","1234");
			PreparedStatement pt = null;
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
			LocalDateTime now = LocalDateTime.now();
			
			
			pt = conn.prepareStatement("select * from note where email = ? and start_date = ?");
			pt.setString(1, email);
			pt.setString(2, dtf.format(now).split(" ")[0]);
			
            ResultSet rs = pt.executeQuery();
		           
            while(rs.next())
            {
            	String name = rs.getString("name");
            	String start_date = rs.getString("start_date");
            	String end_date = rs.getString("end_date");
            	ArrayList<String> anotherList = new ArrayList<String>();
            	anotherList.add(name);
            	anotherList.add(start_date);
            	anotherList.add(end_date);
            	listOfLists.add(anotherList);   
            } 
            System.out.println(listOfLists);
            return listOfLists;
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
			return listOfLists;
		}
	}
	
	public String status(String end_date,String email,String noteName, String notebookName)
	{
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
		LocalDateTime now = LocalDateTime.now();
		String cur_date = dtf.format(now).split(" ")[0];
		
		
		String status = "";
		if (cur_date.compareTo(end_date) > 0) {
			  
            // When Date d1 > Date d2
			status = "Completed";
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notifierapp?useSSL=false","root","1234");
				PreparedStatement pt = null;
				pt = conn.prepareStatement("update note set status =? where email=? and name = ? and notebookName = ?");
				pt.setString(1, status);
				pt.setString(2, email);
				pt.setString(3, noteName);
				pt.setString(4, notebookName);
				
				pt.executeUpdate();
			}
			catch(Exception e)
			{
				
				e.printStackTrace();
			}
        }
  
        else if (cur_date.compareTo(end_date) < 0) {
  
            // When Date d1 < Date d2
        	status = "Active";
        	try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notifierapp?useSSL=false","root","1234");
				PreparedStatement pt = null;
				pt = conn.prepareStatement("update note set status =? where email=? and name = ? and notebookName = ?");
				pt.setString(1, status);
				pt.setString(2, email);
				pt.setString(3, noteName);
				pt.setString(4, notebookName);
				
				pt.executeUpdate();
			}
			catch(Exception e)
			{
				
				e.printStackTrace();
			}
        }
  
        else if (cur_date.compareTo(end_date) == 0) {
  
            // When Date d1 = Date d2
        	status = "Last day";
        	try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notifierapp?useSSL=false","root","1234");
				PreparedStatement pt = null;
				pt = conn.prepareStatement("update note set status =? where email=? and name = ? and notebookName = ?");
				pt.setString(1, status);
				pt.setString(2, email);
				pt.setString(3, noteName);
				pt.setString(4, notebookName);
				
				pt.executeUpdate();
			}
			catch(Exception e)
			{
				
				e.printStackTrace();
			}
        }
		return status;
		
	}
	
	public List<ArrayList<String>> reminder(String email)
	{
		List<ArrayList<String>> listOfLists = new ArrayList<ArrayList<String>>();
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notifierapp?useSSL=false","root","1234");
			PreparedStatement pt = null;
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
			LocalDateTime now = LocalDateTime.now();
			
			
			pt = conn.prepareStatement("select * from note where email = ? and reminder_date = ?");
			pt.setString(1, email);
			pt.setString(2, dtf.format(now).split(" ")[0]);
			
            ResultSet rs = pt.executeQuery();
		           
            while(rs.next())
            {
            	String name = rs.getString("name");
            	String start_date = rs.getString("start_date");
            	
            	ArrayList<String> anotherList = new ArrayList<String>();
            	anotherList.add(name);
            	anotherList.add(start_date);
            	
            	listOfLists.add(anotherList);   
            	System.out.println(anotherList);
            } 
            System.out.println(listOfLists);
            return listOfLists;
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
			return listOfLists;
		}
	}
	
}
