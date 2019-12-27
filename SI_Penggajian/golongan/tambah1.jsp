<%--  
	Document	: tambah1
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
			<h3 align="center">Tambah Data</h3><p></p>
			<form action="" method="post">
				<p>
					<label>Nomor Golongan</label><input type="text" name="nogol">
				</p>
				<p>
					<label>Nama Golongan</label><input type="text" name="namagol">
				</p>
				<p>
					<label>Masa Kerja</label><input type="text" name="msk">
				</p>
				<p>
					<label>Gaji Pokok</label><input type="text" name="gapok">
				</p>
				<p>
					<label></label><input type="submit" name="submit" value="Simpan"><a href="utama1.jsp">Kembali</a>
				</p>
			</form>
		</div>
	</body>
</html>

<%
String a = request.getParameter("nogol");
String b = request.getParameter("namagol");
String c = request.getParameter("msk");
String d = request.getParameter("gapok");

// Membuat variable untuk nampung alamat untuk akses database nantinnya.
String host = "jdbc:mysql://localhost:3306/mydb";
String user = "zera";
String pwd	= "mean123";

Connection conn = null;
PreparedStatement ps = null;
int updateQuery = 0;

if(a !=null && b !=null && c !=null && d !=null){
	if(a !="" && b !="" && c !="" && d !=""){
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(host,user,pwd);
			String query = "Insert into golongan (nogol,namagol,msk,gapok) values (?,?,?,?)";
			//String query = "Insert into pegawai (nip,nama,alamat,jk) values (?,?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setString(1,a);
			ps.setString(2,b);
			ps.setString(3,c);
			ps.setString(4,d);
			updateQuery = ps.executeUpdate();
			if(updateQuery != 0){
				response.sendRedirect("index.jsp");
			}
		}catch(Exception exc){
			out.println("Koneksi Bermasalah atau Data Salah");
		}finally{
			ps.close();
			conn.close();
		}
	}
}
%>