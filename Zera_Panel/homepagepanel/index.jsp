<%--  
	Document	: homepagepanel
	Created On	: Agus 2, 2019
	Author		: Zukron Alviandy Rahmadhan
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="icon" href="static/img/favicon.jpg" type="image/gif" sizes="16x16">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Panel</title>
		<style>
			<%@ include file="style.css"%>
		</style>
	</head>
	<body>
		<%
if((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")){
		%>
		<center>
			<h1>Anda belum login</h1>
			<p>Silahkan login <a href="Panel?action=login">disini</a></p>
		</center>
		<% }else{ 
	String host = "jdbc:mysql://localhost:3306/zera_panel";
	String user = "zera";
	String pwd = "mean123";

	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host,user,pwd);
		Statement stmt = conn.createStatement();
		String username = session.getAttribute("userid").toString(); //mendapatkan username yang sedang login

		String sql = "SELECT * FROM profile where username = '"+username+"'";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
		%>
		<div class="header">
			<button class="openbtn" onclick="openNav()">&#9776;</button>
			<h1>Zera</h1>
		</div>

		<div class="sidebaropen" id="mySidebar">
			<button class="closebtn" onclick="closeNav()">&times;</button>
			<div class="fotoprofil"></div>
			<p>Selamat datang <br>
				<%=rs.getString("fullname")%> <br>
				Saldo Rp.<%=rs.getString("saldo")%>
			</p>
			<a href="Panel">Home</a>
			<a href="Panel?action=profile">Profile</a>
			<a href="#">About</a>
			<a href="Panel?action=logout">Logout</a>
		</div>
		
		<center>
			<div id="main">
				<ul>
					<li><a href="Panel?action=transfer">Transfer</a></li>
					<li><a href="Panel?action=deposit">Deposit</a></li>
					<li><a href="Panel?action=withdraw">Withdraw</a></li>
				</ul>
			</div>
		</center>
		<%
		}
	}catch(Exception e){
		
	}
		}
		%>
		<script src="homepagepanel/script.js"></script>
	</body>
</html>