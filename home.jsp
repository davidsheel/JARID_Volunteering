<%-- 
    Document   : home
    Created on : Apr 5, 2019, 10:51:26 PM
    Author     : David Sheelam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
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
            #btn-warning
            {
                background-color: #632E80;
                color: white;
                font-size: 20px;
            }
            section{
                background-color: #ffffff;
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
                text-decoration-color: #ffffff;
            }
            table{
                color: #632E80;
            }
            table, th, td{
                border: 2px solid #632E80;
                
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
       <header>
            <span>
                <h1>Welcome to JARID Volunteering</h1>
                <blockquote>"Changing The World, One Volunteer at a Time"</blockquote>
                <a href="createEvent.jsp"><button class="btn btn-warning btn-block">Create an Event</button></a>
            </span>
        </header>
        <section>
            <h1>All Volunteering Opportunities</h1>
            <form action="eventDetails.jsp" method="get">
                <table style="margin: 50px auto;"> 
                    <tr>
                        <th><h2> Event Name </h2></th>
                        <th><h2> Register</h2></th>
                    </tr>
                     <% 
                      Class.forName("com.mysql.jdbc.Driver");
                      java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event","root","p@ssw0rd");
                      Statement st = con.createStatement();
                      ResultSet rs = st.executeQuery("select * from events"); 
                     
                     while(rs.next()){
                         %>
                         <tr>  
                             <td> <h5><%out.println(rs.getString(2)); %></h5></td>
                             <td> <button name="bt" value=<%out.print(rs.getString(2));%>>View Details</button></td>
                         
                         </tr>
                  <%
                     }
                     

                     %>
                </table>
            </form>
        </section>
    </body>
</html>
