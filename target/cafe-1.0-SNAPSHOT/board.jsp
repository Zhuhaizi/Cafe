<%-- 
    Document   : board.jsp
    Created on : Nov 26, 2022, 10:41:54 PM
    Author     : DELL
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.models.Board"%>
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

                <!-- Service Start -->
                <div class="container-xxl py-5">
                    <div class="container">
                        <div class="row g-4">
                        <c:forEach items="${BList}" var="b">
                            <c:if test="${b.getB_empty() == 0}">
                                <div class="col-lg-3 col-sm-6" style="pointer-events: none;">
                                    <a href="menu?id=${b.getB_id()}">
                                        <div class="service-item rounded pt-3" style="background-color: #c7cffa;">
                                            <div class="p-4">
                                                <h1 class="text-primary mb-4">Bàn ${b.getB_name()}</h1><br><br>
                                                <a href="view?b_id=${b.getB_id()}" class="btn btn-primary btn-blue" style="pointer-events: auto;">Xem</a>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:if>
                            <c:if test="${b.getB_empty() == 1}">
                                <div class="col-lg-3 col-sm-6">
                                    <a href="menu?id=${b.getB_id()}">
                                        <div class="service-item rounded pt-3">
                                            <div class="p-4">
                                                <h1 class="text-primary mb-4">Bàn ${b.getB_name()}</h1><br><br>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-- Service End -->

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