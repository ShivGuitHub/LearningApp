<%-- 
    Document   : la
    Created on : Jul 7, 2015, 2:46:35 PM
    Author     : shiv.kushwaha
--%>
<!DOCTYPE html>
<html ng-app="myApp" ng-controller="dataController">
    <head>
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="author" content="test">
        <meta name="viewport" content="width=device-width initial-scale=1.0 maximum-scale=1.0 user-scalable=yes">
        <meta name="robots" content="noindex, nofollow">

        <title>Learning Anywhere</title>
        <link rel="icon" type="image/ico" href="images/favicon.ico"/>   
        <link type="text/css" rel="stylesheet" href="css/header.css">
        <link type="text/css" rel="stylesheet" href="css/mmenu.css">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
        <link type="text/css" rel="stylesheet" href="css/app.css">

        <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
        <script type="text/javascript" src="js/jquery.mmenu.js"></script>

        <script type="text/javascript" src="js/angular.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/controller.js"></script>    
        <script type="text/javascript" src="js/app.js"></script>
        <script src="js/xeditable.js"></script>


        <script> 
            $(document).ready(function(){
                $("#flip").click(function(){
                    $("#panel").slideToggle("slow");
                });
            });
        </script>

        <script type="text/javascript">
            $(function() {
                $('nav#menu').mmenu();
            });

        </script>

    </head>
    <body>
        <nav id="menu" class="mmenu mmenu-horizontal">
            <ul class="mmenu-opened">
                <li><a href="cgi-la.cgi">Home</a></li>

                <li><span>CORE JAVA</span>
                    <ul>
                        <li><a href="#" ng-click="dataProcess('java_collection');">COLLECTION</a></li>
                        <li><a href="#" ng-click="dataProcess('java_exception');">EXCEPTION</a></li>
                        <li><a href="#" ng-click="dataProcess('java_thread');">THREAD</a></li>
                    </ul>
                </li>
                <li><a href="#" ng-click="dataProcess('j2ee_sample');">J2EE</a></li>
                <li><a href="#" ng-click="dataProcess('csharp_sample');">C#</a></li>
                <li><a href="#" ng-click="dataProcess('vbdotnet_sample');">VB.NET</a></li>
                <li><a href="#" ng-click="dataProcess('aspdotnet_sample');">ASP.NET</a></li>
                <li><a href="#" ng-click="dataProcess('html_sample');">HTML</a></li>
                <li><a href="#" ng-click="dataProcess('css_sample');">CSS</a></li>
                <li><span>Control Panel</span>
                    <ul>
                        <li><span>THEME</span>
                            <ul>
                                <li><a href="#" onclick="cpProcess('THEME','#1971AA');">BLUE</a></li>
                                <li><a href="#" onclick="cpProcess('THEME','#CD5C5C');">CLASSICALRED</a></li>
                                <li><a href="#" onclick="cpProcess('THEME','#20B2AA');">LIGHTSEAGREEN</a></li>
                            </ul>
                        </li>
                        <li><a href="#" onclick="cpProcess('SUBSCRIBE','1');">SUBSCRIBE</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="page" class="mmenu-page" style="">
            <div id="header" class="labgcolor">
                <a href="#menu"></a>
                LAnywhere
                <div class="well well-sm labgcolor hidden" id="flip" title="Page Movers"><img class="img-responsive" src="images/audio-icon-hi.png" alt="..."></div>
            </div>

            <div class="well well-sm" id="panel">
                <p>
                <div id="circle"><span class="badge"><a href="#Q10">10</a></span></div>
                <div id="circle"><span class="badge"><a href="#Q20">20</a></span></div>
                <div id="circle"><span class="badge"><a href="#Q30">30</a></span></div>
                <div id="circle"><span class="badge"><a href="#">40</a></span></div>
                <div id="circle"><span class="badge"><a href="#">50</a></span></div>
                <div id="circle"><span class="badge"><a href="#Comment">C</a></span></div>
                </p>
            </div>
            <div class="container" id="contain"> 
                <div class="jumbotron" >            
                    <img src="images/recycling.gif" class="img-rounded img-responsive center-block" alt="Learning Power" > 
                    <img src="images/mind_power_new.jpg" class="img-rounded img-responsive center-block" alt="Mind Power" > 
                </div>
                <div>
                    <span id="signupmap" class="glyphicon glyphicon-user" data-toggle="modal" data-target="#signupmapModal"> SignUp</span> 
                    <span id="loginmap" class="glyphicon glyphicon-log-in"  data-toggle="modal" data-target="#signinmapModal"> Login</span>		
                </div>
                </br>			  
                <p id="lacontext" class="labgcolor">@LA provides the most efficient way to learn.</p>
            </div>
            <div class="container">
                <form role="form" class="hidden" id="commentformid">
                    <div class="form-group">
                        <a name="Comment"></a>
                        <label for="comment">Comment:</label>
                        <textarea class="form-control" rows="5" id="comment"></textarea>
                        </br>
                        <button type="button" class="btn btn-primary btn-xs">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    <!-- Sign In data-backdrop="static" -->
        <div class="modal fade"  data-keyboard="false" id="signinmapModal" role="dialog" >
            <div class="modal-dialog ">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header labgcolor" style="padding:15px 30px;">
                        <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
                    </div>
                    <div class="modal-body" style="padding:15px 25px;">
                        <form role="form">
                            <div class="form-group">
                                <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
                                <input type="text" class="form-control" id="usrname" placeholder="Enter User Name" required>
                            </div>
                            <div class="form-group">
                                <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
                                <input type="text" class="form-control" id="psw" placeholder="Enter Password" required>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" value="" checked>Remember me</label>
                            </div>
                            <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger btn-default pull-left" data-dismiss="modal" ><span class="glyphicon glyphicon-remove"></span> Cancel</button>
                        <p>Not a member? <span id="signupmap" class="glyphicon glyphicon-user" data-toggle="modal" data-target="#signupmapModal"> SignUp</span></p>
                        <p>Forgot <a href="#">Password?</a></p>
                    </div>
                </div>

            </div>
        </div> 
        
        <!-- Sign Up data-backdrop="static" -->
        
        <div class="modal fade"  data-keyboard="false" id="signupmapModal" role="dialog" >
                <div class="modal-dialog ">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header labgcolor" style="padding:15px 30px;">
                            <h4><span class="glyphicon glyphicon-lock"></span> Sign Up</h4>
                        </div>
                        <div class="modal-body" style="padding:15px 25px;">
                            <form role="form">
                                <div class="form-group">
                                    <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
                                    <input type="text" class="form-control" id="usrname" placeholder="Enter User Name" required>
                                </div>
                                <div class="form-group">
                                    <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
                                    <input type="text" class="form-control" id="psw" placeholder="Enter Password" required>
                                </div>
                                <div class="form-group">
                                    <label for="usrname"><span class="glyphicon glyphicon-user"></span> Mobile No:</label>
                                    <input type="number" class="form-control" id="usrname" placeholder="Enter Mobile Number" required>
                                </div>
                                <div class="form-group">
                                    <label for="usrname"><span class="glyphicon glyphicon-user"></span> Email Id:</label>
                                    <input type="email" class="form-control" id="usrname" placeholder="Enter Email" required>
                                </div>
                                <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> SignUp</button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal" onclick="revertsigninfunc();"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
                        </div>
                    </div>

                </div>
            </div> 
        <!-- The "button" that takes you to the top of the page when clicked -->
        <a id="toTop" style="display: block;">Back to top</a>
    </body>
</html>