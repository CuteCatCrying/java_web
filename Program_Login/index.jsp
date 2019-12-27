<%--  
	Document	: index
	Created On	: Jul 28, 2019
	Author		: Zukron Alviandy Rahmadhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="icon" href="static/img/favicon.jpg" type="image/gif" sizes="16x16">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Login Page</title>
	</head>
	<body>
		<form method="post" action="login.jsp">
			<center>
				<table border="1" width="30%" cellpadding="3">
					<thead>
						<tr>
							<th colspan="2">Login Here</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>User Name</td>
							<td><input type="text" name="username" value=""></td>
						</tr>
						<tr>
							<td>Password</td>
							<td><input type="text" name="password" value=""></td>
						</tr>
						<tr>
							<td><input type="submit" value="Login"></td>
							<td><input type="reset" value="Reset"></td>
						</tr>
						<tr>
							<td colspan="2">Yet Not Registered!! <a href="registrasi.jsp">Register Here</a></td>
						</tr>
					</tbody>
				</table>
			</center>
		</form>
	</body>
</html>