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
        <link rel="stylesheet" href="main.css" />
        <style>
            .category{
                justify-content: space-between;
            }
            .cartspace{
                margin-right: 10px;
                margin-left: 10px;
            }
        </style>


    </head>
    <body>
        <header class="p-3 text-bg-primary ">
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
                        <li><a href="homepage.jsp" class="nav-link px-2 text-white">Home</a></li>
                        <li class="nav-item dropdown"></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle px-2 text-white" href="#" id="featuresDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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
                        <input type="text" id="disabledTextInput" class="form-control" placeholder="Find any content">

                    </form>

                    <div class="text-end button-header cartspace">
                        <button type="button" class="btn btn-outline-light">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                            <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"></path>
                            </svg>
                            <a href="cart.jsp">Cart</a>
                        </button>

                        <button type="button" class="btn btn-outline-light">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16">
                            <path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783"/>
                            </svg>
                            <a href="cart.jsp">Learn</a>
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
                            class="dropdown-menu text-small show"
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
                            <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
                            <li><hr class="dropdown-divider" /></li>
                            <li><a class="dropdown-item" href="index.jsp">Sign out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>
        <!-- banner -->
        <div id="carouselExample" class="carousel slide">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="images/1.jpg" class="d-block w-100" alt="..." />
                </div>
                <div class="carousel-item">
                    <img src="images/1.jpg" class="d-block w-100" alt="..." />
                </div>
                <div class="carousel-item">
                    <img src="images/1.jpg" class="d-block w-100" alt="..." />
                </div>
            </div>
            <button
                class="carousel-control-prev btn btn-light"
                type="button"
                data-bs-target="#carouselExample"
                data-bs-slide="prev"
                >
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button
                class="carousel-control-next btn btn-light"
                type="button"
                data-bs-target="#carouselExample"
                data-bs-slide="next"
                >
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>


        <!-- Slogan -->

        <div class="container px-4 py-5" id="hanging-icons">
            <!-- <h2 class="pb-2 border-bottom">Hanging icons</h2> -->
            <div class="row g-4 py-5 row-cols-1 row-cols-lg-3">
                <div class="col d-flex align-items-start">
                    <div
                        class="icon-square text-body-emphasis bg-body-secondary d-inline-flex align-items-center justify-content-center fs-4 flex-shrink-0 me-3"
                        >
                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            height="30"
                            fill="currentColor"
                            class="bi bi-check2-circle"
                            viewBox="0 0 16 16"
                            >
                        <path
                            d="M2.5 8a5.5 5.5 0 0 1 8.25-4.764.5.5 0 0 0 .5-.866A6.5 6.5 0 1 0 14.5 8a.5.5 0 0 0-1 0 5.5 5.5 0 1 1-11 0z"
                            ></path>
                        <path
                            d="M15.354 3.354a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l7-7z"
                            ></path>
                        </svg>
                    </div>
                    <div>
                        <h3 class="fs-2 text-body-emphasis">Easy to learn.</h3>
                        <p>So easy to use, even you haven't learn before.</p>
                        <!-- <a href="#" class="btn btn-primary"> Primary button </a> -->
                    </div>
                </div>
                <div class="col d-flex align-items-start">
                    <div
                        class="icon-square text-body-emphasis bg-body-secondary d-inline-flex align-items-center justify-content-center fs-4 flex-shrink-0 me-3"
                        >
                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            height="30"
                            fill="currentColor"
                            class="bi bi-mortarboard"
                            viewBox="0 0 16 16"
                            >
                        <path
                            d="M8.211 2.047a.5.5 0 0 0-.422 0l-7.5 3.5a.5.5 0 0 0 .025.917l7.5 3a.5.5 0 0 0 .372 0L14 7.14V13a1 1 0 0 0-1 1v2h3v-2a1 1 0 0 0-1-1V6.739l.686-.275a.5.5 0 0 0 .025-.917l-7.5-3.5ZM8 8.46 1.758 5.965 8 3.052l6.242 2.913L8 8.46Z"
                            ></path>
                        <path
                            d="M4.176 9.032a.5.5 0 0 0-.656.327l-.5 1.7a.5.5 0 0 0 .294.605l4.5 1.8a.5.5 0 0 0 .372 0l4.5-1.8a.5.5 0 0 0 .294-.605l-.5-1.7a.5.5 0 0 0-.656-.327L8 10.466 4.176 9.032Zm-.068 1.873.22-.748 3.496 1.311a.5.5 0 0 0 .352 0l3.496-1.311.22.748L8 12.46l-3.892-1.556Z"
                            ></path>
                        </svg>
                    </div>
                    <div>
                        <h3 class="fs-2 text-body-emphasis">Many multiform courses.</h3>
                        <p>Range of courses and lessons that span multiple disciplines.</p>
                        <!-- <a href="#" class="btn btn-primary"> Primary button </a> -->
                    </div>
                </div>
                <div class="col d-flex align-items-start">
                    <div
                        class="icon-square text-body-emphasis bg-body-secondary d-inline-flex align-items-center justify-content-center fs-4 flex-shrink-0 me-3"
                        >
                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            height="30"
                            fill="currentColor"
                            class="bi bi-arrow-through-heart"
                            viewBox="0 0 16 16"
                            >
                        <path
                            fill-rule="evenodd"
                            d="M2.854 15.854A.5.5 0 0 1 2 15.5V14H.5a.5.5 0 0 1-.354-.854l1.5-1.5A.5.5 0 0 1 2 11.5h1.793l.53-.53c-.771-.802-1.328-1.58-1.704-2.32-.798-1.575-.775-2.996-.213-4.092C3.426 2.565 6.18 1.809 8 3.233c1.25-.98 2.944-.928 4.212-.152L13.292 2 12.147.854A.5.5 0 0 1 12.5 0h3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-.854.354L14 2.707l-1.006 1.006c.236.248.44.531.6.845.562 1.096.585 2.517-.213 4.092-.793 1.563-2.395 3.288-5.105 5.08L8 13.912l-.276-.182a21.86 21.86 0 0 1-2.685-2.062l-.539.54V14a.5.5 0 0 1-.146.354l-1.5 1.5Zm2.893-4.894A20.419 20.419 0 0 0 8 12.71c2.456-1.666 3.827-3.207 4.489-4.512.679-1.34.607-2.42.215-3.185-.817-1.595-3.087-2.054-4.346-.761L8 4.62l-.358-.368c-1.259-1.293-3.53-.834-4.346.761-.392.766-.464 1.845.215 3.185.323.636.815 1.33 1.519 2.065l1.866-1.867a.5.5 0 1 1 .708.708L5.747 10.96Z"
                            ></path>
                        </svg>
                    </div>
                    <div>
                        <h3 class="fs-2 text-body-emphasis">Quality assurance.</h3>
                        <p>The lessons come from many people with high expertise and experience in many fields.</p>
                        <!-- <a href="#" class="btn btn-primary"> Primary button </a> -->
                    </div>
                </div>
            </div>
        </div>

        <!-- Category -->
        <div class="album  bg-light">
            <h2 class="text-body-emphasis text-center py-3">
                What do you want to learn today ?
            </h2>
            <div class="container">
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">


                    <div class="col-md-3">
                        <div class="card shadow-sm">
                            <img src="images/c++.jpg" alt="">
                            <div class="card-body">
                                <div class="d-flex justify-content-center align-items-center">
                                    <div class="btn-group">
                                        <a href="#">
                                            <button type="button" class="btn btn-sm btn-outline-secondary">
                                                Software engineer
                                            </button>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card shadow-sm">
                            <img src="images/c++.jpg" alt="">
                            <div class="card-body">
                                <div class="d-flex justify-content-center align-items-center">
                                    <div class="btn-group">
                                        <a href="#">
                                            <button type="button" class="btn btn-sm btn-outline-secondary">
                                                Software engineer
                                            </button>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card shadow-sm">
                            <img src="images/c++.jpg" alt="">
                            <div class="card-body">
                                <div class="d-flex justify-content-center align-items-center">
                                    <div class="btn-group">
                                        <a href="#">
                                            <button type="button" class="btn btn-sm btn-outline-secondary">
                                                Software engineer
                                            </button>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card shadow-sm">
                            <img src="images/c++.jpg" alt="">
                            <div class="card-body">
                                <div class="d-flex justify-content-center align-items-center">
                                    <div class="btn-group">
                                        <a href="#">
                                            <button type="button" class="btn btn-sm btn-outline-secondary">
                                                Software engineer
                                            </button>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>




            <!-- Top courses 2024 -->
            <div class="album py-3 bg-light">
                <h2 class="text-body-emphasis text-center py-3">
                    Top courses in 2024
                </h2>
                <div class="container">
                    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">


                        <div class="col-md-3">
                            <div class="card shadow-sm">
                                <img src="images/c++.jpg" alt="">
                                <div class="card-body">
                                    <p class="card-text"><strong>
                                            Program with C++ For Beginners
                                        </strong>
                                    </p>
                                    <p>Jame Smith</p>
                                    <p class="d-inline text-decoration-line-through">1.000.000</p>
                                    <p class="d-inline">899.000</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                View
                                            </button>
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                Add to cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card shadow-sm">
                                <img src="images/c++.jpg" alt="">
                                <div class="card-body">
                                    <p class="card-text"><strong>
                                            Program with C++ For Beginners
                                        </strong>
                                    </p>
                                    <p>Jame Smith</p>
                                    <p class="d-inline text-decoration-line-through">1.000.000</p>
                                    <p class="d-inline">899.000</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                View
                                            </button>
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                Add to cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card shadow-sm">
                                <img src="images/c++.jpg" alt="">
                                <div class="card-body">
                                    <p class="card-text"><strong>
                                            Program with C++ For Beginners
                                        </strong>
                                    </p>
                                    <p>Jame Smith</p>
                                    <p class="d-inline text-decoration-line-through">1.000.000</p>
                                    <p class="d-inline">899.000</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                View
                                            </button>
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                Add to cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card shadow-sm">
                                <img src="images/c++.jpg" alt="">
                                <div class="card-body">
                                    <p class="card-text"><strong>
                                            Program with C++ For Beginners
                                        </strong>
                                    </p>
                                    <p>Jame Smith</p>
                                    <p class="d-inline text-decoration-line-through">1.000.000</p>
                                    <p class="d-inline">899.000</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                View
                                            </button>
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                Add to cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card shadow-sm">
                                <img src="images/c++.jpg" alt="">
                                <div class="card-body">
                                    <p class="card-text"><strong>
                                            Program with C++ For Beginners
                                        </strong>
                                    </p>
                                    <p>Jame Smith</p>
                                    <p class="d-inline text-decoration-line-through">1.000.000</p>
                                    <p class="d-inline">899.000</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                View
                                            </button>
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                Add to cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card shadow-sm">
                                <img src="images/c++.jpg" alt="">
                                <div class="card-body">
                                    <p class="card-text"><strong>
                                            Program with C++ For Beginners
                                        </strong>
                                    </p>
                                    <p>Jame Smith</p>
                                    <p class="d-inline text-decoration-line-through">1.000.000</p>
                                    <p class="d-inline">899.000</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                View
                                            </button>
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                Add to cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card shadow-sm">
                                <img src="images/c++.jpg" alt="">
                                <div class="card-body">
                                    <p class="card-text"><strong>
                                            Program with C++ For Beginners
                                        </strong>
                                    </p>
                                    <p>Jame Smith</p>
                                    <p class="d-inline text-decoration-line-through">1.000.000</p>
                                    <p class="d-inline">899.000</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                View
                                            </button>
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                Add to cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card shadow-sm">
                                <img src="images/c++.jpg" alt="">
                                <div class="card-body">
                                    <p class="card-text"><strong>
                                            Program with C++ For Beginners
                                        </strong>
                                    </p>
                                    <p>Jame Smith</p>
                                    <p class="d-inline text-decoration-line-through">1.000.000</p>
                                    <p class="d-inline">899.000</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                View
                                            </button>
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                Add to cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card shadow-sm">
                                <img src="images/c++.jpg" alt="">
                                <div class="card-body">
                                    <p class="card-text"><strong>
                                            Program with C++ For Beginners
                                        </strong>
                                    </p>
                                    <p>Jame Smith</p>
                                    <p class="d-inline text-decoration-line-through">1.000.000</p>
                                    <p class="d-inline">899.000</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                View
                                            </button>
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                Add to cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card shadow-sm">
                                <img src="images/c++.jpg" alt="">
                                <div class="card-body">
                                    <p class="card-text"><strong>
                                            Program with C++ For Beginners
                                        </strong>
                                    </p>
                                    <p>Jame Smith</p>
                                    <p class="d-inline text-decoration-line-through">1.000.000</p>
                                    <p class="d-inline">899.000</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                View
                                            </button>
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                Add to cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card shadow-sm">
                                <img src="images/c++.jpg" alt="">
                                <div class="card-body">
                                    <p class="card-text"><strong>
                                            Program with C++ For Beginners
                                        </strong>
                                    </p>
                                    <p>Jame Smith</p>
                                    <p class="d-inline text-decoration-line-through">1.000.000</p>
                                    <p class="d-inline">899.000</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                View
                                            </button>
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                Add to cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card shadow-sm">
                                <img src="images/c++.jpg" alt="">
                                <div class="card-body">
                                    <p class="card-text"><strong>
                                            Program with C++ For Beginners
                                        </strong>
                                    </p>
                                    <p>Jame Smith</p>
                                    <p class="d-inline text-decoration-line-through">1.000.000</p>
                                    <p class="d-inline">899.000</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                View
                                            </button>
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-secondary"
                                                >
                                                Add to cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>






                    </div>
                </div>
            </div>

            <!-- news -->
            <div class="album py-3 bg-light">
                <h2 class="text-body-emphasis text-center py-3">
                    Top Instructor
                </h2>
                <div class="container">
                    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                        <div class="col-md-2">
                            <div class="card shadow-sm">
                                <img src="images/instructor.jpg" alt="">
                                <div class="card-body">
                                    <div class="btn-group d-flex flex-column-reverse justify-content-center align-items-center">
                                        <a href="#">
                                            <button type="button" class="btn btn-sm btn-outline-secondary">
                                                Jame Smith
                                            </button>
                                        </a>
                                        <p>Software engineer</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="card shadow-sm">
                                <img src="images/instructor.jpg" alt="">
                                <div class="card-body">
                                    <div class="btn-group d-flex flex-column-reverse justify-content-center align-items-center">
                                        <a href="#">
                                            <button type="button" class="btn btn-sm btn-outline-secondary">
                                                Jame Smith
                                            </button>
                                        </a>
                                        <p>Software engineer</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="card shadow-sm">
                                <img src="images/instructor.jpg" alt="">
                                <div class="card-body">
                                    <div class="btn-group d-flex flex-column-reverse justify-content-center align-items-center">
                                        <a href="#">
                                            <button type="button" class="btn btn-sm btn-outline-secondary">
                                                Jame Smith
                                            </button>
                                        </a>
                                        <p>Software engineer</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="card shadow-sm">
                                <img src="images/instructor.jpg" alt="">
                                <div class="card-body">
                                    <div class="btn-group d-flex flex-column-reverse justify-content-center align-items-center">
                                        <a href="#">
                                            <button type="button" class="btn btn-sm btn-outline-secondary">
                                                Jame Smith
                                            </button>
                                        </a>
                                        <p>Software engineer</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="card shadow-sm">
                                <img src="images/instructor.jpg" alt="">
                                <div class="card-body">
                                    <div class="btn-group d-flex flex-column-reverse justify-content-center align-items-center">
                                        <a href="#">
                                            <button type="button" class="btn btn-sm btn-outline-secondary">
                                                Jame Smith
                                            </button>
                                        </a>
                                        <p>Software engineer</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="card shadow-sm">
                                <img src="images/instructor.jpg" alt="">
                                <div class="card-body">
                                    <div class="btn-group d-flex flex-column-reverse justify-content-center align-items-center">
                                        <a href="#">
                                            <button type="button" class="btn btn-sm btn-outline-secondary">
                                                Jame Smith
                                            </button>
                                        </a>
                                        <p>Software engineer</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- footer -->

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
