<!DOCTYPE html>
<html lang="en">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="main.css" />
    </head>
    <body>

        <!--header area -->
        <jsp:include page="header.jsp"/>
        <!--header end -->

        <div class="container">
            <div class="main-body">
                <!-- /Breadcrumb -->
                <div class="row gutters-sm">
                    <div class="col-md-4 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">
                                    <img src="images/user.PNG" alt="Admin" class="rounded-circle" width="150">
                                    <div class="mt-3">
                                        <h4>${user.fullName}</h4>
                                        <input type="file" name="fullName" id="form_file" value=""/>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-8">
                        <div class="card mb-3">
                            <form action="profile" method="POST">
                                <div class="card-body">

                                    <c:if test="${sessionScope.role==1}">


                                        <div class="row">
                                        </c:if>
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Full Name</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input class="form-control acceptEdit"   name="fullName"  type="text" value="${user.fullName}">

                                        </div>
                                    </div>

                                    <hr>


                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Gender</h6>
                                        </div>
                                        
                                          
                                        <div class="col-sm-9">
                                             
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="gender1" id="inlineRadio1" value="option1">
                                                <label class="form-check-label" for="inlineRadio1">Male</label>
                                            </div>
                                            
                                            
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="geder2" id="inlineRadio2" value="option2">
                                                <label class="form-check-label" for="inlineRadio2">Female</label>
                                            </div>
                                          
                                            
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
                                                <label class="form-check-label" for="inlineRadio3">None</label>
                                            </div>
                                       
                                        </div>
                                        
                                    </div>


                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">BirthofDate</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input class="form-control acceptEdit"   name="Birthday"1type="text" value="${user.birthDate}">

                                        </div>
                                    </div>

                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input class="form-control acceptEdit"   name="email" type="text"value="${user.email}">

                                        </div>
                                    </div>
                                    <hr>


                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Phone</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input class="form-control acceptEdit"   name="phone"  type="text" value="${user.phone}">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Address</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input class="form-control acceptEdit"   name="address"  type="text" value="${user.address}">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <a class="btn btn-info " target="__blank" href="">Edit</a>
                                            <a class="btn btn-primary " target="__blank" href="">Save</a>

                                        </div>
                                    </div>
                                </div>
                            </form>
                            <%
Object user = request.getAttribute("user");
                            %>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!--footer area start-->
        <jsp:include page="footer.jsp"/>
        <!--footer area end-->

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>