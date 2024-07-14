<%-- 
    Document   : newjsp
    Created on : Feb 24, 2024, 3:16:10 PM
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
        <title>Coron-shop</title>
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
            .cb input{
                width: 15px;
                height: 15px;
                float: right;

            }
            .widget_color{
                padding-right: 150px;
            }
            .sm{
                padding: 20px 50px;
            }
            .sm input:hover{
                background: #018576;
                color: white;
                cursor: pointer;
            }
            .se{
                margin-top: 15px;
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
                    <jsp:include page="header-and-search-live.jsp"/>
                    <!--header end -->
                    <!--breadcrumbs area start-->
                    <div class="breadcrumbs_area">
                        <div class="row">
                            <div class="col-12">
                                <div class="breadcrumb_content">
                                    <ul>
                                        <li><a href="index.html">home</a></li>
                                        <li><i class="fa fa-angle-right"></i></li>
                                        <li>shop</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--breadcrumbs area end-->

                    <!--pos home section-->
                    <div class=" pos_home_section">
                        <div class="row pos_home">
                            <div class="col-lg-3 col-md-12">
                                <!--layere categorie"-->
                                <jsp:include page="search-by.jsp"/>
                                <!--wishlist block end-->

                            </div>
                            <div class="col-lg-9 col-md-12" id="content">
                                <!--banner slider start-->
                                <div class="banner_slider mb-35" hidden>
                                    <img src="assets\img\banner\bannner10.jpg" alt="">
                                </div>

                                <!--shop toolbar start-->
                                <div class="shop_toolbar mb-35">
                                    <!--banner slider start-->
                                    <div class="list_button" style="visibility: hidden">
                                        <ul class="nav" role="tablist">
                                            <li>
                                                <a class="active" data-toggle="tab" href="#large" role="tab" aria-controls="large" aria-selected="true"><i class="fa fa-th-large"></i></a>
                                            </li>
                                            <li>
                                                <a data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="false"><i class="fa fa-th-list"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                    <c:if test="${sessionScope.numberOfProduct!=0}">
                                        <div class="page_amount">
                                            <p>Showing 1–${sessionScope.numberOfPage} of ${sessionScope.numberOfProduct} results</p>
                                        </div>
                                    </c:if>
                                    <c:if test="${sessionScope.numberOfProduct==0}">
                                        <div class="page_amount">
                                            <h3>Not found product!</h3>
                                        </div>
                                    </c:if>
                                    <div class="select_option">                                      

                                    </div>
                                </div>
                                <!--shop toolbar end-->

                                <!--shop tab product-->
                                <div class="shop_tab_product">
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="large" role="tabpanel">
                                            <div class="row">
                                                <c:forEach var="product" items="${sessionScope.productList}">
                                                    <div class="col-lg-4 col-md-6">
                                                        <div class="single_product">
                                                            <div class="product_thumb">
                                                                <a href="product-detail?id=${product.id}"><img src="${product.img}" alt="${product.alt}"></a>
                                                                <div class="img_icone">
                                                                    <img src="assets\img\cart\span-new.png" alt="">
                                                                </div>
                                                                <div class="product_action">
                                                                    <a href="#"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                                                </div>
                                                            </div>
                                                            <div class="product_content">
                                                                <span class="product_price">${product.price} đ</span>
                                                                <h3 class="product_title"><a href="product-detail?id=${product.id}">${product.name}</a></h3>
                                                            </div>
                                                            <div class="product_info">
                                                                <ul>
                                                                    <li><a href="#" title=" Add to Wishlist ">Add to Wishlist</a></li>
                                                                    <li><a href="product-detail?id=${product.id}">View Detail</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--shop tab product end-->

                                <!--pagination style start-->
                                <div class="pagination_style">
                                    <div class="item_page">

                                    </div>
                                    <div class="page_number">
                                        <span>Pages: </span>
                                        <ul>
                                            <li>«</li>
                                            <!--<li class="current_number">1</li>-->
                                            <c:forEach var="i" begin="1" end="${sessionScope.numberOfPage}">
                                                <li><a href="page?page=${i}&cid=${requestScope.cid}&color=${requestScope.color}&order=${requestScope.order}&text=${requestScope.text}&name=${requestScope.name}">${i}</a></li>
                                                </c:forEach>
                                            <li>»</li>
                                        </ul>
                                    </div>
                                    <!--pagination style end-->
                                </div>
                            </div>
                        </div>
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
        <!--modal area end-->



        <!-- all js here -->
        <script>
//            $(document).ready(function () {
//                $('#myCheckbox').on('change', function () {
//                    var isChecked = $(this).prop('checked');
//                    if (isChecked) {
//                        var value = $(this).val();
//
//                        // Gửi giá trị từ checkbox bằng AJAX
//                        $.ajax({
//                            type: 'POST',
//                            url: '/WebApplication2/page',
//                            data: {cid: value},
//                            success: function (data) {
//                                var row = document.getElementById("content");
//                                row.innerHTML = data;
//                            }
//                        });
//                    }
//                });
//            });
//            function searchByCategory(param) {
//                var isChecked = param.checked;
//                var txtSearch = param.value;
//                $.ajax({
//                    type: 'POST',
//                    url: '/WebApplication2/page',
//                    data: {
//                        cid: isChecked ? txtSearch : 0
//                    },
//                    success: function (data) {
//                        var row = document.getElementById("content");
//                        row.innerHTML = data;
//                    }
//                });
//            }
            function searchByName(input) {
                var txtSearch = input.value;
                $.ajax({
                    type: 'POST',
                    url: '/WebApplication2/page',
                    data: {
                        name: txtSearch
                    },
                    success: function (data) {
                        $('#content').html(data);
                    }
                });
            }
            window.onload = function () {
                if (performance.navigation.type == 1) {
                    // Trang đã reload, gởi yêu cầu xóa session tới Servlet
                    window.location.href = "reload";
                }
            };
        </script>
        <script src="assets\js\vendor\jquery-1.12.0.min.js"></script>
        <script src="assets\js\popper.js"></script>
        <script src="assets\js\bootstrap.min.js"></script>
        <script src="assets\js\ajax-mail.js"></script>
        <script src="assets\js\plugins.js"></script>
        <script src="assets\js\main.js"></script>
    </body>
</html>

