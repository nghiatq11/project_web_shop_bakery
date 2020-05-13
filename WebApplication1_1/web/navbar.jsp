<%-- 
    Document   : index2
    Created on : Aug 27, 2019, 6:12:28 PM
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
    <body>
        <div id="navbar1" class="">
            <nav class="navbar fixed-top navbar-expand-sm bg-light navbar-light">
                <!-- navbar navbar-expand-sm bg-light justify-content-center -->
                <!-- Brand/logo -->
                <a class="navbar-brand" href="#">
                    <img src="img/logo.png" alt="logo" class="navbar-brand">
                </a>

                <!-- Links -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="navbar-nav container">
                        <li class="nav-item">
                            <a class="nav-link home" href="get-list-product">
                                <fmt:message key="home"/></a>
<!--                            <ul class="dropLink">
                                <li><a href="#">Link 1</a></li>
                                <li><a href="#">Link 2</a></li>
                                <li><a href="#">Link 3</a></li>
                            </ul>-->
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#"><fmt:message key="header"/></a></a>
                            <ul class="dropLink">
                                <li><a href="#">Link 1</a></li>
                                <li><a href="#">Link 2</a></li>
                                <li><a href="#">Link 3</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><fmt:message key="shop"/></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">BLOG</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><fmt:message key="contact"/></a>
                        </li>
                    </ul>
                </div>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <fmt:message key="dropboxLanguage"/>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="?language=vi_VN"><fmt:message key="ViLanguage"/></a>
                        <a class="dropdown-item" href="?language=en_US"><fmt:message key="EnLanguage"/></a>
                    </div>
                </li>
                <div class="navbar-nav navbar-brand">
                    <c:if test="${sessionScope.LoginAccount eq null}">
                        <li class="nav-item">
                            <a class="nav-link" href="signin.jsp"><fmt:message key="Login"/></a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.LoginAccount ne null}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                ${sessionScope.nameAccount}
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="profile"><fmt:message key="myAccount"/></a>
                                <a class="dropdown-item" href="logout"><fmt:message key="logout"/></a>
                            </div>
                        </li>
                    </c:if>
                    <li class="nav-item">
                        <a class="nav-link" href="cart.jsp">
                            <img src="img/shopping_cart_24px.png">
                            <div class="quantityCart">${sessionScope.listCarts.size()}</div>
                        </a>
                    </li>
                </div>
            </nav>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
