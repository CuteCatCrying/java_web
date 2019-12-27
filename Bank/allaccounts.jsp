<%--  
	Document	: allaccounts
	Created On	: Jul 29, 2019
	Author		: Zukron Alviandy Rahmadhan
--%>

<%@page import="java.sql.*" %>
<%@page import="com.connect.dbConnect" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="icon" href="static/img/favicon.jpg" type="image/gif" sizes="16x16"> 
		<link rel="stylesheet" href="static/css/style.css" type="text/css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>All Accounts Page</title>
	</head>
	<body>
		<div id="content-container">
			<div id="content">
				<center>
					<br><h2>All Accounts Details:-</h2><br><br>
					<%
try{
	Connection conn = dbConnect.getConnect();
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("Select * from record");
					%>
					<table cellpadding="10" border="1">
						<tr>
							<td><b>Username</b></td>
							<td><b>Amount</b></td>
							<td><b>Address</b></td>
							<td><b>Phone No.</b></td>
						</tr>
						<%
	while(rs.next()){
						%>
						<tr>
							<td><%=rs.getString(1)%></td>
							<td><%=rs.getString(3)%></td>
							<td><%=rs.getString(4)%></td>
							<td><%=rs.getString(5)%></td>
						</tr>
						<%
	}
						%>
					</table>
					<%
}catch(Exception e){
	response.sendRedirect("error.jsp");
}
					%>
				</center>
			</div>
			<div id="aside">
				<p>
					* Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus aspernatur pariatur voluptate, aliquid atque similique ipsam, error reiciendis ducimus. Qui, ratione. Ad itaque odit ex nihil, accusantium tenetur non, qui. <br><br>
				</p>
				<p>
					* Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam nihil, numquam, voluptatem iusto autem aspernatur ullam nam! Deleniti ea aliquam ut corporis consectetur ratione, ullam officiis sed fuga, est, veniam?
				</p>
			</div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</body>
</html>