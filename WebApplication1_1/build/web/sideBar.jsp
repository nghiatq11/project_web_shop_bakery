<%-- 
    Document   : sideBar
    Created on : Sep 12, 2019, 1:11:37 AM
    Author     : quang
--%>

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


        <!-- Bootstrap CSS -->
        <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <title>Hello, world!</title>
        <link href="https://fonts.googleapis.com/css?family=Indie+Flower&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" media="screen" href="cssShop_Web.css">

    </head>

    <body>
        <div id="sideBar" class="col-lg-3">
            <div class="search">
                <h3 class="widget-title"><fmt:message key="search"/></h3>
                <nav class="navbar navbar-light">
                    <form class="form-inline" action="process-request" method="get">
                        <input class="form-control mr-sm-2 " type="text" name="search" placeholder="Search" >
                        <select name="type" class="searchAndFilerCategory">
                            <option value="1">Name</option>
                            <option value="2">category</option>
                        </select>
                        <button type="sumbit" value="Search"/>
                        <a href="#"><img src="img/search_26px.png"></a>
                    </form>
                </nav>
            </div>

            <div class="category">
                <h3 class="widget-title"><fmt:message key="category"/></h3>
                <ul class="fontlistCategory listCategory">
                    <c:forEach items="${listCategory}" var="listCategory">
                        <li><a href="get-category?categoryId=${listCategory.id}">${listCategory.name}</a></li>

                    </c:forEach>
                </ul>
            </div>

            <div class=" filler">
                <h3 class="widget-title"><fmt:message key="fillByPrice"/></h3>
                <div class="fillterMoney">
                    <ul class="fontlistCategoryFilter listCategory">
                        <c:forEach items="${listFilterPrice}" var="listFilterPrice">
<%--<fmt:formatNumber value="${listFilterPrice.priceFrom}" type="currency"/>--%>
                            <li><a href="get-products-by-filter-price?idFilterPrice=${listFilterPrice.id}" class="filterPrice">
                                    <p class="card-text">${listFilterPrice.getPriceFormat(listFilterPrice.priceFrom)} - ${listFilterPrice.getPriceFormat(listFilterPrice.toPrice)}</p></a></li>
                                </c:forEach>

                    </ul>
                </div>
            </div>

            <div class="popularProducts">
                <h3 class="widget-title"><fmt:message key="topProduct"/></h3>
                <div class="trtr">
                    <table style="width:100%">

                        <tr>
                            <td rowspan="2" class="colImg"><img src="img/popular_product_3.png" class="imgPopular"></td>
                            <td><a href="#" class="nameProduct">FRENCH BREAD</a></td>
                        </tr>
                        <tr>
                            <td class="pricePopularProduct">$10.00</td>
                        </tr>

                    </table>
                </div>
                <div class="trtr">
                    <table style="width:100%">

                        <tr>
                            <td rowspan="2" class="colImg"><img src="img/popular_product_4.jpg" class="imgPopular"></td>
                            <td><a href="#" class="nameProduct">FRENCH BREAD</a></td>
                        </tr>
                        <tr>
                            <td class="pricePopularProduct">$10.00</td>
                        </tr>

                    </table>
                </div>
                <div class="trtr">
                    <table style="width:100%">

                        <tr>
                            <td rowspan="2" class="colImg"><img src="img/popular_product_5.jpg" class="imgPopular"></td>
                            <td><a href="#" class="nameProduct">FRENCH BREAD</a></td>
                        </tr>
                        <tr>
                            <td class="pricePopularProduct">$10.00</td>
                        </tr>

                    </table>
                </div>
                <div class="trtr">
                    <table style="width:100%">

                        <tr>
                            <td rowspan="2" class="colImg"><img src="img/popular_product_6.png" class="imgPopular"></td>
                            <td><a href="#" class="nameProduct">FRENCH BREAD</a></td>
                        </tr>
                        <tr>
                            <td class="pricePopularProduct">$10.00</td>
                        </tr>

                    </table>
                </div>
            </div>

        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


    </body>

</html>
