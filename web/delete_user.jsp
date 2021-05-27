<%@page import="java.sql.*;" %>
<jsp:useBean id="cn" scope="page" class="mm.Conn1" />
<%  
    String uid=request.getParameter("userid");
    int qry=cn.executeUpdate("delete from users where uid='"+uid+"'");
    if(qry>0){
        response.sendRedirect("view_users.jsp");
    }%>