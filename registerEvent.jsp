<%-- 
    Document   : registerEvent
    Created on : Apr 5, 2019, 10:51:26 PM
    Author     : David Sheelam
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	String eventName = request.getParameter("registerButton");
	String user = (session.getAttribute("user")).toString();
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event","root","p@ssw0rd");
	Statement st =  con.createStatement();
	ResultSet rs;
	
	int i = st.executeUpdate("insert into attendees(title, registrant) values('"+eventName+"','"+user+"')");
	
	out.println("You have been registered for the event, " + eventName + ".");
	out.println("<br/>");
	out.println("<a href=\"home.jsp\">Go back to all events</a>");

%>