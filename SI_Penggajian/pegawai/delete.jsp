<%--  
	Document	: delete
	Created On	: Jul 22, 2019
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
		<style>
			*{
				margin: auto;
				padding: 0px;
			}
			#con2{
				width: 500px;
				padding: 30px;
			}
			p{
				margin-bottom: 10px;
			}
			label{
				display: inline-block;
				width: 150px;
			}
		</style>
	</head>
	<body>
		<div id="con2">
			<h3 align="center">Delete Data</h3><p></p>
			<form action="" method="post">
				<%
String id = request.getParameter("d");
//int no = Integer.parseInt(nip);

String host = "jdbc:mysql://localhost:3306/mydb";
String user = "zera";
String pwd	= "mean123";

try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection(host,user,pwd);
	Statement stmt = conn.createStatement();
	stmt.executeUpdate("DELETE FROM pegawai WHERE nip ='"+id+"'");
	response.sendRedirect("index.jsp");
}catch(Exception exc){
	//out.println(exc);
}
				%>
			</form>
		</div>
	</body>
</html>