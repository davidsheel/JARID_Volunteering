<%-- 
    Document   : createEventCheck
    Created on : Apr 5, 2019, 10:51:26 PM
    Author     : David Sheelam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<!DOCTYPE html>
<% 
    String title = request.getParameter("title");
    String date = request.getParameter("dateOf");
    String description = request.getParameter("desc");
    String usr = session.getAttribute("user").toString();
    
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event","root","p@ssw0rd");
    
    Statement st = con.createStatement();
    ResultSet rs; 

    int i  = st.executeUpdate("insert into events(title, date, description, creator) values('"+title+"','"+date+"','"+description+"','"+usr+"')");
    out.println("Your event has been created");
    out.println("<br/>");
    out.println("<a href=\"home.jsp\">View all events</a>");
%>