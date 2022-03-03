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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="style/index.css" />
    <!-- <link rel="stylesheet" href="stylepopupbro.css" /> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<!-- Favicons -->
<link href="images/favicon.png" rel="icon">
<link href="images/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Poppins:300,400,500,700"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
    <title>Mail Order Pharmacy</title>
</head>

<body>



    <nav class="navbar navbar-expand-sm"> 
        <a class="navbar-brand text-black" href="home"><img width="60px"
			height="60px" src="images/OPTIMUS PHARMA.png">Optimus Pharma</a>
        <ul class="navbar-nav ml-auto"> 
            <li class="nav-item"> 
                <a class="nav-link text-secondary" href="supportedDrugs">
                 Available Drugs
                </a> 
            </li> 
            <li class="nav-item"> 
                <a class="nav-link text-secondary" href="search"> 
                  Search Drugs
                </a> 
            </li> 
            <li class="nav-item"> 
                <a class="nav-link text-secondary" href="prescriptionform"> 
                  Subscribe
                </a> 
            </li> 
            <li class="nav-item"> 
                <a class="nav-link text-secondary" href="subscriptions"> 
                  Subscriptions
                </a> 
            </li> 
            <li class="nav-item"> 
                <a class="nav-link text-secondary" href="/webportal/getAllRefill"> 
                  Refill Status
                </a> 
            </li> 
            <li class="nav-item"> 
                <a class="nav-link text-secondary" href="refillDateEntry"> 
                  Refill Due Date
                </a> 
            </li> 
            <li class="nav-item"> 
                <a class="nav-link text-secondary" href="logout"> 
                  Logout
                </a> 
            </li> 
        </ul> 
    </nav> 

  
    
     
    <br><br><br><br><br><br>
    <div class="md-form md-bg input-with-pre-icon">
          <form name="dueForRefill" model="dateModel" action="/webportal/refillDueAsOfDate" method="post">
          <div class="row">
          <div class="col d-flex justify-content-center">
          <label for="example-date-input" >Date</label>
          </div>
           <div class="col d-flex justify-content-left">
            <input class="w-25" type="date" name ="date" id="example-date-input" required="required">
            </div>
            <br>
          </div>
          <button type="submit" class="btn btn-success btn-lg mt-2" style="margin-left:55%; col">Submit</button>
          </form>
          </div>


    <script>
        function openNav() {
document.getElementById("mySidebar").style.width = "300px";


}

/* Set the width of the sidebar to 0 and the left margin of the page content to 0 */
function closeNav() {
document.getElementById("mySidebar").style.width = "0";
}
    </script>
     <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script type = "text/javascript" > history.pushState(null, null, location.href); history.back(); history.forward(); window.onpopstate = function () { history.go(1); }; </script>
	
			<style>
body {
	background-color: white;
 background-repeat: no-repeat;
  background-image: url('images/#');
  background-size: 100% 500%;
}

.navbar-nav {
			margin-top : 25px;
			margin: 10px;
			padding-left: 10px;
            margin-left: auto;
            font-size: 10px;
        }


</style>
</body>

</html>