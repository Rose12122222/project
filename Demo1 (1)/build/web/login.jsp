
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
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
        <link rel="stylesheet" href="main.css" />
    </head>
    <body>
        <!--header area -->
        <jsp:include page="header.jsp"/>
        <!--header end -->

        <section class="h-100">
            <div class="container h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Login</p>
                    <div class="col-md-9 col-lg-6 col-xl-5">
                        <img
                            src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
                            class="img-fluid"
                            alt="Sample image"
                            />
                    </div>
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                        <c:set var="cookie" value="${pageContext.request.cookies}"/>
                        <form action="login" method="post">

                            <!-- Email input -->
                            <div data-mdb-input-init class="form-outline mb-4 mt-5">
                                <input
                                    name="text"
                                    type="text"
                                    id="form3Example3"
                                    class="form-control form-control-lg"
                                    placeholder="Enter username or email"
                                    value="${requestScope.username}"
                                    />
                                <label class="form-label" for="form3Example3">Username</label>
                            </div>

                            <!-- Password input -->
                            <div data-mdb-input-init class="form-outline mb-3">
                                <input
                                    name="password"
                                    type="password"
                                    id="form3Example4"
                                    class="form-control form-control-lg"
                                    placeholder="Enter password"
                                    value="${requestScope.password}"
                                    />
                                <label class="form-label" for="form3Example4">Password</label>
                                <div class="mt-2">
                                    <p style="color:red; ">
                                        <c:if test="${requestScope.error!=null}">
                                            ${requestScope.error}
                                        </c:if></p>
                                </div>
                            </div>

                            <div class="d-flex justify-content-between align-items-center">
                                <!-- Checkbox -->
                                <div class="form-check mb-0">
                                    <input
                                        name="remember" 
                                        type="checkbox"
                                        ${cookie.crem.value!=null?'checked':''}
                                        class="form-check-input me-2"
                                        id="form2Example3"
                                        />
                                    <label class="form-check-label" for="form2Example3">
                                        Remember me
                                    </label>
                                </div>
                                <a href="forgot" class="text-body">Forgot password?</a>
                            </div>
                            <div class="text-center text-lg-start mt-4 pt-2">
                                <button
                                    type="submit"
                                    data-mdb-button-init
                                    data-mdb-ripple-init
                                    class="btn btn-primary btn-lg"
                                    style="padding-left: 2.5rem; padding-right: 2.5rem"
                                    >
                                    Login
                                </button>
                                <p class="small fw-bold mt-2 pt-1 mb-0">
                                    Don't have an account?
                                    <a href="logup" class="link-danger">Register</a>
                                </p>
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
