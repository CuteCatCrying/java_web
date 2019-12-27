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
		<title>Login Page</title>
		<style>
			<%@include file="style.css"%>
		</style>
	</head>
	<body>
		<form action="./proseslogin" method="post">
			<center>
				<table border="0" width="30%" cellpadding="3">
					<thead>
						<tr>
							<th colspan="2">Login Here</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Username</td>
							<td><input type="text" name="username" value=""></td>
						</tr>
						<tr>
							<td>Password</td>
							<td><input type="password" name="password" value=""></td>
						</tr>
						<tr>
							<td><button type="submit">Submit</button></td>
							<td><button type="reset">Reset</button></td>
						</tr>
						<tr>
							<td colspan="2">Belum terdaftar ?<a href="Panel?action=registration">Daftar disini</a></td>
						</tr>
					</tbody>
				</table>
			</center>
		</form>
	</body>
</html>