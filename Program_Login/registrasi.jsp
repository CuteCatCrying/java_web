<%--  
	Document	: registrasi
	Created On	: Jul 28, 2019
	Author		: Zukron Alviandy Rahmadhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="icon" href="static/img/favicon.jpg" type="image/gif" sizes="16x16">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Registration Page</title>
	</head>
	<body>
		<form action="prosesregis.jsp" method="post">
			<center>
				<table border="1" width="30%" cellpadding="5">
					<thead>
						<tr>
							<th colspan="2">Enter Information</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Username</td>
							<td><input type="text" name="username" value=""></td>
						</tr>
						<tr>
							<td>Password</td>
							<td><input type="text" name="password" value=""></td>
						</tr>
						<tr>
							<td>Email</td>
							<td><input type="text" name="email" value=""></td>
						</tr>
						<tr>
							<td><input type="submit" value="Submit"></td>
							<td><input type="reset" value="Reset"></td>
						</tr>
						<tr>
							<td colspan="2">Already Registered!! <a href="index.jsp">Login Here</a></td>
						</tr>
					</tbody>
				</table>
			</center>
		</form>
	</body>
</html>