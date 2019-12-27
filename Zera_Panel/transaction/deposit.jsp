<%--  
	Document	: Deposit
	Created On	: Agus 29, 2019
	Author		: Zukron Alviandy Rahmadhan
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="icon" href="static/img/favicon.jpg" type="image/gif" sizes="16x16">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Deposit Page</title>
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
		<%
		}
	}catch(Exception e){ // jika gagal membuat koneksi dengan database
		
	}
		%>
		<center>
			<form action="./prosesdeposit" method="post">

				<table>
					<thead>
						<tr>
							<th colspan="2">Deposit</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Sumber Dana</td>
							<td>
								<select name="sumberdana">
									<option value="Bank">Bank</option>
									<option value="OVO">OVO</option>
									<option value="Gopay">Gopay</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>

				<table>
				</table>

				<table>
					<tbody>
						<tr>
							<td colspan="3"><button type="submit">Send</button></td>
						</tr>
					</tbody>
				</table>
			</form>
		</center>
		<script src="transaction/javascript/scriptDepo.js"></script>
	</body>
</html>