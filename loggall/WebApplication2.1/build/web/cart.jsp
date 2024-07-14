<%-- 
    Document   : cart
    Created on : Feb 19, 2024, 11:55:00 PM
    Author     : FPT SHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Coron-cart</title>
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
                                        <li>Shopping Cart</li>
                                    </ul>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!--breadcrumbs area end-->



                    <!--shopping cart area start -->
                    <div class="shopping_cart_area">
                        <form action="#"> 
                            <div class="row">
                                <div class="col-12">
                                    <div class="table_desc">
                                        <div class="cart_page table-responsive">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th class="product_remove">Delete</th>
                                                        <th class="product_thumb">Image</th>
                                                        <th class="product_name">Product</th>
                                                        <th class="product-price">Price</th>
                                                        <th class="product_quantity">Quantity</th>
                                                        <th class="product_total">Total</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="product_remove"><a href="#"><i class="fa fa-trash-o"></i></a></td>
                                                        <td class="product_thumb"><a href="#"><img src="assets\img\cart\cart17.jpg" alt=""></a></td>
                                                        <td class="product_name"><a href="#">Handbag fringilla</a></td>
                                                        <td class="product-price">£65.00</td>
                                                        <td class="product_quantity"><input min="0" max="100" value="1" type="number"></td>
                                                        <td class="product_total">£130.00</td>


                                                    </tr>

                                                    <tr>
                                                        <td class="product_remove"><a href="#"><i class="fa fa-trash-o"></i></a></td>
                                                        <td class="product_thumb"><a href="#"><img src="assets\img\cart\cart18.jpg" alt=""></a></td>
                                                        <td class="product_name"><a href="#">Handbags justo</a></td>
                                                        <td class="product-price">£90.00</td>
                                                        <td class="product_quantity"><input min="0" max="100" value="1" type="number"></td>
                                                        <td class="product_total">£180.00</td>


                                                    </tr>
                                                    <tr>
                                                        <td class="product_remove"><a href="#"><i class="fa fa-trash-o"></i></a></td>
                                                        <td class="product_thumb"><a href="#"><img src="assets\img\cart\cart19.jpg" alt=""></a></td>
                                                        <td class="product_name"><a href="#">Handbag elit</a></td>
                                                        <td class="product-price">£80.00</td>
                                                        <td class="product_quantity"><input min="0" max="100" value="1" type="number"></td>
                                                        <td class="product_total">£160.00</td>


                                                    </tr>

                                                </tbody>
                                            </table>   
                                        </div>  
                                        <div class="cart_submit">
                                            <button type="submit">update cart</button>
                                        </div>      
                                    </div>
                                </div>
                            </div>
                            <!--coupon code area start-->
                            <div class="coupon_area">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6">                                      
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <div class="coupon_code">
                                            <h3>Cart Totals</h3>
                                            <div class="coupon_inner">
                                                <div class="cart_subtotal">
                                                    <p>Subtotal</p>
                                                    <p class="cart_amount">£215.00</p>
                                                </div>
                                                <div class="cart_subtotal ">
                                                    <p>Shipping</p>
                                                    <p class="cart_amount"><span>Flat Rate:</span> £255.00</p>
                                                </div>
                                                <a href="#">Calculate shipping</a>

                                                <div class="cart_subtotal">
                                                    <p>Total</p>
                                                    <p class="cart_amount">£215.00</p>
                                                </div>
                                                <div class="checkout_btn">
                                                    <a href="#">Proceed to Checkout</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--coupon code area end-->
                        </form> 
                    </div>
                    <!--shopping cart area end -->

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

