<%-- 
    Document   : adminpannel
    Created on : Jul 8, 2015, 9:14:46 AM
    Author     : shiv.kushwaha
--%>

<!DOCTYPE html>
<html ng-app="myApp" ng-controller="subjectController">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Learning Anywhere</title>

        <link rel="icon" type="image/ico" href="images/favicon.ico"/> 
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link type="text/css" rel="stylesheet" href="css/app.css">
        <link href="css/xeditable.css" rel="stylesheet">

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/app.js"></script>
        <script type="text/javascript" src="js/angular.min.js"></script>
        <script type="text/javascript" src="js/controller.js"></script>
        <script src="js/xeditable.js"></script>
    </head>
    <body>

        <div class="container openfont">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
                <li><a data-toggle="tab" href="#menuSubject">Subject Container</a></li>
                <li><a data-toggle="tab" href="#menuQuestion">Question Container</a></li>
            </ul>

            <div class="tab-content">
                <div id="home" class="tab-pane fade in active">
            <div class="container"> 
                <div class="jumbotron" >  
                    <img src="images/recycling.gif" class="img-rounded img-responsive center-block" alt="Learning Power" > 
                    <img src="images/mind_power_new.jpg" class="img-rounded img-responsive center-block" alt="Mind Power" > 
                </div>
                </br>			  
                <p id="lacontext" class="labgcolor">@LA provides the most efficient way to learn.</p>
            </div>
                </div>
                <div id="menuSubject" class="tab-pane fade">
                    <br/>
                    <div class="row">
                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8"></div>
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                            <form action="" class="search-form">
                                <div class="form-group has-feedback">
                                    <label for="search" class="sr-only">Search</label>
                                    <input type="text" class="form-control" name="search" ng-model="SUBJECTNAMESEARCH" id="search" placeholder="">
                                    <span class="glyphicon glyphicon-search form-control-feedback"></span>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="center-block well well-sm" id="alertid"></div>
                    <br/>
                    <form class="form-inline" role="form">
                        <div class="form-group">
                            <span class="glyphicon glyphicon-info-sign"></span> 
                            <input type="number" class="form-control" name="subjectid" id="subjectid" ng-model="SUBJECTID" placeholder="Enter Subject Id" >
                        </div>
                        <div class="form-group">
                            <span class="glyphicon glyphicon-book"></span>
                            <input type="text" class="form-control" name="subjectname" id="subjectname" ng-model="SUBJECTNAME" placeholder="Enter Subject Name">
                        </div>
                        <button type="button" class="btn btn-info btn-xs" ng-click="subjectInsertProcess();">Add</button>
                        <button type="button" class="btn btn-default btn-xs" ng-click="subjectGetProcess();">Show Container</button>
                        <br/>

                    </form>
                    <hr color="gray" />

                    <table class="table table-hover">
                        <!--
               <thead>
                   <tr class="active">
                       <th>Response</th>
                   </tr>
               </thead>
                        -->
                        <tbody>
                            <!--
                            <tr class="success">
                                <td>{{ lasubjects.RSTATUS }}</td>
                            </tr>
                            -->                      

                            <tr>
                                <td>
                                    <table class="table table-hover" id="tablecontentid">
                                        <thead>
                                            <tr class="active">
                                                <th>SUBJECT ID</th>
                                                <th>SUBJECT NAME</th>
                                                <th>Operation</th>
                                            </tr>
                                        </thead>
                                        <tbody>


                                            <tr ng-repeat="subject in lasubjects | orderBy:sortType:sortReverse | filter:SUBJECTNAMESEARCH" id="{{ subject.SUBJECTID }}">
                                                <td>{{ subject.SUBJECTID }}</td>
                                                <td>                                                
                                                    <div ng-controller="Ctrl">
                                                        <!-- editable element -->
                                                        <a href="#" editable-textarea="subject.SUBJECTNAME" ng-click="previousSubjectNameCapture(subject.SUBJECTNAME);" onbeforesave="updateUser($data,subject.SUBJECTID)" >{{ subject.SUBJECTNAME || "empty" }}</a>

                                                    </div>
                                                </td>
                                                <td>
                                                    <span id ="removerowid"class="glyphicon glyphicon-remove removecolor" ng-click="subjectRemoveProcess(subject.SUBJECTID);"></span> 

                                                </td>          
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                    <div ng-hide="custom"> 
                        <img src="images/loading.gif" class="img-rounded img-responsive center-block" alt="Loading..." > 
                    </div>
                </div>
                <div id="menuQuestion" class="tab-pane fade">
                    <h3>Question Container</h3>
                </div>
            </div>
        </div>
    </body>
</html>