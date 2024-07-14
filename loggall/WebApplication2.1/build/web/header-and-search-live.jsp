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
                    <div class="col-lg-6 col-md-6">
                        <div class="switcher">
                            <ul>
                                <li class="languages"><a href="#"><img src="assets\img\logo\fontlogo.jpg" alt=""> English <i class="fa fa-angle-down"></i></a>
                                    <ul class="dropdown_languages">
                                        <li><a href="#"><img src="assets\img\logo\fontlogo.jpg" alt=""> English</a></li>
                                        <li><a href="#"><img src="assets\img\logo\fontlogo2.jpg" alt=""> French </a></li>
                                    </ul>   
                                </li> 

                                <li class="currency"><a href="#"> Currency : $ <i class="fa fa-angle-down"></i></a>
                                    <ul class="dropdown_currency">
                                        <li><a href="#"> Dollar (USD)</a></li>
                                        <li><a href="#"> Euro (EUR)  </a></li>
                                    </ul> 
                                </li> 
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header_links">
                            <ul>
                                <li><a href="contact.jsp" title="Contact">Contact</a></li>
                                <li><a href="wishlist.jsp" title="wishlist">My wishlist</a></li>
                                <li><a href="my-account.jsp" title="My account">My account</a></li>
                                <li><a href="cart.jsp" title="My cart">My cart</a></li>
                                <li><a href="login.jsp" title="Login">Login</a></li>
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
                            <a href="home.jsp"><img style="height: 120px; width: 140px" src="assets\img\logo\logo.jpg.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-9">
                        <div class="header_right_info">
                            <div class="search_bar">
                                <form action="#">
                                    <input name="name" type="text" onkeyup="searchByName(this)" placeholder="Search..."/>
                                    <!--<button type="submit"><i class="fa fa-search"></i></button>-->
                                </form>
                            </div>
                            <div class="shopping_cart">
                                <a href="cart.jsp"><i class="fa fa-shopping-cart"></i> 2Items - $209.44</a>
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
                                        <li class="active"><a href="home.jsp">Home</a>
                                        </li>
                                        <li><a href="page">shop</a>
                                            <div class="mega_menu jewelry">
                                                <div class="mega_items jewelry">
                                                    <ul>
                                                        <li><a href="page?shop=shop-list">shop list</a></li>
                                                        <li><a href="page?shop=shop-fullwidth">shop Full Width Grid</a></li>
                                                        <li><a href="page?shop=shop-fullwidth-list">shop Full Width list</a></li>
                                                        <li><a href="single-product.jsp">Product Details</a></li>
                                                    </ul>
                                                </div>
                                            </div>  
                                        </li>
                                        <li><a href="#">women</a>
                                            <div class="mega_menu">
                                                <div class="mega_top fix">
                                                    <div class="mega_items">
                                                        <h3><a href="#">Accessories</a></h3>
                                                        <ul>
                                                            <li><a href="#">Cocktai</a></li>
                                                            <li><a href="#">day</a></li>
                                                            <li><a href="#">Evening</a></li>
                                                            <li><a href="#">Sundresses</a></li>
                                                            <li><a href="#">Belts</a></li>
                                                            <li><a href="#">Sweets</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="mega_items">
                                                        <h3><a href="#">HandBags</a></h3>
                                                        <ul>
                                                            <li><a href="#">Accessories</a></li>
                                                            <li><a href="#">Hats and Gloves</a></li>
                                                            <li><a href="#">Lifestyle</a></li>
                                                            <li><a href="#">Bras</a></li>
                                                            <li><a href="#">Scarves</a></li>
                                                            <li><a href="#">Small Leathers</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="mega_items">
                                                        <h3><a href="#">Tops</a></h3>
                                                        <ul>
                                                            <li><a href="#">Evening</a></li>
                                                            <li><a href="#">Long Sleeved</a></li>
                                                            <li><a href="#">Shrot Sleeved</a></li>
                                                            <li><a href="#">Tanks and Camis</a></li>
                                                            <li><a href="#">Sleeveless</a></li>
                                                            <li><a href="#">Sleeveless</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="mega_bottom fix">
                                                    <div class="mega_thumb">
                                                        <a href="#"><img src="assets\img\banner\banner1.jpg" alt=""></a>
                                                    </div>
                                                    <div class="mega_thumb">
                                                        <a href="#"><img src="assets\img\banner\banner2.jpg" alt=""></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li><a href="#">men</a>
                                            <div class="mega_menu">
                                                <div class="mega_top fix">
                                                    <div class="mega_items">
                                                        <h3><a href="#">Rings</a></h3>
                                                        <ul>
                                                            <li><a href="#">Platinum Rings</a></li>
                                                            <li><a href="#">Gold Ring</a></li>
                                                            <li><a href="#">Silver Ring</a></li>
                                                            <li><a href="#">Tungsten Ring</a></li>
                                                            <li><a href="#">Sweets</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="mega_items">
                                                        <h3><a href="#">Bands</a></h3>
                                                        <ul>
                                                            <li><a href="#">Platinum Bands</a></li>
                                                            <li><a href="#">Gold Bands</a></li>
                                                            <li><a href="#">Silver Bands</a></li>
                                                            <li><a href="#">Silver Bands</a></li>
                                                            <li><a href="#">Sweets</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="mega_items">
                                                        <a href="#"><img src="assets\img\banner\banner3.jpg" alt=""></a>
                                                    </div>
                                                </div>

                                            </div>
                                        </li>
                                        <li><a href="#">pages</a>
                                            <div class="mega_menu">
                                                <div class="mega_top fix">
                                                    <div class="mega_items">
                                                        <h3><a href="#">Column1</a></h3>
                                                        <ul>

                                                            <li><a href="login.jsp">Login</a></li>
                                                            <li><a href="my-account.jsp">my account </a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="mega_items">
                                                        <h3><a href="#">Column2</a></h3>
                                                        <ul>
                                                            <li><a href="contact.jsp">Contact</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="mega_items">
                                                        <h3><a href="#">Column3</a></h3>
                                                        <ul>

                                                            <li><a href="cart.jsp">cart</a></li>
                                                            <li><a href="checkout.jsp">Checkout  </a></li>
                                                            <li><a href="wishlist.jsp">Wishlist</a></li>

                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>

                                        <li><a href="blog.html">blog</a>
                                            <div class="mega_menu jewelry">
                                                <div class="mega_items jewelry">
                                                    <ul>
                                                        <li><a href="blog-details.html">blog details</a></li>
                                                        <li><a href="blog-fullwidth.html">blog fullwidth</a></li>
                                                        <li><a href="blog-sidebar.html">blog sidebar</a></li>
                                                    </ul>
                                                </div>
                                            </div>  
                                        </li>
                                        <li><a href="contact.jsp">contact us</a></li>

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
