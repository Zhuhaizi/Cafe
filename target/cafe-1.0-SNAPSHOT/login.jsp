<%-- 
    Document   : login
    Created on : Nov 26, 2022, 10:42:12 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Café</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap"
            rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <!--<link href="css/style.css" rel="stylesheet">-->
        <style>
            /********** Template CSS **********/
            :root {
                --primary: #FEA116;
                --light: #F1F8FF;
                --dark: #0F172B;
            }

            .ff-secondary {
                font-family: 'Pacifico', cursive;
            }

            .fw-medium {
                font-weight: 600 !important;
            }

            .fw-semi-bold {
                font-weight: 700 !important;
            }

            .back-to-top {
                position: fixed;
                display: none;
                right: 45px;
                bottom: 45px;
                z-index: 99;
            }


            /*** Spinner ***/
            #spinner {
                opacity: 0;
                visibility: hidden;
                transition: opacity .5s ease-out, visibility 0s linear .5s;
                z-index: 99999;
            }

            #spinner.show {
                transition: opacity .5s ease-out, visibility 0s linear 0s;
                visibility: visible;
                opacity: 1;
            }


            /*** Button ***/
            .btn {
                font-family: 'Nunito', sans-serif;
                font-weight: 500;
                text-transform: uppercase;
                transition: .5s;
            }

            .btn.btn-primary,
            .btn.btn-secondary {
                color: #FFFFFF;
            }

            .btn-square {
                width: 38px;
                height: 38px;
            }

            .btn-sm-square {
                width: 32px;
                height: 32px;
            }

            .btn-lg-square {
                width: 48px;
                height: 48px;
            }

            .btn-square,
            .btn-sm-square,
            .btn-lg-square {
                padding: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: normal;
                border-radius: 2px;
            }

            .btn.btn-primary.btn-blue {
                background-color: #362d7b;
                border: 0px;
                margin-left: 10%;
                width: 80%;
            }

            .btn.btn-primary.btn-blue:hover {
                background-color: #686ec7;
            }

            .btn.btn-primary.btn-blue-check {
                font-size: large;
                background-color: #362d7b;
                border: 0px;
            }

            .btn.btn-primary.btn-blue-check:hover {
                background-color: #686ec7;
            }

            /*** bill ***/
            #bill {
                margin: 0 5% 0 5%;
            }


            /*** Navbar ***/
            .navbar-dark .navbar-nav .nav-link {
                position: relative;
                margin-left: 25px;
                padding: 35px 0;
                font-size: 15px;
                color: var(--light) !important;
                text-transform: uppercase;
                font-weight: 500;
                outline: none;
                transition: .5s;
            }

            .sticky-top.navbar-dark .navbar-nav .nav-link {
                padding: 20px 0;
            }

            .navbar-dark .navbar-nav .nav-link:hover,
            .navbar-dark .navbar-nav .nav-link.active {
                color: var(--primary) !important;
            }

            .navbar-dark .navbar-brand img {
                max-height: 60px;
                transition: .5s;
            }

            .sticky-top.navbar-dark .navbar-brand img {
                max-height: 45px;
            }

            @media (max-width: 991.98px) {
                .sticky-top.navbar-dark {
                    position: relative;
                }

                .navbar-dark .navbar-collapse {
                    margin-top: 15px;
                    border-top: 1px solid rgba(255, 255, 255, .1)
                }

                .navbar-dark .navbar-nav .nav-link,
                .sticky-top.navbar-dark .navbar-nav .nav-link {
                    padding: 10px 0;
                    margin-left: 0;
                }

                .navbar-dark .navbar-brand img {
                    max-height: 45px;
                }
            }

            @media (min-width: 992px) {
                .navbar-dark {
                    position: absolute;
                    width: 100%;
                    top: 0;
                    left: 0;
                    z-index: 999;
                    background: transparent !important;
                }

                .sticky-top.navbar-dark {
                    position: fixed;
                    background: var(--dark) !important;
                }
            }

            #logo-login {
                margin-left: 10px;
            }


            /*** Hero Header ***/
            .hero-header {
                background: linear-gradient(rgba(15, 23, 43, .9), rgba(15, 23, 43, .9)), url(../img/bg-hero.jpg);
                background-position: center center;
                background-repeat: no-repeat;
                background-size: cover;
            }

            /*** Section Title ***/
            .section-title {
                position: relative;
                display: inline-block;
            }

            .section-title::before {
                position: absolute;
                content: "";
                width: 45px;
                height: 2px;
                top: 50%;
                left: -55px;
                margin-top: -1px;
                background: var(--primary);
            }

            .section-title::after {
                position: absolute;
                content: "";
                width: 45px;
                height: 2px;
                top: 50%;
                right: -55px;
                margin-top: -1px;
                background: var(--primary);
            }

            .section-title.text-start::before,
            .section-title.text-end::after {
                display: none;
            }
        </style>
    </head>

    <body>
        <div class="container-xxl bg-white p-0">
            <div class="container-xxl position-relative p-0">
                <div class="container-xxl py-1 bg-dark  mb-5">
                    <a href="/" class="navbar-brand p-0" id="logo-login">
                        <h1 class="text-primary m-0"><i class="fa fa-coffee"></i>&nbsp;Café</h1>
                    </a>
                </div>
            </div>

            <!-- Reservation Start -->
            <div class="container-xxl py-3 px-0" data-wow-delay="0.1s">
                <div class="row align-items-center" id="bill">
                    <div class="col-lg-3 col-md-3 col-sm-0"></div>
                    <div class="col-lg-6 col-md-6 col-sm-12 p-5">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal">Vui lòng đăng nhập để tiếp
                            tục</h4>
                        <br>
                        <br>
                        <form method="post" action="login">
                            <div class="row g-3">
                                <div class="col-12">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="name" name="txtUser"
                                               placeholder="Tên đăng nhập" required>
                                        <label for="name">Tên đăng nhập</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <input type="password" class="form-control" id="pass" name="txtPass"
                                               placeholder="Mật khẩu" required>
                                        <label for="name">Mật khẩu</label>
                                    </div>
                                </div>
                                <h4 class="text-danger">${wrong}</h4>
                                <div class="col-12 align-items-center">
                                    <button class="btn btn-primary btn-blue-check w-100 py-3" type="submit">Đăng
                                        nhập</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Reservation Start -->


            <!-- Footer Start -->
            <jsp:include page="footer.jsp"></jsp:include>
            <!-- Footer End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/counterup/counterup.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>

