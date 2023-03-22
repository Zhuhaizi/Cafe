<%-- 
    Document   : booking
    Created on : Nov 26, 2022, 10:42:36 PM
    Author     : DELL
--%>

<%@page import="java.sql.ResultSet"%>
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
            #bill-form {
                position: fixed;
                width: 100vw;
                height: 100vh;
                background-color: rgba(0, 0, 0, 0.6);
                top: 0;
                left: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                text-align: center;
                display: none;
                z-index: 999;
            }
            #bill-form-content {
                overflow-y: scroll;
                overflow-x: hidden;
                padding-left: 15px;
                width: 380px;
                height: 450px;
                background-color: white;
                color: black;
                border-radius: 5px;
            }
            #bill-form-content h2 {
                font-size: 20px;
                padding: 12px 0;
                border-bottom: 1px solid #ddd;
                position: relative;
            }
            #bill-form-content h2 span {
                display: block;
                position: absolute;
                height: 30px;
                padding: 0 6px;
                border: 1px solid #ddd;
                right: 12px;
                cursor: pointer;
                top: 50%;
                transform: translateY(-50%);
                line-height: 26px;
                border-radius: 5px;
                background-color: #fd7e14;
                color: white;
                font-size: 15px;
            }
        </style>
    </head>

    <body>
        <div class="container-xxl bg-white p-0">
            <!-- Navbar & Hero Start -->
            <jsp:include page="header.jsp"></jsp:include>
                <!-- Navbar & Hero End -->
            <%
                ResultSet rs = (ResultSet) request.getAttribute("info");
                int count = 1;
            %>
            <!-- Reservation Start -->
            <div class="container-xxl py-3 px-0">
                <div class="align-items-center" id="bill">
                    <div class="p-3">
                        <div class="row">
                            <div class="col-md-5 col-sm-12">
                                <div class="text-start">
                                    <h5 class="section-title ff-secondary text-start text-primary fw-normal">Thông tin</h5>
                                    <h1 class="text-primary">Bàn ${b_id}</h1>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-12">
                                <button class="btn btn-primary btn-blue" style="color: white; padding: 15px">
                                    <a style="color: white" href="additem?b_id=${b_id}&oi_id=${oi_id}">Thêm sản phẩm</a>
                                </button>
                            </div>
                            <div class="col-md-4 col-sm-12">
                                <button class="btn btn-primary btn-blue" style="color: white; padding: 15px">
                                    <a style="color: white" href="additem?b_id=${b_id}&oi_id=${oi_id}&other=1">Thêm sản phẩm khác</a>
                                </button>
                            </div>
                        </div>
                        <br>
                        <div class="border-top">
                            <br>
                            <h5 style="color: #362d7b">- Thời gian bắt đầu: <span class="text-primary" style="font-size: 30px;">${o_time_start}</span>&nbsp;&nbsp;&nbsp;&nbsp;<a href="edittime?o_id=${o_id}&b_id=${b_id}" class="col-2 text-black-50">Sửa</a></h5>
                            
                            <br>
                            <c:if test="${noitem == null}">
                                <h5 style="color: #362d7b">- Danh sách sản phẩm:</h5>
                                <br>
                                <div class="row g-3">
                                    <div class="row" style="text-align: center">
                                        <h4 class="col-2 text-black-200">STT</h4>
                                        <h4 class="col-4 text-black-200">Tên</h4>
                                        <h4 class="col-2 text-black-200">Số lượng</h4>
                                    </div>
                                    <%
                                        while (rs.next()) {
                                    %>
                                    <div class="row" style="font-size: 22px; text-align: center">
                                        <p class="col-2 text-black-200"><%= count%></p>
                                        <p class="col-4 text-black-200"><%= rs.getString("p_name")%></p>
                                        <p class="col-2 text-black-200"><%= rs.getString("oi_quantity")%></p>
                                        <a href="edititem?id=<%= rs.getInt("oi_general_id")%>&b_id=${b_id}" class="col-2 text-primary">Sửa</a>
                                        <a href="deleteitem?id=<%= rs.getInt("oi_general_id")%>&b_id=${b_id}" class="col-2 text-primary" onclick="return confirm('Bạn muốn xóa sản phẩm?')">Xóa</a>
                                    </div>
                                    <%
                                            count++;
                                        }
                                    %>
                                </div>
                            </c:if>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-7"></div>
                            <div class="col-5"><button class="btn btn-primary btn-blue" id="bill-form-btn">Tính tiền</button></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Reservation Start -->


            <div id="bill-form">
                <div id="bill-form-content">
                    <form action="bill" method="post">
                        <h2>Hóa đơn<span id="bill-close">X Đóng</span></h2>
                        <br>
                        <c:if test="${noitem == null}">
                            <div class="row" style="text-align: center">
                                <h5 class="col-1 text-black-200">STT</h5>
                                <h5 class="col-6 text-black-200">Tên</h5>
                                <h5 class="col-1 text-black-200">SL</h5>
                                <h5 class="col-4 text-black-200">TT</h5>
                            </div>
                            <%
                                count = 1;
                                rs.first();
                                rs.previous();
                                while (rs.next()) {
                            %>
                            <div class="row" style="text-align: center">
                                <p class="col-1 text-black-200"><%= count%>.</p>
                                <p class="col-6 text-black-200"><%= rs.getString("p_name")%></p>
                                <p class="col-1 text-black-200"><%= rs.getString("oi_quantity")%></p>
                                <p class="col-4 text-black-200 money"><%= rs.getInt("oi_price")%></p>
                            </div>
                            <%
                                    count++;
                                }
                            %>
                        </c:if>
                        <div class="border-bottom row" style="margin: 0 5px 0 5px">
                            <!--<div class="col-1"></div>-->
                            <div class="col-4">Tiền giờ: </div>
                            <div class="col-4"></div>
                            <div class="col-4 money">${o_time_price}</div>
                        </div>
                        <br>
                        <div class="row" style="margin: 0 5px 0 5px">
                            <h3 class="col-6">Tổng tiền: </h3>
                            <h4 class="col-6 text-primary money">${o_time_price + o_product_price}</h4>
                            <input type="text" value="${o_time_price + o_product_price}" name="o_totalprice" style="display: none">
                            <input type="text" value="${b_id}" name="b_id" style="display: none">
                            <input type="text" value="${o_id}" name="o_id" style="display: none">
                            <input type="text" value="${o_time_price}" name="o_time_price" style="display: none">
                            <input type="text" value="${o_product_price}" name="o_product_price" style="display: none">
                        </div>
                        <br>
                        <button class="btn btn-primary" type="submit" name="btnBill">xuất hóa đơn</button>
                    </form>
                </div>
            </div>

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
                                            const billbtn = document.querySelector('#bill-form-btn');
                                            billbtn.addEventListener("click", function () {
                                                document.querySelector('#bill-form').style.display = "flex";
                                            });
                                            const billclose = document.querySelector('#bill-close');
                                            billclose.addEventListener("click", function () {
                                                document.querySelector('#bill-form').style.display = "none";
                                            });

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
