<%@page import="java.sql.*;" %>
<jsp:useBean id="cn" scope="page" class="mm.Conn1" />
<head>
<style>
body {
    background-image: url("c.jpg");
     background-repeat: repeat-x;
}
</style>
</head>
<body>
    <h1><a href="index.jsp">Home</a></h1>
<table cellspacing="20"><tr><th>User Id</th><th Users List</th></tr><tr><th>User Image</th><th>User Name</th><th>E-mail Id</th></th><th>Action</th></tr>
    <%
        String uid=(String)session.getAttribute("uid");
        ResultSet rs=cn.executeQuery("select * from users where uid!='"+uid+"'");
        while(rs.next()){
            %>
    <tr><td><img  src=images/<%=rs.getString("image")%> height="50" width="50"></td><td><%=rs.getString("username")%></td><td><%=rs.getString("email_id")%></td><td><a href="delete_user.jsp?userid=<%=rs.getString("uid")%>">Delete</a></td></tr>
     <%   }%>
</table>
</body>