<%--  
	Document	: Index
	Created On	: Agus 22, 2019
	Author		: Zukron Alviandy Rahmadhan
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="icon" href="static/img/favicon.jpg" type="image/gif" sizes="16x16">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Profile Page</title>
		<style>
			<%@ include file="style.css"%>
		</style>
	</head>
	<body>
		<%
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
			<h1>Zera</h1>
		</div>

		<div class="sidebaropen" id="mySidebar">
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
			<form action="./updateprofile" method="post">
				<table>
					<thead>
						<tr>
							<th colspan="5">Update Profile</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="hidden" name="username" value='<%=rs.getString("username")%>'></td>
						</tr>
						<tr>
							<td rowspan="5"><img src="" alt="">Gambar</td>
							<td>Fullname</td>
							<td>:</td>
							<td><input type="text" name="fullname" value='<%=rs.getString("fullname")%>'></td>
						</tr>
						<tr>
							<td>Email</td>
							<td>:</td>
							<td><input type="text" name="email" value='<%=rs.getString("email")%>'></td>
						</tr>
						<tr>
							<td>No Hp</td>
							<td>:</td>
							<td><input type="text" name="nohp" value='<%=rs.getString("nohp")%>'></td>
						</tr>
						<tr>
							<td>Jenis Kelamin</td>
							<td>:</td>
							<td>
								<input type="radio" name="jekel" value="Laki-laki">Laki-laki
								<input type="radio" name="jekel" value="Perempuan">Perempuan
							</td>
						</tr>
						<tr>
							<td colspan="4" style="text-align:center;"><button type="submit">Save</button></td>
						</tr>
					</tbody>
				</table>
			</form>
		</center>
		<%
		}
	}catch(Exception e){ // jika gagal membuat koneksi dengan database
		
	}
		%>
		<script src="profile/script.js"></script>
	</body>
</html>