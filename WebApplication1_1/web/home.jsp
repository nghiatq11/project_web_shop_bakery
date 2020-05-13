<%-- 
    Document   : home
    Created on : Sep 16, 2019, 9:19:05 PM
    Author     : quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Material Design Bootstrap</title>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet">
        <!-- Your custom styles (optional) -->
        <link href="css/style.css" rel="stylesheet">
        <!-- MDBootstrap Steppers Pro  -->
        <link href="css/addons-pro/stepper.min.css" rel="stylesheet">

        <link rel="stylesheet" type="text/css" media="screen" href="cssShop_Web.css">
    </head>

    <body>

        <jsp:include page="navbar.jsp" /> 

        <jsp:include page="heading.jsp" /> 

        <!-- Start your project here-->
        <div id="products">
            <div class="container">

                <h1 class="my-4 font-weight-bold">Masonry - Bootstrap 4 grid</h1>
                <div class="sanpham">
                    <div class="grid row">
                        <div class="grid-sizer"></div>
                        <div class="grid-item mb-4 col-lg-3 col-md-4 col-sm-6">
                            <div class="card ">
                                <div class="card-img">
                                    <div class="smooth"></div>
                                    <a href="Detail.html"><img class="card-img-top" src="img_main/product_1.jpg" alt="Card image cap"></a>
                                </div>
                                <div class="card-body">
                                    <a href="Detail.html">
                                        <h5 class="card-title">Card title</h5>
                                    </a>
                                    <p class="card-text">Đây là a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                </div>
                                <div class="card-footer">
                                    <a href="#"><small class="text-muted"><img src="img/add_shopping_cart_24px.png">Add To Cart</small></a>
                                    <div class="card-footer1">
                                        <a href="#"><small class="text-muted"><img src="img/add_shopping_cart_24px.png">Add To Cart</small></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="grid-item mb-4 col-lg-3 col-md-4 col-sm-6">
                            <div class="card ">
                                <div class="card-img">
                                    <div class="smooth"></div>
                                    <a href="Detail.html"><img class="card-img-top" src="img_main/product_1.jpg" alt="Card image cap"></a>
                                </div>
                                <div class="card-body">
                                    <a href="Detail.html">
                                        <h5 class="card-title">Card title</h5>
                                    </a>
                                    <p class="card-text">Đây là a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                </div>
                                <div class="card-footer">
                                    <a href="#"><small class="text-muted"><img src="img/add_shopping_cart_24px.png">Add To Cart</small></a>
                                    <div class="card-footer1">
                                        <a href="#"><small class="text-muted"><img src="img/add_shopping_cart_24px.png">Add To Cart</small></a>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="grid-item mb-4 col-lg-3 col-md-4 col-sm-6">
                            <div class="card ">
                                <div class="card-img">
                                    <div class="smooth"></div>
                                    <a href="Detail.html"><img class="card-img-top" src="img_main/product_1.jpg" alt="Card image cap"></a>
                                </div>
                                <div class="card-body">
                                    <a href="Detail.html">
                                        <h5 class="card-title">Card title</h5>
                                    </a>
                                    <p class="card-text">Đây là a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                </div>
                                <div class="card-footer">
                                    <a href="#"><small class="text-muted"><img src="img/add_shopping_cart_24px.png">Add To Cart</small></a>
                                    <div class="card-footer1">
                                        <a href="#"><small class="text-muted"><img src="img/add_shopping_cart_24px.png">Add To Cart</small></a>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="grid-item mb-4 col-lg-3 col-md-4 col-sm-6">
                            <div class="card ">
                                <div class="card-img">
                                    <div class="smooth"></div>
                                    <a href="Detail.html"><img class="card-img-top" src="img_main/product_1.jpg" alt="Card image cap"></a>
                                </div>
                                <div class="card-body">
                                    <a href="Detail.html">
                                        <h5 class="card-title">Card title</h5>
                                    </a>
                                    <p class="card-text">Đây là a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                </div>
                                <div class="card-footer">
                                    <a href="#"><small class="text-muted"><img src="img/add_shopping_cart_24px.png">Add To Cart</small></a>
                                    <div class="card-footer1">
                                        <a href="#"><small class="text-muted"><img src="img/add_shopping_cart_24px.png">Add To Cart</small></a>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="grid-item mb-4 col-lg-3 col-md-4 col-sm-6">
                            <div class="card ">
                                <div class="card-img">
                                    <div class="smooth"></div>
                                    <a href="Detail.html"><img class="card-img-top" src="img_main/product_1.jpg" alt="Card image cap"></a>
                                </div>
                                <div class="card-body">
                                    <a href="Detail.html">
                                        <h5 class="card-title">Card title</h5>
                                    </a>
                                    <p class="card-text">Đây là a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                </div>
                                <div class="card-footer">
                                    <a href="#"><small class="text-muted"><img src="img/add_shopping_cart_24px.png">Add To Cart</small></a>
                                    <div class="card-footer1">
                                        <a href="#"><small class="text-muted"><img src="img/add_shopping_cart_24px.png">Add To Cart</small></a>
                                    </div>
                                </div>

                            </div>
                        </div>


                    </div>
                </div>

            </div>
        </div>
        <!-- Start your project here-->

        <!-- SCRIPTS -->

        <!-- JQuery -->
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="js/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="js/mdb.min.js"></script>

        <!-- MDBootstrap Masonry  -->
        <script type="text/javascript" src="js/addons/masonry.pkgd.min.js"></script>

        <script type="text/javascript" src="js/addons/imagesloaded.pkgd.min.js"></script>


        <script>
            $('.grid').masonry({
                itemSelector: '.grid-item',
                columnWidth: '.grid-sizer',
                percentPosition: true
            });
        </script>


    </body>

</html>