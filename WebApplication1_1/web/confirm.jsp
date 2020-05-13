<%-- 
    Document   : confirm
    Created on : Oct 1, 2019, 8:09:30 PM
    Author     : quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <title>xác nhận đơn hàng</title>
        <link href="https://fonts.googleapis.com/css?family=Indie+Flower&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" media="screen" href="cssShop_Web.css">
        <link rel="stylesheet" type="text/css" media="screen" href="cssDetail.css">
        <link rel="stylesheet" type="text/css" media="screen" href="cssConfirm.css">
    </head>

    <body>
        <jsp:include page="navbar.jsp" />


        <div id="products" class="container">
            <h2 class="title">Thông tin thanh toán</h2>
            <h2 class="title">(nếu bạn có tài khoản sẽ nhận đc mã giảm giá khi mua hàng tại shop qua Email)</h2>
            <form method="post" action="customer-info" id="form">
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="inputName">Họ và tên</label>
                        <input type="text" class="form-control" id="inputName" placeholder="Họ và tên" name="name" value="${fullName}"<c:if test="${fullName ne null}">readonly</c:if>"
                               title="tên chỉ chữa chữ cái"/>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="inputPhoneNumber">Số điện thoại</label>
                            <input type="number" class="form-control" id="inputPhoneNumber" placeholder="Số điện thoại" name="mobie" value="${mobie}" <c:if test="${mobie ne null}">readonly</c:if>>
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="inputAddress"> địa chỉ</label>
                        <input type="text" class="form-control" id="inputAddress" placeholder="địa chỉ" name="address" value="${address}" <c:if test="${address ne null}">readonly</c:if>>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail">email</label>
                        <input type="email" class="form-control" id="inputEmail" placeholder="email" name="email" value="${email}" <c:if test="${email ne null}">readonly</c:if>>
                    </div>
                    <div class="form-group">
                        <label for="inputNote">note</label>
                        <input type="text" class="form-control" id="inputNote" placeholder="note" name="note">
                    </div>

                    <button  onclick="myFunction()" id="btnsubmitForm"  class="btn btn-primary">xác nhận</button>
                </form>
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


            function myFunction() {
                var x = document.forms["form"]["inputName"].value; //lấy ra giá trị của inputname
                if (x.trim() === "") {
                    x.title = "chưa nhập tên";
                    document.getElementById("btnsubmitForm").type = "button";
                    return false;
                } else {
                    document.getElementById("btnsubmitForm").type = "submit";
                }

                var x = document.forms["form"]["inputPhoneNumber"].value; //lấy ra giá trị của inputPhoneNumber
                if (x.trim() === "") {
                    alert("bạn chưa nhập Số điện thoại");
                    document.getElementById("btnsubmitForm").type = "button";
                    return false;
                } else if (x.length !== 10) {
                    alert("Số điện thoại phải là 10 số");
                    document.getElementById("btnsubmitForm").type = "button";
                    return false;
                } else {
                    document.getElementById("btnsubmitForm").type = "submit";
                }

                var x = document.forms["form"]["inputAddress"].value; //lấy ra giá trị của inputAddress
                if (x.trim() === "") {
                    alert("bạn chưa nhập Địa chỉ");
                    document.getElementById("btnsubmitForm").type = "button";
                    return false;
                } else {
                    document.getElementById("btnsubmitForm").type = "submit";
                }


            }

        </script>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


    </body>

</html>
