<%--  
	Document	: login
	Created On	: Jul 28, 2019
	Author		: Zukron Alviandy Rahmadhan
--%>

<%@page import="java.sql.*" %>

<%
String userid = request.getParameter("username");
String passwo = request.getParameter("password");

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

String host = "jdbc:mysql://localhost:3306/mydb";
String user = "zera";
String pwd = "mean123";

try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(host,user,pwd);
	stmt = conn.createStatement();

	String query = "Select * from admin where username = '"+userid+"' and password = '"+passwo+"'";
	rs = stmt.executeQuery(query);
	if(rs.next()){
		session.setAttribute("userid",userid);
		out.println("Welcome "+userid);
		out.println("<a href='logout.jsp'>Log out</a>");
		response.sendRedirect("sukses.jsp");
	}else{
		out.println("Invalid Password <a href='index.jsp'>try again</a>");
	}
}catch(Exception e){
	out.println(e);
}
%>