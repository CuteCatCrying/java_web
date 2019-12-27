<%--  
	Document	: prosesregis
	Created On	: Jul 28, 2019
	Author		: Zukron Alviandy Rahmadhan
--%>

<%@page import="java.sql.*" %>
<%
String user = request.getParameter("username");
String pwd = request.getParameter("password");
String email = request.getParameter("email");

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","zera","mean123");
	Statement stmt = conn.createStatement();
	
	// ResultSet = rs;
	int i = stmt.executeUpdate("insert into admin (email,username,password,regdate) values ('"+email+"','"+user+"','"+pwd+"',curdate())");

	if(i > 0){
		//session.setAttribute("userid",user);
		response.sendRedirect("welcome.jsp");
		//out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>")
	}else{
		response.sendRedirect("index.jsp");
	}
}catch(Exception e){
	out.println(e);
}
%>