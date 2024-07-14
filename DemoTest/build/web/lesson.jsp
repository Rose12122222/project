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
            .no-padding {
                padding: 0 !important;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <div class="row no-gutters mt-3">
            <div class="col-md-7 no-padding">
                <iframe
                    width="100%"
                    height="500"
                    src="https://www.youtube.com/embed/GlGpSQsS8uc?si=p5BFKU8xr1JT4QhN"
                    title="YouTube video player"
                    frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                    referrerpolicy="strict-origin-when-cross-origin"
                    allowfullscreen
                    ></iframe>
            </div>
            <div class="col-md-5 no-padding">
                <div class="list-group">
                    <a href="#" class="list-group-item list-group-item-action ">
                        Learn C#
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">Program with C</a>
                    <a href="#" class="list-group-item list-group-item-action">Program with C++</a>
                    <a href="#" class="list-group-item list-group-item-action">Program with Java</a>
                    <a href="#" class="list-group-item list-group-item-action ">Program with C#</a>
                    <a href="#" class="list-group-item list-group-item-action ">Program with C#</a>
                    <a href="#" class="list-group-item list-group-item-action ">Program with C#</a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 p-5 ">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item home-tab">
                        <a
                            class="nav-link "
                            href="#course-intro"
                            style="font-size: 20px"
                            >Introduce</a
                        >
                    </li>

                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#course-teacher" style="font-size: 20px"
                           >Lucturers</a
                        >
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#student-feedback" style="font-size: 20px"
                           >Reviews</a
                        >
                    </li>
                    <li  class="nav-item">
                        <a class="nav-link" href="#faq" style="font-size: 20px">FAQ</a>
                    </li>
                </ul>
                <h2 id="course-intro" class="p-3">About this Specialization</h2>
                <p>
                    This Specialization builds on the success of the Python for Everybody
                    course and will introduce fundamental programming concepts including
                    data structures, networked application program interfaces, and
                    databases, using the Python programming language. In the Capstone
                    Project, you’ll use the technologies learned throughout the
                    Specialization to design and create your own applications for data
                    retrieval, processing, and visualization.
                </p>
                <h3 class="p-3">Who is course for : </h3>

                <ul>
                    <li>Anyone interested in Machine Learning.</li>
                    <li>
                        Students who have at least high school knowledge in math and who
                        want to start learning Machine Learning.
                    </li>
                    <li>
                        Any intermediate level people who know the basics of machine
                        learning, including the classical algorithms like linear regression
                        or logistic regression, but who want to learn more about it and
                        explore all the different fields of Machine Learning.
                    </li>
                </ul>
                <div style="background-color: #DAF0BE;" class="p-3">
                    <h3 class="">You will learn and practice :</h3>
                    <ul>
                        <li>Key data science and machine learning concepts right from the beginning with a complete unfolding with examples in Python.</li>
                        <li>
                            Python for Data Science and Data Analysis
                        </li>
                        <li>
                            Feature Engineering and Dimensionality Reduction with Python
                        </li>
                        <li>
                            Convolutional Neural Networks with Python
                        </li>
                        <li>
                            Building your own AI applications.
                        </li>
                    </ul>
                </div>
                <hr>
                <div class="row p-3" id="course-teacher">
                    <h2 class="heading-xl">Instructor</h2>
                    <div class="heading-lg">
                        <strong>
                            <h4>
                                <a href="#" style="text-decoration: none">James Smith</a>
                            </h4>
                        </strong>
                    </div>
                    <p style="color: gray">Development Team Lead</p>
                    <div class="row">
                        <div class="row">
                            <div class="col-md-1">
                                <img
                                    src="images/instructor.jpg"
                                    alt=""
                                    class="rounded-circle teacher-avt"
                                    width="80"
                                    />
                            </div>
                            <div class="col-md-3">
                                <span class="fa fa-star checked"></span>
                                <span style="margin-left: 8px">4.5 Instructor Rating</span><br />
                                <i class="fa fa-graduation-cap"></i>
                                <span style="margin-left: 8px">32,523 Students</span><br />

                                <i class="fa fa-play-circle"></i>

                                <span style="margin-left: 8px">1 Course</span><br />
                            </div>
                        </div>
                        <p style="padding-top: 20px">
                            Hi There, My name is Dmitry and I'm a Senior instructor at 'Ninja
                            Developer Academy'. I started as student not so few years ago here
                            at Udemy. And for today my vision is to bring Premium Level courses
                            with honest prices, affordable education for everybody. You will get
                            huge amount of examples and coding exprience in each topic you
                            choose. Join us and become a Ninja Developer
                        </p>
                    </div>
                </div>
                <hr>
                <div class="row p-3">
                    <h2 class="" id="student-feedback">Student feedback</h2>
                    <div class="row">
                        <div class="col-md-2">
                            <h1 class="display-5 checked">4.7</h1>
                            <div>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star-half-o checked"></span>
                                <h5 class="checked">Course rating</h5>
                            </div>
                        </div>

                        <div class="col-md-8">
                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar bar-5"></div>
                                </div>
                            </div>

                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar bar-4"></div>
                                </div>
                            </div>

                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar bar-3"></div>
                                </div>
                            </div>

                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar bar-2"></div>
                                </div>
                            </div>

                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar bar-1"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="row p-3" id="faq">
                    <div class="col-md-1">
                        <img src="images/instructor.jpg" alt="" width="50"  class="rounded-circle reviews" />
                    </div>
                    <div class="col-md-11">
                        <p class="heading-md">Sikander Ali Haroon</p>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star "></span>
                        <span style="color: gray">a week ago </span>
                        <p style="padding-top: 10px">
                            I am a complete beginner and I must say I love the course Jose
                            actually went from very basic right up to advance topics, One
                            thing which i would like to ask Jose to improve is Final
                            Capstone Project section, Instead of letting us choose from if
                            there is one provided with the solution that would be great
                        </p>
                        <a href="#"
                           ><i class="fa fa-thumbs-up" style="color: gray"></i
                            ></a>
                        <span style="font-size: 12px">Was this review helpful?</span>
                    </div>
                </div>

                <div class="row p-3">
                    <div class="col-md-1">
                        <img src="images/instructor.jpg" alt="" width="50"  class="rounded-circle reviews" />
                    </div>
                    <div class="col-md-11">
                        <p class="heading-md">Sikander Ali Haroon</p>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star "></span>
                        <span style="color: gray">a week ago </span>
                        <p style="padding-top: 10px">
                            I am a complete beginner and I must say I love the course Jose
                            actually went from very basic right up to advance topics, One
                            thing which i would like to ask Jose to improve is Final
                            Capstone Project section, Instead of letting us choose from if
                            there is one provided with the solution that would be great
                        </p>
                        <a href="#"
                           ><i class="fa fa-thumbs-up" style="color: gray"></i
                            ></a>
                        <span style="font-size: 12px">Was this review helpful?</span>
                    </div>
                </div>

                <div class="row p-3">
                    <div class="col-md-1">
                        <img src="images/instructor.jpg" alt="" width="50"  class="rounded-circle reviews" />
                    </div>
                    <div class="col-md-11">
                        <p class="heading-md">Sikander Ali Haroon</p>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star "></span>
                        <span style="color: gray">a week ago </span>
                        <p style="padding-top: 10px">
                            I am a complete beginner and I must say I love the course Jose
                            actually went from very basic right up to advance topics, One
                            thing which i would like to ask Jose to improve is Final
                            Capstone Project section, Instead of letting us choose from if
                            there is one provided with the solution that would be great
                        </p>
                        <a href="#"
                           ><i class="fa fa-thumbs-up" style="color: gray"></i
                            ></a>
                        <span style="font-size: 12px">Was this review helpful?</span>
                    </div>
                </div>

                <div class="row p-3">
                    <div class="col-md-1">
                        <img src="images/instructor.jpg" alt="" width="50"  class="rounded-circle reviews" />
                    </div>
                    <div class="col-md-11">
                        <p class="heading-md">Sikander Ali Haroon</p>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star "></span>
                        <span style="color: gray">a week ago </span>
                        <p style="padding-top: 10px">
                            I am a complete beginner and I must say I love the course Jose
                            actually went from very basic right up to advance topics, One
                            thing which i would like to ask Jose to improve is Final
                            Capstone Project section, Instead of letting us choose from if
                            there is one provided with the solution that would be great
                        </p>
                        <a href="#"
                           ><i class="fa fa-thumbs-up" style="color: gray"></i
                            ></a>
                        <span style="font-size: 12px">Was this review helpful?</span>
                    </div>
                </div>

                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </nav>
                <div class=" p-3">
                    <form>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1"
                                   >Your Feedback</label
                            >
                            <textarea
                                class="form-control"
                                id="exampleFormControlTextarea1"
                                rows="3"
                                ></textarea>
                        </div>
                    </form>
                    <button type="button" class="btn btn-primary mt-2">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
                        <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576zm6.787-8.201L1.591 6.602l4.339 2.76z"></path>
                        </svg>
                        Send
                    </button>
                </div>

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
