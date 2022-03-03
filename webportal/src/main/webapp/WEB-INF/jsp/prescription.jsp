<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page errorPage = "error.jsp" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	
    <title>Mail Order Pharmacy</title>
    <style type="text/css">
    
    .navbar-nav {
			margin-top : 25px;
			margin: 10px;
			padding-left: 10px;
            margin-left: auto;
            font-size: 10px;
        }
        
    .w-50{
    	min-width:60%;
    }
    	.half-entry{
    width: 50%;
    float: left;
  }

  } 
    </style>
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
     
    
      <script>
          function openNav() {
  document.getElementById("mySidebar").style.width = "300px";

}

/* Set the width of the sidebar to 0 and the left margin of the page content to 0 */
function closeNav() {
  document.getElementById("mySidebar").style.width = "0";

}

function(){
    $('.datepicker').datepicker({
        format: 'mm-dd-yyyy',
        endDate: '+0d',
        autoclose: true
    });
});

      </script>
    <br><br><br><br><br><br>
    <h2 class="center">Prescription Details</h2>
	<h3 class="center alrtmsg">${msg}</h3>
    <div class="container mt-5">

        <form name="prescriptionform" model="prescriptionDetails" method="post" onsubmit="return validate()"
            action="subscribe">
            <div class="half-entry">
                <div class="row">
                    <div class="col d-flex justify-content-left">
                        <label for="insuranceProvider">Insurance Provider</label>
                    </div>
                    <div class="col d-flex justify-content-left">
                        <input type="text" id="insurancePolicyNumber" class="form-control" name="insuranceProvider" class="w-50" required tabIndex="1">
                        <span class="text-danger" id="insuranceProviderSpan"></span><br>
                    </div>
                </div>
                <div class="row">
                    <div class="col d-flex justify-content-left">
                        <label for="policyNumber">Policy Number</label>

                    </div>
                    <div class="col d-flex justify-content-left">

                        <input type="text" id="insuranceProvider" class="form-control" name="policyNumber" class="w-50" required tabIndex="2">
                        <span class="text-danger" id="policyNumberSpan"></span><br>
                    </div>
                </div>
                <div class="row">
                    <div class="col d-flex justify-content-left">
                        <label for="doctorName">Doctor Name</label><br>
                    </div>
                    <div class="col d-flex justify-content-left">
                        <input type="text" id="drugName" class="form-control" name="doctorName" class="w-50" required tabIndex="3">
                        <span class="text-danger" id="doctorNameSpan"></span><br>
                    </div>
                </div>
                <div class="row">
                    <div class="col d-flex justify-content-left">
                        <label for="prescriptionDate">Prescription Date</label><br>
                    </div>
                    <div class="col d-flex justify-content-left">
                        <input type="date" id="prescriptionDate" max="2021-04-16" class="form-control" name="prescriptionDate" class="w-50" required tabIndex="4">
                        <span class="text-danger" id="prescriptionDateSpan"></span><br>
                    </div>
                </div>
           
                <div class="row">
                    <div class="col d-flex justify-content-left">
                        <label for="Location">Your Location</label>
                    </div>
                    <div class="col d-flex justify-content-left">
                        <input type="text" id="quantity" class="form-control" name="memberLocation" class="w-50" pattern="[A-Za-z]*" oninvalid="this.setCustomValidity('Fill this field with Alphabets!!')" required tabIndex="5">
                        <span class="text-danger" id="memberLocationSpan"></span><br>
                    </div>
                </div>
            </div>
            <div class="half-entry">
                <div class="row">
                    <div class="col d-flex justify-content-left">
                        <label for="drugName">Medicine Name</label>
                    </div>
                    <div class="col d-flex justify-content-left">
                        <input type="text" id="Dosage" class="form-control" name="drugName" class="w-50"   required tabIndex="6">
                        	<!-- pattern="([A-Z]*)|([A-Z0-9]*)|([A-Z0-9 _]*)" oninvalid="this.setCustomValidity('Fill this field with Uppercase Alphabets!!')" -->
                        <span class="text-danger" id="drugNameSpan"></span><br>
                    </div>
                </div>
                <div class="row">
                    <div class="col d-flex justify-content-left">
                        <label for="dosageDefinition">Dosage Definitions</label>
                    </div>
                    <div class="col d-flex justify-content-left">
                        <input type="text" id="Dosage" class="form-control" name="dosageDefinition" class="w-50" required tabIndex="7">
                        <span class="text-danger" id="dosageDefinitionSpan"></span> <br>
                    </div>
                </div>
                <div class="row">
                    <div class="col d-flex justify-content-left">
                        <label for="quantity">Quantity</label>
                    </div>
                    <div class="col d-flex justify-content-left">
                        <input type="number" id="doctorName" class="form-control" name="quantity" min="1" class="w-50" required tabIndex="8">
                        <span class="text-danger" id="quantitySpan"></span><br>
                    </div>
                </div>

                <div class="row">
                    <div class="col d-flex justify-content-left">
                        <label for="courseDuration">Course Duration (in Days)</label>
                    </div>
                    <div class="col d-flex justify-content-left">
                        <input type="number" id="memberLocation" class="form-control" name="courseDuration" min="1" class="w-50" required tabIndex="9">
                        <span class="text-danger" id="courseDurationSpan"></span><br>
                    </div>
                            
                </div>
                  <button type="submit" class="btn btn-primary" style="background-color: green; align:center">Submit</button>
            </div>
 
        </form>
			
    </div>
    
    <br><br>
    <div align="center">
    <img src="https://images.unsplash.com/photo-1565306648685-669fa31ca56e?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=700&q=80" width="400" height="550">
    </div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
    <br><br><br><br>

	<script src="js/Prescription.js"></script>
	<script type="text/javascript">
        $(document).on('keypress', 'input,select', function (e) {
            if (e.which == 13) {
                e.preventDefault();
                var $next = $('[tabIndex=' + (+this.tabIndex + 1) + ']');
                console.log($next.length);
                if (!$next.length) {
                    $next = $('[tabIndex=1]');
                }
                $next.focus().click();
            }
        });
    </script>
    <script type = "text/javascript" > history.pushState(null, null, location.href); history.back(); history.forward(); window.onpopstate = function () { history.go(1); }; </script>
	<style>
body {
	background-color: white;
  background-image: url('images/#');
   background-repeat: no-repeat;
}

.half-entry {
	margin: 5%;
}

</style>

</body>

</html>