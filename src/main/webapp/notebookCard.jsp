<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</head>
<body>
	<div class="card" style="width:90%;">
		 <div class="container">
			 <div class="row">
			    <div class="col-10">
				  	<div class="card-body">
					    <h5 class="card-title"><%=session.getAttribute("notebookName") %></h5>
					    <h6 class="card-subtitle mb-2 text-muted"><%=session.getAttribute("count") %> Notes</h6>
				    </div>
				</div>  
				<div class="col-2" style = "align-self: center">
						<i class="fa fa-edit"></i>
						<a href="#exampleModalCenter2" class="card-link" data-toggle="modal" data-id="<%=session.getAttribute("notebookName")%>" >Edit</a>&nbsp;&nbsp;&nbsp;
						<i class="fa fa-trash" aria-hidden="true"></i>
				    	<a href="#exampleModalCenter1" class="card-link" data-toggle="modal" data-id="<%=session.getAttribute("notebookName")%>">Delete</a>    
				</div>
				    
			 </div>
		 </div>
	</div>
	
	
	
	<div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalCenterTitle" style="text-align:center">Delete Notebook</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        	<form name = "editForm" action = "deleteNoteBook" method = "post">
		        		  
						  <div >
						   	<input type="hidden" name = "notebookName" id = "notebookName" value = "" >
						    
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
	
	<div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalCenterTitle" style="text-align:center">Edit Notebook</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        	<form name = "editForm" action = "editnotebook" method = "post">
		        		   <div >
						    
						    <input type="hidden" name = "oldName" id = "oldName" value = "">
						  </div> 
		        		  <div >
						    <label for="name">New Name</label>
						    <input type="text" name = "name" placeholder="New notebook name" required>
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
</body>
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

<script>
	$(document).on("click", ".card-link", function () {
	    var myBookId = $(this).data('id');
	    $(".modal-body #notebookName").val( myBookId );
	    
	    // As pointed out in comments, 
	    // it is unnecessary to have to manually call the modal.
	     //$('#exampleModalCenter1').modal('show');
	     //$("#notebookName").printThis();
	});

</script>

<script>
	$(document).on("click", ".card-link", function () {
	    var myBookId = $(this).data('id');
	    $(".modal-body #oldName").val( myBookId );
	    
	    // As pointed out in comments, 
	    // it is unnecessary to have to manually call the modal.
	     //$('#exampleModalCenter1').modal('show');
	     //$("#notebookName").printThis();
	});

</script>
</html>