<%--  
	Document	: sukses
	Created On	: Jul 28, 2019
	Author		: Zukron Alviandy Rahmadhan
--%>

<%
if((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")){
%>
Anda Belum Login <br>
<a href="index.jsp">Silahkan login</a>
<%
} else{
%>
Welcome <%=session.getAttribute("userid")%>
<a href='logout.jsp'>Log Out</a>
<%
}
%>