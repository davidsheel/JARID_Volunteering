<%-- 
    Document   : loginCheck
    Created on : Apr 5, 2019, 10:51:26 PM
    Author     : David Sheelam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<!DOCTYPE html>
<% 
    
    String usr = request.getParameter("username");
    String pass = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event","root","p@ssw0rd");
    
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select*from customer where username='"+usr+"'");

    if(rs.next()){
        if(rs.getString(4).equals(pass)){
            out.println("Login Successful");
            out.println("<br/>");
            out.println("<a href=\"allEvents.jsp\">Proceed to Main Page</a>");
            session.setAttribute("user",usr);
        }
        else if(!rs.getString(4).equals(pass)){
            out.println("Your password dosen't match with your username");
            out.println("<br/>");
            out.println("<a href=\"login.jsp\">Back to Login</a>");
        }
        
    }
    
    else{
        out.println("Your username, " + usr + ", does not exist");
        out.println("<br/>");
    out.println("<a href=\"login.jsp\">Back to Login</a>");
    }



%>