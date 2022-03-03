<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page errorPage = "error.jsp" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

    <title>Mail Order Pharmacy</title>
    <style type="text/css">
    .flip-card {
  background-color: transparent;
  width: 300px;
  height: 300px;
  perspective: 1000px;
  margin-right: 5px;
}

.flip-card-inner {
  position: relative;
  width: 105%;
  height: 100%;
  text-align: center;
  transition: transform 0.6s;
  transform-style: preserve-3d;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  line-height: 90%;
}

.flip-card:hover .flip-card-inner {
  transform: rotateY(180deg);
}

.flip-card-front, .flip-card-back {
  position: absolute;
  width: 100%;
  height: 100%;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
}

.flip-card-front {
  background-color: #FFFAF0;
  color: black;
}

.navbar-nav {
			margin-top : 25px;
			margin: 10px;
			padding-left: 10px;
            margin-left: auto;
            font-size: 10px;
        }

.flip-card-back {
  background-color: #2980b9;
  color: white;
  transform: rotateY(180deg);
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

    
     
    <br><br><br><br><br>
    <h1 class="center " style="color: black;"><b>INVENTORY</b></h1>
	<br><br>
	<section id="services">
        <div class="container">
            <div class="row">
                <c:forEach items="${drugList}" var="itr">

                    <div class="flip-card col-6">
                        <div class="flip-card-inner">
                            <div class="flip-card-front ">

                                <!-- <img src="img_avatar.png" alt="Avatar" style="width:300px;height:300px;"> -->
                                <h1 class="drugname">${itr.drugName}</h1><br>
                                <h6>Manufactured by: ${itr.manufacturer}</h6><br>
                                <h6>Manufacture Date: ${itr.manufactureDate}</h6><br>
                                <h6>Expiry Date: ${itr.expiryDate}</h6><br>

                            </div>
                            <div class="flip-card-back">

                                    <h1 class="availability">Availability</h1><br>
                                <c:forEach items="${itr.druglocationQuantities}" var="itr1">
                                    <p>${itr1.location} : ${itr1.quantity}</p><br>
                                    <!-- <p>${itr1.quantity}</p> -->
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    
                    <br>



                </c:forEach>
            </div>
        </div>
    </section>
  

    <br><br><br><br>


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
		body{
			background-color:white;
			background-image: url('images/#');
		}
		.drugname{
			color:#A0522D;
		}
		.availability{
			color:white;
		}
	</style>
  </body>

</html>