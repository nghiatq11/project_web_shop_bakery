<%-- 
    Document   : listProductSearch
    Created on : Sep 15, 2019, 2:50:09 PM
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
<!DOCTYPE html>
<html>

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


        <!-- Bootstrap CSS -->
        <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link href="css/jquery.range.css" rel="stylesheet">
        <title>Hello, world!</title>
        <link href="https://fonts.googleapis.com/css?family=Indie+Flower&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" media="screen" href="cssShop_Web.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css_full.css">

    </head>

    <body>
        <jsp:include page="navbar.jsp" /> 

        <jsp:include page="heading.jsp" /> 
        <%
            Integer pageCount = (Integer) request.getAttribute("pageCount");
            Integer pageIndex = (Integer) request.getAttribute("pageIndex");
            Integer countAllProductBySeach = (Integer) request.getAttribute("countAllProductBySeach");
        %>

        <div id="products" class=" container">
            <div class="row">
                <div class="col-lg-9 col-lg-9a">
                    <div class="noo-catalog row">
                        <% if (countAllProductBySeach >= pageIndex * 9) {%>
                        <p class="commerce-result-count">Đang xem <%= 9 * (pageIndex - 1) + 1%>–<%= 9 * pageIndex%>  trên <%= countAllProductBySeach%> Sản phẩm</p>
                        <%} else {%>

                        <p class="commerce-result-count">Đang xem <%= 9 * (pageIndex - 1) + 1%>–<%= countAllProductBySeach%>  trên <%= countAllProductBySeach%> Sản phẩm</p>
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


                            <c:forEach items="${listSearch}" var="product" varStatus="loop"> 

                                <div class="col-lg-4 col-md-6">
                                    <div class="card ">
                                        <div class="card-img">
                                            <div class="smooth"></div>
                                            <a href="get-detail-product?productId=${product.id}&&categoryId=${product.categoryId}"><img class="card-img-top" src = "${imageAvatars.get(loop.count-1)}" alt="Card image cap">
                                                </div>
                                                <div class="card-body">

                                                    <h5 class="card-title">${product.name}</h5>
                                            </a>
                                            <p class="card-text">${product.priceFormat}</p>
                                        </div>
                                        <div class="card-footer">
                                            <a href="#"><small class="text-muted"><img src="img/add_shopping_cart_24px.png">Thêm Vào giỏ hàng</small></a>
                                            <div class="card-footer1">
                                                <a href="get-add-to-cart?productId=${product.id}"><small class="text-muted"><img src="img/add_shopping_cart_24px.png">Thêm Vào Giỏ Hàng</small></a>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </c:forEach>
                        </div>
                    </div>
                    <div class="page container">
                        <%= Helper.pager(pageIndex, pageCount, 2, "process-request?page=")%>
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


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


    </body>

</html>

