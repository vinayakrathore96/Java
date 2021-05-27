
<%@page import="java.sql.*" %>
<jsp:useBean id="cn" scope="page" class="mm.Conn1" />
<%



String uid = request.getParameter("uid");
String pid = request.getParameter("pid");
String price = request.getParameter("price");


try{
ResultSet rs=cn.executeQuery("select * from cart where user_id='"+uid+"' and p_id='"+pid+"'");
if(rs.next()){
    String qty=rs.getString("qty");
    if(qty.equals("1")){
        int s=  cn.executeUpdate("delete from cart where p_id='"+pid+"' and user_id='"+uid+"'");
                if(s>0){
                   out.println("Cart is Empty");
                }
    }

    else{
    
              int s=  cn.executeUpdate("update cart set price=price-'"+price+"',qty=qty-1 where p_id='"+pid+"' and user_id='"+uid+"'");
                if(s>0){
                   response.sendRedirect("cart.jsp");
                }
    }
            
}
    }catch(Exception e){e.printStackTrace();
             }
 
   


%>