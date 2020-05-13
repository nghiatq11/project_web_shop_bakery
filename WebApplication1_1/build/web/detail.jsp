<%-- 
    Document   : detail
    Created on : Aug 28, 2019, 2:13:05 AM
    Author     : quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html>

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> 

        <title>Detail</title>
        <link href="https://fonts.googleapis.com/css?family=Indie+Flower&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" media="screen" href="cssShop_Web.css">
        <link rel="stylesheet" type="text/css" media="screen" href="cssDetail2.css">
    </head>

    <body>

        <jsp:include page="navbar.jsp" /> 

        <jsp:include page="heading.jsp" /> 


        


        <!--sử dụng jspBean--> 
        <%--<jsp:useBean id="productDao" scope="page" class="dao.ProductDao"/>--%>
        <%--<c:set value="${productDao.getOne(param.productId)}" var="productDetail" scope="page"/>--%>
        <div id="products" class="container">
            <div class="row">
                <div class="col-lg-9 container">
                    <div class="detailProduct row">


                        <div class="image col-lg-6 col-md-6">
                            <div>
                                <div class="container">
                                    <div class="mySlides">
                                        <div class="numbertext">1 / 5</div>
                                        <img src="${imgAvatar.linkImg}" style="width:100%">
                                    </div>
                                    <c:forEach items="${listSubImg}" var="listSubImg" varStatus="i">
                                        <div class="mySlides">
                                            <div class="numbertext">${i.count+1} / 5</div>
                                            <img src="${listSubImg.linkImg}" style="width:100%">
                                        </div>
                                    </c:forEach>

                                    <a class="prev" onclick="plusSlides(-1)">❮</a>
                                    <a class="next" onclick="plusSlides(1)">❯</a>

                                    <!-- <div class="caption-container">
                                        <p id="caption"></p>
                                    </div> -->

                                    <div class="row">
                                        <div class="column">
                                            <img class="demo cursor" src="${imgAvatar.linkImg}" style="width:100%" onclick="currentSlide(1)">
                                        </div>
                                        <c:forEach items="${listSubImg}" var="listSubImg" varStatus = "i">
                                            <div class="column">
                                                <img class="demo cursor" src="${listSubImg.linkImg}" style="width:100%" onclick="currentSlide(${i.count+1})">
                                            </div>
                                        </c:forEach>

                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="decription col-lg-6 col-md-6">
                            <h1 class="product_title">${productDetail.name}</h1>
                            <p class="price"><span class="amount">${productDetail.priceFormat}</span></p>
                            <p class="description">${productDetail.descripsion}</p>
                            <div class="product_meta">
                                <span class="posted_in">Category: <a href="#">Vegetable</a></span><br>
                                <span class="tagged_as">Tags: <a href="#">cucumbers</a> <a href="#">vegetables</a></span>
                            </div>
                            <form class="cart" action="get-add-to-cart" method="get">
                                <div class="quantity">
                                    <input type="number" step="1" min="1" name="quantity" value="1" title="Qty" class="input-text qty text" size="4">

                                    <input id="getLink" style="display: none" name="linkPrevious" >
                                    <input style="display: none" name="productId" value=${productId}>
                                </div>
                                <button onclick="MyGetLinkForButton()" type="submit" class="single_add_to_cart_button button">Add to cart</button>
                            </form>
                            <div class="yith-wcwl-add-to-wishlist">
                                <div class="yith-wcwl-add-button">
                                    <a href="#" class="add_to_wishlist"></a>
                                </div>
                            </div>
                            <div class="clear"></div>
                            <div class="noo-social-share">
                                <span>Share:</span>
                                <a href="#share" class="noo-share" title="Share on Facebook">
                                    <img src="img/share_on_facebook_64px.png">
                                </a>
                                <a href="#share" class="noo-share" title="Share on Twitter">
                                    <img src="img/share_on_google_logo_64px.png">
                                </a>
                                <a href="#share" class="noo-share" title="Share on Google+">
                                    <img src="img/share_on_twitter_64px.png">
                                </a>
                                <a href="#share" class="noo-share" title="Share on Pinterest">
                                    <i class="fa fa-pinterest"></i>
                                </a>
                            </div>

                        </div>
                    </div>


                    <div class="btDescription_Comment">
                        <ul class="btnDescription">
                            <li id="BTN" class="active" onclick="myFunction1()">
                                <a data-toggle="tab" href="#tab-1">Miêu tả chi tiết</a>
                            </li>
                            <li id="BTN2" onclick="myFunction2()">
                                <a data-toggle="tab" href="#tab-2">Nhận xét</a>
                            </li>
                        </ul>

                        <div class="contentDescription" id="myDIV">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Maecenas tristique gravida, odio et sagi ttis justo. Susp endisse ultricies nisi vel quam suscipit, et
                                rutrum odio porttitor. Donec dictum non nulla ut lobortis. Maecenas tristique gravida, odio et sagi ttis justo. Aliquam vitae mi a eros tincidunt ultricies. Donec porta gravida arcu. Morbi facilisis lorem felis, eu inerdum
                                quam scelerisque eu. Phasellus vel turpis dictum, pulvinar nulla</p>
                        </div>

                        <div class="contentComment" id="myDIV2">
                            <div class="media">
                                <img src="img/user.jpg" class="mr-3" alt="...">
                                <div class="media-body">
                                    <h5 class="mt-0">Media heading</h5>
                                    Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.

                                    <div class="media mt-3">
                                        <a class="mr-3" href="#">
                                            <img src="img/user.jpg" class="mr-3" alt="...">
                                        </a>
                                        <div class="media-body">
                                            <h5 class="mt-0">Media heading</h5>
                                            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="media">
                                <img src="img/user.jpg" class="mr-3" alt="...">
                                <div class="media-body">
                                    <h5 class="mt-0">Media heading</h5>
                                    Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.

                                    <div class="media mt-3">
                                        <a class="mr-3" href="#">
                                            <img src="img/user.jpg" class="mr-3" alt="...">
                                        </a>
                                        <div class="media-body">
                                            <h5 class="mt-0">Media heading</h5>
                                            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="media">
                                <img src="img/user.jpg" class="mr-3" alt="...">
                                <div class="media-body">
                                    <h5 class="mt-0">Media heading</h5>
                                    Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.

                                    <div class="media mt-3">
                                        <a class="mr-3" href="#">
                                            <img src="img/user.jpg" class="mr-3" alt="...">
                                        </a>
                                        <div class="media-body">
                                            <h5 class="mt-0">Media heading</h5>
                                            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="sanpham">
                        <div class="relatedProducts ">Các Sản Phẩm Liên Quan</div>
                        <div class="row">
                            <c:forEach items="${productRelatives}" var="product" varStatus="i">
                                <div class="col-lg-4 col-md-6">
                                    <div class="card ">
                                        <div class="card-img">
                                            <div class="smooth"></div>
                                            <a href="get-detail-product?productId=${product.id}&categoryId=${product.categoryId}"><img class="card-img-top" src="${imageProductRelative.get(i.count-1)}" alt="Card image cap"></a>
                                        </div>
                                        <div class="card-body">
                                            <a href="get-detail-product?productId=${product.id}&categoryId=${product.categoryId}">
                                                <h5 class="card-title">${product.name}</h5>
                                            </a>
                                            <p class="card-text">${product.priceFormat}</p>
                                        </div>
                                        <div class="card-footer">
                                            <a onclick ="GetLinkForTagAMobie()" class="linkAddToCart"  href="get-add-to-cart?productId=${product.id}&linkPrevious="><small class="text-muted"><img src="img/add_shopping_cart_24px.png">Thêm Vào Giỏ Hàng</small></a>
                                            <div class="card-footer1">
                                                <a onclick ="GetLinkForTagAPC()" class="linkAddToCart"  href="get-add-to-cart?productId=${product.id}&linkPrevious="><small class="text-muted"><img src="img/add_shopping_cart_24px.png">Thêm Vào Giỏ Hàng</small></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                </div>


                <jsp:include page="sideBar.jsp" />

            </div>
        </div>


        <div class="footerImg">
            <div class="backgroundColor">
                <div class="container">
                    <div class="col-md-7">
                        <h4 class="widget-title">- Every day fresh -</h4>
                        <h3>organic food</h3>
                    </div>
                    <img src="img/organici-love-me.png" class="noo-image-footer" alt="">
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp" />

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        

        <script>
            function MyGetLinkForButton() {
                var link = window.location.href;// lấy ra link hiện tại của trang web
                document.getElementById("getLink").value = link;
            }

            function GetLinkForTagA() {
                var link = window.location.href;// lấy ra link hiện tại của trang web

                document.getElementById("inputAddToCart").value = link;
                document.getElementById("formAddToCart").submit();
            }

        </script>

        <script>
            function GetLinkForTagAPC() { // function for Pc
                var link = window.location.href;// lấy ra link hiện tại của trang web
                var x = document.getElementsByClassName("linkAddToCart");//laays ra mảng link a có class là "linkAddToCart"
                for (var i = 0; i < x.length; i++) {
                    x[i].href = x[i].href + link;
                }
            }
            function GetLinkForTagAMobie() { // function for mobie
                var link = window.location.href;// lấy ra link hiện tại của trang web
                var x = document.getElementsByClassName("linkAddToCart1");//laays ra mảng link a có class là "linkAddToCart"
                for (var i = 0; i < x.length; i++) {
                    x[i].href = x[i].href + link;
                }
            }

        </script>

        <script>
            function myFunction1() {
                var x = document.getElementById("myDIV");
                var y = document.getElementById("myDIV2");
                var a = document.getElementById("BTN");
                var b = document.getElementById("BTN2");
                if (x.style.display === "none") {
                    a.style.backgroundColor = "rgba(0, 238, 255, 0.596)";
                    b.style.backgroundColor = "rgba(0, 255, 255, 0.158)";
                    y.style.display = "none";
                    x.style.display = "block";
                }
            }

            function myFunction2() {
                var x = document.getElementById("myDIV");
                var y = document.getElementById("myDIV2");
                var a = document.getElementById("BTN");
                var b = document.getElementById("BTN2");
                if (x.style.display !== "none") {
                    b.style.backgroundColor = "rgba(0, 238, 255, 0.596)";
                    a.style.backgroundColor = "rgba(0, 255, 255, 0.158)";
                    y.style.display = "block";
                    x.style.display = "none";
                }
            }
        </script>

        <script>
            var slideIndex = 1;
            showSlides(slideIndex);

            function plusSlides(n) {
                showSlides(slideIndex += n);
            }

            function currentSlide(n) {
                showSlides(slideIndex = n);
            }

            function showSlides(n) {
                var i;
                var slides = document.getElementsByClassName("mySlides");
                var dots = document.getElementsByClassName("demo");
                var captionText = document.getElementById("caption");
                if (n > slides.length) {
                    slideIndex = 1
                }
                if (n < 1) {
                    slideIndex = slides.length
                }
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " active";
                captionText.innerHTML = dots[slideIndex - 1].alt;
            }
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>-->
        <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>-->


    </body>

</html>
