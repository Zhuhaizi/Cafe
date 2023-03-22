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
                <form method="post" action="item" name="myForm" onsubmit="return checkInput(this)">
                    <div class="container-xxl py-5">
                        <div class="container">
                            <div class="text-center">
                                <h5 class="section-title ff-secondary text-center text-primary fw-normal">Menu</h5>
                                <h1 class="mb-5">Chọn các món</h1>
                            </div>
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
                                    <li class="nav-item">
                                        <a class="d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill"
                                           href="#tab-5">
                                            <i class="fa fa-box fa-2x text-primary"></i>
                                            <div class="ps-3">
                                                <small class="text-body">Khác</small>
                                                <h6 class="mt-n1 mb-0">Sản phẩm khác</h6>
                                            </div>
                                        </a>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <div id="tab-1" class="tab-pane fade show p-0 active">
                                        <div class="row g-4">
                                        <c:forEach items="${list1}" var="a">
                                            <div class="col-lg-6">
                                                <div class="d-flex align-items-center">
                                                    <img class="flex-shrink-0 img-fluid rounded" src="${a.getP_img()}" alt=""
                                                         style="width: 80px;">
                                                    <div class="w-100 d-flex flex-column text-start ps-4">
                                                        <h5 class="d-flex justify-content-between border-bottom pb-2">
                                                            <span>${a.getP_name()}</span>
                                                            <span class="btn btn-primary"><input id="chkItems" type="checkbox" name="chkItems" value="${a.getP_id()}"></span>
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
                                            <div class="col-lg-6">
                                                <div class="d-flex align-items-center">
                                                    <img class="flex-shrink-0 img-fluid rounded" src="${b.getP_img()}" alt=""
                                                         style="width: 80px;">
                                                    <div class="w-100 d-flex flex-column text-start ps-4">
                                                        <h5 class="d-flex justify-content-between border-bottom pb-2">
                                                            <span>${b.getP_name()}</span>
                                                            <span class="btn btn-primary"><input id="chkItems" type="checkbox" name="chkItems" value="${b.getP_id()}"></span>
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
                                            <div class="col-lg-6">
                                                <div class="d-flex align-items-center">
                                                    <img class="flex-shrink-0 img-fluid rounded" src="${c.getP_img()}" alt=""
                                                         style="width: 80px;">
                                                    <div class="w-100 d-flex flex-column text-start ps-4">
                                                        <h5 class="d-flex justify-content-between border-bottom pb-2">
                                                            <span>${c.getP_name()}</span>
                                                            <span class="btn btn-primary"><input id="chkItems" type="checkbox" name="chkItems" value="${c.getP_id()}"></span>
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
                                            <div class="col-lg-6">
                                                <div class="d-flex align-items-center">
                                                    <img class="flex-shrink-0 img-fluid rounded" src="${d.getP_img()}" alt=""
                                                         style="width: 80px;">
                                                    <div class="w-100 d-flex flex-column text-start ps-4">
                                                        <h5 class="d-flex justify-content-between border-bottom pb-2">
                                                            <span>${d.getP_name()}</span>
                                                            <span class="btn btn-primary"><input id="chkItems" type="checkbox" name="chkItems" value="${d.getP_id()}"></span>
                                                        </h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div id="tab-5" class="tab-pane fade show p-0">
                                    <div class="row g-4">
                                        <div class="row">
                                            <div class="form-floating col-6">
                                                <input type="text" class="form-control" id="othername" name="othername"placeholder="Tên sản phẩm">
                                                <label for="other">Tên sản phẩm</label>
                                            </div>
                                            <div class="form-floating col-6">
                                                <input type="number" class="form-control" id="otherprice" name="otherprice" placeholder="Giá" min="1000">
                                                <label for="otherprice">Giá</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <input type="text" name="b_id" value="${b_id}" style="display: none">
                            </div>

                        </div>
                    </div>
                </div>
                <!-- Menu End -->

                <div>
                    <button type="submit" class="btn btn-primary btn-blue" name="btnMenu">Hoàn thành</button>
                </div>
            </form>

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
                    function checkCheckbox() {
                        var chk = document.getElementsByName('chkItems')
                        for (var i = 0; i < chk.length; i++) {
                            if (chk[i].checked) {
                                return true;
                            }
                        }
                        return false;
                    }

                    function checkInput() {
                        let oname = document.forms["myForm"]["othername"].value;
                        let oprice = document.forms["myForm"]["otherprice"].value;
                        if (checkCheckbox() == false) {
                            if (oname == "" && oprice == "") {
                                return confirm("Bạn chưa chọn sản phẩm nào!");
                            } else {
                                if ((oname != "" && oprice == "") || (oname == "" && oprice != "")) {
                                    alert("Vui lòng điền đầy đủ thông tin cho [Sản phẩm khác]!");
                                    return false;
                                }
                            }
                        } else {
                            return true;
                        }
                    }
        </script>
    </body>

</html>
