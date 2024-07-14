<%-- 
    Document   : header-and-search-live
    Created on : Feb 25, 2024, 3:28:18 PM
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

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="header_area">
            <!--header top--> 
            <div class="header_top">
                <div class="row align-items-center">
                    <div class="col-lg-5 col-md-5">
                        <div class="switcher">
                            <ul>
                                <li class="languages"><a href="#"><img src="assets\img\logo\logo2.png" alt=""> Vietnam <i class="fa fa-angle-down"></i></a>
                                    <ul class="dropdown_languages">
                                        <li><a href="#"><img src="assets\img\logo\logo2.png" alt=""> Vietnam </a></li>
                                    </ul>   
                                </li> 

                                <li class="currency"><a href="#"> Currency : đ <i class="fa fa-angle-down"></i></a>
                                    <ul class="dropdown_currency">
                                        <li><a href="#"> Dong (VND)</a></li>
                                    </ul> 
                                </li> 
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7">
                        <div class="header_links">
                            <ul>
                                <c:if test="${sessionScope.role == 1}">
                                    <li><a href="manage-account">Manage Account</a></li>
                                    <li><a href="manage-product">Manage Product</a></li>
                                    <li><a href="manage-order" >Manage Order</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.role ==2}">
                                    <li><a href="my-order" title="Contact">My order</a></li>
                                    </c:if>
                                <li><a href="cart">My cart</a></li>
                                <li><a href="checkout">Check out</a></li>
                                    <c:if test="${sessionScope.role != null}">
                                    <li><a href="profile" title="My account">My account</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.role==null}">
                                    <li><a href="login" title="Login">Login</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.role!=null}">
                                    <li><a href="logout" title="Logout">Logout</a></li>
                                    </c:if>
                            </ul>
                        </div>   
                    </div>
                </div> 
            </div> 
            <!--header top end-->

            <!--header middel--> 
            <div class="header_middel">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-3">
                        <div class="logo">
                            <a href="home"><img src="assets\img\logo\logo2.jpg" alt=""></a>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-9">
                        <div class="header_right_info">
                            <div class="search_bar">
                                <form id="myForm" action="">
                                    <input name="name" type="text" placeholder="Search..."/>
                                    <!--<button type="submit"><i class="fa fa-search"></i></button>-->
                                </form>
                            </div>
                            <jsp:useBean id="list" class="dal.CartDAO"/>
                            <c:set var="cookie" value="${pageContext.request.cookies}"/>

                            <c:set var="sumPrice" value="0" />
                            <c:set var="count" value="0"/>
                            <c:forEach var="cart" items="${list.getAllCart(cookie.cart.value)}" varStatus="loop">
                                <c:set var="sumPrice" value="${sumPrice + cart.getPriceByPid() * cart.getQuantity() * (1-cart.getDiscountByPid())}"/>
                                <c:set var="count" value="${loop.count}"/>
                            </c:forEach>
                            <div class="shopping_cart">
                                <a href="cart"><i class="fa fa-shopping-cart"></i> ${count}Items -<span class="price_format"> ${sumPrice} đ</span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>     
            <!--header middel end-->      
            <div class="header_bottom">
                <div class="row">
                    <div class="col-12">
                        <div class="main_menu_inner">
                            <div class="main_menu d-none d-lg-block">
                                <nav>
                                    <ul>
                                        <li class="active"><a href="home">Home</a>
                                        </li>
                                        <li><a href="page">shop</a>
                                            <div class="mega_menu jewelry">
                                                <div class="mega_items jewelry">
                                                    <ul>
                                                        <li><a href="page?shop=shop-list">shop list</a></li>
                                                        <li><a href="page?shop=shop-fullwidth">shop Full Width Grid</a></li>
                                                        <li><a href="page?shop=shop-fullwidth-list">shop Full Width list</a></li>
                                                        <li><a href="product-detail?id=1">Product Details</a></li>
                                                    </ul>
                                                </div>
                                            </div>  
                                        </li>
                                        <li><a href="#">pages</a>
                                            <div class="mega_menu">
                                                <div class="mega_top fix">
                                                    <div class="mega_items">
                                                        <h3><a href="#">Account</a></h3>
                                                        <ul>
                                                            <c:if test="${sessionScope.role==null}">
                                                                <li><a href="login">Login</a></li>
                                                                </c:if>
                                                                <c:if test="${sessionScope.role!=null}">
                                                                <li><a href="logout">Logout</a></li>
                                                                </c:if>
                                                                <c:if test="${sessionScope.role!=null}">
                                                                <li><a href="profile">my account </a></li>
                                                                </c:if>
                                                                <c:if test="${sessionScope.role==1}">
                                                                <li><a href="manage-account">manager account </a></li>
                                                                </c:if>
                                                        </ul>
                                                    </div>
                                                    <div class="mega_items">
                                                        <h3><a href="#">Order</a></h3>
                                                        <ul>
                                                            <c:if test="${sessionScope.role != 1&& sessionScope.role!=null}">
                                                                <li><a href="my-order">My order</a></li>
                                                                </c:if>
                                                                <c:if test="${sessionScope.role==1}">
                                                                <li><a href="manage-order">manager order </a></li>
                                                                </c:if>
                                                            <li><a href="checkout">Checkout  </a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="mega_items">
                                                        <h3><a href="#">Cart&CheckOut</a></h3>
                                                        <ul>
                                                            <li><a href="cart">cart</a></li>
                                                                <c:if test="${sessionScope.role == 1}">
                                                                <li><a href="manage-product">manager product </a></li>
                                                                </c:if>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>

                                    </ul>
                                </nav>
                            </div>                                      
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
