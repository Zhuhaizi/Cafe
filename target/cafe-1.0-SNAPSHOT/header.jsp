<%-- 
    Document   : header
    Created on : Nov 26, 2022, 10:42:50 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Café</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!--Favicon--> 
        <link href="img/favicon.ico" rel="icon">

        <!--Google Web Fonts--> 
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap"
            rel="stylesheet">

        <!--Icon Font Stylesheet--> 
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!--Libraries Stylesheet--> 
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!--Customized Bootstrap Stylesheet--> 
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!--Template Stylesheet--> 
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


            /*** Service ***/

            .service-item {
                box-shadow: 0 0 45px rgba(0, 0, 0, .08);
                transition: .5s;
            }

            .service-item:hover {
                background: var(--primary);
            }

            .service-item * {
                transition: .5s;
            }

            .service-item:hover * {
                color: var(--light) !important;
            }


            /*** Food Menu ***/
            .nav-pills .nav-item .active {
                border-bottom: 2px solid var(--primary);
            }

            li .nav-item {
                padding-left: 10px;
            }
            
            /*** Team ***/
            .team-item {
                box-shadow: 0 0 45px rgba(0, 0, 0, .08);
                height: calc(100% - 38px);
                transition: .5s;
            }

            .team-item img {
                transition: .5s;
            }

            .team-item:hover img {
                transform: scale(1.1);
            }

            .team-item:hover {
                height: 100%;
            }

            .team-item .btn {
                border-radius: 38px 38px 0 0;
            }


            /*** Testimonial ***/
            .testimonial-carousel .owl-item .testimonial-item,
            .testimonial-carousel .owl-item.center .testimonial-item * {
                transition: .5s;
            }

            .testimonial-carousel .owl-item.center .testimonial-item {
                background: var(--primary) !important;
                border-color: var(--primary) !important;
            }

            .testimonial-carousel .owl-item.center .testimonial-item * {
                color: var(--light) !important;
            }

            .testimonial-carousel .owl-dots {
                margin-top: 24px;
                display: flex;
                align-items: flex-end;
                justify-content: center;
            }

            .testimonial-carousel .owl-dot {
                position: relative;
                display: inline-block;
                margin: 0 5px;
                width: 15px;
                height: 15px;
                border: 1px solid #CCCCCC;
                border-radius: 15px;
                transition: .5s;
            }

            .testimonial-carousel .owl-dot.active {
                background: var(--primary);
                border-color: var(--primary);
            }


            /*** Footer ***/
            .footer .btn.btn-social {
                margin-right: 5px;
                width: 35px;
                height: 35px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: var(--light);
                border: 1px solid #FFFFFF;
                border-radius: 35px;
                transition: .3s;
            }

            .footer .btn.btn-social:hover {
                color: var(--primary);
            }

            .footer .btn.btn-link {
                display: block;
                margin-bottom: 5px;
                padding: 0;
                text-align: left;
                color: #FFFFFF;
                font-size: 15px;
                font-weight: normal;
                text-transform: capitalize;
                transition: .3s;
            }

            .footer .btn.btn-link::before {
                position: relative;
                content: "\f105";
                font-family: "Font Awesome 5 Free";
                font-weight: 900;
                margin-right: 10px;
            }

            .footer .btn.btn-link:hover {
                letter-spacing: 1px;
                box-shadow: none;
            }

            .footer .copyright {
                padding: 25px 0;
                font-size: 15px;
                border-top: 1px solid rgba(256, 256, 256, .1);
            }

            .footer .copyright a {
                color: var(--light);
            }

            .footer .footer-menu a {
                margin-right: 15px;
                padding-right: 15px;
                border-right: 1px solid rgba(255, 255, 255, .1);
            }

            .footer .footer-menu a:last-child {
                margin-right: 0;
                padding-right: 0;
                border-right: none;
            }
        </style>

    </head>
    <body>
        <!-- Navbar & Hero Start -->
        <div class="container-xxl position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
                <a href="main" class="navbar-brand p-0">
                    <h1 class="text-primary m-0"><i class="fa fa-coffee"></i>&nbsp;Café</h1>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0 pe-4" style="font-family: Nunito">
                        <a href="main" class="nav-item nav-link" style="font-size: 20px;">Trang chủ</a>
                        <a href="statistic" class="nav-item nav-link" style="font-size: 20px;">Thống kê</a>
                        <a href="storage" class="nav-item nav-link" style="font-size: 20px;">Kho</a>
                        <a href="logout" class="nav-item nav-link" style="font-size: 20px;">Đăng xuất</a>
                    </div>
                </div>
            </nav>

            <div class="container-xxl py-5 bg-dark  mb-5"></div>
        </div>
        <!-- Navbar & Hero End -->
    </body>
</html>
