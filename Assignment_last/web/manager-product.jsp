
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
            .imgg{
                width: 200px;
                height: 200px;
            }
            .material-icons{
                margin-top: 5px;
            }

            .modal-content{
                width: 150%;
            }
            .modal-header h2{
                color: #00dbde;
            }
            #submit{
                border-radius: 10px;
            }
            #submit1{
                border-radius: 10px;
            }
            #submit1:hover {
                background-color: #009999;
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
                                        <li>manager product</li>
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
                                            <h2>Manage <b>Product</b></h2>
                                        </div>
                                        <div class="col-sm-6">
                                            <a id="submit" href="add.jsp?index=${sessionScope.index}"  class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                                            <a id="submit" href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						
                                        </div>
                                    </div>
                                </div>
                                <form action="delete-product" method="get">
                                    <input type="hidden" name="action" value="deletemore">
                                    <input type="hidden" name="index" value="${sessionScope.index}">
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <span class="custom-checkbox">
                                                        <input type="checkbox" id="selectAll">
                                                        <label for="selectAll"></label>
                                                    </span>
                                                </th>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Image</th>
                                                <th>Price</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.listpro}" var="o" varStatus="loop">
                                                <tr>
                                                    <td>
                                                        <span class="custom-checkbox">
                                                            <input type="checkbox" name="option" value="${o.id}">

                                                            <label for="checkbox1"></label>
                                                        </span>
                                                    </td>
                                                    <c:if test="${sessionScope.index!=null||sessionScope.index==''}">
                                                        <td class="order_id">${loop.count + 9*(sessionScope.index-1)}</td>
                                                    </c:if>
                                                    <c:if test="${sessionScope.index==null}">
                                                        <td class="order_id">${loop.count}</td>
                                                    </c:if>
                                                    <td>${o.name}</td>
                                                    <td>
                                                        <img class="imgg" src="${o.img}">
                                                    </td>
                                                    <td class="price_format">${o.price * (1-o.discount)} $</td>

                                                    <td>
                                                        <c:set var="filePath" value="${o.img}" />
                                                        <c:set var="imgformat" value="${fn:replace(filePath, '\\\\', '/')}"/>

                                                        <a href="edit.jsp?pid=${o.id}&&name=${o.name}&&price=${o.price}&&type=${o.type}&&date=${o.date}&&amount=${o.amount}&&discount=${o.discount}&&img=${imgformat}&&alt=${o.alt}&&cid=${o.cid}&&description=${o.description}&&index=${sessionScope.index}" class="edit" ><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                                        <a href="delete-product?pid=${o.id}&&index=${sessionScope.index}"  onclick="return confirm('Are you sure you want to delete this product?')" class="delete"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                                    </td
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <div id="deleteEmployeeModal" class="modal fade">
                                        <div class="modal-dialog" style="margin-left:31.5%;">
                                            <div class="modal-content">
                                                <div class="modal-header">						
                                                    <h4 class="modal-title">Delete Product</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                </div>
                                                <div class="modal-body">					
                                                    <p>Are you sure you want to delete Product?</p>
                                                    <p class="text-warning"><small>This action cannot be undone.</small></p>
                                                </div>
                                                <div class="modal-footer">
                                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                    <input type="submit" class="btn btn-danger" value="Delete">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>

                                <div class="pagination_style">
                                    <div class="item_page">

                                    </div>
                                    <div class="page_number">
                                        <span>Pages: </span>
                                        <ul>
                                            <c:choose>
                                                <c:when test="${empty sessionScope.index or param.index == '1'}">
                                                    <c:set var="currentPage" value="1" />
                                                </c:when>
                                                <c:otherwise>
                                                    <c:set var="currentPage" value="${sessionScope.index}" />
                                                </c:otherwise>
                                            </c:choose>
                                            <li><a href="manage-product?index=1">«</a></li>
                                                <c:forEach var="i" begin="1" end="${sessionScope.nop}">
                                                    <c:choose>
                                                        <c:when test="${i == currentPage}">
                                                        <li class="current_number">${i}</li>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <li><a href="manage-product?index=${i}">${i}</a></li>
                                                        </c:otherwise>
                                                    </c:choose>                                             
                                                </c:forEach>
                                            <li><a href="manage-product?index=${sessionScope.nop}">»</a></li>
                                        </ul>
                                    </div>
                                    <!--pagination style end-->
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

        <script>
            // Hàm để điều chỉnh dữ liệu vào form edit
            function fillEditForm(id, name, price, type, date, amount, discount, img, alt, description, cid) {
                document.querySelector('input[name="proid"]').value = id;
                document.querySelector('input[name="editName"]').value = name;
                document.querySelector('input[name="editPrice"]').value = price;
                document.querySelector('input[name="editType"]').value = type;
                document.querySelector('input[name="editDate"]').value = date;
                document.querySelector('input[name="editAmount"]').value = amount;
                document.querySelector('input[name="editDiscount"]').value = discount;
                document.querySelector('input[name="editImg"]').value = img;
                document.querySelector('input[name="editAlt"]').value = alt;
                document.querySelector('textarea[name="editDescription"]').value = description;
//
//                // Đối với category, chọn giá trị tương ứng trong dropdown
                var categoryDropdown = document.querySelector('select[name="editCategory"]');
                for (var i = 0; i < categoryDropdown.options.length; i++) {
                    if (categoryDropdown.options[i].value === cid) {
                        categoryDropdown.selectedIndex = i;
                        break;
                    }
                }
            }
        </script>

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

