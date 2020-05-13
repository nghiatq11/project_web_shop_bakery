<%-- 
    Document   : Cart
    Created on : Sep 18, 2019, 5:50:39 PM
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
        <title>Cart</title>
        <link href="https://fonts.googleapis.com/css?family=Indie+Flower&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" media="screen" href="cssShop_Web.css">
        <link rel="stylesheet" type="text/css" media="screen" href="cssDetail.css">
        <link rel="stylesheet" type="text/css" media="screen" href="cssCart.css">
    </head>

    <body>
        <jsp:include page="navbar.jsp" />

        <div class="heading">
            <div class="content">
                <div class="h1">Shop Gird</div>
                <div class="h2">ORGANICI/SHOP GRID</div>
            </div>

        </div>

        <div id="products" class="container">
            <div class="row">
                <div class="col-lg-12 container">
                    <c:set scope="page" var="totalPrice" value="0" />
                    <form action="update-cart" method="post">
                        <table style="width: 100%">
                            <tr class="rowName">
                                <th class="productImg">Sản Phẩm</th>
                                <th class="productPrice">Giá 1 Sản Phẩm</th>
                                <th class="productQuantity">Số Lượng</th>
                                <th class="productTotal">Giá tiền</th>
                                <th class="productChoose">Lựa chọn</th>
                            </tr>

                            <c:forEach items="${sessionScope.listCarts}" var="cart" varStatus="track">
                                <tr class="rowDetail">
                                    <td class="rowDetailImg">
                                        <a href="get-detail-product?productId=${cart.productId}&categoryId=${cart.categoryId}">
                                            <div class="row">
                                                <div class="col-sm-6 col-md-6 col-lg-6">
                                                    <img src="${cart.productLinkImg}">
                                                </div>
                                                <div class="nameProduct col-sm-6 col-md-6 col-lg-6">${cart.productName}</div>
                                            </div>
                                        </a>
                                    </td>
                                    <td class="rowDetailPrice"><span>${cart.productPrice}</span></td>
                                    <td class="rowDetailQuantity"><input type="number" step="1" min="1" name="${cart.productId}" value="${cart.quantity}" class="quantityProduct" size="4"></td>
                                    <td class="rowDetailTotal"><fmt:setLocale value="vi_VN"/>
                                        <fmt:formatNumber value="${cart.amount}" type="currency"/></td>
                                    <td class="rowDetailChoose"><a href="remove-cart?productId=${cart.productId}">x</a></td>

                                </tr>
                                <span style="display: none" >${totalPrice = totalPrice + cart.amount }</span>
                            </c:forEach>



                            <tr>
                                <td></td>
                                <td><button type="submit" class="btn">Làm Mới</button></td>
                                <td class="rowDetail">
                                    <h3>Tổng tiền</h3>
                                </td>

                                <td class="rowDetail">
                                    <fmt:setLocale value="vi_VN"/>
                                    <fmt:formatNumber value="${totalPrice}" type="currency"/>
                                </td>
                                <td>
                                    <a href="go-checkout">
                                        <button type="button" class="btn">Xác Nhận</button>
                                    </a>
                                </td>

                            </tr>
                        </table>
                    </form>
                    <a href="remove-cart?productId=0">x</a>
                </div>
            </div>
            <div class="continueToShopping container"><a href="shop.html">Continue to shopping</a></div>
            <hr>
            <div class="row container">
                <div class="col-lg-5 col-md-12 divCode">
                    <h2>mã giảm giá</h2>
                    <p>nhập code giảm giá nếu bạn có</p>
                    <input type="text" name="code" class="input-text" id="code" value="" placeholder="Nhập mã code">
                    <button class="btnCheckCode">Sử dụng</button>
                </div>

                <div class="col-lg-5 col-md-12 divBill">
                    <h2>trạng thái đơn hàng</h2>
                    <table style="width: 100%">
                        <tr>
                            <th>Số tiền được giảm</th>
                            <td>2$</td>
                        </tr>
                        <tr>
                            <th>phí ship: </th>
                            <td>Chi phí vận chuyển sẽ được tính khi bạn đã cung cấp địa chỉ của bạn.</td>
                        </tr>
                        <tr>
                            <th>Tổng tiền: </th>
                            <td>10$</td>
                        </tr>
                    </table>
                    <a href="confirm.html">
                        <div class="checkOut">
                            <h4 style="padding-top: 10px">Thanh Toán</h4>
                        </div>
                    </a>
                </div>
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
