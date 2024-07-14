<%-- 
    Document   : single-product
    Created on : Feb 20, 2024, 11:32:47 AM
    Author     : FPT SHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Coron-single product</title>
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
                                        <li>single product</li>
                                    </ul>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!--breadcrumbs area end-->


                    <!--product wrapper start-->
                    <div class="product_details">
                        <div class="row">
                            <div class="col-lg-5 col-md-6">
                                <div class="product_tab fix">
                                    <div class="tab-content produc_tab_c">
                                        <div class="tab-pane fade show active" id="p_tab1" role="tabpanel">
                                            <div class="modal_img">
                                                <a href="#"><img src="assets\img\product\product13.jpg" alt=""></a>
                                                <div class="img_icone">
                                                    <img src="assets\img\cart\span-new.png" alt="">
                                                </div>
                                                <div class="view_img">
                                                    <a class="large_view" href="assets\img\product\product13.jpg"><i class="fa fa-search-plus"></i></a>
                                                </div>    
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="p_tab2" role="tabpanel">
                                            <div class="modal_img">
                                                <a href="#"><img src="assets\img\product\product14.jpg" alt=""></a>
                                                <div class="img_icone">
                                                    <img src="assets\img\cart\span-new.png" alt="">
                                                </div>
                                                <div class="view_img">
                                                    <a class="large_view" href="assets\img\product\product14.jpg"><i class="fa fa-search-plus"></i></a>
                                                </div>     
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="p_tab3" role="tabpanel">
                                            <div class="modal_img">
                                                <a href="#"><img src="assets\img\product\product15.jpg" alt=""></a>
                                                <div class="img_icone">
                                                    <img src="assets\img\cart\span-new.png" alt="">
                                                </div>
                                                <div class="view_img">
                                                    <a class="large_view" href="assets\img\product\product15.jpg"> <i class="fa fa-search-plus"></i></a>
                                                </div>     
                                            </div>
                                        </div>
                                    </div>

                                </div> 
                            </div>
                            <div class="col-lg-7 col-md-6">
                                <div class="product_d_right">
                                    <h1>Printed Summer Dress</h1>
                                    <div class="product_ratting mb-10">
                                        <ul>
                                            <li><a href="#"><i class="fa fa-star"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star"></i></a></li>
                                            <li><a href="#"> Write a review </a></li>
                                        </ul>
                                    </div>
                                    <div class="product_desc">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati modi culpa voluptates illo, quos magni totam inventore delectus perspiciatis necessitatibus, iure rerum! Deleniti nobis voluptatibus minus, iusto ullam quae esse..</p>
                                    </div>

                                    <div class="content_price mb-15">
                                        <span>$118.00</span>
                                        <span class="old-price">$130.00</span>
                                    </div>
                                    <div class="box_quantity mb-20">
                                        <form action="#">
                                            <label>quantity</label>
                                            <input min="0" max="100" value="1" type="number">
                                        </form> 
                                        <button type="submit"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                        <a href="#" title="add to wishlist"><i class="fa fa-heart" aria-hidden="true"></i></a>    
                                    </div>
                                    <div class="product_d_size mb-20">
                                        <label for="group_1">size</label>
                                        <select name="size" id="group_1">
                                            <option value="1">S</option>
                                            <option value="2">M</option>
                                            <option value="3">L</option>
                                        </select>
                                    </div>

                                    <div class="sidebar_widget color">
                                        <h2>Choose Color</h2>
                                        <div class="widget_color">
                                            <ul>
                                                <li><a href="#"></a></li>
                                                <li><a href="#"></a></li>
                                                <li> <a href="#"></a></li>
                                                <li><a href="#"></a></li>
                                            </ul>
                                        </div>
                                    </div>                 

                                    <div class="product_stock mb-20">
                                        <p>299 items</p>
                                        <span> In stock </span>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!--product details end-->


                    <!--product info start-->
                    
                    <!--product info end-->


                    <!--new product area start-->
                    <div class="new_product_area product_page">
                        <div class="row">
                            <div class="col-12">
                                <div class="block_title">
                                    <h3>  11 other products category:</h3>
                                </div>
                            </div> 
                        </div>
                        <div class="row">
                            <div class="single_p_active owl-carousel">
                                <div class="col-lg-3">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a href="single-product.jsp"><img src="assets\img\product\product1.jpg" alt=""></a> 
                                            <div class="img_icone">
                                                <img src="assets\img\cart\span-new.png" alt="">
                                            </div>
                                            <div class="product_action">
                                                <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                            </div>
                                        </div>
                                        <div class="product_content">
                                            <span class="product_price">$50.00</span>
                                            <h3 class="product_title"><a href="single-product.jsp">Curabitur sodales</a></h3>
                                        </div>
                                        <div class="product_info">
                                            <ul>
                                                <li><a href="#" title=" Add to Wishlist ">Add to Wishlist</a></li>
                                                <li><a href="single-product.jsp">View Detail</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a href="single-product.jsp"><img src="assets\img\product\product2.jpg" alt=""></a> 
                                            <div class="hot_img">
                                                <img src="assets\img\cart\span-hot.png" alt="">
                                            </div>
                                            <div class="product_action">
                                                <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                            </div>
                                        </div>
                                        <div class="product_content">
                                            <span class="product_price">$40.00</span>
                                            <h3 class="product_title"><a href="single-product.jsp">Quisque ornare dui</a></h3>
                                        </div>
                                        <div class="product_info">
                                            <ul>
                                                <li><a href="#" title=" Add to Wishlist ">Add to Wishlist</a></li>
                                                <li><a href="single-product.jsp">View Detail</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a href="single-product.jsp"><img src="assets\img\product\product3.jpg" alt=""></a> 
                                            <div class="img_icone">
                                                <img src="assets\img\cart\span-new.png" alt="">
                                            </div>
                                            <div class="product_action">
                                                <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                            </div>
                                        </div>
                                        <div class="product_content">
                                            <span class="product_price">$60.00</span>
                                            <h3 class="product_title"><a href="single-product.jsp">Sed non turpiss</a></h3>
                                        </div>
                                        <div class="product_info">
                                            <ul>
                                                <li><a href="#" title=" Add to Wishlist ">Add to Wishlist</a></li>
                                                <li><a href="single-product.jsp">View Detail</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a href="single-product.jsp"><img src="assets\img\product\product4.jpg" alt=""></a> 
                                            <div class="hot_img">
                                                <img src="assets\img\cart\span-hot.png" alt="">
                                            </div>
                                            <div class="product_action">
                                                <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                            </div>
                                        </div>
                                        <div class="product_content">
                                            <span class="product_price">$65.00</span>
                                            <h3 class="product_title"><a href="single-product.jsp">Duis convallis</a></h3>
                                        </div>
                                        <div class="product_info">
                                            <ul>
                                                <li><a href="#" title=" Add to Wishlist ">Add to Wishlist</a></li>
                                                <li><a href="single-product.jsp">View Detail</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a href="single-product.jsp"><img src="assets\img\product\product6.jpg" alt=""></a> 
                                            <div class="img_icone">
                                                <img src="assets\img\cart\span-new.png" alt="">
                                            </div>
                                            <div class="product_action">
                                                <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                            </div>
                                        </div>
                                        <div class="product_content">
                                            <span class="product_price">$50.00</span>
                                            <h3 class="product_title"><a href="single-product.jsp">Curabitur sodales</a></h3>
                                        </div>
                                        <div class="product_info">
                                            <ul>
                                                <li><a href="#" title=" Add to Wishlist ">Add to Wishlist</a></li>
                                                <li><a href="single-product.jsp">View Detail</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                        </div>      
                    </div> 
                    <!--new product area start-->  


                    <!--new product area start-->
                    <div class="new_product_area product_page">
                        <div class="row">
                            <div class="col-12">
                                <div class="block_title">
                                    <h3>    Related Products</h3>
                                </div>
                            </div> 
                        </div>
                        <div class="row">
                            <div class="single_p_active owl-carousel">
                                <div class="col-lg-3">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a href="single-product.jsp"><img src="assets\img\product\product6.jpg" alt=""></a> 
                                            <div class="img_icone">
                                                <img src="assets\img\cart\span-new.png" alt="">
                                            </div>
                                            <div class="product_action">
                                                <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                            </div>
                                        </div>
                                        <div class="product_content">
                                            <span class="product_price">$50.00</span>
                                            <h3 class="product_title"><a href="single-product.jsp">Curabitur sodales</a></h3>
                                        </div>
                                        <div class="product_info">
                                            <ul>
                                                <li><a href="#" title=" Add to Wishlist ">Add to Wishlist</a></li>
                                                <li><a href="single-product.jsp">View Detail</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a href="single-product.jsp"><img src="assets\img\product\product5.jpg" alt=""></a> 
                                            <div class="hot_img">
                                                <img src="assets\img\cart\span-hot.png" alt="">
                                            </div>
                                            <div class="product_action">
                                                <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                            </div>
                                        </div>
                                        <div class="product_content">
                                            <span class="product_price">$40.00</span>
                                            <h3 class="product_title"><a href="single-product.jsp">Quisque ornare dui</a></h3>
                                        </div>
                                        <div class="product_info">
                                            <ul>
                                                <li><a href="#" title=" Add to Wishlist ">Add to Wishlist</a></li>
                                                <li><a href="single-product.jsp">View Detail</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a href="single-product.jsp"><img src="assets\img\product\product4.jpg" alt=""></a> 
                                            <div class="img_icone">
                                                <img src="assets\img\cart\span-new.png" alt="">
                                            </div>
                                            <div class="product_action">
                                                <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                            </div>
                                        </div>
                                        <div class="product_content">
                                            <span class="product_price">$60.00</span>
                                            <h3 class="product_title"><a href="single-product.jsp">Sed non turpiss</a></h3>
                                        </div>
                                        <div class="product_info">
                                            <ul>
                                                <li><a href="#" title=" Add to Wishlist ">Add to Wishlist</a></li>
                                                <li><a href="single-product.jsp">View Detail</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a href="single-product.jsp"><img src="assets\img\product\product3.jpg" alt=""></a> 
                                            <div class="hot_img">
                                                <img src="assets\img\cart\span-hot.png" alt="">
                                            </div>
                                            <div class="product_action">
                                                <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                            </div>
                                        </div>
                                        <div class="product_content">
                                            <span class="product_price">$65.00</span>
                                            <h3 class="product_title"><a href="single-product.jsp">Duis convallis</a></h3>
                                        </div>
                                        <div class="product_info">
                                            <ul>
                                                <li><a href="#" title=" Add to Wishlist ">Add to Wishlist</a></li>
                                                <li><a href="single-product.jsp">View Detail</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a href="single-product.jsp"><img src="assets\img\product\product2.jpg" alt=""></a> 
                                            <div class="img_icone">
                                                <img src="assets\img\cart\span-new.png" alt="">
                                            </div>
                                            <div class="product_action">
                                                <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                            </div>
                                        </div>
                                        <div class="product_content">
                                            <span class="product_price">$50.00</span>
                                            <h3 class="product_title"><a href="single-product.jsp">Curabitur sodales</a></h3>
                                        </div>
                                        <div class="product_info">
                                            <ul>
                                                <li><a href="#" title=" Add to Wishlist ">Add to Wishlist</a></li>
                                                <li><a href="single-product.jsp">View Detail</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                        </div>      
                    </div> 
                    <!--new product area start-->  

                </div>
                <!--pos page inner end-->
            </div>
        </div>
        <!--pos page end-->

        <!--footer area start-->
        <jsp:include page="footer.jsp"/>
        <!--footer area end-->


        <!-- modal area start --> 
        <jsp:include page="modal.jsp"/>
        <!-- modal area end --> 



        <!-- all js here -->
        <script src="assets\js\vendor\jquery-1.12.0.min.js"></script>
        <script src="assets\js\popper.js"></script>
        <script src="assets\js\bootstrap.min.js"></script>
        <script src="assets\js\ajax-mail.js"></script>
        <script src="assets\js\plugins.js"></script>
        <script src="assets\js\main.js"></script>
    </body>
</html>

