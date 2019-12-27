<%--  
	Document	: about
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
		<title>About</title>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<div id="container">
			<%
String name = (String)session.getAttribute("username");
			%>

			<div id="content-container">
				<div id="content">
					<marquee>
						<h2 style="color:red;"><i>
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
						</i></h2>
					</marquee>

					<br><br>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero dolores recusandae, ipsam amet quod asperiores, fuga, at ipsa molestiae aliquam temporibus cupiditate numquam officiis itaque. Numquam maiores sint earum distinctio.

						Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque nemo illum laudantium, rem dolores incidunt corporis necessitatibus, aspernatur accusantium, quaerat sapiente facilis ad ipsum ab, eum sit totam quas pariatur.

						Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatum doloremque provident quod repellat, itaque similique, nam minus esse, dolores iure optio libero aut omnis nemo rerum dolorum quos rem corporis.
					</p>
				</div>

				<div id="aside">
					<%
if(name == null){
					%>
					<h2>Login : -</h2>
					<jsp:include page="login.jsp"></jsp:include>
					<%
}else{
					%>
					<p>
						* Lorem ipsum dolor sit amet, consectetur adipisicing elit. A dolores velit distinctio corporis, veniam! Vero hic quas ratione molestiae quos delectus saepe quis inventore sapiente illo eaque, enim! Praesentium, ea?

						* Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis necessitatibus nulla ad! Corporis cupiditate delectus, quis quibusdam consectetur neque nostrum dolore eum eos ratione dolorum dolorem sunt dignissimos, aut quam.
					</p>
					<%
}
					%>
				</div>
			</div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</body>
</html>