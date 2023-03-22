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

    </head>

    <body>
        <div class="container-xxl bg-white p-0">
            <!-- Navbar & Hero Start -->
            <jsp:include page="header.jsp"></jsp:include>
                <!-- Navbar & Hero End -->

                <div class="container-xxl py-3">
                    <div class="container">
                        <div class="row g-4">
                            <div class="col-12 border-bottom">
                                <div class="row col-9">
                                    <button class="btn btn-primary col-2 text-capitalize" style="font-size: 20px">Tuần này</button>
                                    <div class="col-1"></div>
                                    <button class="btn btn-primary col-3 text-capitalize" style="font-size: 20px">Tháng này</button>
                                    <div class="col-1"></div>
                                    <button class="btn btn-primary col-2 text-capitalize" style="font-size: 20px">Năm này</button>
                                </div>
                            </div>
                            <br><br><br><br>
                            <div class="row" style="margin-top: 40px">
                                <div class="col-8">
                                    <div>
                                        <canvas id="myChart"></canvas>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="col-12">
                                        <div class="pt-0" style="background-color: #362d7b">
                                            <div class="p-3">
                                                <h4 class="text-white mb-0">Tổng thu</h4><br><br>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="col-12">
                                        <div class="pt-0" style="background-color: #362d7b">
                                            <div class="p-3">
                                                <h4 class="text-white mb-0">Tiền giờ</h4><br><br>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="col-12">
                                        <div class="pt-0" style="background-color: #362d7b">
                                            <div class="p-3">
                                                <h4 class="text-white mb-0">Tiền sản phẩm</h4><br><br>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer Start -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        const ctx = document.getElementById('myChart');
        var data = document.getElementsByClassName('data');
        var dataset = [];
        for (let i = 0; i < data.length; i++) {
            console.log(data[i].innerHTML);
            dataset.push(data[i].innerHTML);
        }
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
                datasets: [{
                        label: '# of Votes',
                        data: dataset,
                        borderWidth: 1
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
    </script>
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