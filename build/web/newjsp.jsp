<%-- 
    Document   : newjsp
    Created on : 8 Apr, 2017, 9:17:04 AM
    Author     : 7140r
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%
            String s=(String)session.getAttribute("status");
           out.print(s);%></h1>
    </body>
</html>
