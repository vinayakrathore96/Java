<%@page import="java.sql.*;" %>
<jsp:useBean id="cn" scope="page" class="mm.Conn1" />
<% 
String id=request.getParameter("id");
int rs=cn.executeUpdate("delete from products where product_id='"+id+"'");
if(rs>0){
    response.sendRedirect("delete.jsp");
}
%>