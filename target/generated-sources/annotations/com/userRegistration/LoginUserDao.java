package com.userRegistration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


public class LoginUserDao {

	public boolean getUser(String email)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/notifierapp?useSSL=false","root","1234");
			
			PreparedStatement pt = null;
		
			pt = con.prepareStatement("select username,pass_word from userdetails where email=?");
			pt.setString(1, email);
            ResultSet rs = pt.executeQuery();
            
            if(rs.next())
            {
                return true;
            } 
            else 
            {
                return false;
            }
			
			
		}
		catch(Exception e)
		{
			
			
			return(false);
		}
		
	}
	public void storeUserData(String phone, String email, String username, String password)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notifierapp?useSSL=false","root","1234");
			Statement st=conn.createStatement();
			
			int j=st.executeUpdate("insert into userdetails(username,pass_word,phone,email)values('"+username+"','"+password+"','"+phone+"','"+email+"')");
			
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
		}
	}
	public boolean login(String email,String password)
	{	
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/notifierapp?useSSL=false","root","1234");
			
			PreparedStatement pt = null;
			
			pt = con.prepareStatement("select email,pass_word from userdetails where email=? and pass_word = ?");
			pt.setString(1, email);
			pt.setString(2, password);
            ResultSet rs = pt.executeQuery();
            String orPass = "";
            while (rs.next())
            {
                orPass = rs.getString("pass_word");
            } 
            if (orPass.equals(password)) 
            {            
            	return true;   
            } 
            else 
            {
                return false;
            }
			
			
		}
		catch(Exception e)
		{	
			return(false);
		}
		
	}
	public void update(String username, String phone,String email)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/notifierapp?useSSL=false","root","1234");
			
			PreparedStatement pt = null;
			
			pt = con.prepareStatement("update userdetails set username = ? ,phone = ? where email=?");
			pt.setString(1, username);
			pt.setString(2, phone);
			pt.setString(3, email);
			pt.executeUpdate();
           
            
			
			
		}
		catch(Exception e)
		{	
			e.printStackTrace();
		}
	}
	
}
