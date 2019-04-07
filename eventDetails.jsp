<%-- 
    Document   : eventDetails
    Created on : Apr 5, 2019, 10:51:26 PM
    Author     : David Sheelam
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Events</title>
        <script src="jquery-3.2.1.min.js"></script>
        <link rel =" stylesheet" href="bootstrap.css">
        <script src="bootstrap.js"></script>
        <style>
            body{
                font-family: sans-serif;
            } 
            header{
                background: linear-gradient(#632e80, #ffffff);
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
                background-color: #632e80;
            }
            section{
                background-color: #ecf0f1;
                text-align: center;
                position: absolute;
                width: 100%;
                
            }
            section h1{
                color: #632e80;
                text-align: center
                
            }
            section h1:hover{
                text-decoration: underline;
                text-decoration-color: #632e80;
            }
            table{
                color: #632e80;
            }
            table, th, td{
                border: 5px solid #632e80;
                
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
                        <li><% 
                            if((session.getAttribute("user")) == null){
                                        out.print("<li><a href=\"login.jsp\">Login/Sign Up</a></li>");
                            }
                            else{
                                out.println("Hello " +session.getAttribute("user").toString());
                                out.println("<br/>");
                                out.println("<a href=\"logOut.jsp\">Log out</a>");                    
                            }
                        
                        %></li>
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
                        <th><h2> Title </h2></th>
                        <th><h2> Date</h2></th>
                         <th><h2> Description</h2></th>
                         <th><h2>Organization</h2></th>
                         <th><h2>Duty</h2></th>
                         <th><h2>View registrants for this event</h2></th>
                    </tr>
                     <% 
                String event = request.getParameter("bt");
                Class.forName("com.mysql.jdbc.Driver");
                java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event","root","p@ssw0rd");

                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM events where title = '"+event+"' ");
                     while(rs.next()){
                    	 
                    if(session.getAttribute("user") == null){
                    	%>
                    	<tr>  
                             <td> <h3><%out.println(rs.getString(2)); %></h3></td>
                             <td><h3><%out.println(rs.getString(3)); %></h3></td>
                             <td><h3><%out.println(rs.getString(4).toString()); %></h3></td>
                              <td><h3><%out.println(rs.getString(5).toString()); %></h3></td>
                              <td><a href="login.jsp"><button>Login to register<button></a></td>
                              <td>N/A</td>
                         </tr>
                    	
                    	
                <%    
                break;
                //break;
                    }
                    
                    	 // Error happens when user is not logged in to application
                    	 if(!(session.getAttribute("user").equals(rs.getString(5))) && !(session.getAttribute("user") == null)){
                    		 
                         %>
                         <tr>  
                             <td> <h3><%out.println(rs.getString(2)); %></h3></td>
                             <td><h3><%out.println(rs.getString(3)); %></h3></td>
                             <td><h3><%out.println(rs.getString(4).toString()); %></h3></td>
                              <td><h3><%out.println(rs.getString(5).toString()); %></h3></td>
                              <td>
	                              <form action="registerEvent.jsp" method="post"> 	
	                              	<button name="registerButton" value=<%out.print(rs.getString(2));%>>Register<button>
	                              </form>	                              
                              </td>
                              <td>N/A</td>
                         </tr>
                  <%
                    	 }
                    	 
                    	 if(session.getAttribute("user").equals(rs.getString(5))){
                    		 %>
                    	<tr>  
                             <td> <h3><%out.println(rs.getString(2)); %></h3></td>
                             <td><h3><%out.println(rs.getString(3)); %></h3></td>
                             <td><h3><%out.println(rs.getString(4).toString()); %></h3></td>
                              <td><h3><%out.println(rs.getString(5).toString()); %></h3></td>
                              <td>
	                              <form action="deleteEvent.jsp" method="post"> 
	                              	<button name="deleteButton" value=<%out.print(rs.getString(2));%>>Delete Your Event<button>
	                              </form>
                              
                              </td>
                              
                              <td>
	                              <form action="viewPeople.jsp" method="post"> 
	                              	<button name="lookPeople" value=<%out.print(rs.getString(2));%>>View attendees<button>
	                              </form>
                              
                              </td>
                              
                         </tr>
                    		 
                    <%		 
                    	 
                    	 }

                    
                     }
                     
                     %>
                </table>
    </body>
</html>