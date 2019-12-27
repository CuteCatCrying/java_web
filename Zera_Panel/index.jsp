<%--  
	Document	: index
	Created On	: Jul 30, 2019
	Author		: Zukron Alviandy Rahmadhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="icon" href="static/img/favicon.jpg" type="image/gif" sizes="16x16">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Zera Panel</title>
	</head>
	<style>
		<%@include file="static/css/style.css"%>
	</style>
	<body>
		<div class="header">
			<button class="openbtn" onclick="openNav()">&#9776;</button>
			<h1>Zera</h1>
		</div>

		<div class="sidebaropen" id="mySidebar">
			<button class="closebtn" onclick="closeNav()">&times;</button>
			<a href="Panel?action=login">Login</a>
			<a href="#">About</a>
		</div>

		<div id="main">
			<p>
				Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quasi maxime dignissimos reiciendis facere in. Ex esse eaque officiis. Quisquam nulla numquam atque, esse in inventore aperiam? Praesentium quis, minus optio!
			</p>
				<br>
			<p>
				Lorem ipsum dolor sit amet, consectetur adipisicing elit. In recusandae perspiciatis, inventore expedita voluptatum quas velit alias quis blanditiis odit soluta dignissimos sit sequi non corporis animi dolorum? Ut, animi?
			</p>
		</div>
	</body>
	<script>
		/* Set the width of the sidebar to 250px and the left margin of the page content to 250px */
		function openNav() {
		  document.getElementById("mySidebar").style.width = "250px";
		  document.getElementById("main").style.marginLeft = "250px";
		}

		/* Set the width of the sidebar to 0 and the left margin of the page content to 0 */
		function closeNav() {
		  document.getElementById("mySidebar").style.width = "0";
		  document.getElementById("main").style.marginLeft = "0";
		} 
	</script>
</html>