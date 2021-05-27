<%@ page import="java.sql.*;"%>
<jsp:useBean id="cn" scope="page" class="mm.Conn1" />
<%@ page import="java.util.Properties;"%>
<%@ page import="javax.mail.Session;"%>
<%@ page import="javax.mail.Message;"%>
<%@ page import="javax.mail.Transport;"%>
<%@ page import="javax.mail.Transport;"%>
<%@ page import="javax.mail.Authenticator;"%>
<%@ page import="javax.mail.MessagingException;"%>
<%@ page import="javax.mail.internet.InternetAddress;"%>
<%@ page import="javax.mail.PasswordAuthentication;"%>
<%@ page import="javax.mail.internet.MimeMessage;"%>

<%
     String id=request.getParameter("uid");
    ResultSet rs=cn.executeQuery("select * from cart where user_id='"+id+"'");
    if(rs.next()){
            String pid=rs.getString("p_id");
    String pname=rs.getString("p_name");
    String qty=rs.getString("qty");
    String price=rs.getString("price");
    String image=rs.getString("image");
    String uid=rs.getString("user_id");
    String uemail=rs.getString("user_email");
    String aprice=rs.getString("a_price");
    String s="Your Order for"+pname+" is Placed"; 
    
  try{
  int n=cn.executeUpdate("delete from cart where user_id='"+uid+"'");
  if(n>0){
      int nn=cn.executeUpdate("insert into orders(p_id,p_name,qty,price,image,user_id,user_email,a_price,status) values('"+pid+"','"+pname+"','"+qty+"','"+price+"','"+image+"','"+uid+"','"+uemail+"','"+aprice+"','"+s+"')");
           if(nn>0){
               
               String to=uemail;
    String sub="Your Order Status";
    String msg=s;
   final String user="rohitcocth9@gmail.com";
   final String pass="clashofclans";
    
  
    
  Properties props = new Properties();
props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");	
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
      
        Session session1 = Session.getInstance(props,new javax.mail.Authenticator() {
        
          
            protected PasswordAuthentication getPasswordAuthentication() 
            {
                return new PasswordAuthentication(user,pass);
            }
        });

        try 
        {
            Message message = new MimeMessage(session1);
            
            message.setFrom(new InternetAddress(user));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(sub);
            message.setText(msg);
            
            Transport.send(message);
             out.println("<script>");
            out.println("alert('Order Placed.....')");
            out.println("</script>");
            response.sendRedirect("cart.jsp");
            
        } catch (MessagingException e) 
        {
            out.println("<script>");
            out.println("alert('Not added to cart, please try again.....')");
            out.println("</script>");
            response.sendRedirect("cart.jsp");
            
            
        }  
           }}
  }catch(Exception e){out.print(e);}
  
  }
  %>