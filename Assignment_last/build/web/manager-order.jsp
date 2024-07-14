<%-- 
    Document   : cart
    Created on : Feb 19, 2024, 11:55:00 PM
    Author     : FPT SHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Orders" %>
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
        <link rel="stylesheet" href="assets/css/order.css"/>
        <link rel="stylesheet" href="assets/css/order.css"/>
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
                                        <li>Manage Order</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--breadcrumbs area end-->



                    <!--shopping cart area start -->
                    <div class="shopping_cart_area">
                        <form action="cart" method="post"> 
                            <input hidden="" name="action" value="edit"/>
                            <div class="row">
                                <div class="col-12">
                                    <div class="table_desc">
                                        <div class="cart_page table-responsive">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th class="order_id">Order</th>
                                                        <th class="order_name">Username</th>
                                                        <th class="order_date">Date</th>
                                                        <th class="order_status">Status</th>
                                                        <th class="order_total">Total</th>
                                                        <th class="order_action">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>                                                        
                                                    <c:forEach var="order" items="${requestScope.listorder}" varStatus="loop">
                                                        <tr> 
                                                            <c:if test="${param.page!=null||param.page==''}">
                                                                <td class="order_id">${loop.count + 10*(param.page-1)}</td>
                                                            </c:if>
                                                            <c:if test="${param.page==null}">
                                                                <td class="order_id">${loop.count}</td>
                                                            </c:if>
                                                            <td class="order_name">${order.getUserNameByAid()}</td>
                                                            <td class="order_date">${order.getDate()}</td>
                                                            <td class="order_status">${order.getStatus()==1?'Completed':'Processing'}</td>
                                                            <td class="order_total"><span class="price_format">${order.getTotal()} đ</span> For ${order.getNumberOfItem()} Items</td>
                                                            <c:if test="${order.getStatus()!=1}">
                                                                <td class="order_action"><a href="manage-order?page=${param.page}&&action=update&&id=${order.getId()}"><i style="color: #00bba6; font-size: 15px" class="fa" onclick="return confirm('Are you sure you want to accept this order?')">Accepct?</i></a></td>
                                                            </c:if>
                                                            <c:if test="${order.getStatus()==1}">
                                                                <td class="order_action"></td>
                                                            </c:if>                                                        
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>   
                                        </div> 

                                        <!--                                        <div class="cart_submit">
                                                                                    <button type="submit" >update cart</button>
                                                                                </div>-->
                                        <div class="pagination_style" style="margin-bottom: 0">
                                            <div class="item_page" style="visibility: hidden">                                               
                                                <label for="page_select">show</label>
                                                <select id="page_select">

                                                </select>
                                                <span>Products by page</span>
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
                                                    <li><a href="manage-order?page=1">«</a></li>
                                                        <c:forEach var="i" begin="1" end="${sessionScope.numberOfPageOrder}">
                                                            <c:choose>
                                                                <c:when test="${i == currentPage}">
                                                                <li class="current_number">${i}</li>
                                                                </c:when>
                                                                <c:otherwise>
                                                                <li><a href="manage-order?page=${i}">${i}</a></li>
                                                                </c:otherwise>
                                                            </c:choose>                                             
                                                        </c:forEach>
                                                    <li><a href="manage-order?page=${sessionScope.numberOfPageOrder}">»</a></li>
                                                </ul>
                                            </div>
                                        </div> 
                                    </div>
                                </div>
                            </div>
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
        <script>
            $(document).ready(function () {
            <c:if test="${requestScope.error!=null}">
                alert("${error}");
            </c:if>
            });
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

