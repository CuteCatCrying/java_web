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
	String data = "SELECT * FROM nilai WHERE id ='"+num+"'";
	rs = stmt.executeQuery(data);
	while(rs.next()){
				%>
				<p>
					<label></label><input type="hidden" name="id" value='<%=rs.getString("id")%>'>
				</p>
				<p>
					<label></label><input type="hidden" name="tglnilai" value='<%=rs.getString("tglnilai")%>'>
				</p>
				<p>
					<label></label><input type="hidden" name="nim" value='<%=rs.getString("nim")%>'>
				</p>
				<p>
					<label></label><input type="hidden" name="kodemk" value='<%=rs.getString("kodemk")%>'>
				</p>
				<p>
					<label>Nilai</label><input type="text" name="nilai" value='<%=rs.getString("nilai")%>'>
				</p>
				<p>
					<label>Keterangan</label>
					<select name="keterangan">
						<option value="UTS">UTS</option>
						<option value="UAS">UAS</option>
						<option value="HERR">HERR</option>
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
String a1 = request.getParameter("id");
String a = request.getParameter("tglnilai");
String b = request.getParameter("nim");
String c = request.getParameter("kodemk");
String d = request.getParameter("nilai");
String e = request.getParameter("keterangan");

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
			String query = "UPDATE nilai SET nilai=?, keterangan=? WHERE id='"+a1+"'";
			ps = conn.prepareStatement(query);
			ps.setString(1,d);
			ps.setString(2,e);
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