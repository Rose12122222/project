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
        <%@include file="header.jsp" %>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <div class="container">
            <div class="row">
                <!-- BEGIN SEARCH RESULT -->
                <div class="col-md-12">
                    <div class="grid search">
                        <div class="grid-body">
                            <div class="row">
                                <!-- BEGIN TABLE RESULT -->
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>Course</th>
                                                <th>Instructor</th>
                                                <th>Lesson</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="image"><img src="images/c++.jpg" alt=""></td>
                                                <td class="product"><strong>Jame Smith</strong><br>Program with C</td>
                                                <td class="price text-right">4/10</td>
                                                <td class="price text-right">On-Going</td>
                                            </tr>
                                            <tr>
                                                <td class="image"><img src="images/c++.jpg" alt=""></td>
                                                <td class="product"><strong>Jame Smith</strong><br>Program with C</td>
                                                <td class="price text-right">4/10</td>
                                                <td class="price text-right">On-Going</td>
                                            </tr>
                                            <tr>
                                                <td class="image"><img src="images/c++.jpg" alt=""></td>
                                                <td class="product"><strong>Jame Smith</strong><br>Program with C</td>
                                                <td class="price text-right">4/10</td>
                                                <td class="price text-right">On-Going</td>
                                            </tr>
                                            <tr>
                                                <td class="image"><img src="images/c++.jpg" alt=""></td>
                                                <td class="product"><strong>Jame Smith</strong><br>Program with C</td>
                                                <td class="price text-right">4/10</td>
                                                <td class="price text-right">On-Going</td>
                                            </tr>
                                        </tbody>
                                    </table>
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
                <!-- END SEARCH RESULT -->
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>