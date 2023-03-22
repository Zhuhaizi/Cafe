<%-- 
    Document   : menu
    Created on : Nov 26, 2022, 10:42:23 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <link href="css/style.css" rel="stylesheet">
        <style>
            #chkItems{
                height: 200%;
                width: 200%;
                margin-top: -90%;
                margin-left: -50%;
            }
        </style>
    </head>

    <body>
        <div class="container-xxl bg-white p-0">
            <!-- Navbar & Hero Start -->
            <jsp:include page="header.jsp"></jsp:include>
                <!-- Navbar & Hero End -->

                <!-- Menu Start -->

                <div class="container-xxl py-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-5 col-sm-12">
                                <div class="text-start">
                                    <h5 class="section-title ff-secondary text-start text-primary fw-normal">Menu</h5>
                                    <h1 class="mb-5">Danh Sách Sản Phẩm</h1>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-0"></div>
                            <div class="col-md-3 col-sm-12">
                                <button class="btn btn-primary btn-blue" style="color: white; padding: 15px">
                                    <a style="color: white" href="addproduct">Thêm sản phẩm mới</a>
                                </button>
                            </div>
                        </div>
                        <div class="col-md-0 col-sm-12"><br></div>
                        <div class="tab-class text-center">
                            <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                                <li class="nav-item">
                                    <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill"
                                       href="#tab-1">
                                        <i class="fa fa-wine-bottle fa-2x text-primary"></i>
                                        <div class="ps-3">
                                            <small class="text-body">Nước</small>
                                            <h6 class="mt-n1 mb-0">Nước đóng chai</h6>
                                        </div>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill"
                                       href="#tab-2">
                                        <i class="fa fa-wine-glass fa-2x text-primary"></i>
                                        <div class="ps-3">
                                            <small class="text-body">Nước</small>
                                            <h6 class="mt-n1 mb-0">Nước khác</h6>
                                        </div>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill"
                                       href="#tab-3">
                                        <i class="fa fa-smoking fa-2x text-primary"></i>
                                        <div class="ps-3">
                                            <small class="text-body">Thuốc lá</small>
                                            <h6 class="mt-n1 mb-0">Thuốc lá</h6>
                                        </div>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill"
                                       href="#tab-4">
                                        <i class="fa fa-hamburger fa-2x text-primary"></i>
                                        <div class="ps-3">
                                            <small class="text-body">Thức ăn</small>
                                            <h6 class="mt-n1 mb-0">Thức ăn</h6>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div id="tab-1" class="tab-pane fade show p-0 active">
                                    <div class="row g-4">
                                    <c:forEach items="${list1}" var="a">
                                        <div class="col-12">
                                            <div class="d-flex align-items-center">
                                                <img class="flex-shrink-0 img-fluid rounded" src="${a.getP_img()}" alt="" style="width: 80px;">
                                                <div class="w-100 d-flex flex-column text-start ps-4">
                                                    <h5 class="d-flex justify-content-between border-bottom pb-2 row">
                                                        <span class="col-3">${a.getP_name()}</span>
                                                        <span class="text-primary col-3 money">${a.getP_price()}</span>
                                                        <a class="text-black-50 col-3" href="editproduct?id=${a.getP_id()}">Sửa</a>
                                                        <a class="text-black-50 col-3" href="deleteproduct?id=${a.getP_id()}" onclick="return confirm('Bạn muốn xóa sản phẩm?')">Xóa</a>
                                                    </h5>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div id="tab-2" class="tab-pane fade show p-0">
                                <div class="row g-4">
                                    <c:forEach items="${list2}" var="b">
                                        <div class="col-12">
                                            <div class="d-flex align-items-center">
                                                <img class="flex-shrink-0 img-fluid rounded" src="${b.getP_img()}" alt="" style="width: 80px;">
                                                <div class="w-100 d-flex flex-column text-start ps-4">
                                                    <h5 class="d-flex justify-content-between border-bottom pb-2 row">
                                                        <span class="col-3">${b.getP_name()}</span>
                                                        <span class="text-primary col-3 money">${b.getP_price()}</span>
                                                        <a class="text-black-50 col-3" href="editproduct?id=${b.getP_id()}">Sửa</a>
                                                        <a class="text-black-50 col-3" href="deleteproduct?id=${b.getP_id()}" onclick="return confirm('Bạn muốn xóa sản phẩm?')">Xóa</a>
                                                    </h5>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div id="tab-3" class="tab-pane fade show p-0">
                                <div class="row g-4">
                                    <c:forEach items="${list3}" var="c">
                                        <div class="col-12">
                                            <div class="d-flex align-items-center">
                                                <img class="flex-shrink-0 img-fluid rounded" src="${c.getP_img()}" alt="" style="width: 80px;">
                                                <div class="w-100 d-flex flex-column text-start ps-4">
                                                    <h5 class="d-flex justify-content-between border-bottom pb-2 row">
                                                        <span class="col-3">${c.getP_name()}</span>
                                                        <span class="text-primary col-3 money">${c.getP_price()}</span>
                                                        <a class="text-black-50 col-3" href="editproduct?id=${c.getP_id()}">Sửa</a>
                                                        <a class="text-black-50 col-3" href="deleteproduct?id=${c.getP_id()}" onclick="return confirm('Bạn muốn xóa sản phẩm?')">Xóa</a>
                                                    </h5>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div id="tab-4" class="tab-pane fade show p-0">
                                <div class="row g-4">
                                    <c:forEach items="${list4}" var="d">
                                        <div class="col-12">
                                            <div class="d-flex align-items-center">
                                                <img class="flex-shrink-0 img-fluid rounded" src="${d.getP_img()}" alt="" style="width: 80px;">
                                                <div class="w-100 d-flex flex-column text-start ps-4">
                                                    <h5 class="d-flex justify-content-between border-bottom pb-2 row">
                                                        <span class="col-3">${d.getP_name()}</span>
                                                        <span class="text-primary col-3 money">${d.getP_price()}</span>
                                                        <a class="text-black-50 col-3" href="editproduct?id=${d.getP_id()}">Sửa</a>
                                                        <a class="text-black-50 col-3" href="deleteproduct?id=${d.getP_id()}" onclick="return confirm('Bạn muốn xóa sản phẩm?')">Xóa</a>
                                                    </h5>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Menu End -->

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
        <script>
                                                            const formatter = new Intl.NumberFormat('vi-VN', {
                                                                style: 'currency',
                                                                currency: 'VND',
                                                                minimumFractionDigits: 0
                                                            })

                                                            var x = document.getElementsByClassName('money');
                                                            for (var i = 0; i < x.length; i++) {
                                                                x[i].innerHTML = formatter.format(x[i].innerHTML);
                                                            }
        </script>
    </body>

</html>
