<<%-- 
    Document   : signUp
    Created on : Apr 5, 2019, 10:51:26 PM
    Author     : David Sheelam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            
        </style>
        <script>
            
        </script>
        <script src="jquery-3.2.1.min.js"></script>
        <link rel =" stylesheet" href="bootstrap.css">
        <script src="bootstrap.js"></script>
        <link rel="stylesheet" href="jquery-ui.css">
        <script src="jquery-ui.js"></script>
             <style>
            nav div a:hover{
                text-decoration: underline;
                text-decoration-color: #C5A6D6;
            }
            form{
                color: #632E80;
                font-size: 20px;
                background-color: #FCFCFC;
                position: absolute;
                top: 10%;
                left: 30%;
                width: 40%;
            }
            form h1{
                text-align: center;
            }
            form a{
                color: #632E80;
            }
            form a:hover{
                color: #A076B6;
                text-decoration-color: #C5A6D6;
            }
            #btn{
                background-color: #632E80;
                color: white;
                font-size: 20px;
            }
            #btn:hover{
                background-color: #C5A6D6;
            }
            .navbar{
                background-color: #C5A6D6 !important;
            }
            .navbar .navbar-brand{
                color : #632E80 !important;
            }
            .navbar .navbar-brand:hover{
                color : #ffffff !important;
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
<!--                        <li><% /*
                            if((session.getAttribute("user")).toString().equals("null")){
                                        out.print("<li><a href=\"login.jsp\">Login/Sign Up</a></li>");
                            }
                            else{
                                   out.print("Hello " +session.getAttribute("user").toString());                    
                            }
                        
                        */%></li>-->
                    </ul>
                </div>
            </div>
        </nav>
      <form action="signUpCheck.jsp" method="post">
          <h1>Sign Up</h1>
          <div class="form-group">
          <label for="name">Name:</label>
          <input  class="form-control" type=text" id="name" name="name"  required></input>
        </div>
        <div class="form-group">  
          <label for="usrName">Username:</label>
          <input class="form-control"type="text" id="usrName" name="usrName"  required></input>
        </div>
        <div class="form-group">
          <label for="pass">Password:</label>
          <input class="form-control"type="password" id="pass" name="pass" required></input>
        </div>
        <div class="form-group"> 
          <button class="form-control" id="btn">  Sign Up </button>
        </div> 
      </form>
                    <script>
                        $("#usrName").alphanum();
                        $("#pass").alphanum();
                    </script>
    </body>
</html>
