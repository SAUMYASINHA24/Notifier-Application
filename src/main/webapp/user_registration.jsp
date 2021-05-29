<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link href="frontpage.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">
    <link href="../../../../dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="navbar.css" rel="stylesheet">
	<script>
	function Validation()
	{
		var emailid = document.signup_form.email.value;
		var num = document.signup_form.phone.value;
		var password = document.signup_form.password.value;
		var confirm_password = document.signup_form.confirm_password.value;
		atpos = emailid.indexOf("@"); 
		dotpos = emailid.lastIndexOf("."); 

	    if (atpos< 1 || ( dotpos - atpos<=3 ) || (emailid.length-1)==dotpos)           
         { 
           alert("Please enter correct email ID");
		   document.signup_form.email.focus() ;   
		   return false;          
		             
         }
        else if (isNaN(num) || num.length!=10)
         {    
			 document.getElementById("phone");      
			 alert("Please enter numeric 10 digit phone number");
			document.signup_form.phone.focus() ; 		 
			     return false;
		 }
        else if(password!=confirm_password)
        {
			document.getElementById("confirm_password");
			alert("Passwords do not match");
			document.signup_form.confirm_password.focus();
			return false;	
        }
         else
         {    
          	return true;
         } 
	}; 
	
	</script>
	<!--  <style type="text/css">
	body
	{
  		background-color:#FFFACD;
	}
	
	</style>-->
	
<title>Insert title here</title>
</head>
<body class="login_body">
	

		
			<!-- 
			
				<form  method="post" action = "UserRegistration" name = "signup_form" id="form1">  
			  <div class="container">
			  	
			    <label for="email"><b>Email</b></label>
			    <input type="email" placeholder="Enter email-id" name="email" required>
			    <label for="phone"><b>Contact</b></label>
			    <input type="text" placeholder="Enter contact number" name="phone" required>
			    <label for="username"><b>Username</b></label>
			    <input type="text" placeholder="Create Username" name="username" required>
			
			    <label for="password"><b>Password</b></label>
			    <input type="password" placeholder="Create Password" name="password" required>
			    <label for="confirm_password"><b>Confirm Password</b></label>
			    <input type="password" placeholder="Confirm Password" name="confirm_password" required>   
			    <button type="submit" onclick="return (Validation());">Register</button>
			  </div>
			  <div class="container" style="background-color:#f1f1f1">
			    Already a member?<span class="login"><a href = "login.jsp">Login</a></span>
			  </div>
			</form>
		</div>	
	</div>
</body>
			 -->



  
    <form class="form-signin" action = "UserRegistration" name = "signup_form" id="form1" method = "post">
      
      <h1 class="h3 mb-3 font-weight-normal" style = "padding-left:30px;color:blue">Please sign up</h1>
      <label for="email" class="sr-only">Email address</label>
      <input type="email" id="email" name = "email" class="form-control" placeholder="Email address" required autofocus>
      
      
      <label for="phone" class="sr-only">Mobile Number</label>
      <input type="text" id="phone" name = "phone" class="form-control" placeholder="Contact number" required >
      
      <label for="username" class="sr-only">Username</label>
      <input type="text" id="username" name = "username" class="form-control" placeholder="Username" required >
           
      <label for="password" class="sr-only">Password</label>
      <input type="password" id="password" name ="password" class="form-control" placeholder="Password" required>
      
      <label for="confirm_password" class="sr-only">confirm_password</label>
      <input type="password" id="confirm_password" name = "confirm_password" class="form-control" placeholder="confirm_password" required >
      
      <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="return (Validation());">Register</button>
      <div class="form-group">
         <p class="text-center">Already a member? <a href="login.jsp" id="signup">Login</a></p>
      </div>
    </form>
  </body>
</html>