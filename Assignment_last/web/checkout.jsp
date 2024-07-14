<%-- 
    Document   : checkout
    Created on : Feb 19, 2024, 11:57:27 PM
    Author     : FPT SHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dal.CartDAO"%>
<%@page import="model.Cart" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Coron-checkout</title>
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
                                        <li>checkout</li>
                                    </ul>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!--breadcrumbs area end-->


                    <!--Checkout page section-->
                    <div class="Checkout_section">                     
                        <div class="checkout_form">
                            <form action="payment" method="post">
                                <div class="row">

                                    <div class="col-lg-6 col-md-6">

                                        <h3>Billing Details</h3>
                                        <div class="row">
                                            <div class="col-lg-6 mb-30">
                                                <label>Phone<span>*</span></label>
                                                <input type="text" required=""> 

                                            </div> 
                                            <div class="col-lg-6 mb-30">
                                                <label> Email Address   <span>*</span></label>
                                                <input type="text" required=""> 

                                            </div> 
                                           	    	    	    	    	    	 
                                        </div> 

                                    </div>

                                    <div class="col-lg-6 col-md-6">  
                                        <h3>Your order</h3> 
                                        <div class="order_table table-responsive mb-30">
                                            <jsp:useBean id="list" class="dal.CartDAO"/>
                                            <c:set var="cookie" value="${pageContext.request.cookies}"/>
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th>Product</th>
                                                        <th>Total</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="order" items="${list.getAllCart(cookie.cart.value)}">
                                                        <tr>
                                                            <td> ${order.getNameByPid()} <strong> × ${order.getQuantity()}</strong></td>
                                                            <td class="price_format"> ${order.getPriceByPid() * order.getQuantity() * (1-order.getDiscountByPid())} đ</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                                <tfoot>
                                                    <tr class="order_total">
                                                        <th>Order Total</th>
                                                            <c:if test="${requestScope.sumPrice==null}">
                                                            <td><strong class="price_format">0 đ</strong></td>
                                                        </c:if>
                                                        <c:if test="${requestScope.sumPrice!=null}">
                                                            <td><strong class="price_format">${requestScope.sumPrice} đ</strong></td>
                                                        </c:if>
                                                    </tr>
                                                </tfoot>
                                            </table>     
                                        </div>
                                        <div class="payment_method">
                                            <div class="panel-default">
                                                <input id="payment_defult" name="check_method" type="checkbox" data-target="createp_account">
                                                <label for="payment_defult" data-toggle="collapse" data-target="#collapsedefult" aria-controls="collapsedefult">Pay by QR Code <img src="" alt=""></label>

                                                <div id="collapsedefult" class="collapse one" data-parent="#accordion">
                                                    <div class="card-body1">
                                                        <<img src="assets/img/visha/myqr.jpg" alt=""/> 
                                                    </div>
                                                </div>
                                            </div>    
                                            <!--test-->
                                            <div class="order_button">
                                                <c:if test="${sessionScope.role==3}">
                                                    <button onclick="myFunction()" type="submit">Proceed to PayPal</button> 
                                                </c:if>
                                                <c:if test="${sessionScope.role!=3}">
                                                    <button type="submit">Proceed to PayPal</button> 
                                                </c:if>
                                            </div>



                                            <c:if test="${requestScope.order!=null}">
                                                <p style="color: turquoise">${requestScope.order}</p>
                                            </c:if>
                                            <c:if test="${requestScope.error!=null}">
                                                <p style="color: red">${requestScope.error}</p>
                                            </c:if>
                                        </div>         
                                    </div>
                                </div> 
                            </form> 
                        </div>  
                    </div>

                    <!--Checkout page section end-->

                </div>
                <!--pos page inner end-->
            </div>
        </div>
        <!--pos page end-->

        <!--footer area start-->
        <jsp:include page="footer.jsp"/>
        <!--footer area end-->
        <script>
            function myFunction() {
                alert("You have been banned!");
            }
        </script>
        <script>
            window.onload = function () {
                if (performance.navigation.type == 1) {
                    window.location.href = "checkout";
                }
            };
        </script>
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

