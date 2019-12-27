<%--  
	Document	: contact
	Created On	: Jul 29, 2019
	Author		: Zukron Alviandy Rahmadhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="icon" href="static/img/favicon.jpg" type="image/gif" sizes="16x16"> 
		<link rel="stylesheet" href="static/css/style.css" type="text/css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Contact Page</title>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<%
String name = (String)session.getAttribute("username");
String s = (String)session.getAttribute("contact_status");
		%>
		<div id="container">
			<script>
				function check(){
					if(document.f1.subject.value=""){
						alert("Please enter subject!");
						return false;
					}
					if(document.f1.message.value=""){
						alert("Please enter message!");
						return false;
					}
				}
			</script>
			<div id="content-container">
				<div id="content">
					<marquee><h2 style="color: red;"><i>
						<%
if(name == null){
							%>
							- Welcome Guest -
							<%
}else{
							%>
							- Welcome <%=name%> -
							<%
}
							%>
					</i></h2></marquee><br><br>
					<center>
						<%
if(s.equals("true")){
						%>
						<h2 style="color: red;">Message Sent</h2><br>
						<%
session.getAttribute("contact_status","no_status");
}
						%>
						<h2>Contact us by the form given below</h2><br><br>
						<form action="contactBean.jsp" onsubmit="return check();" name="f1">
							<b>Subject: &nbsp;&nbsp;&nbsp;</b><input type="text" name="subject"><br><br>
							<b>Message: </b><textarea name="message" cols="16" rows="8"></textarea><br><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="submit" value="Submit">&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" value="Clear">
						</form>
					</center>
				</div>
				<div id="aside">
					<p>* Lorem ipsum dolor sit amet, consectetur adipisicing elit. Unde veniam nulla repellat numquam ea, odio mollitia illum iste non porro molestias tempore magni impedit voluptatibus recusandae, qui nihil, eveniet officiis!</p>
					<p>* Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellat explicabo ea impedit autem temporibus amet, deserunt doloremque dolore, eos, quibusdam fuga dolor necessitatibus expedita molestiae! Vitae magnam, quae distinctio illum!</p>
				</div>
			</div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</body>
</html>