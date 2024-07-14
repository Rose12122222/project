<%-- 
    Document   : search-by
    Created on : Feb 25, 2024, 3:24:44 PM
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
        <form action="page" method="get">
            <input hidden="" name="shop" value="${param.shop}"/>
            <div class="sidebar_widget shop_c">
                <div class="categorie__titile">
                    <h4>Categories</h4>
                </div>
                <div class="layere_categorie">
                    <ul>
                        <c:forEach var="category" items="${sessionScope.categoryList}">
                            <li>
                                <input name="cid" value="${category.getId()}" type="checkbox">
                                <label for="acces">${category.getName()}<span> (${category.getNumberOfProduct()})</span></label>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <!--layere categorie end-->

            <!--color area start-->  
            <div class="sidebar_widget color">
                <h2>Color</h2>
                <div class="widget_color">
                    <ul>
                        <c:forEach var="color" varStatus="status" items="${sessionScope.colorList}">
                            <li class="cb">
                                <a href="#">${color}</a>
                                <input type="checkbox" name="color" value="${color}"/>
                                <style>
                                    .widget_color ul li:nth-child(${status.count}) a::before{
                                        background: ${color};
                                        position: absolute;
                                        content: "";
                                        width: 15px;
                                        height: 15px;
                                        left: -23px;
                                        top: 50%;
                                        -webkit-transform: translatey(-50%);
                                        transform: translatey(-50%);
                                    }
                                </style>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>                 
            <!--color area end--> 

            <!--price slider start-->                                     
            <div class="sidebar_widget price">
                <h2>Price</h2>
                <div class="ca_search_filters">

                    <input type="text" name="text" id="amount">  
                    <div id="slider-range"></div> 
                </div>
            </div>                                                       
            <!--price slider end-->
            <div class="select_option">                                      
                <label>Sort By</label>
                <select multiple="multiple" name="order" id="short_pro">
                    <option selected="" value="0">Position</option>
                    <option value="1">Price: Lowest</option>
                    <option value="2">Price: Highest</option>
                    <option value="3">Amount: Lowest</option>
                    <option value="4">Amount: Highest</option>
                </select>
            </div>
            <div class="search_bar se">
                <input name="name"  placeholder="Find name..."  type="text">
            </div>
            <div class="sm">
                <input  type="submit" value="Search"/>
            </div>
        </form>
        <!--wishlist block start-->
        <div class="sidebar_widget wishlist mb-30">
            <div class="block_title">
                <h3><a href="#">Wishlist</a></h3>
            </div>
            <div class="block_content">
                <p>2  products</p>
                <a href="wishlist.jsp">» My wishlists</a>
            </div>
        </div>            
    </body>
</html>
