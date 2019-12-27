<%--  
	Document	: contactBean
	Created On	: Jul 29, 2019
	Author		: Zukron Alviandy Rahmadhan
--%>

<%@page import="java.util.Properties" %>
<%@page import="javax.mail.*" %>
<%@page import="javax.mail.internet.*" %>

<%
String s = request.getParameter("subject");
String m = request.getParameter("message");
String to = "zukronalviandy@gmail.com";

Properties props = new Properties();
props.put("mail.smtp.host","smtp.gmail.com");
props.put("mail.smtp.socketFactory.port","465");
props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
props.put("mail.smtp.auth","true");
props.put("mail.smtp.port","465");

Session sesi1 = Session.getDefaultInstance(props, new javax.mail.Authenticator(){
	protected PasswordAuthentication getPasswordAuthentication(){
		return new PasswordAuthentication("reitaray5@gmail.com","Floxion123");
	}
});

//compose message
try{
	MimeMessage message = new MimeMessage(sesi1);
	message.setFrom(new InternetAddress("zukronalviandy@gmail.com"));
	message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	message.setSubject(s);
	message.setText(m);

	// send message
	Transport.send(message);
	session.setAttribute("contact_status","true");
	response.sendRedirect("contact.jsp");
}catch(Exception e){
	throw new RuntimeException(e);
}
%>