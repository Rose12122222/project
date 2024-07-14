<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Coron-my account</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets\img\favicon.png">

        <!-- all css here -->
        <link rel="stylesheet" href="assets\css\bootstrap.min.css">
        <link rel="stylesheet" href="assets\css\plugin.css">
        <link rel="stylesheet" href="assets\css\bundle.css">
        <link rel="stylesheet" href="assets\css\style.css">
        <link rel="stylesheet" href="assets\css\responsive.css">
        <script src="assets\js\vendor\modernizr-2.8.3.min.js"></script>

        <!--     Fonts and icons     -->
        <!--        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
                <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">-->
        <!-- CSS Files -->
        <!--<link href="./dashboard/paper-dashboard-master/assets/css/bootstrap.min.css" rel="stylesheet" />-->
        <!--<link href="./dashboard/paper-dashboard-master/assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />-->

        <style>
            #submit:hover {
                background-color: #009999; /* Darker green background on hover */
            }
            #submit{
                color: white;
                border-color: white;
                border-radius: 10px;
                background-color: #00bba6;
                width: 100px;
                height: 40px;
            }
        </style>
    </head>
    <body>
        <!-- Add your site or application content here -->

        <!--pos page start-->
        <div class="pos_page">
            <div class="container">  
                <!--pos page inner-->
                <div class="pos_page_inner"> 

                    <!--header area -->
                    <jsp:include page="header.jsp"/>
                    <!--header end -->

                    <!--breadcrumbs area start-->
                    <div class="breadcrumbs_area">
                        <div class="row">
                            <div class="col-12">
                                <div class="breadcrumb_content">
                                    <ul>
                                        <li><a href="home">home</a></li>
                                        <li><i class="fa fa-angle-right"></i></li>
                                        <li>my account</li>
                                    </ul>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!--breadcrumbs area end-->

                    <!-- Start Maincontent  -->
                    <section class="main_content_area">
                        <div class="account_dashboard">
                            <div class="row">
                                <div class="col-sm-12 col-md-3 col-lg-3">
                                    <!-- Nav tabs -->
                                    <div class="dashboard_tab_button">
                                        <ul role="tablist" class="nav flex-column dashboard-list">
                                            <li><a href="#account-details" data-toggle="tab" class="nav-link active">Account details</a></li>
                                                <c:if test="${sessionScope.role==1}">
                                                <li><a href="#dashboard1" data-toggle="tab" class="nav-link">Dashboard 1</a></li>
                                                <li><a href="#dashboard2" onclick="dashboard2()" data-toggle="tab" class="nav-link">Dashboard 2</a></li>
                                                </c:if> 
                                            <li><a href="logout" class="nav-link">logout</a></li>
                                        </ul>
                                    </div>    
                                </div>
                                <div class="col-sm-12 col-md-9 col-lg-9">
                                    <!-- Tab panes -->
                                    <div class="tab-content dashboard_content">
                                        <c:if test="${sessionScope.role==1}">
                                            <div class="tab-pane fade" id="dashboard1">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="card ">
                                                            <div class="card-header ">
                                                                <h5 class="card-title">The chart Of Seller</h5>
                                                                <p class="card-category">Seller quantity Of Product </p>
                                                            </div>
                                                            <div class="card-body ">
                                                                <canvas id=chartHours width="600" height="200"></canvas>
                                                            </div>
                                                            <div class="card-footer ">
                                                                <hr>
                                                                <div class="stats">
                                                                    <i class="fa fa-history"></i> Updated 3 minutes ago
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>   
                                            </div>
                                            <div class="tab-pane fade " id="dashboard2">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="card ">
                                                            <div class="card-header ">
                                                                <h5 class="card-title">Total Seller</h5>
                                                            </div>
                                                            <div class="card-body ">
                                                                <canvas id="chartEmail"></canvas>
                                                            </div>
                                                            <div class="card-footer ">
                                                                <div class="legend">                       
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="card ">
                                                            <div class="card-header ">
                                                                <h5 class="card-title">Total Amount Of Product</h5>
                                                            </div>
                                                            <div class="card-body ">
                                                                <canvas id="chartEmail1" style="width:100%;max-width:600px"></canvas>
                                                            </div>
                                                            <div class="card-footer ">
                                                                <div class="legend"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${sessionScope.role==1}">
                                            <div class="tab-pane fade show active" id="account-details">
                                            </c:if>
                                            <c:if test="${sessionScope.role!=1}">
                                                <div class="tab-pane fade active show" id="account-details">
                                                </c:if>
                                                <h3>Your Profile</h3>
                                                <div class="login">
                                                    <div class="login_form_container">
                                                        <div class="account_login_form">
                                                            <form action="profile" method="post">

                                                                <c:set var="info" value="${requestScope.info}"/>
                                                                <div class="input-radio">
                                                                    <c:choose>
                                                                        <c:when test="${info.gender==1}">
                                                                            <span class="custom-radio"><input checked="" type="checkbox" value="1" name="gender1">Male</span>
                                                                            <span class="custom-radio"><input type="checkbox" value="0" name="gender2">Female</span>
                                                                            </c:when>
                                                                            <c:when test="${info.gender==null || info.gender==-1}">
                                                                            <span class="custom-radio"><input type="checkbox" value="1" name="gender1">Male</span>
                                                                            <span class="custom-radio"><input type="checkbox" value="0" name="gender2">Female</span>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                            <span class="custom-radio"><input type="checkbox" value="1" name="gender1">Male</span>
                                                                            <span class="custom-radio"><input checked="" type="checkbox" value="0" name="gender2">Female</span>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                </div> <br>
                                                                <input type="hidden" name="accid" value="${sessionScope.accid}">
                                                                <label>First Name</label>
                                                                <input type="text" name="first-name" value="${info.firstName}">
                                                                <label>Last Name</label>
                                                                <input type="text" name="last-name" value="${info.lastName}">
                                                                <label>Email</label>
                                                                <input type="text" name="email" value="${info.email}">
                                                                <label>Address</label>
                                                                <input type="text" name="address" value="${info.address}">
                                                                <label>Birthdate</label>
                                                                <input type="text" placeholder="YYYY-MM-DD" value="${info.birthday}"name="birthday">
                                                                <c:choose>
                                                                    <c:when test="${info.getPassByID()==null}">
                                                                        <label>Old Password</label>
                                                                        <input type="text" name="oldpassword" value="${requestScope.firstpass}">
                                                                        <label>New Password</label>
                                                                        <input type="text" name="newpassword" >
                                                                        <label>Confirm New Password</label>
                                                                        <input type="text" name="confirm">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <label>Old Password</label>
                                                                        <input type="text" name="oldpassword" value="${info.getPassByID()}">
                                                                        <label>New Password</label>
                                                                        <input type="text" name="newpassword" >
                                                                        <label>Confirm New Password</label>
                                                                        <input type="text" name="confirm">
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <div>
                                                                    <c:set var="sucess" value="${requestScope.sucess}"/>
                                                                    <c:if test="${sucess!=null}">
                                                                        <p style="color: #00bba6;">${sucess}</p>
                                                                    </c:if>
                                                                </div>
                                                                <div>
                                                                    <c:set var="error" value="${requestScope.error}"/>
                                                                    <c:if test="${error!=null}">
                                                                        <p style="color: red;">${error}</p>
                                                                    </c:if>
                                                                </div>
                                                                <div class="save_button primary_btn default_button">
                                                                    <button id="submit" type="submit">Save</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>      	
                    </section>			
                    <!-- End Maincontent  --> 
                </div>
                <!--pos page inner end-->
            </div>
        </div>
        <!--pos page end-->

        <!--footer area start-->
        <jsp:include page="footer.jsp"/>
        <!--footer area end-->


        <!--   Core JS Files   -->
        <script src="./dashboard/paper-dashboard-master/assets/js/core/jquery.min.js"></script>
        <!--<script src="./dashboard/paper-dashboard-master/assets/js/core/popper.min.js"></script>-->
        <!--<script src="./dashboard/paper-dashboard-master/assets/js/core/bootstrap.min.js"></script>-->
        <!--<script src="./dashboard/paper-dashboard-master/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
                                                    $(document).ready(function () {
                                                        chartColor = "#FFFFFF";

                                                        ctx = document.getElementById('chartHours').getContext("2d");
                                                        ctx1 = document.getElementById('chartEmail').getContext('2d');
                                                        ctx2 = document.getElementById('chartEmail1').getContext('2d');

                                                        var xhr = new XMLHttpRequest();
                                                        xhr.open('GET', 'dash', true);
                                                        xhr.onload = function () {
                                                            if (xhr.status >= 200 && xhr.status < 300) {
                                                                var data = xhr.responseText.split("\n");

                                                                var labels = [];
                                                                var dataset1 = [];
                                                                var dataset2 = [];
                                                                var dataset3 = [];
                                                                var dataset4 = [];
                                                                var dataset5 = [];

                                                                data.forEach(function (item) {
                                                                    var values = item.split(",");
                                                                    labels.push(values[0]);
                                                                    dataset1.push(values[1]);
                                                                    dataset2.push(values[2]);
                                                                    dataset3.push(values[3]);
                                                                    dataset4.push(values[4]);
                                                                    dataset5.push(values[5]);
                                                                });

                                                                var myChart = new Chart(ctx, {
                                                                    type: 'bar',
                                                                    data: {
                                                                        labels: [labels[0], labels[1], labels[2], labels[3]],
                                                                        datasets: [{
                                                                                label: "MAX",
                                                                                backgroundColor: 'rgba(255, 99, 132, 0.5)',
                                                                                data: dataset1
                                                                            }, {
                                                                                label: "MIN",
                                                                                backgroundColor: 'rgba(54, 162, 235, 0.5)',
                                                                                data: dataset2
                                                                            }, {
                                                                                label: "AVG",
                                                                                backgroundColor: 'rgba(255, 206, 86, 0.5)',
                                                                                data: dataset3
                                                                            }]
                                                                    },
                                                                    options: {
                                                                        scales: {
                                                                            y: {
                                                                                beginAtZero: true
                                                                            }
                                                                        }
                                                                    }
                                                                });

                                                                var myChart1 = new Chart(ctx1, {
                                                                    type: 'pie',
                                                                    data: {
                                                                        labels: [labels[0], labels[1], labels[2], labels[3]],
                                                                        datasets: [{
                                                                                data: [dataset4[0], dataset4[1], dataset4[2], dataset4[3]],
                                                                                backgroundColor: [
                                                                                    'rgba(255, 99, 132, 0.7)',
                                                                                    'rgba(54, 162, 235, 0.7)',
                                                                                    'rgba(255, 206, 86, 0.7)',
                                                                                    'rgba(75, 192, 192, 0.7)'
                                                                                ]
                                                                            }]
                                                                    },
                                                                    options: {
                                                                        tooltips: {
                                                                            callbacks: {
                                                                                label: function (tooltipItem, data) {
                                                                                    var dataset = data.datasets[tooltipItem.datasetIndex];
                                                                                    var currentValue = dataset.data[tooltipItem.index];
                                                                                    var total = dataset.data.reduce(function (previousValue, currentValue, currentIndex, array) {
                                                                                        return previousValue + currentValue;
                                                                                    });
                                                                                    var percentage = Math.round((currentValue / total) * 100) + '%';
                                                                                    return percentage;
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                });

                                                                var myChart2 = new Chart(ctx2, {
                                                                    type: 'pie',
                                                                    data: {
                                                                        labels: [labels[0], labels[1], labels[2], labels[3]],
                                                                        datasets: [{
                                                                                data: [dataset5[0], dataset5[1], dataset5[2], dataset5[3]],
                                                                                backgroundColor: [
                                                                                    '#e3e3e3',
                                                                                    '#4acccd',
                                                                                    '#fcc468',
                                                                                    '#ef8157'
                                                                                ]
                                                                            }]
                                                                    },
                                                                    options: {
                                                                        tooltips: {
                                                                            callbacks: {
                                                                                label: function (tooltipItem, data) {
                                                                                    var dataset = data.datasets[tooltipItem.datasetIndex];
                                                                                    var currentValue = dataset.data[tooltipItem.index];
                                                                                    var total = dataset.data.reduce(function (previousValue, currentValue, currentIndex, array) {
                                                                                        return previousValue + currentValue;
                                                                                    });
                                                                                    var percentage = Math.round((currentValue / total) * 100) + '%';
                                                                                    return percentage;
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                });
                                                            }
                                                        };
                                                        xhr.send();
                                                    });
        </script>

        <!-- all js here -->
        <script src="assets\js\vendor\jquery-1.12.0.min.js"></script>
        <script src="assets\js\popper.js"></script>
        <script src="assets\js\bootstrap.min.js"></script>
        <script src="assets\js\ajax-mail.js"></script>
        <script src="assets\js\plugins.js"></script>
        <script src="assets\js\main.js"></script>
    </body>
</html>