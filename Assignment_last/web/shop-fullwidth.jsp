<%-- 
    Document   : shop-full-width
    Created on : Feb 20, 2024, 11:32:01 AM
    Author     : FPT SHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Coron-shop fullwidth</title>
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
                                        <li><a href="home">home</a></li>
                                        <li><i class="fa fa-angle-right"></i></li>
                                        <li>shop fullwidth</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--breadcrumbs area end-->

                    <!--pos home section-->
                    <div class=" pos_home_section shop_section shop_fullwidth" id="content">   
                        <div class="row">
                            <div class="col-12">
                                <!--shop toolbar start-->
                                <div class="shop_toolbar mb-35">
                                    <div class="list_button">

                                    </div>
                                    <c:if test="${sessionScope.numberOfProduct!=0}">
                                        <div class="page_amount">
                                            <p>Showing 1–${sessionScope.numberOfPage2} of ${sessionScope.numberOfProduct} results</p>
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
                            </div>
                        </div>        

                        <!--shop tab product-->
                        <div class="shop_tab_product shop_fullwidth">   
                            <div class="tab-content" id="myTabContent">                  
                                <div class="tab-pane fade show active" id="large" role="tabpanel">
                                    <div class="row">
                                        <c:forEach var="product" items="${sessionScope.productList2}">
                                            <div class="col-lg-3 col-md-4 col-sm-6">
                                                <div class="single_product">
                                                    <div class="product_thumb">
                                                        <a href="product-detail?id=${product.id}"><img src="${product.img}" alt="${product.alt}"></a> 
                                                        <div class="img_icone">
                                                            <img src="" alt="">
                                                        </div>
                                                        <div class="product_action">
                                                            <a href="cart?action=add&pid=${product.id}&quantity=1"> <i class="fa fa-shopping-cart"></i> Add to cart</a>
                                                        </div>
                                                    </div>
                                                    <div class="product_content">
                                                        <span class="product_price price_format">${product.price * (1-product.discount)} đ</span>
                                                        <h3 class="product_title"><a href="product-detail?id=${product.id}">${product.name}</a></h3>
                                                    </div>
                                                    <div class="product_info">
                                                        <ul>
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
                        <div class="pagination_style shop_page">
                            <div class="item_page">

                            </div>
                            <div class="page_number">
                                <span>Pages: </span>
                                <ul>
                                    <c:choose>
                                        <c:when test="${empty param.page or param.page == '1'}">
                                            <c:set var="currentPage" value="1" />
                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="currentPage" value="${param.page}" />
                                        </c:otherwise>
                                    </c:choose>
                                    <li><a href="page?shop=shop-fullwidth&page?page=1&cid=${requestScope.cid}&color=${requestScope.color}&order=${requestScope.order}&&minValue=${requestScope.sPrice}&&maxValue=${requestScope.ePrice}&name=${requestScope.name}">«</a></li>
                                    <c:forEach var="i" begin="1" end="${sessionScope.numberOfPage2}">
                                        <c:choose>
                                            <c:when test="${i == currentPage}">
                                                <li class="current_number">${i}</li>
                                                </c:when>
                                                <c:otherwise>
                                                <li><a href="page?shop=shop-fullwidth&page=${i}&cid=${requestScope.cid}&color=${requestScope.color}&order=${requestScope.order}&minValue=${requestScope.sPrice}&maxValue=${requestScope.ePrice}&name=${requestScope.name}">${i}</a></li>
                                                </c:otherwise>
                                            </c:choose>                                             
                                        </c:forEach>
                                    <li><a href="page?shop=shop-fullwidth&page?page=${sessionScope.numberOfPage2}&cid=${requestScope.cid}&color=${requestScope.color}&order=${requestScope.order}&&minValue=${requestScope.sPrice}&&maxValue=${requestScope.ePrice}&name=${requestScope.name}">»</a></li>
                                </ul>
                            </div>
                        </div>
                        <!--pagination style end-->   
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
            $('#myForm input, #myForm .select_option select').on('input select', function () {
                sendData();
            });

            $("#slider-range").slider({
                range: true,
                step: 1000,
                min: 0,
                max: 500000,
                values: [0, 500000],
                slide: function (event, ui) {
                    $("#amount").val(ui.values[0] + "đ - " + ui.values[1] + "đ");
                    sendData(ui.values[0], ui.values[1]);
                }
            });

            function sendData(minValue, maxValue) {
                var formData = $('#myForm').serializeArray();
                formData.push({name: "minValue", value: minValue});
                formData.push({name: "maxValue", value: maxValue});

                $.ajax({
                    type: "POST",
                    url: "/Assignment/page?shop=shop-fullwidth", // Đổi "YourServerEndpoint" thành địa chỉ servlet của bạn
                    data: formData,
                    success: function (response) {
                        $('#content').html(response);
                    }
                });
            }
            function searchByName(input) {
                var txtSearch = input.value;
                $.ajax({
                    type: 'POST',
                    url: '/Assignment/page?shop=shop-fullwidth',
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
                    window.location.href = "reload?shop=shop-fullwidth";
                }
            };
        </script>
        <script src="assets/js/myjs.js"></script>
        <script src="assets\js\vendor\jquery-1.12.0.min.js"></script>
        <script src="assets\js\popper.js"></script>
        <script src="assets\js\bootstrap.min.js"></script>
        <script src="assets\js\ajax-mail.js"></script>
        <script src="assets\js\plugins.js"></script>
        <script src="assets\js\main.js"></script>
    </body>
</html>

