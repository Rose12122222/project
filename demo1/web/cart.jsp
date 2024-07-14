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
    </head>
    <body>
        <!--header area -->
        <jsp:include page="header.jsp"/>
        <!--header end -->
        
        <section class="h-100 gradient-custom">
            <div class="container py-5">
                <div class="row d-flex justify-content-center my-4">
                    <div class="col-md-8">
                        <div class="card mb-4">
                            <div class="card-header py-3">
                                <h5 class="mb-0">Cart - 2 items</h5>
                            </div>
                            <div class="card-body">
                                <!-- Single item -->
                                <div class="row">
                                    <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                                        <!-- Image -->
                                        <div
                                            class="bg-image hover-overlay hover-zoom ripple rounded"
                                            data-mdb-ripple-color="light"
                                            >
                                            <img src="images/c++.jpg" class="w-100" alt="" />
                                            <a href="#!">
                                                <div
                                                    class="mask"
                                                    style="background-color: rgba(251, 251, 251, 0.2)"
                                                    ></div>
                                            </a>
                                        </div>
                                        <!-- Image -->
                                    </div>

                                    <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
                                        <!-- Data -->
                                        <p><strong>Program with C++ For Beginners</strong></p>
                                        <p>Sam Smith</p>
                                        <!-- Data -->
                                    </div>

                                    <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                                        <!-- Quantity -->
                                        <div class="d-flex mb-4" style="max-width: 300px">
                                            <div data-mdb-input-init class="form-outline">
                                                <label class="form-label" for="form1">Quantity</label>
                                                <input
                                                    id="form1"
                                                    min="0"
                                                    name="quantity"
                                                    value="1"
                                                    type="number"
                                                    class="form-control"
                                                    />
                                            </div>
                                        </div>
                                        <!-- Quantity -->

                                        <!-- Price -->
                                        <p class="text-start text-md-center">
                                            <strong>$17.99</strong>
                                        </p>
                                        <!-- Price -->
                                    </div>
                                </div>
                                <!-- Single item -->

                                <hr class="my-4" />

                                <!-- Single item -->
                                <div class="row">
                                    <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                                        <!-- Image -->
                                        <div
                                            class="bg-image hover-overlay hover-zoom ripple rounded"
                                            data-mdb-ripple-color="light"
                                            >
                                            <img src="images/c++.jpg" class="w-100" alt="" />
                                            <a href="#!">
                                                <div
                                                    class="mask"
                                                    style="background-color: rgba(251, 251, 251, 0.2)"
                                                    ></div>
                                            </a>
                                        </div>
                                        <!-- Image -->
                                    </div>

                                    <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
                                        <!-- Data -->
                                        <p><strong>Program with C++ For Beginners</strong></p>
                                        <p>Sam Smith</p>
                                        <!-- Data -->
                                    </div>

                                    <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                                        <!-- Quantity -->
                                        <div class="d-flex mb-4" style="max-width: 300px">
                                            <div data-mdb-input-init class="form-outline">
                                                <label class="form-label" for="form1">Quantity</label>
                                                <input
                                                    id="form1"
                                                    min="0"
                                                    name="quantity"
                                                    value="1"
                                                    type="number"
                                                    class="form-control"
                                                    />
                                            </div>
                                        </div>
                                        <!-- Quantity -->

                                        <!-- Price -->
                                        <p class="text-start text-md-center">
                                            <strong>$17.99</strong>
                                        </p>
                                        <!-- Price -->
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card mb-4 mb-lg-0">
                            <div class="card-body">
                                <p><strong>Now We Accept VNpay</strong></p>
                                <img
                                    class="me-2"
                                    width="45px"
                                    src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg"
                                    alt="Visa"
                                    />
                                <img
                                    class="me-2"
                                    width="45px"
                                    src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/amex.svg"
                                    alt="American Express"
                                    />
                                <img
                                    class="me-2"
                                    width="45px"
                                    src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg"
                                    alt="Mastercard"
                                    />
                                <img
                                    class="me-2"
                                    width="45px"
                                    src="images/vnpay.jpg"
                                    alt="PayPal acceptance mark"
                                    />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card mb-4">
                            <div class="card-header py-3">
                                <h5 class="mb-0">Summary</h5>
                            </div>
                            <div class="card-body">
                                <ul class="list-group list-group-flush">
                                    <li
                                        class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0"
                                        >
                                        Products
                                        <span>$53.98</span>
                                    </li>

                                    <li
                                        class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3"
                                        >
                                        <div>
                                            <strong>Total amount</strong>
                                            <strong>
                                                <p class="mb-0">(including VAT)</p>
                                            </strong>
                                        </div>
                                        <span><strong>$53.98</strong></span>
                                    </li>
                                </ul>

                                <button
                                    type="button"
                                    data-mdb-button-init
                                    data-mdb-ripple-init
                                    class="btn btn-primary btn-lg btn-block"
                                    >
                                    Go to checkout
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
