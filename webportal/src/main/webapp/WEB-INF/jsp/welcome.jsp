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
	
<style type="text/css">
.image {
	width: 20%;
	margin-top: -15%;
}

.navbar-nav {
			margin-top : 25px;
			margin: 10px;
			padding-left: 10px;
            margin-left: auto;
            font-size: 10px;
        }
        
li:hover {
	color: grey;
 }

.reverse {
	transform: rotateY(180deg);
	margin-left: 80%;
	margin-top: -19%;
}
</style>

<title>Mail Order Pharmacy</title>
</head>

<body class="bwelcome"  >

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


	<br>
	<br>
	<br>
	<div class="typ">
		<h1>
			<p class="typewrite" style="margin-right: 37%" data-period="1000"
				data-type='[ "Welcome to Mail Order Pharmacy....", "A pharmacy your family can trust!!","As reliable as your family.", "We got all your health needs covered!!", "Count on us.." ]'>
				<span class="wrap"></span>
			</p>
		</h1>
	</div>
<br>

	<div class="container">
		<div class="row gx-5 gy-5">
			<div class="col-md-6 col-12">
				<div class=" p-3 bg-grey">
					<div class="col-12 d-flex mt-2 justify-content-center">
						<h3>Medications and more right to your door.</h3>
					</div>
					<div class="col-12 p-4 mt-2 d-flex text-wrap text-center">
						<p>Small enough to know you, Big Enough to serve your every need. Get Medicines Delivered at your doorstep when and where you need..</p>
					</div>
				</div>
			</div>

			<div class="row gx-8 gy-8">
				<div class="p-3 bg-grey">
					<div class="col-12 d-flex mt-2 justify-content-left">
						<h3 class="spinner-grow text-success"> &nbsp OFFER!! &nbsp</h3>
					</div>
					<div class="col-12 mt-2 p-4 d-flex text-wrap text-center">
						<p>We have got you covered ..
							Order now and experience one day delivery for orders above
							&#8377;5000.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="card-group">
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <div class="col-sm-3">
                <div class="card">
                    <img class="card-img-top" src="https://images.unsplash.com/photo-1501250987900-211872d97eaa?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTIxfHxzZWFyY2glMjBkcnVnc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">SEARCH DRUGS</h5>
                        <p class="card-text"><ul>
                        	<li>Search Drugs by Name / ID ·</li>
                         	<li>Get Dispatchable Stock of a Drug by Location</li>
                        </ul>
                        </p>
                    </div>
                </div>
            </div>
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <div class="col-sm-3">
                <div class="card">
                    <img class="card-img-top" src="https://images.unsplash.com/photo-1563213126-a4273aed2016?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">You can REFILL DRUGS ANYTIME</h5>
                        <p class="card-text"><ul>
                        	<li>View Last Refill for the Subscriptions · </li>
                         	<li>Get Prescriptions that are Due For Refill.</li>
                        </ul>
                        </p>
                    </div>
                </div>
            </div>
			
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <div class="col-sm-3">
                <div class="card">
                    <img class="card-img-top" src="https://exam4enterprise.com/wp-content/uploads/2017/11/Unsubscribe-510.png" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">SUBSCRIBE / UNSUBSCRIBE</h5>
                        <p class="card-text"><ul>
                        	<li>On one click you can subscribe as well as unsubscribe to our service.</li>
                        </ul>
                        </p>
                    </div>
                </div>
            </div>
	</div>
	
	
	

	<!-- <img src="COVID_19_IEC_ENG86.jpg" class="image"> -->
	<!--<img src="images/#" style="width: 70%; margin: 20%;">-->

	<br>
	<br>
	<br>
	<br>




	<script>
		var TxtType = function(el, toRotate, period) {
			this.toRotate = toRotate;
			this.el = el;
			this.loopNum = 0;
			this.period = parseInt(period, 10) || 2000;
			this.txt = '';
			this.tick();
			this.isDeleting = false;
		};

		TxtType.prototype.tick = function() {
			var i = this.loopNum % this.toRotate.length;
			var fullTxt = this.toRotate[i];

			if (this.isDeleting) {
				this.txt = fullTxt.substring(0, this.txt.length - 1);
			} else {
				this.txt = fullTxt.substring(0, this.txt.length + 1);
			}

			this.el.innerHTML = '<span class="wrap">' + this.txt + '</span>';

			var that = this;
			var delta = 200 - Math.random() * 100;

			if (this.isDeleting) {
				delta /= 2;
			}

			if (!this.isDeleting && this.txt === fullTxt) {
				delta = this.period;
				this.isDeleting = true;
			} else if (this.isDeleting && this.txt === '') {
				this.isDeleting = false;
				this.loopNum++;
				delta = 500;
			}

			setTimeout(function() {
				that.tick();
			}, delta);
		};

		window.onload = function() {
			var elements = document.getElementsByClassName('typewrite');
			for (var i = 0; i < elements.length; i++) {
				var toRotate = elements[i].getAttribute('data-type');
				var period = elements[i].getAttribute('data-period');
				if (toRotate) {
					new TxtType(elements[i], JSON.parse(toRotate), period);
				}
			}
		
		};

		Resources
	</script>


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
  	background-image: url('https://images.unsplash.com/photo-1613918108466-292b78a8ef95?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1055&q=80');	
}

#card-group {
	margin: 20%;
}

</style>
	
	
</body>
</html>