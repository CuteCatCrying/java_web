<%--  
	Document	: index
	Created On	: Jul 21, 2019
	Author		: Zukron Alviandy Rahmadhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="icon" href="static/img/favicon.jpg" type="image/gif" sizes="16x16"> 
		<title>Menu Utama SI Penggajian</title>
		<style type="text/css">
			*{
				padding: 0px;
				margin: 0px;
			}
			#header{
				margin: auto;
				width: 500px;
				font-family: Arial, Helvetica, sans-serif;
			}
			ul, ol{
				list-style: none; 
			}
			.nav li a{
				background-color: #000;
				color: #fff;
				text-decoration: none;
				padding: 10px 15px;
				display: block;
			}
			.nav li a:hover{
				background-color: #434343;
			}
			.nav > li {
				float: left;
			}
			.nav li ul{
				display: none;
				position: absolute;
				min-width: 140px;
			}
			.nav li:hover > ul{
				display: block;
			}
			.nav li ul li{
				position: relative;
			}
			.nav li ul li ul{
				right: -140px;
				top: 0px;
			}
		</style>
	</head>
	<body>
		<div id="header">
			<ul class="nav">
				<li><a href="/SI_Penggajian/pegawai">Pegawai</a></li>
				<li><a href="/SI_Penggajian/golongan">Golongan</a></li>
				<li><a href="/SI_Penggajian/gaji">Gaji</a></li>
				<li><a href="/SI_Penggajian/kontak">Kontak</a></li>
			</ul>
		</div>
	</body>
</html>