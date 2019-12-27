<%--  
	Document	: Message
	Created On	: Jul 29. 2019
	Author		: Zukron Alviandy Rahmadhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Message Page</title>
	</head>
	<body>
		<center>
			<h3><%=request.getAttribute("Message")%></h3>
		</center>
	</body>
</html>