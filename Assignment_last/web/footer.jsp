<%-- 
    Document   : header.jsp
    Created on : Feb 20, 2024, 12:11:48 AM
    Author     : FPT SHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Footer Shop</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        <!--footer area start-->
        <div class="footer_area">
            <div class="footer_top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-8 col-sm-8">
                            <div class="footer_widget">
                                <h3>About us</h3>
                                <p>"Shop đồ chơi của chúng tôi mang đến cho bạn những chiếc gấu bông đáng yêu, chất lượng cao và giá cả phải chăng, cam kết sự hài lòng tuyệt đối từ khách hàng."</p>
                                <div class="footer_widget_contect">
                                    <p><i class="fa fa-map-marker" aria-hidden="true"></i>Thạch Hoà, Thạch Thất, Hà Nội, Việt Nam</p>

                                    <p><i class="fa fa-mobile" aria-hidden="true"></i> 0366 453 985<p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-8 col-sm-8">
                            <div class="footer_widget">
                                <h3>My Account</h3>
                                <ul>
                                    <c:if test="${sessionScope.role!=null}">
                                        <li><a href="profile">Your Account</a></li>
                                        </c:if>
                                        <c:if test="${sessionScope.role!=1}">
                                        <li><a href="my-order">My orders</a></li>
                                        </c:if>
                                        <c:if test="${sessionScope.role==null}">
                                        <li><a href="login">Login</a></li>
                                        </c:if>
                                        <c:if test="${sessionScope.role!=null}">
                                        <li><a href="logout">Logout</a></li>
                                        </c:if>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-8 col-sm-8">
                            <div class="footer_widget">
                                <h3>Informations</h3>
                                <ul>
                                    <li><a href="page">Our store(s)!</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-8 col-sm-8">
                            <div class="footer_widget">
                                <h3>Extras</h3>
                                <ul>
                                    <li><a href="cart">My cart</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer_bottom">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-6 col-md-6">
                            <div class="copyright_area">
                                <p>Copyright &copy; 2024 <a href="#">Teddy Shop</a>. All rights reserved. </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--footer area end-->
    </body>
</html>
