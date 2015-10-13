<%-- 
    Document   : error
    Created on : Jul 7, 2015, 12:40:31 PM
    Author     : shiv.kushwaha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
            <%
            out.println((String)request.getAttribute("errormsg"));
            
            %>
            
        </h1>
    </body>
</html>
