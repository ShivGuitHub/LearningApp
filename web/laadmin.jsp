<%-- 
    Document   : laadmin
    Created on : Jul 8, 2015, 9:08:56 AM
    Author     : shiv.kushwaha
--%>

<%@taglib  prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html:html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/ico" href="images/favicon.ico"/> 
        <link type="text/css" rel="stylesheet" href="css/app.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/app.js"></script>

    </head>
    <body id="loginmap">

        <div class="container">
            <!-- Modal -->
            <div class="modal fade openfont" data-backdrop="static" data-keyboard="false" id="adminmapModal" role="dialog" >
                <div class="modal-dialog ">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header laadminbgcolor" style="padding:35px 50px;">
                            <html:errors />
                            <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
                        </div>
                        <div class="modal-body" style="padding:40px 50px;">
                            <html:form  action="/AdminProcess">
                                <div class="form-group "  >
                                    <div class="alert-danger" id="errormsgid">
                                        <c:if test="${requestScope.errormsg ne 'null'}">
                                            <c:out value="${requestScope.errormsg}"></c:out>
                                        </c:if>
                                    </div>

                                </div>
                                <script>
                                    $('#errormsgid').delay('2000').fadeOut()
                                </script>        
                                <div class="form-group">
                                    <label for="username"><span class="glyphicon glyphicon-user"></span> Username</label>
                                    <input type="text" class="form-control" name="username" id="username" placeholder="Enter User Name" required>                        
                                </div>
                                <div class="form-group">
                                    <label for="password"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
                                    <input type="password" class="form-control" name="password" id="password" placeholder="Enter Password" required>
                                </div>
                                <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
                            </html:form>
                        </div>
                    </div>

                </div>
            </div> 
        </div>

    </body>
</html:html>
