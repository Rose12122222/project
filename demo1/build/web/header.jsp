<%-- 
    Document   : header.jsp
    Created on : May 15, 2024, 6:38:46 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <li><a href="#" class="nav-link px-2 text-white">Sale</a></li>
          </ul>

          <form class="col-12 col-lg-6 mb-3 mb-lg-0 me-lg-3" role="search">
            <input
              type="text"
              id="disabledTextInput"
              class="form-control"
              placeholder="Find any content"
            />
          </form>

          <div class="text-end button-header">
            <button type="button" class="btn btn-outline-light me-2">
              <a href="login.jsp">login</a>
            </button>
            <button type="button" class="btn btn-outline-light me-2">
              <a href="signup.jsp">Sign up</a>
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
        </div>
      </div>
    </header>
    </body>
</html>
