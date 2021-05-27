<%@page import="java.sql.*;" %>
<jsp:useBean id="cn" scope="page" class="mm.Conn1" />
<!DOCTYPE html>
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

            if ((username != "" && username != null) && (password != "" && password != null)) {

                ResultSet rs = cn.executeQuery("select * from cart where user_id='" + uid + "'");
                while (rs.next()) {
                    items++;
                    int amt = Integer.parseInt(rs.getString("price"));
                    total_amt = total_amt + amt;
                }

        %>


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
                        <a class="active" href="index.jsp"> <span class="icon-home"></span> Home</a> 
                        <a href="my_account.jsp"><span class="icon-user"></span> My Account</a> 
                        <a href="register.jsp"><span class="icon-edit"></span> Free Register </a> 
                        <a href="contact.jsp"><span class="icon-envelope"></span> Contact us</a>
                        <a href="cart.jsp"><span class="icon-shopping-cart"></span> <%out.print(items);%> Item(s) - <span class="badge badge-warning"><%out.print(total_amt);%> </span></a>
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
                                    <a data-toggle="dropdown" class="dropdown-toggle" href="#"><span class="icon-lock"></span>Welcome,<%out.print(username);%> <b class="caret"></b></a>
                                    <div class="dropdown-menu"><script>
                                        function  valid1()
                                        {
                                            if (f.username.value === "")
                                            {
                                                alert("enter username");
                                                return;
                                            }
                                            if (f.password.value == "")
                                            {
                                                alert("enter password");
                                                return;

                                            }
                                            f.submit();
                                        }
                                        </script>
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
                <div id="sidebar" class="span3">
                    <div class="well well-small">
                        <ul class="nav nav-list">
                            <li><a href="four_column.jsp?type=T.V."><span class="icon-chevron-right"></span>Television</a></li>
                            <li><a href="four_column.jsp?type=Refrigerators"><span class="icon-chevron-right"></span>Refrigerators</a></li>
                            <li><a href="four_column.jsp?type=AC and Fan"><span class="icon-chevron-right"></span>Air Conditioners & Coolers</a></li>
                            <li><a href="four_column.jsp?type=Washing Machines"><span class="icon-chevron-right"></span>Washing Machines</a></li>
                            <li><a href="four_column.jsp?type=Computer and Peripherals"><span class="icon-chevron-right"></span>Computer and Peripherals</a></li>
                            <li><a href="four_column.jsp?type=Laptops"><span class="icon-chevron-right"></span>Laptops</a></li>
                            <li><a href="four_column.jsp?type=Mobiles"><span class="icon-chevron-right"></span>Mobiles</a></li>
                            <li style="border:0"> &nbsp;</li>

                        </ul>
                    </div>


                    <div class="well well-small" ><a href="#"><img src="assets/img/paypal.jpg" alt="payment method paypal"></a></div>

                </div
                <div class="span9">
                    <div class="well np">
                        <div id="myCarousel" class="carousel slide homCar">
                            <div class="carousel-inner">
                                <div class="item">
                                    <img style="width:100%" src="assets/img/l1.jpg" alt="Redmi Note 4">
                                    <center><div class="carousel-caption">
                                            <h4>Redmi Note 4</h4>
                                            <p><span>Next Sale on 31/03/2017</span></p>
                                        </div></center>
                                </div>
                                <div class="item">
                                    <img style="width:100%" src="assets/img/l2.jpg" alt="Samsung s6 Edge">
                                    <div class="carousel-caption">
                                        <h4></h4>
                                        <p><span>Samsung S6 Edge</span></p>
                                    </div>
                                </div>
                                <div class="item active">
                                    <img style="width:100%" src="assets/img/a6.jpg" alt="bootstrap ecommerce templates">
                                    <div class="carousel-caption">
                                        <h4></h4>
                                        <p><span></span></p>
                                    </div>
                                </div>
                                <div class="item">
                                    <img style="width:100%" src="assets/img/tv4.jpg" alt="bootstrap templates">
                                    <div class="carousel-caption">
                                        <h4></h4>
                                        <p><span></span></p>
                                    </div>
                                </div>
                            </div>
                            <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                            <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
                        </div>
                    </div>
                    <!--
                    New Products
                    -->
                    <div class="well well-small">
                        <h3>New Products </h3>
                        <hr class="soften"/>
                        <div class="row-fluid">
                            <div id="newProductCar" class="carousel slide">
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <ul class="thumbnails">
                                            <li class="span3">
                                                <div class="thumbnail">

                                                    <a href="#"><img src="assets/img/scanners.jpg" alt="HP Scanner"></a>
                                                </div>
                                            </li>
                                            <li class="span3">
                                                <div class="thumbnail">

                                                    <a  href="#"><img src="assets/img/keyboard.jpg" alt=""></a>
                                                </div>
                                            </li>
                                            <li class="span3">
                                                <div class="thumbnail">

                                                    <a  href="#"><img src="assets/img/a3.jpg" alt=""></a>
                                                </div>
                                            </li>
                                            <li class="span3">
                                                <div class="thumbnail">
                                                    <img src="assets/img/hp.jpg" alt=""></a>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="item">
                                        <ul class="thumbnails">
                                            <li class="span3">
                                                <div class="thumbnail">
                                                    <img src="assets/img/hp2.jpg" alt=""></a>
                                                </div>
                                            </li>
                                            <li class="span3">
                                                <div class="thumbnail">
                                                    <img src="assets/img/m2.jpg" alt=""></a>
                                                </div>
                                            </li>
                                            <li class="span3">
                                                <div class="thumbnail">
                                                    <img src="assets/img/ref1.jpg" alt=""></a>
                                                </div>
                                            </li>
                                            <li class="span3">
                                                <div class="thumbnail">
                                                    <img src="assets/img/lcd1.jpg" alt=""></a>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <a class="left carousel-control" href="#newProductCar" data-slide="prev">&lsaquo;</a>
                                <a class="right carousel-control" href="#newProductCar" data-slide="next">&rsaquo;</a>
                            </div>
                        </div>
                        <div class="row-fluid">
                            <ul class="thumbnails">
                                <li class="span4">
                                    <div class="thumbnail">

                                        <img src="assets/img/printer.jpg" alt=""></a>
                                        <div class="caption cntr">
                                            <p></p>
                                            <p><strong>Rs. 2500</strong></p>

                                            <br class="clr">
                                        </div>
                                    </div>
                                </li>
                                <li class="span4">
                                    <div class="thumbnail">
                                        <img src="assets/img/hp3.jpg" alt=""></a>
                                        <div class="caption cntr">
                                            <p>HP OMEN Touchscreen</p>
                                            <p><strong> Rs. 30,000</strong></p>

                                            <br class="clr">
                                        </div>
                                    </div>
                                </li>
                                <li class="span4">
                                    <div class="thumbnail">
                                        <img src="assets/img/m.jpg" alt=""></a>
                                        <div class="caption cntr">
                                            <p>Logitech Wired Mouse</p>
                                            <p><strong>Rs. 400</strong></p>

                                            <br class="clr">
                                        </div>
                                    </div>
                                </li>
                            </ul>
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
                                <img alt="" src="assets/img/1.png"></a>
                            </div>
                            <div class="span2">
                                <img alt="" src="assets/img/2.png"></a>
                            </div>
                            <div class="span2">
                                <img alt="" src="assets/img/3.png"></a>
                            </div>
                            <div class="span2">
                                <img alt="" src="assets/img/4.png"></a>
                            </div>
                            <div class="span2">
                                <img alt="" src="assets/img/5.png"></a>
                            </div>
                            <div class="span2">
                                <img alt="" src="assets/img/6.png"></a>
                            </div>
                        </div>
                    </section>

                    <!--
                    Footer
                    -->

                </div><!-- /container -->

                <div class="copyright">
                    <div class="container">

                        <span>Copyright &copy; 2017</span>
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


                <%} else {%>
                <!DOCTYPE html>
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

                        <link rel="shortcut icon" href="assets/ico/favicon.ico">
                    </head>
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
                                        <a class="active" href="index.jsp"> <span class="icon-home"></span> Home</a> 
                                        <a href="my_account.jsp"><span class="icon-user"></span> My Account</a> 
                                        <a href="register.jsp"><span class="icon-edit"></span> Free Register </a> 
                                        <a href="contact.jsp"><span class="icon-envelope"></span> Contact us</a>
                                        <a href="cart.jsp"><span class="icon-shopping-cart"></span> First, Login - <span class="badge badge-warning"></span></a>
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
                                            <a class="logo" href="#"><span>Twitter Bootstrap ecommerce template</span> 
                                                <img src="assets/img/logo-bootstrap-shoping-cart.png" alt="bootstrap sexy shop">
                                            </a>
                                        </h1>
                                    </div>
                                    <div class="span4">

                                    </div>
                                    <div class="span4 alignR">
                                        <p><br> <strong> Support (24/7) :  0800 1234 678 </strong><br><br></p>

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
                                                    <a data-toggle="dropdown" class="dropdown-toggle" href="#"><span class="icon-lock"></span> Login <b class="caret"></b></a>
                                                    <div class="dropdown-menu"><script>
                                        function  valid1()
                                        {
                                            if (f.username.value === "")
                                            {
                                                alert("enter username");
                                                return;
                                            }
                                            if (f.password.value == "")
                                            {
                                                alert("enter password");
                                                return;

                                            }
                                            f.submit();
                                        }
                                                        </script>
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
                            <div class="row">
                                <div id="sidebar" class="span3">
                                    <div class="well well-small">
                                        <ul class="nav nav-list">
                                            <li><a href="four_column.jsp?type=T.V."><span class="icon-chevron-right"></span>Television</a></li>
                                            <li><a href="four_column.jsp?type=Refrigerators"><span class="icon-chevron-right"></span>Refrigerators</a></li>
                                            <li><a href="four_column.jsp?type=AC and Fan"><span class="icon-chevron-right"></span>Air Conditioners and Coolers</a></li>
                                            <li><a href="four_column.jsp?type=Washing Machines"><span class="icon-chevron-right"></span>Washing Machines</a></li>
                                            <li><a href="four_column.jsp?type=Computer and Peripherals"><span class="icon-chevron-right"></span>Computer and Peripherals</a></li>
                                            <li><a href="four_column.jsp?type=Laptops"><span class="icon-chevron-right"></span>Laptops</a></li>
                                            <li><a href="four_column.jsp?type=Mobiles"><span class="icon-chevron-right"></span>Mobiles</a></li>
                                            <li style="border:0"> &nbsp;</li>

                                        </ul>
                                    </div>


                                    <div class="well well-small" ><a href="#"><img src="assets/img/paypal.jpg" alt="payment method paypal"></a></div>


                                </div>
                                <div class="span9">
                                    <div class="well np">
                                        <div id="myCarousel" class="carousel slide homCar">
                                            <div class="carousel-inner">
                                                <div class="item">
                                                    <img style="width:100%" src="assets/img/l1.jpg" alt="bootstrap ecommerce templates">
                                                    <div class="carousel-caption">
                                                        <h4></h4>
                                                        <p><span></span></p>
                                                    </div>
                                                </div>
                                                <div class="item">
                                                    <img style="width:100%" src="assets/img/l2.jpg" alt="bootstrap ecommerce templates">
                                                    <div class="carousel-caption">
                                                        <h4></h4>
                                                        <p><span></span></p>
                                                    </div>
                                                </div>
                                                <div class="item active">
                                                    <img style="width:100%" src="assets/img/a6.jpg" alt="bootstrap ecommerce templates">
                                                    <div class="carousel-caption">
                                                        <h4></h4>
                                                        <p><span></span></p>
                                                    </div>
                                                </div>
                                                <div class="item">
                                                    <img style="width:100%" src="assets/img/tv4.jpg" alt="bootstrap templates">
                                                    <div class="carousel-caption">

                                                    </div>
                                                </div>
                                            </div>
                                            <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                                            <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
                                        </div>
                                    </div>
                                    <!--
                                    New Products
                                    -->
                                    <div class="well well-small">
                                        <h3>New Products </h3>
                                        <hr class="soften"/>
                                        <div class="row-fluid">
                                            <div id="newProductCar" class="carousel slide">
                                                <div class="carousel-inner">
                                                    <div class="item active">
                                                        <ul class="thumbnails">
                                                            <li class="span3">
                                                                <div class="thumbnail">
                                                                    <a class="zoomTool" href="#" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
                                                                    <img src="assets/img/scanners.jpg" alt="bootstrap-ring"></a>
                                                                </div>
                                                            </li>
                                                            <li class="span3">
                                                                <div class="thumbnail">
                                                                    <a class="zoomTool" href="#" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
                                                                    <img src="assets/img/keyboard.jpg" alt=""></a>
                                                                </div>
                                                            </li>
                                                            <li class="span3">
                                                                <div class="thumbnail">
                                                                    <a class="zoomTool" href="#" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
                                                                    <img src="assets/img/a3.jpg" alt=""></a>
                                                                </div>
                                                            </li>
                                                            <li class="span3">
                                                                <div class="thumbnail">
                                                                    <img src="assets/img/hp.jpg" alt=""></a>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="item">
                                                        <ul class="thumbnails">
                                                            <li class="span3">
                                                                <div class="thumbnail">
                                                                    <img src="assets/img/hp2.jpg" alt=""></a>
                                                                </div>
                                                            </li>
                                                            <li class="span3">
                                                                <div class="thumbnail">
                                                                    <img src="assets/img/m2.jpg" alt=""></a>
                                                                </div>
                                                            </li>
                                                            <li class="span3">
                                                                <div class="thumbnail">

                                                                    <img src="assets/img/ref1.jpg" alt=""></a>
                                                                </div>
                                                            </li>
                                                            <li class="span3">
                                                                <div class="thumbnail">

                                                                    <img src="assets/img/lcd1.jpg" alt=""></a>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <a class="left carousel-control" href="#newProductCar" data-slide="prev">&lsaquo;</a>
                                                <a class="right carousel-control" href="#newProductCar" data-slide="next">&rsaquo;</a>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <ul class="thumbnails">
                                                <li class="span4">
                                                    <div class="thumbnail">

                                                        <img src="assets/img/printer.jpg" alt=""></a>
                                                        <div class="caption cntr">
                                                            <p>HP Printer</p>
                                                            <p><strong> Rs. 4,999</strong></p>

                                                            <br class="clr">
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="span4">
                                                    <div class="thumbnail">

                                                        <img src="assets/img/hp3.jpg" alt=""></a>
                                                        <div class="caption cntr">
                                                            <p>HP OMEN Touchscreen</p>
                                                            <p><strong> 30,000</strong></p>

                                                            <br class="clr">
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="span4">
                                                    <div class="thumbnail">

                                                        <img src="assets/img/m.jpg" alt=""></a>
                                                        <div class="caption cntr">
                                                            <p>Logitech Wired Mouse</p>
                                                            <p><strong>Rs. 400</strong></p>

                                                            <br class="clr">
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
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
                                        <img alt="" src="assets/img/1.png"></a>
                                    </div>
                                    <div class="span2">
                                        <img alt="" src="assets/img/2.png"></a>
                                    </div>
                                    <div class="span2">
                                        <img alt="" src="assets/img/3.png"></a>
                                    </div>
                                    <div class="span2">
                                        <img alt="" src="assets/img/4.png"></a>
                                    </div>
                                    <div class="span2">
                                        <img alt="" src="assets/img/5.png"></a>
                                    </div>
                                    <div class="span2">
                                        <img alt="" src="assets/img/6.png"></a>
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
                <%}%>