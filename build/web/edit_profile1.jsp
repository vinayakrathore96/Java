<%@ page import="java.sql.*;"%>
<jsp:useBean id="cn" scope="page" class="mm.Conn1" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  String id=request.getParameter("id");
            String uname=request.getParameter("username");
            String pass=request.getParameter("password");
            String email=request.getParameter("email");
             String mno=request.getParameter("mobile");
             int rs=cn.executeUpdate("update users set admin_name='"+uname+"',admin_pass='"+pass+"',email_id='"+email+"',mobile='"+mno+"' where uid='"+id+"'");
            if(rs>0){
            response.sendRedirect("admin_homepage.jsp");
            }
            else{
                int rss=cn.executeUpdate("update users set username='"+uname+"',password='"+pass+"',email_id='"+email+"',mobile='"+mno+"' where uid='"+id+"'");
            if(rss>0){
            response.sendRedirect("index.jsp");
            }
            }
            %>
    </body>
</html>
