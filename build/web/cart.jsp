
<%@page import="java.sql.*;" %>
<jsp:useBean id="cn" scope="page" class="mm.Conn1" />
<% if(session.getAttribute("uname")==null || session.getAttribute("password")==null){
    response.sendRedirect("cart_error.jsp");
}else{%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Online Shopping Cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap styles -->
    <link href="assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- Customize styles -->
    <link href="style.css" rel="stylesheet"/>
    <!-- font awesome styles -->
	<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet">
		<!--[if IE 7]>
			<link href="css/font-awesome-ie7.min.css" rel="stylesheet">
		<![endif]-->

		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

	<!-- Favicons -->
    <link rel="shortcut icon" href="assets/ico/favicon.ico">
  </head>
<body>
    <%
        String username=(String)session.getAttribute("uname");
        String password=(String)session.getAttribute("password");
        String uid=(String)session.getAttribute("uid");
        int items=0;
        int total_amt=0;
       String  img=null;
       String  desc=null; 
       int a_amt=0;
       int qty=0;
       int price=0,pid=0;
       int discount=0;
       int total=0;
       int d=0;
        if((username!="" && username!=null) && (password!="" && password!=null)){
            
ResultSet rs=cn.executeQuery("select * from cart where user_id='"+uid+"'");
        while(rs.next()){
            items++;
            int di=Integer.parseInt(rs.getString("discount"));
            discount=discount+di;
            int amt=Integer.parseInt(rs.getString("price"));
            total_amt=total_amt+amt;
        img=rs.getString("image");
           desc=rs.getString("product_detail");
           a_amt=Integer.parseInt(rs.getString("a_price"));
           qty=Integer.parseInt(rs.getString("qty"));
           price=Integer.parseInt(rs.getString("price"));
           pid=Integer.parseInt(rs.getString("p_id"));
        }
        
        %>
    
    <input type="hidden" name="uid" value="<%out.print(uid);%>">
    <input type="hidden" name="pid" value="<%out.print(pid);%>">
    <input type="hidden" name="price" value="<%out.print(price);%>">
<!-- 
	Upper Header Section 
-->
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="topNav">
		<div class="container">
			<div class="alignR">
				<div class="pull-left socialNw">
					<a href="#"><span class="icon-twitter"></span></a>
					<a href="#"><span class="icon-facebook"></span></a>
					<a href="#"><span class="icon-youtube"></span></a>
					<a href="#"><span class="icon-tumblr"></span></a>
				</div>
				<a href="index.jsp"> <span class="icon-home"></span> Home</a> 
				<a href="my_account.jsp"><span class="icon-user"></span> My Account</a> 
				<a href="register.jsp"><span class="icon-edit"></span> Free Register </a> 
				<a href="contact.jsp"><span class="icon-envelope"></span> Contact us</a>
				<a class="active" href="cart.jsp"><span class="icon-shopping-cart"></span> <%out.print(items);%> Item(s) - <span class="badge badge-warning"><%out.print(total_amt);%></span></a>
			</div>
		</div>
	</div>
</div>

<!--
Lower Header Section 
-->
<div class="container">
<div id="gototop"> </div>
<header id="header">
<div class="row">
	<div class="span4">
	<h1>
	<a class="logo" href="index.jsp"><span>Twitter Bootstrap ecommerce template</span> 
		<img src="assets/img/logo-bootstrap-shoping-cart.png" alt="bootstrap sexy shop">
	</a>
	</h1>
	</div>
	<div class="span4">
	
	</div>
	<div class="span4 alignR">
	<p><br> <strong> Support (24/7) :  0800 1234 678 </strong><br><br></p>
	<span class="btn btn-mini">[ 2 ] <span class="icon-shopping-cart"></span></span>
	<span class="btn btn-warning btn-mini">$</span>
	<span class="btn btn-mini">&pound;</span>
	<span class="btn btn-mini">&euro;</span>
	</div>
</div>
</header>

<!--
Navigation Bar Section 
-->
<div class="navbar">
	  <div class="navbar-inner">
		<div class="container">
		  <a data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </a>
		  <div class="nav-collapse">
			<ul class="nav">
			  <li class=""><a href="index.jsp">Home</a></li>
			 <li class=""><a href="three_column.jsp?type=all">Three Column</a></li>
			  <li class=""><a href="four_column.jsp?type=all">Four Column</a></li>
			  </ul>
			
			<ul class="nav pull-right">
			<li class="dropdown">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#"><span class="icon-lock"></span> Welcome,<%out.print(username);%> <b class="caret"></b></a>
				<div class="dropdown-menu">
				<form class="form-horizontal loginFrm" action="logout.jsp">
				  <div class="control-group">
					<input type="submit"  class="span2" value="Logout" >
				  </div>
				  
				</form>
				</div>
			</li>
			</ul>
		  </div>
		</div>
	  </div>
	</div>
<!-- 
Body Section 
-->
	<div class="row">
	<div class="span12">
    <ul class="breadcrumb">
		<li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
		<li class="active">Check Out</li>
    </ul>
	<div class="well well-small">
		<h1>Check Out <small class="pull-right"> <%out.print(items);%> Items are in the cart </small></h1>
	<hr class="soften"/>	
        <script>
            rem(){
                response.sendRedirect("del_pro.jsp");
            }
            </script>
            <%
                total=total_amt-discount;
                ResultSet rss=cn.executeQuery("select * from cart where user_id='"+uid+"'");
               
        while(rss.next()){
            
           d=rss.getInt("discount");
        img=rss.getString("image");
           desc=rss.getString("product_detail");
           a_amt=Integer.parseInt(rss.getString("a_price"));
           qty=Integer.parseInt(rss.getString("qty"));
           price=Integer.parseInt(rss.getString("price"));
           pid=Integer.parseInt(rss.getString("p_id"));
           
        %>
	<table class="table table-bordered table-condensed">
              <thead>
                <tr>
                  <th>Product</th>
                  <th>Description</th>
				  
                  <th>Avail.</th>
                  <th>Unit price</th>
                  <th>Qty </th>
                  <th>Discount</th>
                  <th>Total</th>
				</tr>
              </thead>
              <tbody>
                <tr>
                  <td><img  src=products/<%out.print(img);%> width=150px  height=150></td>
                  <td>Model : n/a<br>Other Information:<%out.print(desc);%></td>
                 
                  <td><span class="shopBtn"><span class="icon-ok"></span></span> </td>
                  <td><%out.print(a_amt);%></td>
                  <td>
                      <input class="span1" style="max-width:34px"  id="appendedInputButtons" size="16" type="text" value="<%out.print(qty);%>" readonly="readonly">
				  <a href='del_pro.jsp?pid=<%=rss.getString("p_id")%>&uid=<%=session.getAttribute("uid")%>&price=<%=rss.getString("price")%>&disc=<%=rss.getString("discount")%>&disc1=<%=rss.getString("i_discount")%>'>Remove </a>
                  </td><td><%out.print(d);%></td>
                  <td><%out.print(price);%></td>
                </tr>
                
				</tbody><%}%>
                                <tr><td colspan="6">Total Items:</td><td><%out.print(items);%></td></tr>
                                
                                <tr><td colspan="6">Total Discount:</td><td><%out.print(discount);%></td></tr>
                <tr><td colspan="6">Total Amount To Pay:</td><td><%out.print(total_amt);%></td></tr>
            </table>
        <%}%>
        
 
            <br/>
	
		
            	  
	<a href="four_column.jsp?type=all" class="shopBtn btn-large"><span class="icon-arrow-left"></span> Continue Shopping </a>
        <a href="place_order.jsp?uid=<%out.print(uid);%>" class="shopBtn btn-large pull-right">Place Order <span class="icon-arrow-right"></span></a>

</div>
</div>
</div>
  </body>
</html>
<%}%>