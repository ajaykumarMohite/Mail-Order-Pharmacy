<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page errorPage = "error.jsp" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<link rel="stylesheet" href="style/index.css" />
<!-- <link rel="stylesheet" href="stylepopupbro.css" /> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Mail Order Pharmacy</title>
</head>

<body>

	<nav class="navbar navbar-inverse ">
		<a href="/webportal/home" class="navbar-brand"><img width="60px" height="60px"src="images/OPTIMUS PHARMA.png"> Optimus Pharma 	
		  </a>
		
		<div class="" id="navbarText">
			<ul class="navbar-nav mr-auto text-center">
				<!-- <li class="nav-item"> -->
				<a class="nav-link"
					onclick="document.getElementById('loginModal').style.display='block'"
					id="loginBtn"><b>LOGIN</b></a>
				<!-- </li> -->
			</ul>
		</div>
	</nav>

	<br>
	<br>
	<br>

	<div id="loginModal" >

		<form class="modal-content animate" name="loginform" model="UserData"
			method="post" action="anotherlogin">
			<h1 class="center"><img width="60px" height="60px"src="images/OPTIMUS PHARMA.png">Login</h1>
			<span
				onclick="document.getElementById('loginModal').style.display='none'"
				class="closeModal" title="Close Modal">&times;</span> <br>
			<br>
			<div class="containernew">
				<!-- <label for="username"><b>Username</b></label> -->
				<fieldset>
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span >Username  :</span>
					<input type="text" placeholder="" name="userid" id="username"
						required> 
				</fieldset>
				<!-- <label for="password"><b>Password</b></label> -->
				<br>
				<fieldset>
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span >Password  :</span>
					<input type="password" name="upassword" placeholder=""
						id="password" required> 
				
				</fieldset>
				<button type="submit" id="loginSubmit">Login</button>
				<button type="reset" id="clear">Clear</button>

			</div>
			<p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span class="alrtmsg">${errormsg}</span></p>
		</form>
	</div>
	<br>


	<script>
		var modal = document.getElementById('loginModal');

		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
	<script type = "text/javascript" > history.pushState(null, null, location.href); history.back(); history.forward(); window.onpopstate = function () { history.go(1); }; </script>
	<style>
body {
  background-color: #f5f5f5;
}
</style>
</body>
</html>