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
					<label>No Bukti</label><input type="text" name="nobukti">
				</p>
				<p>
					<label>Tanggal gaji</label><input type="text" name="tglgaji">
				</p>
				<p>
					<label>NIP</label><input type="text" name="nip">
				</p>
				<p>
					<label>No Gol</label><input type="text" name="nogol">
				</p>
				<p>
					<label>Potongan</label><input type="text" name="potongan">
				</p>
				<p>
					<label>Tunjangan</label><input type="text" name="tunjangan">
				</p>
				<p>
					<label>Keterangan</label>
					<select name="keterangan">
						<option value="Sudah_Terima">Sudah Terima</option>
						<option value="Belum_Terima">Belum Terima</option>
					</select>
				</p>
				<p>
					<label></label><input type="submit" name="submit" value="Simpan"><a href="index.jsp">Kembali</a>
				</p>
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
			String query = "Insert into gaji values (?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setString(1,a);
			ps.setString(2,b);
			ps.setString(3,c);
			ps.setString(4,d);
			ps.setString(5,e);
			ps.setString(6,f);
			ps.setString(7,g);
			updateQuery = ps.executeUpdate();
			if(updateQuery != 0){
				response.sendRedirect("index.jsp");
			}
		}catch(Exception exc){
			out.println("Koneksi Bermasalah");
		}finally{
			ps.close();
			conn.close();
		}
	}
}
%>