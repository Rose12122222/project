<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="model.Category"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="CSS/1.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
              integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Merriweather:300,400,400i|Noto+Sans:400,400i,700"
              rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600" rel="stylesheet">

        <link rel="shortcut icon" type="image/x-icon" href="assets\img\favicon.png">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <!--all css here--> 
        <link rel="stylesheet" href="assets\css\bootstrap.min.css">
        <link rel="stylesheet" href="assets\css\plugin.css">
        <link rel="stylesheet" href="assets\css\bundle.css">
        <link rel="stylesheet" href="assets\css\style.css">
        <link rel="stylesheet" href="assets\css\responsive.css">
        <script src="assets\js\vendor\modernizr-2.8.3.min.js"></script>

        <style>
            body{
                background-image: url(assets/img/logo/);
                background-size: cover;
                background-position: center;
            }
            #submit:hover {
                background-color: #009999; /* Darker green background on hover */
            }
            .fo{
                margin: 0 20%;
                border: 100px solid #80808000;
                grid-column: 6/9;
                grid-row: 1;
                display: flex;
                flex-direction: column;
                position: relative;
                border-radius: 15px;
                box-shadow: 0px 0px 14px 0px grey;
                background-color: white;
            }
            label {
                margin-top: 5px;
                color: #00bba6;
                display: block;
                font-weight: lighter;
                margin-bottom: 5px;
                font-size: 24px;
            }

            input {
                display: block;
                border-bottom: 2px solid #00BCD4;
                margin-top: 6px;
                margin-bottom: 10px;
                outline-style: none;
                background: rgba(255, 255, 255, 0.6);

            }
            #submit {
                background-color: #00bba6; /* Green background */
                color: black; /* White text */
                width: 30%;
                text-decoration: none;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 5px;
            }

        </style>
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


                    <!-- Start Maincontent  -->
                    <section class="main_content_area">

                        <div class="container">
                            <div class="table-wrapper">
                                <div class="fo">
                                    <h2 style="text-align: center;color: #00bba6">EDIT PRODUCT</h2>
                                    <form action="edit-product" method="post">
                                        <input type="hidden" name="action" value="edit">
                                        <input type="hidden" name="pid" value="${param.pid}">
                                        <input type="hidden" name="index" value="${sessionScope.index}">

                                        <label>Name</label>
                                        <input value="${param.name}" name="name" type="text" required>
                                        <label>Price</label>
                                        <input value="${param.price}" name="price" type="text"  required>
                                        <div style="margin: 5px 0px;">
                                            <c:set var="error" value="${requestScope.error}"/>
                                            <c:if test="${error!=null}">
                                                <p style="color: red;">${error}</p>
                                            </c:if>
                                        </div>
                                        <label>Type</label>
                                        <input value="${param.type}" name="type" type="text"  required>
                                        <label>Date</label>
                                        <input value="${param.date}" name="date" type="text"  required>
                                        <div style="margin: 5px 0px;">
                                            <c:set var="error1" value="${requestScope.error1}"/>
                                            <c:if test="${error1!=null}">
                                                <p style="color: red;">${error1}</p>
                                            </c:if>
                                        </div>
                                        <label>Amount</label>
                                        <input value="${param.amount}" name="amount" type="text" required>
                                        <div style="margin: 5px 0px;">
                                            <c:set var="error2" value="${requestScope.error2}"/>
                                            <c:if test="${error2!=null}">
                                                <p style="color: red;">${error2}</p>
                                            </c:if>
                                        </div>
                                        <label>Discount</label>
                                        <input value="${param.discount}" name="discount" type="text" required>
                                        <div style="margin: 5px 0px;">
                                            <c:set var="error3" value="${requestScope.error3}"/>
                                            <c:if test="${error3!=null}">
                                                <p style="color: red;">${error3}</p>
                                            </c:if>
                                        </div>
                                        <label>Image</label>
                                        <input value="${param.img}" name="img" type="text"  required>
                                        <label>Alt</label>
                                        <input value="${param.alt}" name="alt" type="text"  required>
                                        <label>Description</label>
                                        <input value="${param.description}" name="description" type="text" required>
                                        <label>Category</label><br>
                                        <select name="category">
                                            <c:forEach items="${sessionScope.listcate}" var="o">
                                                <c:choose>
                                                    <c:when test="${param.cid==o.id}">
                                                        <option selected="" value="${o.id}">${o.name}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${o.id}">${o.name}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select><br>
                                        

                                        <div style="display: flex; margin-top: 40px; justify-content: space-around">
                                            <input id="submit" type="reset" value="Reset">
                                            <input id="submit" type="submit" value="Edit">
                                        </div>

                                    </form>
                                </div>

                            </div>

                        </div>


                    </section>

                </div>
                <!--pos page inner end-->
            </div>
        </div>
        <!--pos page end-->

        <!--footer area start-->
        <jsp:include page="footer.jsp"/>
        <!--footer area end-->



        <!-- all js here -->
        <script src="assets\js\vendor\jquery-1.12.0.min.js"></script>
        <script src="assets\js\popper.js"></script>
        <script src="assets\js\bootstrap.min.js"></script>
        <script src="assets\js\ajax-mail.js"></script>
        <script src="assets\js\main.js"></script>

        <script src="./assets/js/manager.js" type="text/javascript"></script>

    </body>
</html>