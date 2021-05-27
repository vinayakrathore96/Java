<%@page import="java.util.Properties;"%>
<%@page import="javax.mail.Session;"%>
<%@page import="javax.mail.Message;"%>
<%@page import="javax.mail.Transport;"%>
<%@page import="javax.mail.Transport;"%>
<%@page import="javax.mail.Authenticator;"%>
<%@page import="javax.mail.MessagingException;"%>
<%@page import="javax.mail.internet.InternetAddress;"%>
<%@page import="javax.mail.PasswordAuthentication;"%>
<%@page import="javax.mail.internet.MimeMessage;"%>
<%@page import="java.sql.*;" %>
<jsp:useBean id="cn" scope="page" class="mm.Conn1" />

<% 
   String uid=request.getParameter("u_id");
   String pid=request.getParameter("pid");
   String uemail=request.getParameter("email");
   String pname=request.getParameter("pname");
   String status=request.getParameter("status");
   
    out.print(uid+"<br>");
    out.print(pid+"<br>");
    out.print(uemail+"<br>");
    out.print(pname+"<br>");
    out.print(status+"<br>");
    
   int rs=cn.executeUpdate("update orders set status='"+status+"' where user_id='"+uid+"' and p_id='"+pid+"'");
   
  
   
   
   if(rs>0){
       
       
       String to=uemail;
    String sub="Your Order Status";
    String msg=status;
   final String user="rohitcocth9@gmail.com";
   final String pass="clashofclans";
    
  Properties props = new Properties();
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");	
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        
        Session session1 = Session.getInstance(props,new Authenticator() 
        {
            
            protected PasswordAuthentication getPasswordAuthentication() 
            {
                return new PasswordAuthentication(user, pass);
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
            
             response.sendRedirect("check_orders.jsp");
            
        } catch (MessagingException e) 
        {
            out.print("user not informed");
            
            response.sendRedirect("check_orders.jsp");
        }  
   }
   
%>