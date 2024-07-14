
<%-- 
    Document   : login
    Created on : Feb 19, 2024, 11:55:30 PM
    Author     : FPT SHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Coron-login</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets\img\favicon.png">

        <!-- all css here -->
        <link rel="stylesheet" href="assets/css/mycss.css">
        <link rel="stylesheet" href="/path/to/font-awesome/css/all.min.css">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
                      integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
                      crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!--        <link rel="stylesheet" href="assets\css\bootstrap.min.css">
                <link rel="stylesheet" href="assets\css\plugin.css">
                <link rel="stylesheet" href="assets\css\bundle.css">
                <link rel="stylesheet" href="assets\css\style.css">
                <link rel="stylesheet" href="assets\css\responsive.css">
                <script src="assets\js\vendor\modernizr-2.8.3.min.js"></script>-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
<!--        <h2>Sign in/up Form</h2>-->
        <a href="home"><img src="assets/img/logo/logo4.jpg" alt=""></a>
        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="" method="">
                    <h1>Create Account</h1>
                    <div class="social-container">


                        <a href="https://www.facebook.com/?locale=vi_VN" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="https://www.google.com.vn/?hl=vi" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <span>or use your email for registration</span>
                    <input style="width: 100%" type="text" name="username" placeholder="Username" />
                    <input style="width: 100%" type="password" name="password" placeholder="Password" />
                    <input style="width: 100%" type="password" name="cfpassword" placeholder="Confirm password" />
                    <button type="button" id="register"  class="anh1">Sign Up</button>
                    <p id="error-msg" style="color: red"></p>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <c:set var="cookie" value="${pageContext.request.cookies}"/>
                <form action="login" method="post">
                    <h1>Sign in</h1>
                    <div class="social-container">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <span>or use your account</span>
                    <input type="text" name="text" placeholder="Username or email" value="${cookie.cuser.value}" style="width: 100%;" />
                    <input type="password" name="password" placeholder="Password" value="${cookie.cpass.value}" style="width: 100%;" />
                    <div class="anh">
                        <input n type="checkbox" name="remember" ${cookie.crem.value!=null?'checked':''}/>Remember me
                    </div>  

                    <button>Sign In</button>
                    <a href="#">Forgot your password?</a>
                    <p id="error-msg" style="color: red">
                        <c:if test="${requestScope.error!=null}">
                            ${requestScope.error}
                        </c:if>
                    </p>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button class="ghost" id="signIn">Sign In</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button class="ghost" id="signUp">Sign Up</button>
                    </div>
                </div>
            </div>
        </div>
        <!--pos page end-->

        <!-- all js here -->
        <script>
            $(document).ready(function () {
                $('button#register').click(function () {
                    var username = $('input[name="username"]').val();
                    var password = $('input[name="password"]').val();
                    var confirmPassword = $('input[name="cfpassword"]').val();

                    $.ajax({
                        type: 'POST',
                        url: '/Assignment/logup',
                        data: {
                            username: username,
                            password: password,
                            cfpassword: confirmPassword
                        },
                        success: function (data) {
                            if (data === 'Sign up successful!') {
                                alert("Sign up successful! Back to login page.");
                                window.location.href = "login";
                            } else {
                                $('#error-msg').text(data);
                            }
                        }
                    });
                });
            });
        </script>
        <script src="assets/js/login.js"></script>
        <!--        <script src="assets\js\vendor\jquery-1.12.0.min.js"></script>
                <script src="assets\js\popper.js"></script>
                <script src="assets\js\bootstrap.min.js"></script>
                <script src="assets\js\ajax-mail.js"></script>
                <script src="assets\js\plugins.js"></script>
                <script src="assets\js\main.js"></script>-->
    </body>
</html>
