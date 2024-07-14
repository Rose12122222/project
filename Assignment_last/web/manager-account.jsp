
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Coron-my account</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets\img\favicon.png">

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="./assets/css/manager.css" rel="stylesheet" type="text/css"/>

        <!--all css here--> 
        <link rel="stylesheet" href="assets\css\bootstrap.min.css">
        <link rel="stylesheet" href="assets\css\plugin.css">
        <link rel="stylesheet" href="assets\css\bundle.css">
        <link rel="stylesheet" href="assets\css\style.css">
        <link rel="stylesheet" href="assets\css\responsive.css">
        <script src="assets\js\vendor\modernizr-2.8.3.min.js"></script>

        <style>
            .material-icons{
                margin-top: 5px;
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
                                        <li>manager account</li>
                                    </ul>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!--breadcrumbs area end-->

                    <!-- Start Maincontent  -->
                    <section class="main_content_area">
                        <div class="container">
                            <div class="table-wrapper">
                                <div class="table-title">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <h2>Manage <b>Account</b></h2>
                                        </div>
                                    </div>
                                </div>
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr style="text-align: center">

                                            <th>ID</th>
                                            <th>UserName</th>
                                            <th>PassWord</th>
                                            <th>Role</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.listacc}" var="o">
                                            <tr style="text-align: center">

                                                <td>${o.id}</td>
                                                <td>${o.username}</td>
                                                <td>${o.password}</td>
                                                <c:if test="${o.role == 1}">
                                                    <td>Admin</td>
                                                </c:if>
                                                <c:if test="${o.role == 2}">
                                                    <td>User</td>
                                                </c:if>
                                                <c:if test="${o.role == 3}">
                                                    <td>Banned</td>
                                                </c:if>
                                                <td>
                                                    <c:if test="${o.role!=1}">
                                                        <c:if test="${o.role!=2}">
                                                            <a href="manage-account?action=unblock&&aid=${o.id}&&index1=${sessionScope.index1}" onclick="toggleIcon(this)" class="delete"><i class="material-icons" title="Block">&#xe898;</i></a>
                                                        </c:if>
                                                        <c:if test="${o.role==2}">
                                                            <a href="manage-account?action=block&&aid=${o.id}&&index1=${sessionScope.index1}" onclick="toggleIcon(this)" class="delete"><i class="material-icons" title="Block">&#xe899;</i></a>
                                                        </c:if>
                                                    </c:if>
                                                    <a href="manage-account?aid=${o.id}&&index1=${sessionScope.index1}" onclick="return confirm('Are you sure you want to delete this account?')" class="delete"><i class="material-icons" title="Delete">&#xE872;</i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <div class="pagination_style">
                                    <div class="item_page">

                                    </div>
                                    <div class="page_number">
                                        <span>Pages: </span>
                                        <ul>
                                            <c:choose>
                                                <c:when test="${empty param.index1 or param.index1 == '1'}">
                                                    <c:set var="currentPage" value="1" />
                                                </c:when>
                                                <c:otherwise>
                                                    <c:set var="currentPage" value="${param.index1}" />
                                                </c:otherwise>
                                            </c:choose>
                                            <li><a href="manage-account?index1=1">«</a></li>
                                                <c:forEach var="i" begin="1" end="${sessionScope.nop2}">
                                                    <c:choose>
                                                        <c:when test="${i == currentPage}">
                                                        <li class="current_number">${i}</li>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <li><a href="manage-account?index1=${i}">${i}</a></li>
                                                        </c:otherwise>
                                                    </c:choose>                                             
                                                </c:forEach>
                                            <li><a href="manage-account?index1=${sessionScope.nop2}">»</a></li>
                                        </ul>
                                    </div>
                                    <!--pagination style end-->
                                </div>
                            </div>

                        </div>

                        <!-- Delete Modal HTML -->
                        <div id="deleteEmployeeModal" class="modal fade">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form>
                                        <div class="modal-header">						
                                            <h4 class="modal-title">Delete Product</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        </div>
                                        <div class="modal-body">					
                                            <p>Are you sure you want to delete these Records?</p>
                                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                                        </div>
                                        <div class="modal-footer">
                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                            <input type="submit" class="btn btn-danger" value="Delete">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        </a>
                    </section>			
                    <!-- End Maincontent  --> 
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
        <script src="assets\js\plugins.js"></script>
        <script src="assets\js\main.js"></script>

        <script src="./assets/js/manager.js" type="text/javascript"></script>

    </body>
</html>

