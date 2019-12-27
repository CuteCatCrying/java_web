<%--  
	Document	: index
	Created On	: Jul 23, 2019
	Author		: Zukron Alviandy Rahmadhan
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="icon" href="../static/img/favicon.jpg" type="image/gif" sizes="16x16">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Mata Kuliah Page</title>
		<style>
			a{
				text-decoration: none;
			}
		</style>
	</head>
	<body>
		<div id="con">
			<h3 align="center">Aplikasi Sistem Informasi Penilaian</h3>
			<a href="tambah.jsp">Tambah</a><p></p>
			<%
try{
	String host = "jdbc:mysql://localhost:3306/si_penilaian";
	String user = "zera";
	String pwd	= "mean123";

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(host,user,pwd);
	stmt = conn.createStatement();
	String data = "SELECT * FROM matakuliah";
	rs = stmt.executeQuery(data);
			%>
			<table border="1" cellspacing="0" cellpadding="0" width="100%">
				<tr>
					<th>Kode MK</th>
					<th>Nama</th>
					<th>SKS</th>
					<th>Semester</th>
					<th>Aksi</th>
				</tr>
				<%
				while(rs.next()){
				%>
				<tr>
					<td><%=rs.getString("kodemk")%></td>
					<td><%=rs.getString("namamk")%></td>
					<td><%=rs.getString("sks")%></td>
					<td><%=rs.getString("semester")%></td>
					<td><a href="update.jsp?u=<%=rs.getString("kodemk")%>">edit</a> / <a href="delete.jsp?d=<%=rs.getString("kodemk")%>">hapus</a></td>
				</tr>
				<% } %>
			</table>
			<%
	rs.close();
	stmt.close();
	conn.close();
}catch(Exception exc){
	out.println(exc);
}
			%>
		</div>
	</body>
</html>