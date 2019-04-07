<%-- 
    Document   : createEvent
    Created on : Apr 5, 2019, 10:51:26 PM
    Author     : David Sheelam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            body{
                font-family: sans-serif;
            }
            textarea {
                width:200;
                height:300;
            }
            form{
                position: absolute;
                top: 10%;
                left: 40%;
                background-color: #FCFCFC;
            }
            label{
                color: #632e80;
            }
            input[type="submit"]{
                background-color: #632e80;
            }
            input[type="submit"]:hover{
                background-color: #632e80;
                color: white;
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
                        
%> </li>
                    </ul>
                </div>
            </div>
        </nav>
        <form action="createEventCheck.jsp" method="post">
            <h1 style="color: #632e80">Create a Personalized Event</h1>
            <div id="Dtitle" class="form-group">
                <label for="title">Title</label>
                <input id="title" class="form-control" type="text" name="title" required></input>
            </div>
            <div id="DdateOfOcc" class="form-group">
                <label for="date">Date of Event</label>
                <input type="date"  min="2019-04-05" max="2021-01-01" id="date" name="dateOf" class="form-control" placeholder="mm/dd/yy" required>
            </div>
            <div id="Ddescrip" class="form-group">
                <label for="descrp">Description:</label>
                <input type="textarea" id="descrp" name="desc" class="form-control" required></input>
            </div>
            <input type="submit" value="submit" class="form-control"id="submit"></input>
        </form>
    </body>
</html>
