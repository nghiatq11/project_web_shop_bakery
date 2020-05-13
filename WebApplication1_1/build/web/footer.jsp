<%-- 
    Document   : footer
    Created on : Sep 12, 2019, 1:03:04 AM
    Author     : quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<c:if test="${not empty param.language}">
    <c:set var="language" value="${param.language}" scope="session"/>
</c:if>
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="language.resource" />
<!DOCTYPE html>
<html>

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
        <link href="css/jquery.range.css" rel="stylesheet">
        <title>Detail</title>
        <link href="https://fonts.googleapis.com/css?family=Indie+Flower&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" media="screen" href="cssShop_Web.css">
        <link rel="stylesheet" type="text/css" media="screen" href="cssDetail2.css">
    </head>

    <body>
        <footer id="footer">
            <footer class="wrap-footer footer-2 colophon wigetized">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 col-sm-6 info_shop">

                            <div class="img">
                                <a href="#"><img src="img/logo.png" alt=""></a>
                                <p>
                                    Tiệm Bánh Mộc nơi những người thợ đặt tình yêu, niềm đam mê trong từng sản phẩm để tạo ra hương vị bánh ngon nhất đậm đà tính truyền thống và hiện đại phục vụ những vị khách hàng yêu quý!
                                </p>
                            </div>

                            <div class="social">
                                <a href="#"><img class="size" src="img/facebook_50px.png"></a>
                                <a href="#"><img class="size" src="img/google_50px.png"></a>
                                <a href="#"><img class="size" src="img/youtube_play_50px.png"></a>
                            </div>

                            <div class="copyright">
                                2019 Tiệm Bánh Mộc.<br> Designed with <i class="fa fa-heart-o"></i> by Quang Nghĩa.
                            </div>

                        </div>
                        <div class="col-md-3 col-sm-6 contact">

                            <h4 class="widget-title"><fmt:message key="contact"/></h4>
                            <div class="textwidget">
                                <h6><fmt:message key="address"/></h6>
                                <p>Số 7 ngõ 77/47/29 Xuân La - Tây Hồ 10000 Hanoi, Vietnam</p>
                                <h6><fmt:message key="hotline"/></h6>
                                <p>
                                    <a href="#"> 0962.988.674 </a><br>
                                </p>
                                <h6>Email</h6>
                                <p>
                                    <a href="#">
                                        quangnghia1105@gmail.com
                                    </a>
                                </p>
                            </div>

                        </div>
                        <div class="col-md-3 col-sm-6 item-footer-four">
                            <div class="widget widget_flickr">
                                <h4 class="widget-title"><fmt:message key="location"/></h4>
                                <section id="map">
                                    <div id="gmap"></div>
                                    <script>
                                        function myMap() {
                                            var myCenter = new google.maps.LatLng(21.062514, 105.805911);
                                            var mapCanvas = document.getElementById("gmap");
                                            var mapOptions = {
                                                center: myCenter,
                                                zoom: 15
                                            };
                                            var map = new google.maps.Map(mapCanvas, mapOptions);
                                            var marker = new google.maps.Marker({
                                                position: myCenter
                                            });
                                            marker.setMap(map);
                                            var infowindow = new google.maps.InfoWindow({
                                                content: "Tiệm Bánh Mộc"
                                            });
                                            infowindow.open(map, marker);
                                        }
                                    </script>
                                    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2LlIj3sk2akFpnpNcXzX9_NS08Xda1sE&callback=myMap"></script>
                                </section>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 item-footer-four">
                            <div class="widget widget_noo_openhours">
                                <h4 class="widget-title"><fmt:message key="workingTime"/></h4>
                                <ul class="noo-openhours">
                                    <li>
                                        <span><fmt:message key="mondayToFriday"/>: </span>
                                        <span>08:00 <fmt:message key="am"/> - 08:00 <fmt:message key="pm"/> </span>
                                    </li>
                                    <li>
                                        <span><fmt:message key="saturday"/> &amp; <fmt:message key="sunday"/>: </span>
                                        <span>10:00 <fmt:message key="am"/> - 06:00 <fmt:message key="pm"/> </span>
                                    </li>
                                </ul>
                            </div>
                            <div class="widget widget_noo_happyhours">
                                <h4 class="widget-title"><fmt:message key="happyHours"/></h4>
                                <ul class="noo-happyhours">
                                    <li>
                                        <div><fmt:message key="discountHours"/></div>
                                        <div>06:00 <fmt:message key="am"/> - 08:00 <fmt:message key="pm"/> <fmt:message key="daily"/> </div>
                                    </li>
                                </ul>
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
        </footer>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


    </body>

</html>
