<%-- 
    Document   : header.jsp
    Created on : May 15, 2024, 6:38:46 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header class="p-3 text-bg-primary">
            <div class="container">
                <div
                    class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start"
                    >
                    <a
                        href="#"
                        class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none"
                        >
                        <img src="images/logo.png" alt="" width="70" height="32" />
                    </a>

                    <ul
                        class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0"
                        >
                        <li>
                            <a href="homepage.jsp" class="nav-link px-2 text-white">Home</a>
                        </li>
                        <li class="nav-item dropdown"></li>
                        <li class="nav-item dropdown">
                            <a
                                class="nav-link dropdown-toggle px-2 text-white"
                                href="#"
                                id="featuresDropdown"
                                role="button"
                                data-bs-toggle="dropdown"
                                aria-expanded="false"
                                >
                                Category
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="featuresDropdown">
                                <li><a class="dropdown-item" href="#">Software engineer</a></li>

                                <li><a class="dropdown-item" href="#">Marketing</a></li>
                                <li><a class="dropdown-item" href="#">Business</a></li>
                                <li><a class="dropdown-item" href="#">Design</a></li>
                            </ul>
                        </li>
                        <li><a href="#" class="nav-link px-2 text-white">About Us</a></li>
                        <li><a href="coursedetail.jsp" class="nav-link px-2 text-white">Sale</a></li>
                    </ul>

                    <form class="col-12 col-lg-6 mb-3 mb-lg-0 me-lg-3" role="search">
                        <input
                            type="text"
                            id="disabledTextInput"
                            class="form-control"
                            placeholder="Find any content"
                            />
                    </form>

                    <c:if test="${sessionScope.role == null}">
                        <div class="text-end button-header">
                            <button type="button" class="btn btn-outline-light me-2">
                                <a href="login">login</a>
                            </button>
                            <button type="button" class="btn btn-outline-light me-2">
                                <a href="logup">Sign up</a>
                            </button>
                            <button type="button" class="btn btn-outline-light">
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="16"
                                    height="16"
                                    fill="currentColor"
                                    class="bi bi-cart"
                                    viewBox="0 0 16 16"
                                    >
                                <path
                                    d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"
                                    ></path>
                                </svg>
                                <a href="cart.jsp">Cart</a>
                            </button>
                        </div>
                    </c:if>

                    <c:if test="${sessionScope.role != null}">
                        <div class="text-end button-header cartspace">
                            <button type="button" class="btn btn-outline-light">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"></path>
                                </svg>
                                <a href="cart.html">Cart</a>
                            </button>

                            <button type="button" class="btn btn-outline-light">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16">
                                <path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783"/>
                                </svg>
                                <a href="cart.html">Learn</a>
                            </button>
                        </div>

                        <div class="dropdown text-start">
                            <a
                                href="#"
                                class="d-block link-dark text-decoration-none dropdown-toggle show"
                                id="dropdownUser1"
                                data-bs-toggle="dropdown"
                                aria-expanded="true"
                                >
                                <img
                                    src="https://github.com/mdo.png"
                                    alt="mdo"
                                    width="32"
                                    height="32"
                                    class="rounded-circle"
                                    />
                            </a>
                            <ul
                                class="dropdown-menu text-small "
                                aria-labelledby="dropdownUser1"
                                style="
                                position: absolute;
                                inset: 0px 0px auto auto;
                                margin: 0px;
                                transform: translate3d(110px, 34px, 0px);
                                "
                                data-popper-placement="bottom-end"
                                >
                                <li><a class="dropdown-item" href="#">Certificate</a></li>
                                <li><a class="dropdown-item" href="#">Settings</a></li>
                                <li><a class="dropdown-item" href="profile">Profile</a></li>
                                <li><a class="dropdown-item" href="forgotpass.html">Security</a></li>
                                <li><a class="dropdown-item" href="logout">Sign out</a></li>
                            </ul>
                        </div>
                    </c:if>
                </div>
            </div>
        </header>
    </body>
</html>
