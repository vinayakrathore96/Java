<%@ page import="java.sql.*;"%>
<jsp:useBean id="cn" scope="page" class="mm.Conn1" />

<% 
    
 int pid=Integer.parseInt(request.getParameter("pid"));
 int uid=Integer.parseInt(request.getParameter("uid"));
int p=Integer.parseInt(request.getParameter("price"));
int d=Integer.parseInt(request.getParameter("disc"));
int d1=Integer.parseInt(request.getParameter("disc1"));
int p2=0;
p2=p+d;
out.print(p+"<br>");
out.print(d+"<br>");
out.print(d1+"<br>");
out.print(p2+"<br>");
ResultSet rs=cn.executeQuery("select * from cart where user_id='"+uid+"' and p_id='"+pid+"'");
    if(rs.next()){
        int p1=Integer.parseInt(rs.getString("a_price"));
        out.print(p1+"<br>");
      int p3=p1-d1;
      out.print("price:"+p+"<br>");
       out.print("p3:"+p3+"<br>");
        out.print("Result:"+(p-p3)+"<br>");
    if(p-p3==0){
            int n=cn.executeUpdate("delete from cart where p_id='"+pid+"' and user_id='"+uid+"'");
if(n>0){
    response.sendRedirect("cart.jsp");
}
else{
    response.sendRedirect("cart.jsp");
}
        }
        else{
        int n=cn.executeUpdate("update cart set qty=qty-1,price=price-'"+p3+"',discount=discount-'"+d1+"' where p_id='"+pid+"' and user_id='"+uid+"'");
if(n>0){
    response.sendRedirect("cart.jsp");
}
else{
    response.sendRedirect("cart.jsp");
}
       }  
    } 
 

%>