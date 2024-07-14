

<%-- 
    Document   : single-product
    Created on : Feb 20, 2024, 11:32:47 AM
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
                                        <li><a href="home">home</a></li>
                                        <li><i class="fa fa-angle-right"></i></li>
                                        <li>single product</li>
                                    </ul>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!--breadcrumbs area end-->


                    <!--product wrapper start-->
                    <c:set var="product" value="${requestScope.product}"/>
                    <div class="product_details">
                        <div class="row">
                            <div class="col-lg-5 col-md-6">
                                <div class="product_tab fix">
                                    <div class="tab-content produc_tab_c">
                                        <div class="tab-pane fade show active" id="p_tab1" role="tabpanel">
                                            <div class="modal_img">
                                                <a href="#"><img src="${product.getImg()}" alt="${product.getAlt()}"></a>
                                                <div class="img_icone">
                                                    <img src="" alt="">
                                                </div>
                                                <div class="view_img">
                                                    <a class="large_view" href="${product.getImg()}"><i class="fa fa-search-plus"></i></a>
                                                </div>    
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                            </div>
                            <div class="col-lg-7 col-md-6">
                                <div class="product_d_right">
                                    <h1>${product.getName()}</h1>
                                    <div class="product_desc">
                                        <p> ${product.getDescription()} </p>
                                    </div>

                                    <div class="content_price mb-15">
                                        <span class="price_format">${product.getPrice() * (1-product.getDiscount())} đ</span>
                                        <c:if test="${product.discount!=0}">
                                            <span class="old-price price_format">${product.getPrice()} đ</span>
                                        </c:if>
                                    </div>
                                    <div class="box_quantity mb-20">
                                        <form action="cart" method="get">
                                            <input hidden="" name="action" value="add"/>
                                            <input hidden="" name="pid" value="${product.id}"/>
                                            <label>quantity</label>
                                            <input name="quantity" min="1" max="100" value="1" type="number">
                                            <button type="submit"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                        </form> 
                                    </div>               

                                    <div class="product_stock mb-20">
                                        <p>${product.getAmount()} items</p>
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
                                    <h3>    Related Products</h3>
                                </div>
                            </div> 
                        </div>
                        <div class="row">
                            <div class="single_p_active owl-carousel">
                                <c:forEach var="relatedProduct" items="${requestScope.relatedProductList}">
                                    <div class="col-lg-3">
                                        <div class="single_product">
                                            <div class="product_thumb">
                                                <a href="product-detail?id=${relatedProduct.getId()}"><img src="${relatedProduct.getImg()}" alt="${relatedProduct.getAlt()}"></a> 
                                                <div class="img_icone">
                                                    <img src="" alt="">
                                                </div>
                                                <div class="product_action">
                                                    <a href="cart?action=add&pid=${relatedProduct.id}&quantity=1"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                                </div>
                                            </div>
                                            <div class="product_content">
                                                <span class="product_price price_format">${relatedProduct.getPrice() * (1-relatedProduct.getDiscount())}</span>
                                                <h3 class="product_title"><a href="product-detail?id=${relatedProduct.getId()}">${relatedProduct.getName()}</a></h3>
                                            </div>
                                            <div class="product_info">
                                                <ul>
                                                    <li><a href="product-detail?id=${relatedProduct.getId()}">View Detail</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
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
        <script src="assets/js/myjs.js"></script>
        <script src="assets\js\vendor\jquery-1.12.0.min.js"></script>
        <script src="assets\js\popper.js"></script>
        <script src="assets\js\bootstrap.min.js"></script>
        <script src="assets\js\ajax-mail.js"></script>
        <script src="assets\js\plugins.js"></script>
        <script src="assets\js\main.js"></script>
    </body>
</html>

