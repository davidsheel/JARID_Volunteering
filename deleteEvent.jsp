<%-- 
    Document   : deleteEvent
    Created on : Apr 5, 2019, 10:51:26 PM
    Author     : David Sheelam
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deleting your event...</title>
</head>
</html>
<% 
	String eventName = request.getParameter("deleteButton");
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event","root","p@ssw0rd");
	Statement st =  con.createStatement();
	ResultSet rs;
	
	int i = st.executeUpdate("delete from events where title= '"+eventName+"' ");
	int j = st.executeUpdate("delete from attendees where title= '"+eventName+"' ");
	
	out.println("Your event was deleted");
	out.println("<br/>");
	out.println("<a href=\"home.jsp\">View all events</a>");


%>