<%@page import="java.sql.*;" %>
<jsp:useBean id="cn" scope="page" class="mm.Conn1" />

<% if(session.getAttribute("uname")==null || session.getAttribute("password")==null){
    %><html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Online Electronics Shopping</title>
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
         int d;
        
        try{
        String type=request.getParameter("type");
      d=10;
           
           

      
        
       if(type.equals("all")){
           
       
        
        %>
    
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
				<a href="cart.jsp"><span class="icon-shopping-cart"></span>Login First <span class="badge badge-warning"> </span></a>
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
	<a class="logo" href="#"><span></span> 
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
			  <li class=""><a href="index.jsp">Home	</a></li>
			 
			  <li class=""><a href="three_column.jsp?type=all">Three Column</a></li>
			  <li class="active"><a href="four_column.jsp">Four Column</a></li>
			  
			</ul>
			
			<ul class="nav pull-right">
			<li class="dropdown">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#"><span class="icon-lock"></span><b class="caret"></b></a>
				<div class="dropdown-menu">
				<form class="form-horizontal loginFrm" method="post" action="login"  name=f>
				  <div class="control-group">
					<input type="text" class="span2" id="inputEmail" name="username" placeholder="username">
				  </div>
				  <div class="control-group">
					<input type="password" name="password" class="span2" id="inputPassword" placeholder="Password">
				  </div>
				  <div class="control-group">
					<label class="checkbox">
					<input type="checkbox"> Remember me
					</label>
					<button type="button" class="shopBtn btn-block" onclick="valid1()">Login in</button>
                                        <a href='forgot_password.jsp'>Forget Password?</a>
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
<!--
Three column view
-->
	<h3>All Products </h3>
		<ul class="thumbnails">  <% 
        
                    
        ResultSet rs=cn.executeQuery("select * from products where category='Laptops' ");
        while(rs.next()){
                int disc=(d*rs.getInt("price"))/100;
                %>
        
			<li class="span3">
			  <div class="thumbnail">
				<a href="product_details.html" class="overlay"></a>
				<img src=products/<%=rs.getString("image")%> alt=""></a>
				<div class="caption cntr">
					<p><%=rs.getString("product_name")%></p>
					<p><strong>Rs. <%=rs.getString("price")%></strong></p>
                                        <h4><a class="shopBtn" href="cart_error.jsp">Add To Cart</a></h4>
					<div class="actionList">
					  Get <%out.print(d);%>% Discount
					</div> 
					<br class="clr">
				</div>
			  </div>
			</li><%}%>
			
		  </ul>
                        <h3>Computer and Peripherals </h3>
                   <ul class="thumbnails">  <% 
     
        ResultSet rs1=cn.executeQuery("select * from products where category='Computer and Peripherals'");
        while(rs1.next()){  
            int disc=(d*rs1.getInt("price"))/100;
                   %>
			<li class="span3">
			  <div class="thumbnail">
				
				<img src=products/<%=rs1.getString("image")%> alt=""></a>
				<div class="caption cntr">
					<p><%=rs1.getString("product_name")%></p>
					<p><strong>Rs. <%=rs1.getString("price")%></strong></p>
                                        <h4><a class="shopBtn" href="cart_error.jsp"> Add to cart </a></h4>
					<div class="actionList">
						Get <%out.print(d);%>% Discount
					</div> 
					<br class="clr">
				</div>
			  </div>
			</li><%}%>
			
		  </ul>
                         <h3>Refrigerators </h3>
                   <ul class="thumbnails">  <% 
       
        ResultSet rs2=cn.executeQuery("select * from products where category='Refrigerators'");
        while(rs2.next()){
                    int disc=(d*rs2.getInt("price"))/100;
                   %>
			<li class="span3">
			  <div class="thumbnail">
				<img src=products/<%=rs2.getString("image")%> alt=""></a>
				<div class="caption cntr">
					<p><%=rs2.getString("product_name")%></p>
					<p><strong>Rs. <%=rs2.getString("price")%></strong></p>
                                        <h4><a class="shopBtn" href="cart_error.jsp"> Add to cart </a></h4>
					<div class="actionList">
						Get <%out.print(d);%>% Discount
					</div> 
					<br class="clr">
				</div>
			  </div>
			</li><%}%>
			
		  </ul>
                               <h3>Washing Machines </h3>
                   <ul class="thumbnails">  <% 
        
        ResultSet rs3=cn.executeQuery("select * from products where category='Washing Machines'");
        while(rs3.next()){
                    int disc=(d*rs3.getInt("price"))/100;
                   %>
			<li class="span3">
			  <div class="thumbnail">
				<img src=products/<%=rs3.getString("image")%> alt=""></a>
				<div class="caption cntr">
					<p><%=rs3.getString("product_name")%></p>
					<p><strong>Rs. <%=rs3.getString("price")%></strong></p>
                                        <h4><a class="shopBtn" href="cart_error.jsp"> Add to cart </a></h4>
					<div class="actionList">
					Get <%out.print(d);%>% Discount	
					</div> 
					<br class="clr">
				</div>
			  </div>
			</li><%}%>
			
		  </ul>
                        
                               <h3>AC & Fan </h3>
                   <ul class="thumbnails">  <% 
        
        ResultSet rs4=cn.executeQuery("select * from products where category='AC and Fan'");
        while(rs4.next()){
                    int disc=(d*rs4.getInt("price"))/100;
                   %>
			<li class="span3">
			  <div class="thumbnail">
				<img src=products/<%=rs4.getString("image")%> alt=""></a>
				<div class="caption cntr">
					<p><%=rs4.getString("product_name")%></p>
					<p><strong>Rs. <%=rs4.getString("price")%></strong></p>
                                        <h4><a class="shopBtn" href="cart_error.jsp">Add to cart </a></h4>
					<div class="actionList">
						Get <%out.print(d);%>% Discount
					</div> 
					<br class="clr">
				</div>
			  </div>
			</li><%}%>
			
		  </ul>
                        
                          
<!-- 
Clients 
-->
<section class="our_client">
	<hr class="soften"/>
	<h4 class="title cntr"><span class="text">Manufactures</span></h4>
	<hr class="soften"/>
	<div class="row">
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/1.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/2.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/3.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/4.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/5.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/6.png"></a>
		</div>
	</div>
</section>

<!--
Footer
-->
<footer class="footer">
<div class="row-fluid">
<div class="span2">
<h5>Your Account</h5>
<a href="#">YOUR ACCOUNT</a><br>
<a href="#">PERSONAL INFORMATION</a><br>
<a href="#">ADDRESSES</a><br>
<a href="#">DISCOUNT</a><br>
<a href="#">ORDER HISTORY</a><br>
 </div>
<div class="span2">
<h5>Iinformation</h5>
<a href="contact.html">CONTACT</a><br>
<a href="#">SITEMAP</a><br>
<a href="#">LEGAL NOTICE</a><br>
<a href="#">TERMS AND CONDITIONS</a><br>
<a href="#">ABOUT US</a><br>
 </div>
<div class="span2">
<h5>Our Offer</h5>
<a href="#">NEW PRODUCTS</a> <br>
<a href="#">TOP SELLERS</a><br>
<a href="#">SPECIALS</a><br>
<a href="#">MANUFACTURERS</a><br>
<a href="#">SUPPLIERS</a> <br/>
 </div>
 <div class="span6">
<h5>The standard chunk of Lorem</h5>
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for
 those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et 
 Malorum" by Cicero are also reproduced in their exact original form, 
accompanied by English versions from the 1914 translation by H. Rackham.
 </div>
 </div>
</footer>
</div><!-- /container -->

<div class="copyright">
<div class="container">
	<p class="pull-right">
		<a href="#"><img src="assets/img/maestro.png" alt="payment"></a>
		<a href="#"><img src="assets/img/mc.png" alt="payment"></a>
		<a href="#"><img src="assets/img/pp.png" alt="payment"></a>
		<a href="#"><img src="assets/img/visa.png" alt="payment"></a>
		<a href="#"><img src="assets/img/disc.png" alt="payment"></a>
	</p>
	<span>Copyright &copy; 2013<br> bootstrap ecommerce shopping template</span>
</div>
</div>
<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.easing-1.3.min.js"></script>
    <script src="assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
    <script src="assets/js/shop.js"></script>
  </body>
</html>
<!-- 
	Upper Header Section 
-->


<%} else{%>
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
				<a href="cart.jsp"><span class="icon-shopping-cart"></span>Login First <span class="badge badge-warning"></span></a>
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
			  <li class=""><a href="index.jsp">Home	</a></li>
			  <li class=""><a href="three_column.jsp?type=all">Three Column</a></li>
			  <li class="active"><a href="four_column.jsp?type=all">Four Column</a></li>
			  </ul>
			
			<ul class="nav pull-right">
			<li class="dropdown">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#"><span class="icon-lock"></span> Welcome  <b class="caret"></b></a>
				<div class="dropdown-menu">
				<form class="form-horizontal loginFrm" method="post" action="login"  name=f>
				  <div class="control-group">
					<input type="text" class="span2" id="inputEmail" name="username" placeholder="username">
				  </div>
				  <div class="control-group">
					<input type="password" name="password" class="span2" id="inputPassword" placeholder="Password">
				  </div>
				  <div class="control-group">
					<label class="checkbox">
					<input type="checkbox"> Remember me
					</label>
					<button type="button" class="shopBtn btn-block" onclick="valid1()">Login in</button>
                                        <a href='forgot_password.jsp'>Forget Password?</a>
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
<!--
Three column view
-->
	<h3><%out.print(type);%> </h3>
		<ul class="thumbnails">  <% 
        
                    String  ss=request.getParameter("type");
        ResultSet rs=cn.executeQuery("select * from products where category='"+ss+"'");
        while(rs.next()){
                int disc=(d*rs.getInt("price"))/100;%>
			<li class="span3">
			  <div class="thumbnail">
				
				<img src=products/<%=rs.getString("image")%> alt=""></a>
				<div class="caption cntr">
					<p><%=rs.getString("product_name")%></p>
					<p><strong>Rs. <%=rs.getString("price")%></strong></p>
					<h4><a class="shopBtn" href="cart_error.jsp"> Add to cart </a></h4>
					<div class="actionList">
						Get <%out.print(d);%>% Discount
					</div> 
					<br class="clr">
				</div>
			  </div>
			</li><%}%>
			
		  </ul>
                       
<!-- 
Clients 
-->
<section class="our_client">
	<hr class="soften"/>
	<h4 class="title cntr"><span class="text">Manufactures</span></h4>
	<hr class="soften"/>
	<div class="row">
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/1.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/2.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/3.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/4.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/5.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/6.png"></a>
		</div>
	</div>
</section>

<!--
Footer
-->
<footer class="footer">
<div class="row-fluid">
<div class="span2">
<h5>Your Account</h5>
<a href="#">YOUR ACCOUNT</a><br>
<a href="#">PERSONAL INFORMATION</a><br>
<a href="#">ADDRESSES</a><br>
<a href="#">DISCOUNT</a><br>
<a href="#">ORDER HISTORY</a><br>
 </div>
<div class="span2">
<h5>Iinformation</h5>
<a href="contact.html">CONTACT</a><br>
<a href="#">SITEMAP</a><br>
<a href="#">LEGAL NOTICE</a><br>
<a href="#">TERMS AND CONDITIONS</a><br>
<a href="#">ABOUT US</a><br>
 </div>
<div class="span2">
<h5>Our Offer</h5>
<a href="#">NEW PRODUCTS</a> <br>
<a href="#">TOP SELLERS</a><br>
<a href="#">SPECIALS</a><br>
<a href="#">MANUFACTURERS</a><br>
<a href="#">SUPPLIERS</a> <br/>
 </div>
 <div class="span6">
<h5>The standard chunk of Lorem</h5>
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for
 those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et 
 Malorum" by Cicero are also reproduced in their exact original form, 
accompanied by English versions from the 1914 translation by H. Rackham.
 </div>
 </div>
</footer>
</div><!-- /container -->

<div class="copyright">
<div class="container">
	<p class="pull-right">
		<a href="#"><img src="assets/img/maestro.png" alt="payment"></a>
		<a href="#"><img src="assets/img/mc.png" alt="payment"></a>
		<a href="#"><img src="assets/img/pp.png" alt="payment"></a>
		<a href="#"><img src="assets/img/visa.png" alt="payment"></a>
		<a href="#"><img src="assets/img/disc.png" alt="payment"></a>
	</p>
	<span>Copyright &copy; 2013<br> bootstrap ecommerce shopping template</span>
</div>
</div>
<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.easing-1.3.min.js"></script>
    <script src="assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
    <script src="assets/js/shop.js"></script>
  </body>
</html>
<%}}catch(Exception e){e.printStackTrace();}
}else{
%>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Online Electronics Shopping</title>
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
         int d;
        String username=(String)session.getAttribute("uname");
        String password=(String)session.getAttribute("password");
        String uid=(String)session.getAttribute("uid");
        String s=(String)session.getAttribute("status");
        int items=0;
        int total_amt=0;
        try{
        String type=request.getParameter("type");
        if((username!="" && username!=null) && (password!="" && password!=null)){
           
       String status=session.getAttribute("status").toString();
        
        if(status.equals("Delivered")){
            session.setAttribute("statu",status);
            d=15;
        }
        else{
            session.setAttribute("statu",status);
            d=10;
        }
ResultSet rs0=cn.executeQuery("select * from cart where user_id='"+uid+"'");
        while(rs0.next()){
            items++;
            int amt=Integer.parseInt(rs0.getString("price"));
            total_amt=total_amt+amt;
        }
        
       if(type.equals("all")){
           
       
        
        %>
    
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
				<a href="cart.jsp"><span class="icon-shopping-cart"></span><%out.print(items);%> Item(s) - <span class="badge badge-warning"><%out.print(total_amt);%> </span></a>
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
			  <li class=""><a href="index.jsp">Home	</a></li>
			 
			  <li class=""><a href="three_column.jsp?type=all">Three Column</a></li>
			  <li class="active"><a href="four_column.jsp">Four Column</a></li>
			  
			</ul>
			
			<ul class="nav pull-right">
			<li class="dropdown">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#"><span class="icon-lock"></span>Welcome,<%out.print(username);%> <b class="caret"></b></a>
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
<!--
Three column view
-->
	<h3>All Products </h3>
		<ul class="thumbnails">  <% 
        
                    
        ResultSet rs=cn.executeQuery("select * from products where category='Laptops' ");
        while(rs.next()){
                int disc=(d*rs.getInt("price"))/100;
                %>
        
			<li class="span3">
			  <div class="thumbnail">
				<a href="product_details.html" class="overlay"></a>
				<img src=products/<%=rs.getString("image")%> alt=""></a>
				<div class="caption cntr">
					<p><%=rs.getString("product_name")%></p>
					<p><strong>Rs. <%=rs.getString("price")%></strong></p>
					<h4><a class="shopBtn" href="add_to_cart.jsp?pid=<%=rs.getString("product_id")%>&pname=<%=rs.getString("product_name")%>&price=<%=rs.getString("price")%>&image=<%=rs.getString("image")%>&uid=<%=session.getAttribute("uid")%>&uemail=<%=session.getAttribute("uemail")%>&desc=<%=rs.getString("Product_details")%>&discount=<%out.print(disc);%>" title="add to cart"> Add to cart </a></h4>
					<div class="actionList">
					  Get <%out.print(d);%>% Discount
					</div> 
					<br class="clr">
				</div>
			  </div>
			</li><%}%>
			
		  </ul>
                        <h3>Computer and Peripherals </h3>
                   <ul class="thumbnails">  <% 
     
        ResultSet rs1=cn.executeQuery("select * from products where category='Computer and Peripherals'");
        while(rs1.next()){  
            int disc=(d*rs1.getInt("price"))/100;
                   %>
			<li class="span3">
			  <div class="thumbnail">
				
				<img src=products/<%=rs1.getString("image")%> alt=""></a>
				<div class="caption cntr">
					<p><%=rs1.getString("product_name")%></p>
					<p><strong>Rs. <%=rs1.getString("price")%></strong></p>
					<h4><a class="shopBtn" href="add_to_cart.jsp?pid=<%=rs1.getString("product_id")%>&pname=<%=rs1.getString("product_name")%>&price=<%=rs1.getString("price")%>&image=<%=rs1.getString("image")%>&uid=<%=session.getAttribute("uid")%>&uemail=<%=session.getAttribute("uemail")%>&discount=<%out.print(disc);%>&discount=<%out.print(disc);%>" title="add to cart"> Add to cart </a></h4>
					<div class="actionList">
						Get <%out.print(d);%>% Discount
					</div> 
					<br class="clr">
				</div>
			  </div>
			</li><%}%>
			
		  </ul>
                         <h3>Refrigerators </h3>
                   <ul class="thumbnails">  <% 
       
        ResultSet rs2=cn.executeQuery("select * from products where category='Refrigerators'");
        while(rs2.next()){
                    int disc=(d*rs2.getInt("price"))/100;
                   %>
			<li class="span3">
			  <div class="thumbnail">
				<img src=products/<%=rs2.getString("image")%> alt=""></a>
				<div class="caption cntr">
					<p><%=rs2.getString("product_name")%></p>
					<p><strong>Rs. <%=rs2.getString("price")%></strong></p>
					<h4><a class="shopBtn" href="add_to_cart.jsp?pid=<%=rs2.getString("product_id")%>&pname=<%=rs2.getString("product_name")%>&price=<%=rs2.getString("price")%>&image=<%=rs2.getString("image")%>&uid=<%=session.getAttribute("uid")%>&uemail=<%=session.getAttribute("uemail")%>&discount=<%out.print(disc);%>" title="add to cart"> Add to cart </a></h4>
					<div class="actionList">
						Get <%out.print(d);%>% Discount
					</div> 
					<br class="clr">
				</div>
			  </div>
			</li><%}%>
			
		  </ul>
                               <h3>Washing Machines </h3>
                   <ul class="thumbnails">  <% 
        
        ResultSet rs3=cn.executeQuery("select * from products where category='Washing Machines'");
        while(rs3.next()){
                    int disc=(d*rs3.getInt("price"))/100;
                   %>
			<li class="span3">
			  <div class="thumbnail">
				<img src=products/<%=rs3.getString("image")%> alt=""></a>
				<div class="caption cntr">
					<p><%=rs3.getString("product_name")%></p>
					<p><strong>Rs. <%=rs3.getString("price")%></strong></p>
					<h4><a class="shopBtn" href="add_to_cart.jsp?pid=<%=rs3.getString("product_id")%>&pname=<%=rs3.getString("product_name")%>&price=<%=rs3.getString("price")%>&image=<%=rs3.getString("image")%>&uid=<%=session.getAttribute("uid")%>&uemail=<%=session.getAttribute("uemail")%>&discount=<%out.print(disc);%>" title="add to cart"> Add to cart </a></h4>
					<div class="actionList">
					Get <%out.print(d);%>% Discount	
					</div> 
					<br class="clr">
				</div>
			  </div>
			</li><%}%>
			
		  </ul>
                        
                               <h3>AC & Fan </h3>
                   <ul class="thumbnails">  <% 
        
        ResultSet rs4=cn.executeQuery("select * from products where category='AC and Fan'");
        while(rs4.next()){
                    int disc=(d*rs4.getInt("price"))/100;
                   %>
			<li class="span3">
			  <div class="thumbnail">
				<img src=products/<%=rs4.getString("image")%> alt=""></a>
				<div class="caption cntr">
					<p><%=rs4.getString("product_name")%></p>
					<p><strong>Rs. <%=rs4.getString("price")%></strong></p>
					<h4><a class="shopBtn" href="add_to_cart.jsp?pid=<%=rs4.getString("product_id")%>&pname=<%=rs4.getString("product_name")%>&price=<%=rs4.getString("price")%>&image=<%=rs4.getString("image")%>&uid=<%=session.getAttribute("uid")%>&uemail=<%=session.getAttribute("uemail")%>&discount=<%out.print(disc);%>" title="add to cart"> Add to cart </a></h4>
					<div class="actionList">
						Get <%out.print(d);%>% Discount
					</div> 
					<br class="clr">
				</div>
			  </div>
			</li><%}%>
			
		  </ul>
                        
                          
<!-- 
Clients 
-->
<section class="our_client">
	<hr class="soften"/>
	<h4 class="title cntr"><span class="text">Manufactures</span></h4>
	<hr class="soften"/>
	<div class="row">
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/1.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/2.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/3.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/4.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/5.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/6.png"></a>
		</div>
	</div>
</section>

<!--
Footer
-->
<footer class="footer">
<div class="row-fluid">
<div class="span2">
<h5>Your Account</h5>
<a href="#">YOUR ACCOUNT</a><br>
<a href="#">PERSONAL INFORMATION</a><br>
<a href="#">ADDRESSES</a><br>
<a href="#">DISCOUNT</a><br>
<a href="#">ORDER HISTORY</a><br>
 </div>
<div class="span2">
<h5>Iinformation</h5>
<a href="contact.html">CONTACT</a><br>
<a href="#">SITEMAP</a><br>
<a href="#">LEGAL NOTICE</a><br>
<a href="#">TERMS AND CONDITIONS</a><br>
<a href="#">ABOUT US</a><br>
 </div>
<div class="span2">
<h5>Our Offer</h5>
<a href="#">NEW PRODUCTS</a> <br>
<a href="#">TOP SELLERS</a><br>
<a href="#">SPECIALS</a><br>
<a href="#">MANUFACTURERS</a><br>
<a href="#">SUPPLIERS</a> <br/>
 </div>
 <div class="span6">
<h5>The standard chunk of Lorem</h5>
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for
 those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et 
 Malorum" by Cicero are also reproduced in their exact original form, 
accompanied by English versions from the 1914 translation by H. Rackham.
 </div>
 </div>
</footer>
</div><!-- /container -->

<div class="copyright">
<div class="container">
	<p class="pull-right">
		<a href="#"><img src="assets/img/maestro.png" alt="payment"></a>
		<a href="#"><img src="assets/img/mc.png" alt="payment"></a>
		<a href="#"><img src="assets/img/pp.png" alt="payment"></a>
		<a href="#"><img src="assets/img/visa.png" alt="payment"></a>
		<a href="#"><img src="assets/img/disc.png" alt="payment"></a>
	</p>
	<span>Copyright &copy; 2013<br> bootstrap ecommerce shopping template</span>
</div>
</div>
<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.easing-1.3.min.js"></script>
    <script src="assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
    <script src="assets/js/shop.js"></script>
  </body>
</html>
<!-- 
	Upper Header Section 
-->


<%} else{%>
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
				<a href="cart.jsp"><span class="icon-shopping-cart"></span><%out.print(items);%> Item(s) - <span class="badge badge-warning"><%out.print(total_amt);%> </span></a>
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
			  <li class=""><a href="index.jsp">Home	</a></li>
			  <li class=""><a href="three_column.jsp?type=all">Three Column</a></li>
			  <li class="active"><a href="four_column.jsp?type=all">Four Column</a></li>
			 </ul>
			
			<ul class="nav pull-right">
			<li class="dropdown">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#"><span class="icon-lock"></span> Welcome,<%out.print(username);%>  <b class="caret"></b></a>
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
<!--
Three column view
-->
	<h3><%out.print(type);%> </h3>
		<ul class="thumbnails">  <% 
        
                    String  ss=request.getParameter("type");
        ResultSet rs=cn.executeQuery("select * from products where category='"+ss+"'");
        while(rs.next()){
                int disc=(d*rs.getInt("price"))/100;%>
			<li class="span3">
			  <div class="thumbnail">
				<a href="product_details.html" class="overlay"></a>
				<a href="product_details.html"><img src=products/<%=rs.getString("image")%> alt=""></a>
				<div class="caption cntr">
					<p><%=rs.getString("product_name")%></p>
					<p><strong>Rs. <%=rs.getString("price")%></strong></p>
					<h4><a class="shopBtn" href="add_to_cart.jsp?pid=<%=rs.getString("product_id")%>&pname=<%=rs.getString("product_name")%>&price=<%=rs.getString("price")%>&image=<%=rs.getString("image")%>&uid=<%=session.getAttribute("uid")%>&uemail=<%=session.getAttribute("uemail")%>&desc=<%=rs.getString("Product_details")%>&discount=<%out.print(disc);%>" title="add to cart"> Add to cart </a></h4>
					<div class="actionList">
						Get <%out.print(d);%>% Discount
					</div> 
					<br class="clr">
				</div>
			  </div>
			</li><%}%>
			
		  </ul>
                       
<!-- 
Clients 
-->
<section class="our_client">
	<hr class="soften"/>
	<h4 class="title cntr"><span class="text">Manufactures</span></h4>
	<hr class="soften"/>
	<div class="row">
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/1.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/2.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/3.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/4.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/5.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="assets/img/6.png"></a>
		</div>
	</div>
</section>

<!--
Footer
-->
<footer class="footer">
<div class="row-fluid">
<div class="span2">
<h5>Your Account</h5>
<a href="#">YOUR ACCOUNT</a><br>
<a href="#">PERSONAL INFORMATION</a><br>
<a href="#">ADDRESSES</a><br>
<a href="#">DISCOUNT</a><br>
<a href="#">ORDER HISTORY</a><br>
 </div>
<div class="span2">
<h5>Iinformation</h5>
<a href="contact.html">CONTACT</a><br>
<a href="#">SITEMAP</a><br>
<a href="#">LEGAL NOTICE</a><br>
<a href="#">TERMS AND CONDITIONS</a><br>
<a href="#">ABOUT US</a><br>
 </div>
<div class="span2">
<h5>Our Offer</h5>
<a href="#">NEW PRODUCTS</a> <br>
<a href="#">TOP SELLERS</a><br>
<a href="#">SPECIALS</a><br>
<a href="#">MANUFACTURERS</a><br>
<a href="#">SUPPLIERS</a> <br/>
 </div>
 <div class="span6">
<h5>The standard chunk of Lorem</h5>
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for
 those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et 
 Malorum" by Cicero are also reproduced in their exact original form, 
accompanied by English versions from the 1914 translation by H. Rackham.
 </div>
 </div>
</footer>
</div><!-- /container -->

<div class="copyright">
<div class="container">
	<p class="pull-right">
		<a href="#"><img src="assets/img/maestro.png" alt="payment"></a>
		<a href="#"><img src="assets/img/mc.png" alt="payment"></a>
		<a href="#"><img src="assets/img/pp.png" alt="payment"></a>
		<a href="#"><img src="assets/img/visa.png" alt="payment"></a>
		<a href="#"><img src="assets/img/disc.png" alt="payment"></a>
	</p>
	<span>Copyright &copy; 2013<br> bootstrap ecommerce shopping template</span>
</div>
</div>
<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.easing-1.3.min.js"></script>
    <script src="assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
    <script src="assets/js/shop.js"></script>
  </body>
</html>
<%}}}catch(Exception e){e.printStackTrace();}}%>