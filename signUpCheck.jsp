<%-- 
    Document   : signUpCheck
    Created on : Apr 5, 2019, 10:51:26 PM
    Author     : David Sheelam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<!DOCTYPE html>
<% 
    String name = request.getParameter("name");
    String usr = request.getParameter("usrName");
    String pass = request.getParameter("pass");
    
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event","root","p@ssw0rd");
    
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from customer where username= '"+usr+"' ");
    
    if(rs.next()){
    	out.println("This username, " + usr + ", already exists");
    	out.println("<br/>");
    	out.println("<a href=\"signUp.jsp\">Back to signup</a>");
    	
    }
    else{
        int i  = st.executeUpdate("insert into customer(name, username, password) values('"+name+"','"+usr+"','"+pass+"')");
        out.println("Registration successful");
        out.println("<a href=\"login.jsp\">Proceed to login</a>");
    }


%>