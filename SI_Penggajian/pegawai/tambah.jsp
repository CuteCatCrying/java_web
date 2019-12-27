<%--  
	Document	: tambah
	Created On	: Jul 21, 2019
	Author		: Zukron Alviandy Rahmadhan
--%>

<%@page import="javax.swing.*" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<link rel="icon" href="../static/img/favicon.jpg" type="image/gif" sizes="16x16"> 
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
					<label>NIP</label><input type="text" name="nip">
				</p>
				<p>
					<label>Nama</label><input type="text" name="nama">
				</p>
				<p>
					<label>Alamat</label><input type="text" name="alamat">
				</p>
				<p>
					<label>Jenis Kelamin</label><input type="radio" name="jk" value="Laki-laki">Laki-laki
					<input type="radio" name="jk" value="Perempuan">Perempuan
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
	String a=request.getParameter("nip");
	String b=request.getParameter("nama");
	String c=request.getParameter("alamat");
	String d=request.getParameter("jk");

	// Membuat variable untuk nampung alamat untuk akses database nantinya
	String url="jdbc:mysql://localhost:3306/mydb";
	String user="zera";
	String pwd="mean123";

	// Membuat koneksi ke database dengan jdbc
	Connection conn = null;
	PreparedStatement ps=null;
	int updateQuery = 0;

	// Untuk mengecek textbox nim, nama, kelamin, alamat tidak kosong
	if(a !=null && b !=null && c !=null && d !=null){
		if(a !="" && b !="" && c !="" && d !=""){
			try{
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn = DriverManager.getConnection(url,user,pwd);
				String query = "Insert into pegawai (nip,nama,alamat,jk) values (?,?,?,?)";
				ps = conn.prepareStatement(query);
				ps.setString(1,a);
				ps.setString(2,b);
				ps.setString(3,c);
				ps.setString(4,d);
				updateQuery = ps.executeUpdate();
				if(updateQuery != 0){
					response.sendRedirect("index.jsp");
				}
				//if(!conn.isClosed()){
				//	out.println("Berhasil update");
				//}
			}catch(Exception exc){
				//out.println(exc);
			}finally{
				ps.close();
				conn.close();
			}
		}
	}
%>