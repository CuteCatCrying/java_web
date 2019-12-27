<%--  
	Document	: index
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
		<title>Gaji Page</title>
		<style>
			a {
				text-decoration: none;
			}
		</style>
	</head>
	<body>
		<div id="con">
			<h3 align="center">Aplikasi Sistem Informasi Gaji</h3>
			<a href="tambah.jsp">Tambah</a><p></p>
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
	String query = "Select * from gaji";
	rs = stmt.executeQuery(query);
			%>
			<table border="1" cellspacing="0" cellpadding="0" width="100%">
				<tr>
					<th>No Bukti</th>
					<th>Tanggal Gaji</th>
					<th>NIP</th>
					<th>No Golongan</th>
					<th>Potongan</th>
					<th>Tunjangan</th>
					<th>Keterangan</th>
					<th>Aksi</th>
				</tr>
				<%
	while(rs.next()){
				%>
				<tr>
					<td><%=rs.getString("nobukti")%></td>
					<td><%=rs.getString("tglgaji")%></td>
					<td><%=rs.getString("nip")%></td>
					<td><%=rs.getString("nogol")%></td>
					<td><%=rs.getString("potongan")%></td>
					<td><%=rs.getString("tunjangan")%></td>
					<td><%=rs.getString("keterangan")%></td>
					<td><a href="update.jsp?u=<%=rs.getString("nobukti")%>">edit</a> / <a href="delete.jsp?a=<%=rs.getString("nobukti")%>">hapus</a></td>
				</tr>
				<%
	}
				%>
			</table>
			<%
	rs.close();
	stmt.close();
	conn.close();
}catch(Exception e){
	out.println(e);
}
			%>
		</div>
	</body>
</html>