<%--  
	Document	: show
	Created On	: Jul 29, 2019
	Author		: Zukron Alviandy Rahmadhan
--%>

<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Showing Data</title>
	</head>
	<body>
		<h2>Data from the table 'tbrg' of database 'dbjual'</h2>
		<%
try{
	String host = "jdbc:mysql://localhost:3306/dbjual";
	String user = "zera";
	String pwd = "mean123";

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(host,user,pwd);
	stmt = conn.createStatement();
	String sql = "SELECT * FROM tbrg";
	rs = stmt.executeQuery(sql);
		%>
		<table cellpadding="15" border="1" style="background-color: #ffffcc;">
			<tr>
				<th>Kode Barang</th>
				<th>Nama</th>
				<th>Satuan</th>
			</tr>
			<%
	while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
			</tr>
			<%
	}
	rs.close();
	stmt.close();
	conn.close();
}catch(Exception e){
	out.println(e);
}
			%>
		</table>
		<table>
			<tr>
				<td>
					<form action="index.jsp" method="get">
					<button type="submit"><-- back</button>
				</td>
			</tr>
		</table>
	</body>
</html>