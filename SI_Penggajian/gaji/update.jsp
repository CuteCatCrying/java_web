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
	String host = "jdbc:mysql://localhost:3306/mydb";
	String user = "zera";
	String pwd	= "mean123";

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(host,user,pwd);
	stmt = conn.createStatement();

	String num = request.getParameter("u");
	String data = "Select * from gaji where nobukti='"+num+"'";
	rs = stmt.executeQuery(data);
	while(rs.next()){
				%>
				<p>
					<label></label><input type="hidden" name="nobukti" value='<%=rs.getString("nobukti")%>'>
				</p>
				<p>
					<label></label><input type="hidden" name="tglgaji" value='<%=rs.getString("tglgaji")%>'>
				</p>
				<p>
					<label></label><input type="hidden" name="nip" value='<%=rs.getString("nip")%>'>
				</p>
				<p>
					<label></label><input type="hidden" name="nogol" value='<%=rs.getString("nogol")%>'>
				</p>
				<p>
					<label>Potongan</label><input type="text" name="potongan" value='<%=rs.getString("potongan")%>'>
				</p>
				<p>
					<label>Tunjangan</label><input type="text" name="tunjangan" value='<%=rs.getString("tunjangan")%>'>
				</p>
				<p>
					<label>Keterangan</label>
					<select name="keterangan">
						<option value="Sudah_Terima">Sudah Terima</option>
						<option value="Belum_Terima">Belum Terima</option>
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
String a = request.getParameter("nobukti");
String b = request.getParameter("tglgaji");
String c = request.getParameter("nip");
String d = request.getParameter("nogol");
String e = request.getParameter("potongan");
String f = request.getParameter("tunjangan");
String g = request.getParameter("keterangan");

// membuat variabel untuk menampung alamat untuk akses database
String host = "jdbc:mysql://localhost:3306/mydb";
String user = "zera";
String pwd	= "mean123";

// Membuat koneksi ke database dengan jdbc
Connection conn = null;
PreparedStatement ps = null;
int updateQuery = 0;

// untuk mengecek textbox tidak kosong
if(a !=null && b !=null && c !=null && d !=null && e !=null && f !=null && g !=null){
	if(a !="" && b !="" && c !="" && d !="" && e !="" && f !="" && g !=""){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(host,user,pwd);
			String query = "update gaji set potongan=?, tunjangan=?, keterangan=? where nobukti='"+a+"'";
			ps = conn.prepareStatement(query);
			ps.setString(1,e);
			ps.setString(2,f);
			ps.setString(3,g);
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