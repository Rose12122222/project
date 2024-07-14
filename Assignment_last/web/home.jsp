
<%-- 
    Document   : home
    Created on : Feb 19, 2024, 11:45:48 PM
    Author     : FPT SHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="model.Category"%>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Coron - Fashion eCommerce Bootstrap4 Template</title>
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
        <style>
            .product_active.owl-carousel .img_sale img {
                width: inherit;
            }
            .img_sale {
                position: absolute;
                top: 0;
                left: 0;
            }
        </style>
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

                    <!--pos home section-->
                    <div class="pos_home_section">
                        <div class="row">
                            <!--banner slider start-->
                            <div class="col-12">
                                <div class="banner_slider slider_two">
                                    <div class="slider_active owl-carousel">
                                        <div class="single_slider" style="background-image: url(assets/img/slider/slider_4.jpg)">
                                            <div class="slider_content">
                                                <div class="slider_content_inner">  
                                                    <h1>True!!!</h1>
                                                    <p>Teddy bears are always people's trustworthy companions.<br> Come and get it!!!</p>
                                                    <a href="page">shop now</a>
                                                </div>     
                                            </div>
                                        </div>
                                        <div class="single_slider" style="background-image: url(assets/img/slider/slider_5.jpg)">
                                            <div class="slider_content">
                                                <div class="slider_content_inner">  
                                                    <h1>EQ</h1>
                                                    <p>Teddy bears are ideal for expressing affection and care.<br> </p>
                                                    <a href="page">shop now</a>
                                                </div>     
                                            </div> 
                                        </div>
                                        <div class="single_slider" style="background-image: url(assets/img/slider/slider_6.jpg)">
                                            <div class="slider_content">
                                                <div class="slider_content_inner">  
                                                    <h1>Friend</h1>
                                                    <p>Regardless of age, teddy bears are still items that help lift your mood and bring a feeling of warmth.<br> </p>
                                                    <a href="page">shop now</a>
                                                </div>     
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                                <!--banner slider start-->
                            </div>    
                        </div>  
                        <!--new product area start-->
                        <div class="new_product_area product_two">
                            <div class="row">
                                <div class="col-12">
                                    <div class="block_title">
                                        <h3>  New Products</h3>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="single_p_active owl-carousel">
                                    
                                    <!--start here-->
                                    <c:forEach var="newProduct" items="${requestScope.newproductlist}">
                                        <div class="col-lg-3">
                                            <div class="single_product">
                                                <div class="product_thumb">
                                                    <a href="product-detail?id=${newProduct.id}"><img src="${newProduct.img}" alt="${newProduct.alt}"></a> 
                                                    <div class="img_icone">
                                                        <img src="assets\img\cart\span-new.png" alt="">
                                                    </div>
                                                    <div class="product_action">
                                                        <a href="cart?action=add&pid=${newProduct.id}&quantity=1"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                                <div class="product_content">
                                                    <span class="product_price price_format">${newProduct.price * (1-newProduct.discount)} đ</span>
                                                    <h3 class="product_title"><a href="product-detail?id=${newProduct.id}">${newProduct.name}</a></h3>
                                                </div>
                                                <div class="product_info">
                                                    <ul>
                                                        <li><a href="product-detail?id=${newProduct.id}">View Detail</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach> 
                                </div> 
                            </div>      
                        </div> 
                        <!--new product area start--> 

                        <!--banner area start-->
                        <div class="banner_area banner_two">
                            <div class="row">
                                <div class="col-lg-4 col-md-6">
                                    <div class="single_banner">
                                        <a href="page"><img src="assets\img\banner\banner1.jpg" alt=""></a>
                                        <div class="banner_title">
                                            <p>Up to <span> 40%</span> off</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="single_banner">
                                        <a href="page"><img src="assets\img\banner\banner3.jpg" alt=""></a>
                                        <div class="banner_title title_2">
                                            <p>sale off <span> 30%</span></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="single_banner">
                                        <a href="page"><img src="assets\img\banner\banner2.jpg" alt=""></a>
                                        <div class="banner_title title_3">
                                            <p>sale off <span> 30%</span></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>     
                        <!--banner area end--> 

                        <!--featured product area start-->
                        <div class="new_product_area product_two">
                            <div class="row">
                                <div class="col-12">
                                    <div class="block_title">
                                        <h3>   Best Sale Products</h3>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="single_p_active owl-carousel">
                                    <c:forEach var="bestSale" items="${requestScope.bestsaleproductlist}">
                                        <div class="col-lg-3">
                                            <div class="single_product">
                                                <div class="product_thumb">
                                                    <a href="product-detail?id=${bestSale.id}"><img src="${bestSale.img}" alt="${bestSale.alt}"></a> 
                                                    <div class="img_sale">
                                                        <img src="assets\img\cart\span-sale2.png" alt="">
                                                    </div>
                                                    <div class="product_action">
                                                        <a href="cart?action=add&pid=${bestSale.id}&quantity=1"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                                <div class="product_content">
                                                    <span class="product_price price_format">${bestSale.price * (1-bestSale.discount)} đ</span>
                                                    <h3 class="product_title"><a href="product-detail?id=${bestSale.id}">${bestSale.name}</a></h3>
                                                </div>
                                                <div class="product_info">
                                                    <ul>
                                                        <li><a href="product-detail?id=${bestSale.id}">View Detail</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div> 
                            </div>      
                        </div> 
                        <!--featured product area start-->                                          
                    </div>
                    <!--pos home section end-->
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
        <script src="assets/js/myjs.js"></script>
        <script src="assets\js\vendor\jquery-1.12.0.min.js"></script>
        <script src="assets\js\popper.js"></script>
        <script src="assets\js\bootstrap.min.js"></script>
        <script src="assets\js\ajax-mail.js"></script>
        <script src="assets\js\plugins.js"></script>
        <script src="assets\js\main.js"></script>
    </body>
</html>

