<%@page import="java.sql.*;" %>
<jsp:useBean id="cn" scope="page" class="mm.Conn1" />
<%
  String uname=(String)session.getAttribute("uname");
  String pass=(String)session.getAttribute("password");
  out.print(uname+"<br>");
   out.print(pass+"<br>");
if((uname.equals("") || uname.equals(null)) && (pass.equals("") || pass.equals(null))){
    response.sendRedirect("homepage.jsp");
}
else{
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Twitter Bootstrap shopping cart</title>
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

<script>
function check()
{
    
   
    if(f1.from.value=="" || f1.from.value==null){
        alert("Enter a Valid E-mail id");
    }
    n=f1.from.value;//abc
    s=n.indexOf("@");
    if(s==-1)
    {
        alert("must  include @");
        return;
    } 
    s=n.indexOf(".com");
    if(s==-1)
    {
        alert("enter  email  properly");
        return;
    }
    
   if(f1.password.value=="" || f1.password.value==null){
        alert("Enter Password");
    }
    if(f1.subject.value=="" || f1.subject.value==null){
        alert("Enter Subject");
    }
    if(f1.message.value=="" || f1.message.value==null){
        alert("Enter message");
    }
    /*if(f1.image.value="" || f1.image.value=null){
        alert("Please Select an Image");
    }*/
    f1.submit();

}

</script>

<body>
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
				<a href="cart.jsp"><span class="icon-shopping-cart"></span>0 Item(s) - <span class="badge badge-warning"></span></a>
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
			  <li class="active"><a href="index.jsp">Home	</a></li>
			 <li class=""><a href="three_column.jsp?type=all">Three Column</a></li>
			  <li class=""><a href="four_column.jsp?type=all">Four Column</a></li>
			  </ul>
			
			<ul class="nav pull-right">
			<li class="dropdown">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#"><span class="icon-lock"></span>Welcome,<%out.print(uname);%> <b class="caret"></b></a>
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
	
		
		<div>
                    <center><h4>Change Password</h4></center>
		

<script>
function check()
{
    
    if(f1.username.value=="" || f1.username.value==null)
    {
        alert("Enter Username");
        return;
    }
    if(f1.password.value=="" || f1.password.value==null)
    {
        alert("Enter Password");
        return;
    }
   
    if(f1.email.value=="" || f1.email.value==null){
        alert("Enter a Valid E-mail id");
    }
    n=f1.email.value;//abc
    s=n.indexOf("@");
    if(s==-1)
    {
        alert("must  include @");
        return;
    } 
    s=n.indexOf(".com");
    if(s==-1)
    {
        alert("enter  email  properly");
        return;
    }
   if(f1.mobile.value=="" || f1.mobile.value==null){
        alert("Enter Mobile Number");
    }
    
    if(f1.mobile.value.length<10 || f1.mobile.value.length>10)
    {
        alert("Enter valid Mobile Number");
    }
    if(/[a-z]/.test(f1.mobile.value))
    {
        alert("Enter valid Mobile Number");
    }
    /*if(f1.image.value="" || f1.image.value=null){
        alert("Please Select an Image");
    }*/
    f1.submit();

}

</script>
    <body><form action="edit_profile1.jsp" method="post" name="f1">
       <%  
           String username=(String)session.getAttribute("uname");
           String password=(String)session.getAttribute("password");
            ResultSet rs=cn.executeQuery("select * from users where admin_name='"+username+"' and admin_pass='"+password+"' ");
          if(rs.next()){
           
           %>
           <table><tr><td>ID</td><td><input type="text" name="id" value="<%=rs.getInt("uid")%>" required="true" readonly="readonly"></td></tr>
               <tr><td>Username</td><td><input type="text" name="username" value="<%=rs.getString("admin_name")%>" required="true"></td></tr>
               <tr><td>Password</td><td><input type="text" name="password" value="<%=rs.getString("admin_pass")%>" required="true"></td></tr>
               <tr><td>Email_id</td><td><input type="text" name="email" value="<%=rs.getString("email_id")%>" required="true"></td></tr>
               <tr><td>Mobile Number</td><td><input type="text" name="mobile" value="<%=rs.getString("mobile")%>" required="true"></td></tr>
           <%}
             else{
                       ResultSet rss=cn.executeQuery("select * from users where username='"+username+"' and password='"+password+"' ");
          if(rss.next()){
           %>
           <table><tr><td>ID</td><td><input type="text" name="id" value="<%=rss.getInt("uid")%>" required="true" readonly="readonly"></td></tr>
               <tr><td>Username</td><td><input type="text" name="username" value="<%=rss.getString("username")%>" required="true"></td></tr>
               <tr><td>Password</td><td><input type="text" name="password" value="<%=rss.getString("password")%>" required="true"></td></tr>
               <tr><td>Email_id</td><td><input type="text" name="email" value="<%=rss.getString("email_id")%>" required="true"></td></tr>
               <tr><td>Mobile Number</td><td><input type="text" name="mobile" value="<%=rss.getString("mobile")%>" required="true"></td></tr>
           <%}}%>
                       
               <tr><td colspan="2"><center><input type="button" value="Update" onclick="check()"></center></td></tr>
           </table>           
        </form> 
    </body>
</html>
		</div>
	</div>

	
</div>
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

<!-- /container -->

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
<%}%>