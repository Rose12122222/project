<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                                        <h4>${USER.fullName}</h4>
                                        <input type="file" name="" id="form_file" value=""/>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-8">
                        <form action="profile" class="card mb-3" method="POST">
                            <input type="hidden" name="action" value="edit-profile"/>     
                            <input type="hidden" name="id" value="${USER.id}"/>

                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Full Name</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input class="form-control acceptEdit"  required  name="name" id="inputFirstName" type="text" value="${USER.getFullName()}">

                                    </div>
                                </div>

                                <hr>


                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Gender</h6>
                                    </div>
                                    <div class="col-sm-9">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="male" ${USER.gender == 1 ? 'checked' : ''}>
                                            <label class="form-check-label" for="inlineRadio1">Male</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="female"  ${USER.gender == 0 ? 'checked' : ''}>
                                            <label class="form-check-label" for="inlineRadio2">Female</label>
                                        </div>
                                    </div>
                                </div>

                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">BirthofDate</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input class="form-control acceptEdit" required  name="dob" id="inputFirstName" type="date" value="${USER.getBirthDate()}">

                                    </div>
                                </div>

                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Email</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input class="form-control acceptEdit"   name="email" id="inputFirstName" type="email" value="${USER.getEmail()}">

                                    </div>
                                </div>
                                <hr>


                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Phone</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input class="form-control acceptEdit"   name="phone" id="inputFirstName" type="tel" value="${USER.getPhoneNumber()}">
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Address</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input class="form-control acceptEdit"   name="address" id="inputFirstName" type="text" value="${USER.getAddress()}">
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <button class="btn btn-primary" type="submit">Save</button>
                                    </div>
                                    <div style="color: green">${MESSAGE}</div>
                                </div>
                            </div>
                        </form>
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