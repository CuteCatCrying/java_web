<%--  
	Document	: update
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
	String host = "jdbc:mysql://localhost:3306/si_penilaian";
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
	String data = "SELECT * FROM matakuliah WHERE kodemk ='"+num+"'";
	rs = stmt.executeQuery(data);
	while(rs.next()){
				%>
				<p>
					<label></label><input type="hidden" name="kodemk" value='<%=rs.getString("kodemk")%>'>
				</p>
				<p>
					<label>Nama Matakuliah</label><input type="text" name="namamk" value='<%=rs.getString("namamk")%>'>
				</p>
				<p>
					<label>SKS</label><input type="text" name="sks" value='<%=rs.getString("sks")%>'>
				</p>
				<p>
					<label>Semester</label>
					<select name="semester">
						<option value="I">I</option>
						<option value="II">II</option>
						<option value="III">III</option>
						<option value="IV">IV</option>
						<option value="V">V</option>
						<option value="VI">VI</option>
						<option value="VII">VII</option>
					</select>
				</p>
				<p>
					<label></label><input type="submit" name="submit" value="Update"><a href="index.jsp">Kembali</a>
				</p>
				<%
	}
	rs.close();
	stmt.close();
	conn.close();
}catch(Exception e){
	out.println(e);
}
				%>
			</form>
		</div>
	</body>
</html>

<%
String a = request.getParameter("kodemk");
String b = request.getParameter("namamk");
String c = request.getParameter("sks");
String d = request.getParameter("semester");

// Membuat variable untuk menampung alamat untuk akses database nantinya.
String host = "jdbc:mysql://localhost:3306/si_penilaian";
String user = "zera";
String pwd	= "mean123";

// Membuat koneksi ke database dengan jdbc
Connection conn = null;
PreparedStatement ps = null;
int updateQuery = 0;

if(a !=null && b !=null && c !=null && d !=null){
	if(a !="" && b !="" && c !="" && d !=""){
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(host,user,pwd);
			String query = "UPDATE matakuliah SET namamk=?, sks=?, semester=? WHERE kodemk='"+a+"'";
			ps = conn.prepareStatement(query);
			ps.setString(1,b);
			ps.setString(2,c);
			ps.setString(3,d);
			updateQuery = ps.executeUpdate();
			if(updateQuery != 0){
				response.sendRedirect("index.jsp");
			}
		}catch(Exception exc){
			out.println(exc);
		}finally{
			ps.close();
			conn.close();
		}
	}
}
%>