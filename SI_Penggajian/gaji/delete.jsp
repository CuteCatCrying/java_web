<%--  
	Document	: delete
	Created On	: Jul 28, 2019
	Author		: Zukron Alviandy Rahmadhan
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="icon" href="../static/img/favicon.jpg" type="image/gif" sizes="16x16">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>JSP Page</title>
	</head>
	<body>
		<%
String a = request.getParameter("a");
String host = "jdbc:mysql://localhost:3306/mydb";
String user = "zera";
String pwd	= "mean123";
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(host,user,pwd);
	Statement stmt = conn.createStatement();
	stmt.executeUpdate("Delete from gaji where nobukti='"+a+"'");
	response.sendRedirect("index.jsp");
}catch(Exception e){
	out.println(e);
}
		%>
	</body>
</html>