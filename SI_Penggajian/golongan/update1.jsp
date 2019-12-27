<%--  
	Document	: update1
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
		<title>JSP Page</title>

		<style>
			*{
				margin: auto;
				padding: 0;
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
			<h3 align="center">Update Data</h3><p></p>
			<form action="" method="post">
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

	//String u = request.getParameter("u");
	//int num = Integer.parseInt(u);
	
	String num = request.getParameter("u");
	String data = "SELECT * FROM golongan WHERE nogol ='"+num+"'";
	rs = stmt.executeQuery(data);
	while(rs.next()){
				%>
				<p>
					<label></label><input type="hidden" name="nogol" value='<%=rs.getString("nogol")%>'>
				</p>
				<p>
					<label>Golongan</label><input type="text" name="namagol" value='<%=rs.getString("namagol")%>'>
				</p>
				<p>
					<label>Masa Kerja</label><input type="text" name="msk" value='<%=rs.getString("msk")%>'>
				</p>
				<p>
					<label>Gaji Pokok</label><input type="text" name="gapok" value='<%=rs.getString("gapok")%>'>
				</p>
				<p>
					<label></label><input type="submit" name="submit" value="Update"><a href="utama1.jsp">Kembali</a>
				</p>
				<%
	}
	rs.close();
	stmt.close();
	conn.close();
}catch(Exception ex){
	out.println("Can't connect to database");
}
				%>
			</form>
		</div>
	</body>
</html>

<%
String a = request.getParameter("nogol");
String b = request.getParameter("namagol");
String c = request.getParameter("msk");
String d = request.getParameter("gapok");

// Membuat variable untuk menampung alamat untuk akses database nantinya.
String host = "jdbc:mysql://localhost:3306/mydb";
String user = "zera";
String pwd	= "mean123";

// Membuat koneksi ke database dengan jdbc
Connection conn = null;
PreparedStatement ps = null;
int updateQuery = 0;

try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(host,user,pwd);
	String query = "UPDATE golongan SET namagol=?, msk=?, gapok=? WHERE nogol='"+a+"'";
	ps = conn.prepareStatement(query);
	ps.setString(1,b);
	ps.setString(2,c);
	ps.setString(3,d);
	updateQuery = ps.executeUpdate();
	if(updateQuery != 0){
		response.sendRedirect("index.jsp");
	}
}catch(Exception exc){
	//out.println(exc);
}finally{
	ps.close();
	conn.close();
}
%>