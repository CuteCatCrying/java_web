<%--  
	Document	: tambah
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
			<h3 align="center">Tambah Data</h3><p></p>
			<form action="" method="post">
				<p>
					<label>NIM</label><input type="text" name="nim">
				</p>
				<p>
					<label>Nama</label><input type="text" name="nama">
				</p>
				<p>
					<label>Kelamin</label>
					<input type="radio" name="kelamin" value="Laki-laki">Laki-laki
					<input type="radio" name="kelamin" value="Perempuan">Perempuan
				</p>
				<p>
					<label>Angkatan</label><input type="text" name="angkatan">
				</p>
				<p>
					<label></label><input type="submit" name="submit" value="Simpan">
					<a href="index.jsp">Kembali</a>
				</p>
			</form>
		</div>
	</body>
</html>

<%
String a = request.getParameter("nim");
String b = request.getParameter("nama");
String c = request.getParameter("kelamin");
String d = request.getParameter("angkatan");

// Membuat variable untuk nampung alamat untuk akses database nantinnya.
String host = "jdbc:mysql://localhost:3306/si_penilaian";
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
			String query = "Insert into mahasiswa values (?,?,?,?)";
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