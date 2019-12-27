<%--  
	Document	: admin
	Created On	: Jul 29, 2019
	Author		: Zukron Alviandy Rahmadhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Halaman Admin</title>
	</head>
	<body>
		<%
if((session.getAttribute("username") == null) || (session.getAttribute("hak_akses") == "Pelanggan")){
	response.sendRedirect("index.jsp");
}
		%>
		<h1>Hallo <%=session.getAttribute("username")%></h1>
		<a href="Login?proses=logout">Log Out</a>
	</body>
</html>