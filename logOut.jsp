<%-- 
    Document   : logOut
    Created on : Apr 5, 2019, 10:51:26 PM
    Author     : David Sheelam
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.concurrent.TimeUnit" %>
<% 
session.removeAttribute("user");
session.invalidate();
TimeUnit.SECONDS.sleep(3);
response.sendRedirect("login.jsp");
%>