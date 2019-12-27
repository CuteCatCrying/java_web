<%--  
	Document	: logout
	Created On	: Jul 28, 2019
	Author		: Zukron Alviandy Rahmadhan
--%>

<%
session.setAttribute("username", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>