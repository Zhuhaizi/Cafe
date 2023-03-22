<%-- 
    Document   : booking
    Created on : Nov 26, 2022, 10:42:36 PM
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
    </head>

    <body>
        <div class="container-xxl bg-white p-0">
            <!-- Navbar & Hero Start -->
            <jsp:include page="header.jsp"></jsp:include>
                <!-- Navbar & Hero End -->

                <!-- Reservation Start -->
                <div class="container-xxl py-3 px-0">
                    <div class="align-items-center" id="bill">
                        <div class="p-3">
                            <h5 class="section-title ff-secondary text-start text-primary fw-normal">Thông tin</h5>
                            <h2 class="text-black mb-4">Vui lòng điền số lượng các sản phẩm</h2>
                            <h1 class="text-primary">Bàn ${b_id}</h1>
                        <br>
                        <form action="booking" method="post">
                            <input type="text" value="${b_id}" name="b_id" style="display: none">
                            <div class="row g-3">
                                <c:if test="${plist != null}">
                                    <c:forEach items="${plist}" var="p">
                                        <div class="row">
                                            <div class="col-6">
                                                <h6 class=" border-bottom">- ${p.getP_name()}</h6>
                                            </div>
                                            <div class="col-6">
                                                <div>
                                                    <input type="text" name="productID" value="${p.getP_id()}" style="display: none">
                                                    <input type="number" class="form-control" name="quantity" placeholder="Số lượng" min="1" max="100" required>
                                                    <br>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${othername != null && otherprice != null}">
                                    <div class="col-12">
                                        <h6>- Sản phẩm khác:</h6>
                                    </div>
                                    <div class="row g-4">
                                        <div class="row">
                                            <div class="form-floating col-6">
                                                <input type="text" class="form-control" id="othername" name="othername"placeholder="Tên sản phẩm" value="${othername}">
                                                <label for="other">Tên sản phẩm</label>
                                            </div>
                                            <div class="form-floating col-6">
                                                <input type="text" class="form-control" id="otherprice" name="otherprice" placeholder="Giá" value="${otherprice}">
                                                <label for="otherprice">Giá</label>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                <div class="col-12 align-items-center">
                                    <button class="btn btn-primary btn-blue-check w-100 py-3" type="submit" name="btnBooking">Xác nhận</button>
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
