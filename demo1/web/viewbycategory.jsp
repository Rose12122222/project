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
        <style>
            .CategoryCh{
                margin-top: 20px;
                margin-left: 40px;
            }
            .btn {
                margin-bottom: 5px;
            }

            .grid {
                position: relative;
                width: 100%;
                background: #fff;
                color: #666666;
                border-radius: 2px;
                margin-bottom: 25px;
                box-shadow: 0px 1px 4px rgba(0, 0, 0, 0.1);
            }

            .grid .grid-body {
                padding: 15px 20px 15px 20px;
                font-size: 0.9em;
                line-height: 1.9em;
            }

            .search table tr td.rate {
                color: #f39c12;
                line-height: 50px;
            }

            .search table tr:hover {
                cursor: pointer;
            }

            .search table tr td.image {
                width: 50px;
            }

            .search table tr td img {
                width: 50px;
                height: 50px;
            }

            .search table tr td.rate {
                color: #f39c12;
                line-height: 50px;
            }

            .search table tr td.price {
                font-size: 1.5em;
                line-height: 50px;
            }

            .search #price1,
            .search #price2 {
                display: inline;
                font-weight: 600;
            }

            .short-range {
                width: 70%;
            }
        </style>
    </head>
    <body>
        <!--header area -->
        <jsp:include page="header.jsp"/>
        <!--header end -->
        
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <div class="container">
            <div class="row">
                <!-- BEGIN SEARCH RESULT -->
                <div class="col-md-12">
                    <div class="grid search">
                        <div class="grid-body">
                            <div class="row">
                                <!-- BEGIN FILTERS -->
                                <div class="col-md-3">
                                    <h2 class="grid-title"><i class="fa fa-filter"></i> Filters</h2>
                                    <hr>

                                    <!-- BEGIN FILTER BY CATEGORY -->
                                    <h4>By category:</h4>
                                    <div class="checkbox">
                                        <label><input type="checkbox" class="icheck"> Software engineer</label>
                                    </div>
                                    <div class="checkbox">
                                        <label><input type="checkbox" class="icheck"> Marketing</label>
                                    </div>
                                    <div class="checkbox">
                                        <label><input type="checkbox" class="icheck"> Business</label>
                                    </div>
                                    <div class="checkbox">
                                        <label><input type="checkbox" class="icheck"> Design</label>
                                    </div>

                                    <!-- END FILTER BY CATEGORY -->

                                    <div class="padding"></div>



                                    <div class="padding"></div>
                                    <h4>By rate:</h4>
                                    <div class="checkbox">
                                        <label><input type="checkbox" class="icheck">   
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i></label>
                                    </div>
                                    <div class="checkbox">
                                        <label><input type="checkbox" class="icheck">   
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                    </div>
                                    <div class="checkbox">
                                        <label><input type="checkbox" class="icheck">   
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                    </div>
                                    <div class="checkbox">
                                        <label><input type="checkbox" class="icheck">   
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                    </div>
                                    <div class="checkbox">
                                        <label><input type="checkbox" class="icheck">   
                                            <i class="fa fa-star"></i>
                                    </div>




                                    <!-- BEGIN FILTER BY PRICE -->
                                    <h4>By price:</h4>
                                    Between <div id="price1">$300</div> to <div id="price2">$800</div>
                                    <input type="range" class="form-range short-range" min="0" max="3" id="customRange2">
                                    <!-- END FILTER BY PRICE -->

                                    <h4>By Discount:</h4>
                                    <div class="checkbox">
                                        <label><input type="checkbox" class="icheck"> 50%</label>
                                    </div>
                                    <div class="checkbox">
                                        <label><input type="checkbox" class="icheck"> 30%</label>
                                    </div>
                                    <div class="checkbox">
                                        <label><input type="checkbox" class="icheck"> 20%</label>
                                    </div>
                                </div>
                                <!-- END FILTERS -->
                                <!-- BEGIN RESULT -->
                                <div class="col-md-9">
                                    <hr>
                                    <!-- BEGIN SEARCH INPUT -->
                                    <div class="input-group">
                                        <input type="text" class="form-control" value="web development">
                                        <span class="input-group-btn">
                                            <button class="btn btn-primary" type="button"><i class="fa fa-search"></i></button>
                                        </span>
                                    </div>
                                    <!-- END SEARCH INPUT -->
                                    <p>Showing all results matching "web development"</p>

                                    <div class="padding"></div>

                                    <div class="row">
                                        <!-- BEGIN ORDER RESULT -->
                                        <div class="col-sm-6">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                                    Order by <span class="caret"></span>
                                                </button>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="#">Name</a></li>
                                                    <li><a href="#">Date</a></li>
                                                    <li><a href="#">View</a></li>
                                                    <li><a href="#">Rating</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- END ORDER RESULT -->


                                    </div>

                                    <!-- BEGIN TABLE RESULT -->
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <tbody><tr>
                                                    <td class="number text-center">1</td>
                                                    <td class="image"><img src="https://www.bootdey.com/image/400x300/FF8C00" alt=""></td>
                                                    <td class="product"><strong>Product 1</strong><br>This is the product description.</td>
                                                    <td class="rate text-right"><span><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-half-o"></i></span></td>
                                                    <td class="price text-right">$350</td>
                                                </tr>
                                                <tr>
                                                    <td class="number text-center">2</td>
                                                    <td class="image"><img src="https://www.bootdey.com/image/400x300/5F9EA0" alt=""></td>
                                                    <td class="product"><strong>Product 2</strong><br>This is the product description.</td>
                                                    <td class="rate text-right"><span><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i></span></td>
                                                    <td class="price text-right">$1,050</td>
                                                </tr>
                                                <tr>
                                                    <td class="number text-center">3</td>
                                                    <td class="image"><img src="https://www.bootdey.com/image/400x300" alt=""></td>
                                                    <td class="product"><strong>Product 3</strong><br>This is the product description.</td>
                                                    <td class="rate text-right"><span><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-half-o"></i><i class="fa fa-star-o"></i></span></td>
                                                    <td class="price text-right">$550</td>
                                                </tr>
                                                <tr>
                                                    <td class="number text-center">4</td>
                                                    <td class="image"><img src="https://www.bootdey.com/image/400x300/8A2BE2" alt=""></td>
                                                    <td class="product"><strong>Product 4</strong><br>This is the product description.</td>
                                                    <td class="rate text-right"><span><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i></span></td>
                                                    <td class="price text-right">$330</td>
                                                </tr>
                                                <tr>
                                                    <td class="number text-center">5</td>
                                                    <td class="image"><img src="https://www.bootdey.com/image/400x300" alt=""></td>
                                                    <td class="product"><strong>Product 5</strong><br>This is the product description.</td>
                                                    <td class="rate text-right"><span><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span></td>
                                                    <td class="price text-right">$540</td>
                                                </tr>
                                                <tr>
                                                    <td class="number text-center">6</td>
                                                    <td class="image"><img src="https://www.bootdey.com/image/400x300/6495ED" alt=""></td>
                                                    <td class="product"><strong>Product 6</strong><br>This is the product description.</td>
                                                    <td class="rate text-right"><span><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-half-o"></i></span></td>
                                                    <td class="price text-right">$870</td>
                                                </tr>
                                                <tr>
                                                    <td class="number text-center">7</td>
                                                    <td class="image"><img src="https://www.bootdey.com/image/400x300/DC143C" alt=""></td>
                                                    <td class="product"><strong>Product 7</strong><br>This is the product description.</td>
                                                    <td class="rate text-right"><span><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i></span></td>
                                                    <td class="price text-right">$620</td>
                                                </tr>
                                                <tr>
                                                    <td class="number text-center">8</td>
                                                    <td class="image"><img src="https://www.bootdey.com/image/400x300/9932CC" alt=""></td>
                                                    <td class="product"><strong>Product 8</strong><br>This is the product description.</td>
                                                    <td class="rate text-right"><span><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-half-o"></i></span></td>
                                                    <td class="price text-right">$1,550</td>
                                                </tr>
                                            </tbody></table>
                                    </div>
                                    <!-- END TABLE RESULT -->

                                    <!-- BEGIN PAGINATION -->
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                                            <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                        </ul>
                                    </nav>
                                    <!-- END PAGINATION -->
                                </div>
                                <!-- END RESULT -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END SEARCH RESULT -->
            </div>
        </div>
        <!--footer area start-->
        <jsp:include page="footer.jsp"/>
        <!--footer area end-->
    </body>
</html>