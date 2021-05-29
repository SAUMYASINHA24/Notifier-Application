<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>
	table
	{
		 width:50%;
		 border-collapse: collapse;
		margin-left:300px;
		margin-top:40px;
		 text-align:left;
	}
	th, td {
	  border: 1px solid black;
	  text-align:left;
	  padding: 8px;
	 
	}
	tr:nth-child(even)
	{
  		background-color: #dddddd;
	}

</style>
</head>
<body>
		<%
			String noteName  = request.getParameter("noteName");
			String start_date  = request.getParameter("start_date");
			String end_date  = request.getParameter("end_date");
			String reminder_date  = request.getParameter("reminder_date");
			String status  = request.getParameter("status");
			String tag  = request.getParameter("tag");
			String description  = request.getParameter("description");
			
			
		%>
		<div class = "generated_epass">	 
		<h3 style = "padding-left:300px;padding-top:100px; color:blue;">Note Details</h3>
	 	<table> 	
	 			
			<tr>
				<th>Name</th>
				<td><%out.println(noteName); %></td>
			</tr>
			<tr>
				<th>Start date</th>
				<td><%out.println(start_date); %></td>
			</tr>
			<tr>
				<th>End date</th>
				<td><%out.println(end_date); %></td>
			</tr>
			<tr>
				<th>Reminder date</th>
				<td><%out.println(reminder_date); %></td>
			</tr>
			<tr>
				<th>Status</th>
				<td><%out.println(status); %></td>
			</tr>
			<tr>
				<th>Tag</th>
				<td><%out.println(tag); %></td>
			</tr>
			<tr>
				<th>Description</th>
				<td><%out.println(description); %></td>
			</tr>	
				
		</table>
	 
	 	<a href = "newNote.jsp" style = "padding-left:300px;">Back</a>
	 
	 </div>
</body>
</html>