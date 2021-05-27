
<%@page import="java.sql.*;" %>
<jsp:useBean id="cn" scope="page" class="mm.Conn1" />
<% if (session.getAttribute("uname") == null || session.getAttribute("password") == null) {
        response.sendRedirect("cart_error.jsp");
    } else {%>
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
            String username = (String) session.getAttribute("uname");
            String password = (String) session.getAttribute("password");
            String uid = (String) session.getAttribute("uid");
            int items = 0;
            int total_amt = 0;
            String img = null;
            String desc = null;
            int a_amt = 0;
            int qty = 0;
            int price = 0, pid = 0;
            if ((username != "" && username != null) && (password != "" && password != null)) {

                ResultSet rs = cn.executeQuery("select * from cart where user_id='" + uid + "'");
                while (rs.next()) {
                    items++;
                    int amt = Integer.parseInt(rs.getString("price"));
                    total_amt = total_amt + amt;
                    img = rs.getString("image");
                    desc = rs.getString("product_detail");
                    a_amt = Integer.parseInt(rs.getString("a_price"));
                    qty = Integer.parseInt(rs.getString("qty"));
                    price = Integer.parseInt(rs.getString("price"));
                    pid = Integer.parseInt(rs.getString("p_id"));
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
            --> <%
                ResultSet rs0 = cn.executeQuery("select * from users where uid='" + uid + "'");
                if (rs0.next()) {
                    
            %>
            <div class="row">
                <div class="span12">
                    <ul class="breadcrumb">
                        <li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
                        <li class="active">My Account</li>
                    </ul>
                    <div class="well well-small">
                        <center><h1>My Account</h1></center><div style="float:right"> <img  src=images/<%=rs0.getString("image")%> width=100px  height=100></div>
                            <%  }%>
                        <hr class="soften"/>

                        <table cellpadding="20"> 



                            <tr><td><h4><a href="edit_profile.jsp" >Edit Profile</a></h4></td></tr>
                            <tr><td><h4><a href="change_password.jsp" >Change Password</a></h4></td></tr>
                            <tr><td><h4><a href="checkmy_orders.jsp">My Orders</a></h4></td></tr>


                        </table>
                        <h4><a href="logout.jsp">Logout</a></h4>
                        <%}%>


                        <br/>




                    </div>
                </div>
            </div>
            <!-- 
            Clients 
            -->

    </body>
</html><%}%>