<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="com.addNote.NoteDao" %>

  <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</head>
<body>


			
		
	<div class="card" style="width:90%;">
		 
	 <div class="container">
		 <div class="row">
		    <div class="col-2">
			  	<div class="card-body">
				    <h5 class="card-title"><%=session.getAttribute("noteName") %></h5>
				    <i class="fa fa-plus" data-toggle="modal" data-target="#exampleModal" aria-hidden="true"></i>
			    </div>
			</div>  
			
			<div class="col-2">
			  	<div class="card-body">
				    
				    <h6 class="card-title">Started on: <%=session.getAttribute("start_date") %> </h6>
				    <a class="card-block stretched-link text-decoration-none" href= "noteDetails.jsp?noteName=<%=session.getAttribute("noteName") %>&start_date=<%=session.getAttribute("start_date")%>&end_date=<%=session.getAttribute("end_date") %>&reminder_date=<%=session.getAttribute("reminder_date") %>&status= <%=session.getAttribute("status") %>&tag=<%=session.getAttribute("tag") %>&description=<%=session.getAttribute("description") %>"></a>
				    
				    <%--
				    <h6 class="card-subtitle mb-2 text-muted"></h6>
				    <h6 class="card-subtitle mb-2 text-muted"><%=session.getAttribute("reminder_date") %> </h6>
				    <h6 class="card-subtitle mb-2 text-muted"></h6>
				    <h6 class="card-subtitle mb-2 text-muted"><%=session.getAttribute("tag") %> </h6>
				     <h6 class="card-subtitle mb-2 text-muted"><%=session.getAttribute("description") %> </h6> --%>
			    </div>
			</div>  
			<div class="col-2">
			  	<div class="card-body">
			  		<a class="card-block stretched-link text-decoration-none" href= "noteDetails.jsp?noteName=<%=session.getAttribute("noteName") %>&start_date=<%=session.getAttribute("start_date")%>&end_date=<%=session.getAttribute("end_date") %>&reminder_date=<%=session.getAttribute("reminder_date") %>&status= <%=session.getAttribute("status") %>&tag=<%=session.getAttribute("tag") %>&description=<%=session.getAttribute("description") %>"></a>
			  		
			  		<%
			  			
						String end_date = (String)(session.getAttribute("end_date"));
				  		NoteDao notedao = new NoteDao();
				  		String email1 = (String)(session.getAttribute("email"));
				  		String status = notedao.status(end_date,email1,(String)(session.getAttribute("noteName")),(String)(session.getAttribute("notebookName")));
				  		session.setAttribute("status", status);
				  		
			  		%>
				   <button type="submit" class="btn btn-primary btn-block" style="background-color:green;" ><%=status %></button>   
			    </div>
			</div>  
			
			<div class="col-6" style = "align-self: center;padding-left:350px;">
					<i class="fa fa-edit"></i>
					<a href="#exampleModalCenter2" class="card-link" data-toggle="modal" data-id="<%=session.getAttribute("noteName") %>,<%=session.getAttribute("notebookName") %>" >Edit</a>&nbsp;&nbsp;&nbsp;
					<i class="fa fa-trash" aria-hidden="true"></i>
			    	<a href="#exampleModalCenter1" class="card-link" data-toggle="modal" data-id="<%=session.getAttribute("noteName") %>,<%=session.getAttribute("notebookName") %>">Delete</a>    
			</div>
			    
		 </div>
	 </div>
	 </div>
	 
	 <div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalCenterTitle" style="text-align:center">Edit Note</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        	<form name = "editForm" action = "editNote" method = "post">
		        		  <div >
						    
						    <input type="hidden" name = "oldEditData" id = "oldEditData" value = "">
						  </div>
						 
		        		  <div >
						    <label for="name">Name</label>
						    <input type="text" name = "name" placeholder="name" required>
						  </div>
						   <div >
						    <label for="start_date">Start Date</label>&nbsp;&nbsp;
						    <input type="date" name = "start_date" placeholder="Start date" required>
						</div>
						<div >
						    <label for="end_date">End Date</label>&nbsp;&nbsp;
						    <input type="date" name = "end_date" placeholder="End date" required>
						</div>
						<div >
						    <label for="reminder_date">Reminder date</label>&nbsp;&nbsp;
						    <input type="date" name = "reminder_date" placeholder="Reminder date" required>
						</div>
						<div >
						   
						    <input type="hidden" name = "status" placeholder="Status" required>
						</div>
						
						<div >
						    <label for="Tag">Tag</label>&nbsp;&nbsp;
						    <input type="text" name = "tag" placeholder="Private/Public" required>
						</div>
						<div >
						    <label for="description">Description</label>&nbsp;&nbsp;
						    <input type="text" name = "description" placeholder="Give a briefing" required>
						</div>
						  
						  <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick = "newNotebook.jsp">Close</button>
					        <button type="submit" class="btn btn-primary" >Save changes</button>
					      </div>
					</form>
		      </div>
		      
		    </div>
		  </div>
	</div>
	
	
	<div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalCenterTitle" style="text-align:center">Delete Note</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        	<form name = "editForm" action = "deleteNote" method = "post">
		        		  
		        		  <div >
						   
						    <input type="hidden" name = "oldDeleteData" id = "oldDeleteData" value = "" >
						  </div>
						  					  
						  <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick = "newNotebook.jsp">Close</button>
					        <button type="submit" class="btn btn-primary" >Confirm delete</button>
					      </div>
					</form>
		      </div>
		      
		    </div>
		  </div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

<script>
	$(document).on("click", ".card-link", function () {
	    var myBookId = $(this).data('id');
	    $(".modal-body #oldEditData").val( myBookId );
	    
	    // As pointed out in comments, 
	    // it is unnecessary to have to manually call the modal.
	     //$('#exampleModalCenter1').modal('show');
	     //$("#notebookName").printThis();
	});

</script>

<script>
	$(document).on("click", ".card-link", function () {
	    var myBookId = $(this).data('id');
	    $(".modal-body #oldDeleteData").val( myBookId );
	    
	    // As pointed out in comments, 
	    // it is unnecessary to have to manually call the modal.
	     //$('#exampleModalCenter1').modal('show');
	     //$("#notebookName").printThis();
	});

</script>
</html>