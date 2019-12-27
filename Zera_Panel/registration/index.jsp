<%--  
	Document	: Index
	Created On	: Agus 19, 2019
	Author		: Zukron Alviandy Rahmadhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="icon" href="static/img/favicon.jpg" type="image/gif" sizes="16x16">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Registration Page</title>
		<style>
			<%@include file="style.css"%>
		</style>
	</head>
	<body>
		<center>
			<form action="./prosesregis" method="post">
				<table border="0" width="30%" cellpadding="3">
					<thead>
						<tr>
							<th colspan="2">Registration Here</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Full Name</td>
							<td><input type="text" name="fullname" value=""></td>
						</tr>
						<tr>
							<td>Email</td>
							<td><input type="text" name="email"></td>
						</tr>
						<tr>
							<td>Username</td>
							<td><input type="text" name="username" value=""></td>
						</tr>
						<tr>
							<td>Password</td>
							<td><input type="password" name="password"></td>
						</tr>
						<tr>
							<td>Confirm Password</td>
							<td><input type="password" name="confpassword"></td>
						</tr>
						<tr>
							<td><button type="submit">Regist</button></td>
							<td><button type="reset">Reset</button></td>
						</tr>
						<tr>
							<td colspan="2">Sudah terdaftar ?<a href="Panel?action=login">Login disini</a></td>
						</tr>
					</tbody>
				</table>
			</form>
		</center>
	</body>
</html>