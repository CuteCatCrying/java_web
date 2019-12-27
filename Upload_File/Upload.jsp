<%--  
	Document	: Upload
	Created On	: Jul 29, 2019
	Author		: Zukron Alviandy Rahmadhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Upload Page</title>
	</head>
	<body>
		<center>
			<h1>File Upload to Database Demo</h1>
			<form method="post" action="uploadServlet" enctype="multipart/form-data">
				<table border="0">
					<tr>
						<td>Portrait Photo</td>
						<td><input type="file" name="photo" size="50"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="Save"></td>
					</tr>
				</table>
			</form>
		</center>
	</body>
</html>