<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"

            />

    </style>
    <link rel="stylesheet" href="main.css">
</head>
<body>
    <!--header area -->
    <jsp:include page="header.jsp"/>
    <!--header end -->

    <section class="h-100">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                    <form action="change" method="post">
                        <!-- Email input -->

                        <div data-mdb-input-init class="form-outline mb-4 mt-5">
                            <input type="hidden" name="getemail" value="${sessionScope.checkemail}"> 
                            <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">
                                Forgot Password
                            </p>
                            <h5>Reset password for: ${sessionScope.checkemail} </h5>
                            <h6>Password: (From  8 - 12 character)</h6>
                            <input
                                name="password"
                                type="password"
                                id="form3Example3"
                                class="form-control form-control-lg"
                                placeholder="Enter your password"
                                />
                        </div>


                        <!-- Password input -->
                        <div data-mdb-input-init class="form-outline mb-3">
                            <h6>Confirm you password:</h6>
                            <input
                                name="confirm"
                                type="password"
                                id="form3Example4"
                                class="form-control form-control-lg"
                                placeholder="Confirm your password"
                                />
                            <div class="mt-2">
                                <p style=" color: red;">
                                    <c:if test="${requestScope.error!=null}">
                                        ${requestScope.error}
                                    </c:if>
                                </p>
                            </div>
                        </div>

                        <div class="row text-center mt-4 pt-2">
                            <button
                                type="submit"
                                data-mdb-button-init
                                data-mdb-ripple-init
                                class="btn btn-primary btn-lg "
                                style="padding-left: 2.5rem; padding-right: 2.5rem"
                                >
                                Reset Password
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
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
