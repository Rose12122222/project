<%-- 
    Document   : my-account
    Created on : Feb 19, 2024, 11:54:18 PM
    Author     : FPT SHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Coron-my account</title>
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
                                        <li>my account</li>
                                    </ul>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!--breadcrumbs area end-->

                    <!-- Start Maincontent  -->
                    <section class="main_content_area">
                        <div class="account_dashboard">
                            <div class="row">
                                <div class="col-sm-12 col-md-3 col-lg-3">
                                    <!-- Nav tabs -->
                                    <div class="dashboard_tab_button">
                                        <ul role="tablist" class="nav flex-column dashboard-list">
                                            <li><a href="#dashboard" data-toggle="tab" class="nav-link active">Dashboard</a></li>
                                            <li> <a href="#orders" data-toggle="tab" class="nav-link">Orders</a></li>
                                            <li><a href="#downloads" data-toggle="tab" class="nav-link">Downloads</a></li>
                                            <li><a href="#address" data-toggle="tab" class="nav-link">Addresses</a></li>
                                            <li><a href="#account-details" data-toggle="tab" class="nav-link">Account details</a></li>
                                            <li><a href="login.jsp" class="nav-link">logout</a></li>
                                        </ul>
                                    </div>    
                                </div>
                                <div class="col-sm-12 col-md-9 col-lg-9">
                                    <!-- Tab panes -->
                                    <div class="tab-content dashboard_content">
                                        <div class="tab-pane fade show active" id="dashboard">
                                            <h3>Dashboard </h3>
                                            <p>From your account dashboard. you can easily check &amp; view your <a href="#">recent orders</a>, manage your <a href="#">shipping and billing addresses</a> and <a href="#">Edit your password and account details.</a></p>
                                        </div>
                                        <div class="tab-pane fade" id="orders">
                                            <h3>Orders</h3>
                                            <div class="coron_table table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th>Order</th>
                                                            <th>Date</th>
                                                            <th>Status</th>
                                                            <th>Total</th>
                                                            <th>Actions</th>	 	 	 	
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>1</td>
                                                            <td>May 10, 2018</td>
                                                            <td><span class="success">Completed</span></td>
                                                            <td>$25.00 for 1 item </td>
                                                            <td><a href="cart.jsp" class="view">view</a></td>
                                                        </tr>
                                                        <tr>
                                                            <td>2</td>
                                                            <td>May 10, 2018</td>
                                                            <td>Processing</td>
                                                            <td>$17.00 for 1 item </td>
                                                            <td><a href="cart.jsp" class="view">view</a></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="downloads">
                                            <h3>Downloads</h3>
                                            <div class="coron_table table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th>Product</th>
                                                            <th>Downloads</th>
                                                            <th>Expires</th>
                                                            <th>Download</th>	 	 	 	
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Shopnovilla - Free Real Estate PSD Template</td>
                                                            <td>May 10, 2018</td>
                                                            <td><span class="danger">Expired</span></td>
                                                            <td><a href="#" class="view">Click Here To Download Your File</a></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Organic - ecommerce html template</td>
                                                            <td>Sep 11, 2018</td>
                                                            <td>Never</td>
                                                            <td><a href="#" class="view">Click Here To Download Your File</a></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="address">
                                            <p>The following addresses will be used on the checkout page by default.</p>
                                            <h4 class="billing-address">Billing address</h4>
                                            <a href="#" class="view">Edit</a>
                                            <p><strong>Bobby Jackson</strong></p>
                                            <address>
                                                House #15<br>
                                                Road #1<br>
                                                Block #C <br>
                                                Banasree <br>
                                                Dhaka <br>
                                                1212
                                            </address>
                                            <p>Bangladesh</p>   
                                        </div>
                                        <div class="tab-pane fade" id="account-details">
                                            <h3>Your Profile </h3>
                                            <div class="login">
                                                <div class="login_form_container">
                                                    <div class="account_login_form">
                                                        <form action="#">
                                                            <input type="text" name="aid" value="${param.aid}" />
                                                            <div class="input-radio">
                                                                <span class="custom-radio"><input type="radio" value="1" name="id_gender"> Mr.</span>
                                                                <span class="custom-radio"><input type="radio" value="1" name="id_gender"> Mrs.</span>
                                                                
                                                            </div> <br>
                                                            <label>First Name</label>
                                                            <input type="text" name="first-name">
                                                            <label>Last Name</label>
                                                            <input type="text" name="last-name">
                                                            <label>Email</label>
                                                            <input type="text" name="email-name">
                                                            <label>Address</label>
                                                            <input type="password" name="user-password">
                                                            <label>Birthdate</label>
                                                            <input type="text" placeholder="MM/DD/YYYY" value="" name="birthday">
                                                            <div class="save_button primary_btn default_button">
                                                                <a href="#">Save</a>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>      	
                    </section>			
                    <!-- End Maincontent  --> 
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

