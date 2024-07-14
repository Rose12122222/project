<%-- 
    Document   : login
    Created on : Feb 19, 2024, 11:55:30 PM
    Author     : FPT SHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Coron-login</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets\img\favicon.png">

        <!-- all css here -->
        <link rel="stylesheet" href="assets\css\bootstrap.min.css">
        <link rel="stylesheet" href="assets\css\plugin.css">
        <link rel="stylesheet" href="assets\css\bundle.css">
        <link rel="stylesheet" href="assets\css\style.css">
        <link rel="stylesheet" href="assets\css\responsive.css">
        <script src="assets\js\vendor\modernizr-2.8.3.min.js"></script>
    </head>
    <body>
        <!-- Add your site or application content here -->

        <!--pos page start-->
        <div class="pos_page">
            <div class="container"> 
                <!--pos page inner-->
                <div class="pos_page_inner">  
                    <!--header area -->
                    <jsp:include page="header.jsp"/>
                    <!--header end -->
                    <!--breadcrumbs area start-->
                    <div class="breadcrumbs_area">
                        <div class="row">
                            <div class="col-12">
                                <div class="breadcrumb_content">
                                    <ul>
                                        <li><a href="home.jsp">home</a></li>
                                        <li><i class="fa fa-angle-right"></i></li>
                                        <li>login</li>
                                    </ul>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!--breadcrumbs area end-->

                    <!-- customer login start -->
                    <div class="customer_login">
                        <div class="row">
                            <!--login area start-->
                            <div class="col-lg-6 col-md-6">
                                <div class="account_form">
                                    <h2>login</h2>
                                    <form action="#">
                                        <p>   
                                            <label>Username or email <span>*</span></label>
                                            <input type="text">
                                        </p>
                                        <p>   
                                            <label>Passwords <span>*</span></label>
                                            <input type="password">
                                        </p>   
                                        <div class="login_submit">
                                            <button type="submit">login</button>
                                            <label for="remember">
                                                <input id="remember" type="checkbox">
                                                Remember me
                                            </label>
                                            <a href="#">Lost your password?</a>
                                        </div>

                                    </form>
                                </div>    
                            </div>
                            <!--login area start-->

                            <!--register area start-->
                            <div class="col-lg-6 col-md-6">
                                <div class="account_form register">
                                    <h2>Register</h2>
                                    <form action="#">
                                        <p>   
                                            <label>Email address  <span>*</span></label>
                                            <input type="text">
                                        </p>
                                        <p>   
                                            <label>Passwords <span>*</span></label>
                                            <input type="password">
                                        </p>
                                        <div class="login_submit">
                                            <button type="submit">Register</button>
                                        </div>
                                    </form>
                                </div>    
                            </div>
                            <!--register area end-->
                        </div>
                    </div>
                    <!-- customer login end -->

                </div>
                <!--pos page inner end-->
            </div> 
        </div>
        <!--pos page end-->

        <!--footer area start-->
        <jsp:include page="footer.jsp"/>
        <!--footer area end-->






        <!-- all js here -->
        <script src="assets\js\vendor\jquery-1.12.0.min.js"></script>
        <script src="assets\js\popper.js"></script>
        <script src="assets\js\bootstrap.min.js"></script>
        <script src="assets\js\ajax-mail.js"></script>
        <script src="assets\js\plugins.js"></script>
        <script src="assets\js\main.js"></script>
    </body>
</html>

