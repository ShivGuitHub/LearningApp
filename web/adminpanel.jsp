<%-- 
    Document   : adminpannel
    Created on : Jul 8, 2015, 9:14:46 AM
    Author     : shiv.kushwaha
--%>

<!DOCTYPE html>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

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
                <li class="active"><a data-toggle="tab" href="#home"><bean:message key="admin.tab.home"/></a></li>
                <li><a data-toggle="tab" href="#menuSubject"><bean:message key="admin.tab.subject"/></a></li>
                <li><a data-toggle="tab" href="#menuQuestion"><bean:message key="admin.tab.question"/></a></li>
                 <li><a data-toggle="tab" href="#menuPreview"><bean:message key="admin.tab.preview"/></a></li>
            </ul>

            <div class="tab-content">
                <div id="home" class="tab-pane">
                    <div class="container"> 
                        </br>			  
                        <p id="lacontext" class="labgcolor">Windows Error::10053 - An established connection was aborted by the software in your host machine.</p>
                    </div>
                </div>
                <div id="menuSubject" class="tab-pane">
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
                            <input type="number" class="form-control" name="subjectid" min="1" id="subjectid" ng-model="SUBJECTID" placeholder="Enter Subject Id" >
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
                <div id="menuQuestion" class="tab-pane">
                    <h3>Question Container</h3>
                </div>
                <div id="menuPreview" class="tab-pane active">
                    <br/>
                    <br/>
                    <div class="container" ng-controller="questPreviewController"> 
                        <div class="center-block well well-sm" id="alertquestid"></div>
                        <br/>
                        <form class="form-group" role="form">
                            <div class="row">
                                <div class="form-group col-xs-1 col-sm-1 col-md-1 col-lg-1">
                                    <span class="glyphicon glyphicon-pencil"></span> 
                                    <input type="number" class="form-control" name="questid" min="1" id="questid" ng-model="QUESTID" placeholder="QuestId" >
                                </div>
                                <div class="form-group col-xs-11 col-sm-11 col-md-11 col-lg-11">
                                    <span class="glyphicon glyphicon-user"></span>
                                    <input type="text" class="form-control" name="questsubject" id="questsubject" ng-model="QUESTSUBJECT" placeholder="Enter Question Subject">
                                </div>
                             </div>
                            <div class="input-group">
                                <textarea class="form-control custom-control" rows="16"  name="questanswer" id="questanswer" ng-model="QUESTANSWER" style="resize:none"></textarea>     
                                <span class="input-group-addon btn btn-primary" ng-click="insertAndShowPreview();">Preview</span>
                           </div>
                    </form> 
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>