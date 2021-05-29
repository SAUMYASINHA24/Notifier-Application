<!DOCTYPE html>
<html>
<%@ page import ="com.addNote.NoteDao" %>
<%@ page import ="com.addNotebook.NoteBookDao" %>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<head>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
   
    <script src = "bootstrap.bundle.min.js / bootstrap.bundle.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
  
</head>

<body>
    <div class="wrapper">
        
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>Hi Saumya</h3>
            </div>
		<%-- class="active"--%>
            <ul class="list-unstyled components">
                
                <li>
                    <a href="newNotebook.jsp">Notebooks</a>
                    
                </li>
                <li>
                    <a href="newNote.jsp">Notes</a>
                </li>
                <li>
                    <a href="#" data-toggle="modal" data-target="#exampleModalCenter3">Edit User</a>
                </li>
                <li>
                    <a href="#" data-toggle="modal" data-target="#exampleModal4" >Your Today's tasks</a>
                </li>
            </ul>

        </nav>

        <!-- Page Content  -->
        <div id="content">

            <nav class="navbar navbar-expand-lg navbar-light bg-light" style = "background-color: #212529 !important ">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-left"></i>
                        
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>
					<%
	                                NoteDao notedao1 = new NoteDao();
	        						List<ArrayList<String>> reminders = notedao1.reminder((String)(session.getAttribute("email")));
	        						
	        						String finalValue = "";
	        						for(int i = 0; i < reminders.size(); i+=1)
	        						{
	        							session.setAttribute("reminderNote", reminders.get(i).get(0));
	        	            			session.setAttribute("reminderStartDate", reminders.get(i).get(1));
	        	            			finalValue += "Name: "+reminders.get(i).get(0)+"<br>Start date: "+reminders.get(i).get(1)+"<br>";
	        						}
	        						
                     %>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto" >
                            <li class="nav-item active" >
                                <a class="nav-link" href="#" style = "color: white;" id = "trial" data-html="true" data-toggle="popover" data-placement="bottom" title="Reminders" 
                                data-content="<%=finalValue %>">                            
          			<i class="fas fa-bell"></i></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp" style = "color: white;"><i class="fas fa-sign-out-alt"></i>Logout</a>
                            </li>
                            
                        </ul>
                    </div>
                </div>
            </nav>
            
            		<div style = "padding-left:860px;" >
            			<input type ="text" placeholder = "Search">
            			<button style = "background-color:green;" ><i class="fa fa-search" aria-hidden="true"></i></button>
            		</div>
            		<h3>Notes</h3><br>
            		
            		<%
						NoteDao nd = new NoteDao();
						HttpSession session1 = request.getSession();
						String email = (String)(session1.getAttribute("email"));
					
							List<ArrayList<String>> notes = nd.getNote(email);
												
		            		for(int i = 0; i < notes.size(); i+=1) 
		            		{ 	
		            			
	            				session1.setAttribute("noteName", notes.get(i).get(0));
	            				session1.setAttribute("start_date", notes.get(i).get(1));
	            				session1.setAttribute("end_date", notes.get(i).get(2));
	            				session1.setAttribute("reminder_date", notes.get(i).get(3));
	            				session1.setAttribute("status", notes.get(i).get(4));
	            				session1.setAttribute("tag", notes.get(i).get(5));
	            				session1.setAttribute("description", notes.get(i).get(6));
	            				session1.setAttribute("notebookName", notes.get(i).get(7));
	            				%>
	            				<%@include file='noteCard.jsp'%><br> 
		          				
		          			<% } %>	
          			
        </div>
        <div class="modal fade" id="exampleModalCenter3" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalCenterTitle" style="text-align:center">Edit User</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        	<form name = "editForm" action = "edituser" method = "post">
		        		<div >
						    <label for="username">Username</label>
						    <input type="username" name = "username" placeholder="username" required>
						  </div>
						  <div >
						    <label for="phone">Mobile Number</label>
						    <input type="phone" name = "phone" placeholder="Enter 10 digits" required>
						  </div>
						  <div >
						    <label for="email">Email address</label>
						    <input type="email" name = "email" placeholder="email@example.com" required>
						  </div>
						  <div >
						    <label for="password">Password</label>
						    <input type="password"  name="password" placeholder="Password" required>
						  </div>
						  <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick = "dashboard.jsp">Close</button>
					        <button type="submit" class="btn btn-primary" >Save changes</button>
					      </div>
					</form>
		      </div>
		      
		    </div>
		  </div>
		</div>
		
		<div class="modal fade" id="exampleModalCenter4" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalCenterTitle" style="text-align:center">Edit User</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        	hello
		      </div>
		      
		    </div>
		  </div>
		</div>
		
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Add Note</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        	<form name = "newNote" action = "addNote" method = "post">
		        		<div >
						    <label for="name">Name</label>&nbsp;&nbsp;
						    <input type="text" name = "name" placeholder="Note name" required>
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
						    <label for="notebookName">Notebook name</label>&nbsp;&nbsp;
						    <input type="text" name = "notebookName" placeholder="NoteBook name" required>
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
					        <button type="submit" class="btn btn-primary" >Save changes</button>      
					      </div>
					</form>
		      </div>
		      
		    </div>
		  </div>
		</div>
		
		<div class="modal fade" id="exampleModal4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Your daily tasks!!!</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        	<%
		        		NoteDao nbd = new NoteDao();
						HttpSession session2 = request.getSession();
						String email1 = (String)(session1.getAttribute("email"));	
						List<ArrayList<String>> tasks = nbd.todayTasks(email);
		        	%>
		        	<% for(int i = 0; i < tasks.size(); i+=1) { %>
            			<%
            				session1.setAttribute("noteName", tasks.get(i).get(0));
            				session1.setAttribute("start_date", tasks.get(i).get(1));
            				session1.setAttribute("end_date", tasks.get(i).get(2));
            			%>
            			<div class="card-body">
						   
						    <p style = "color:blue;">Name: <%=session.getAttribute("noteName") %></p>
						    <p style = "color:black;">Start date: <%=session.getAttribute("start_date") %></p>
						    <p style = "color:black;">End date: <%=session.getAttribute("end_date") %></p>
						    
						</div>
          				 
          				
          			<% } %>
		      </div>
		      
		    </div>
		  </div>
		</div>
    </div>

    <!-- jQuery CDN - Slim version (=without AJAX) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
	
    <script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });

        
    </script>
    <script>
    $('#trial').popover({
    	  sanitize: false,
    	  
    	})
    
	</script>
</body>

</html>