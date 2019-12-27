<%--  
	Document	: utama1
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
		<title>Golongan Page</title>

		<style>
			a{
				text-decoration: none;
			}
		</style>
	</head>
	<body>
		<div id="con">
			<h3 align="center">Aplikasi Sistem Informasi Penggajian</h3>
			<a href="tambah1.jsp">Tambah</a><p></p>
			<%
try{
	String host = "jdbc:mysql://localhost:3306/mydb";
	String user = "zera";
	String pwd	= "mean123";

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(host,user,pwd);
	stmt = conn.createStatement();
	String data = "SELECT * FROM golongan";
	rs = stmt.executeQuery(data);
			%>
			<table border="1" cellspacing="0" cellpadding="0" width="100%">
				<tr>
					<th>Nomor Golongan</th>
					<th>Nama Golongan</th>
					<th>Masa Kerja</th>
					<th>Gaji Pokok</th>
					<th>Aksi</th>
				</tr>
				<%
				while(rs.next()){
				%>
				<tr>
					<td><%=rs.getString("nogol")%></td>
					<td><%=rs.getString("namagol")%></td>
					<td><%=rs.getString("msk")%></td>
					<td><%=rs.getString("gapok")%></td>
					<td><a href="update1.jsp?u=<%=rs.getString("nogol")%>">edit</a> / <a href="delete1.jsp?d=<%=rs.getString("nogol")%>">hapus</a></td>
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