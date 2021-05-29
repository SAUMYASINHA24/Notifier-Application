package com.addNotebook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class NoteBookDao {
	
	
	public void storeNoteBookData(String email, String name)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notifierapp?useSSL=false","root","1234");
			Statement st=conn.createStatement();
			
			int j=st.executeUpdate("insert into notebook(email,name)values('"+email+"','"+name+"')");
			
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
		}
	}
	
	public List<ArrayList<String>> getNoteBook(String email)
	{
		List<ArrayList<String>> listOfLists = new ArrayList<ArrayList<String>>();
     	
     	
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notifierapp?useSSL=false","root","1234");
			PreparedStatement pt = null;
			
			pt = conn.prepareStatement("select name,notesCount from notebook where email = ?");
			pt.setString(1, email);
			
            ResultSet rs = pt.executeQuery();
           
            while(rs.next())
            {
            	String name = rs.getString("name");
            	String count = rs.getString("notesCount");
            	ArrayList<String> anotherList = new ArrayList<String>();
            	anotherList.add(name);
            	anotherList.add(count);
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
	public void updateNoteBook(String email,String oldName,String newName)
	{

		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notifierapp?useSSL=false","root","1234");
			PreparedStatement pt = null;
			pt = conn.prepareStatement("update notebook set name = ? where email=? and name = ?");
			pt.setString(1, newName);
			pt.setString(2, email);
			pt.setString(3, oldName);
			pt.executeUpdate();
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
		}
	}
	public void deleteNoteBook(String email,String name)
	{

		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String sql = "delete from notebook  where email=? and name = ?";
			
			try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notifierapp?useSSL=false","root","1234"); 
			        PreparedStatement stmt = conn.prepareStatement(sql)) {
			      
			      stmt.setString(1, email);
			      stmt.setString(2, name);
			      stmt.executeUpdate();
			      
			      System.out.println("Record deleted successfully");
			}
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
		}
	}

}
