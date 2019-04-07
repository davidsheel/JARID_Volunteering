<%-- 
    Document   : createEventCheck
    Created on : Apr 5, 2019, 10:51:26 PM
    Author     : David Sheelam
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            body{
                font-family: sans-serif;
            } 
            header{
                background: linear-gradient(#632E80, #ffffff);
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                height:100vh;
            }
            header span{
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                color: white;
            }
            .btn-warning{
                background-color: #632E80;
            }
            section{
                background-color: #ecf0f1;
                text-align: center;
                position: absolute;
                width: 100%;
                
            }
            section h1{
                color: #632E80;
                text-align: center
                
            }
            section h1:hover{
                text-decoration: underline;
                text-decoration-color: #632E80;
            }
            table{
                color: #632E80;
            }
            table, th, td{
                border: 5px solid #632E80;
                
            }
            .navbar{
                background-color: #ffffff !important;
            }
            .navbar .navbar-brand{
                color : #632E80 !important;
            }
            .navbar .navbar-brand:hover{
                color : #C5A6D6 !important;
            }
        </style>
        <script>
            
        </script>
        <script src="jquery-3.2.1.min.js"></script>
        <link rel =" stylesheet" href="bootstrap.css">
        <script src="bootstrap.js"></script>
    </head>
    <body>
       <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button class="navbar-toggle collapse" data-toggle="collapsed" data-target="#hide" aria-expanded="false">
                        <span class="sr-only">Toggle Navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="home.jsp">JARID Volunteering</a>
                </div>
                <div id="hide">
                    <ul class="nav navbar-nav navbar-right">
                        <li> <br/><% 
                            if((session.getAttribute("user").toString()).equals("null")){
                                        out.print("<li><a href=\"login.jsp\">Login/Sign Up</a></li>");
                            }
                            else{
                                   out.println("Hello " +session.getAttribute("user").toString());
                                   out.println("<br/>");
                                   out.println("<a href=\"logOut.jsp\">Log out</a>");
                            }
                        
%> 
</li>
                    </ul>
                </div>
            </div>
        </nav>
        <br/>
        <br/>
        <br/>
        <br/>
		<table style="margin: 50px auto;">
			<tr>
				<th><h3>Registrants for your event</h3></th>
			</tr>

<% 
                String event = request.getParameter("lookPeople");
                Class.forName("com.mysql.jdbc.Driver");
                java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event","root","p@ssw0rd");

                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM attendees where title = '"+event+"' ");
                
                while(rs.next()){
                	%>
                	<tr>  
                             <td> <h4><%out.println(rs.getString(3)); %></h4></td>
                         </tr>
                	
                	<%
                	
                }
                
                %>
                
  			</table>              
</body>
</html>