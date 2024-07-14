<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dal.*"%>

<!DOCTYPE html>
<html lang="en">
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


                                        <h4>${admin.fullName}</h4>


                                        <input type="file" name="" id="form_file" value=""/>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-8">

                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="row">
                           
                                        <div class="col-sm-3">
                                   <h6 class="mb-0">FullName</h6>

                                        </div>
                                        <div class="col-sm-9 text-secondary">

                                            <input class="form-control acceptEdit" name="fullName"  type="text" value="${info.fullName}"/>

                                        </div>     
                                    </div>

                                    <hr>


                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Gender</h6>
                                        </div>
                                        <div class="col-sm-9">
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Male">

                                                <label class="form-check-label" for="inlineRadio1">Male</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="Female">

                                                <label class="form-check-label" for="inlineRadio2">Female</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="None">

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
                                            <input class="form-control acceptEdit"   name="BirthofDate"  type="text" value="${admin.birthday}">

                                        </div>
                                    </div>

                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0"> email</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input class="form-control acceptEdit"   name="email" id="inputFirstName" type="text" value="${info.email}">

                                        </div>
                                    </div>
                                    <hr>


                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Phone</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input class="form-control acceptEdit"   name="phone" id="inputFirstName" type="text" value="${admin.phone_number}">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Address</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input class="form-control acceptEdit"   name="address" id="inputFirstName" type="text" value="${admin.address}">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <a class="btn btn-info " target="__blank" href="" id="">Edit</a>
                                            <a class="btn btn-primary " target="__blank" href="" id="">Save</a>

                                        </div>
                                    </div>
                                </div>
                           
                        </div>

                    </div>
                </div>

            </div>


        </div>

        <!--footer area start-->

        <!--footer area end-->
    </body>
</html>