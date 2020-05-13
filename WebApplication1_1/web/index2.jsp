<%-- 
    Document   : index2
    Created on : Aug 27, 2019, 6:12:28 PM
    Author     : quang
--%>

<%@page import="util.Helper"%>
<%@page import="dao.ImageDao"%>
<%@page import="entity.Image"%>
<%@page import="dao.ProductDao"%>
<%@page import="entity.Product"%>
<%@page import="entity.Product"%>
<%@page import="java.util.List"%>
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

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <title>Hello, world!</title>
        <link href="https://fonts.googleapis.com/css?family=Indie+Flower&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" media="screen" href="cssShop_Web.css">

    </head>

    <body>

        <jsp:include page="navbar.jsp" />

        <jsp:include page="heading.jsp" />

        <%
            Integer pageCount = (Integer) request.getAttribute("pageCount");
            Integer pageIndex = (Integer) request.getAttribute("pageIndex");
            Integer countAllProduct = (Integer) request.getAttribute("countAllProduct");
        %>

        



        <div id="products" class=" container">
            <div class="row">
                <div class="col-lg-9 col-lg-9a">
                    <div class="noo-catalog row">
                        <% if (countAllProduct >= pageIndex * 9) {%>
                        <p class="commerce-result-count"><fmt:message key="showing"/> <%= 9 * (pageIndex - 1) + 1%>–<%= 9 * pageIndex%>  <fmt:message key="of"/> <%= countAllProduct%> <fmt:message key="results"/></p>
                        <%} else {%>

                        <p class="commerce-result-count">Đang xem <%= 9 * (pageIndex - 1) + 1%>–<%= countAllProduct%>  trên <%= countAllProduct%> Sản phẩm</p>
                        <%}%>
                        <form class="commerce-ordering" method="post" action="sort-by-price">
                            <select name="orderby" class="orderby">
                                <option value="" selected="selected">Default sorting</option>
                                <option value="a-z">Sort by name: A to Z</option>
                                <option value="z-a">Sort by name: Z to A</option>
                                <option value="desc">Sort by price: high to low</option>
                                <option value="asc">Sort by price: low to high</option>
                            </select>
                            <div class="product-style-control">
                                <button type="submit" style="background-color: white"><img src="img/list_100px.png"></button>
                            </div>
                        </form>
                    </div>

                    <div class="sanpham">
                        <div class="row justify-content-around">

                            <c:forEach items="${result}" var="product" varStatus="loop"> 

                                <div class="col-lg-4 col-md-6">
                                    <div class="card ">
                                        <div class="card-img">
                                            <div class="smooth"></div>
                                            <!--sử sụng jsp Bean-->
                                            <!--<a href="detail.jsp?productId=${product.id}&categoryId=${product.categoryId}"><img class="card-img-top" src = "${imgAvatars.get(loop.count-1)}" alt="Card image cap">-->
                                            <a href="get-detail-product?productId=${product.id}&categoryId=${product.categoryId}"><img class="card-img-top" src = "${imgAvatars.get(loop.count-1)}" alt="Card image cap">
                                                </div>
                                                <div class="card-body">

                                                    <h5 class="card-title">${product.name}</h5>
                                            </a>
                                            <p class="card-text">${product.priceFormat}</p>
                                        </div>
                                        <div class="card-footer">

                                            <a onclick="GetLinkForTagAMobie()" class="linkAddToCart1" href="get-add-to-cart?productId=${product.id}&linkPrevious="><small class="text-muted"><img src="img/add_shopping_cart_24px.png"><fmt:message key="adToCart"/></small></a>

                                            <div class="card-footer1">

                                                <a onclick ="GetLinkForTagA()" class="linkAddToCart"  href="get-add-to-cart?productId=${product.id}&linkPrevious="><small class="text-muted"><img src="img/add_shopping_cart_24px.png">Thêm Vào Giỏ Hàng</small></a>

                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </c:forEach>
                        </div>
                    </div>


                    <div class="page container">
                        <%= Helper.pager(pageIndex, pageCount, 2, "get-list-product?page=")%>
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
                        <h3>Bakery</h3>
                    </div>
                    <img src="img/organici-love-me.png" class="noo-image-footer" alt="">
                </div>
            </div>
        </div>


        <jsp:include page="footer.jsp" />
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->



        <script>
            function GetLinkForTagA() { // function for Pc
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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>-->
        <!--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>-->
        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>-->
        <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>-->


    </body>

</html>
