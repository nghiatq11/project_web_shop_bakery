<%-- 
    Document   : signin
    Created on : Oct 20, 2019, 2:00:10 AM
    Author     : quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="loginForm/assets/css/bootstrap/bootstrap.min.css">

        <!-- link css form đăng ký -->
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="loginForm/assets/css/fms/form1.css">
    </head>

    <body>

        <section id="cover" class="c-signin" style="background-image: url(loginForm/assets/images/bakery-wallpaper-hd-1.jpg);"></section>

        <!-- Begin: Login form -->
        <!-- <div id="login-blur" style="background-image: url(img/bg_common2.jpg);"></div> -->
        <div id="login-f">
            <div class="middle">
                <div id="dangNhap" style="display: block; transition: 2s " class="login-panel">
                    <div class="col">
                        <% String message = (String) request.getAttribute("message");
                            if (message == null) {
                        %>
                        <h3 style="color: white"> Chào mừng trở lại! </h3>
                        <%} else {%>
                        <h3 style="color: white"> <%= message%> </h3>
                        <%}%>
                    </div>
                    <form class="js-validation-signin" method="post" action="login">
                        <div class="form-group">
                            <div class="col">
                                <div class="form-material floating">
                                    <input type="email" class="f-control" id="login-email" name="email" onchange="setLabelLogin()">
                                    <label for="login-username" id="l-login">
                                        <i class="far fa-envelope fa-fw"></i>
                                        Email
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col">
                                <div class="form-material floating">
                                    <input type="password" class="f-control" id="login-password" name="password" onchange="setLabelPassword()">
                                    <label for="login-password" id="l-password">
                                        <i class="fas fa-key fa-fw"></i>
                                        Mật khẩu
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col">
                                <label class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="login-remember-me" name="login-remember-me">
                                    <span class="custom-control-indicator"></span>
                                    <span class="custom-control-description">Ghi nhớ tài khoản</span>
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col">
                                <button type="submit" class="btn btn-sm" id="buttonSubmit">
                                    <i class="fa fa-sign-in" aria-hidden="true"></i> Đăng nhập
                                </button>
                            </div>
                        </div>
                        <div class="form-group" style="margin-top: 10px;">
                            <div class="col">
                                <a  onclick="changeLogin()" class="link-effect mr-5" style="color: #9e6a1c ; cursor: pointer">
                                    <i class="fas fa-edit fa-fw"></i> Tạo tài khoản
                                </a>
                                <a class="link-effect" href="reminder_password.html">
                                    <i class="fas fa-lock fa-fw"></i> Quên mật khẩu?
                                </a>
                            </div>
                        </div>

                    </form>


                </div>

                <!--start đăng ký   -->
                <div id="dangky" class="container" style="display: none; transition: 2s">
                    <div class="row justify-content-center">
                        <div class="col-md-8">
                            <div class="card">
                                <div class="card-header"><h3>Đăng Ký - để nhận mã Code giảm giá từ Shop Nhé!</h3></div>
                                <div class="card-body">

                                    <form id="form" class="form-horizontal js-validation-signin" method="post" action="add-account-and-accountDetail">

                                        <div class="form-group">
                                            <div class="col">
                                                <div class="form-material floating">
                                                    <input type="text" class="f-control" id="login-email" name="name" onchange="setLabelName()" required>
                                                    <label for="login-username" id="l-name">
                                                        <i class="fa fa-user fa" aria-hidden="true"></i>
                                                        Họ và Tên
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col">
                                                <div class="form-material floating">
                                                    <!--<input type="number" class="f-control" id="login-email" name="phonenumer" onchange="setLabelCfPhoneNumer()">-->
                                                    <select name="gender" class="f-control" id="login-email" onchange="setLabelCfGender()"style="background-color: #9e6a1c00">
                                                        <option value=""></option>
                                                        <option value="1" style="color: black">Nam</option>
                                                        <option value="0" style="color: black">Nữ</option>
                                                        <option value="2" style="color: black">Khác</option>
                                                    </select>
                                                    <label for="login-username" id="l-confirmGender">
                                                        <i class="fas fa-transgender-alt"></i>
                                                        Giới Tính
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col">
                                                <div class="form-material floating">
                                                    <input type="number" class="f-control" id="inputPhoneNumber" name="phonenumer" onchange="setLabelCfPhoneNumer()" pattern="[0-9]"
                                                           title="sai format số điện thoại">
                                                    <label for="login-username" id="l-confirmPhoneNumber">
                                                        <i class="fas fa-phone-volume"></i>
                                                        Số điện thoại
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col">
                                                <div class="form-material floating">
                                                    <input type="text" class="f-control" id="login-email" name="address" onchange="setLabelCfAddress()" required>
                                                    <label for="login-username" id="l-confirmAddress">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                        Địa Chỉ
                                                    </label>
                                                </div>
                                            </div>
                                        </div>



                                        <div class="form-group">
                                            <div class="col">
                                                <div class="form-material floating">
                                                    <input type="email" class="f-control" id="login-email" name="email" onchange="setLabelEmail()" required>
                                                    <label for="login-username" id="l-email">
                                                        <i class="fa fa-envelope fa" aria-hidden="true"></i>
                                                        Email
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col">
                                                <div class="form-material floating">
                                                    <input type="password" class="f-control" id="matKhau" name="pass" onchange="setLabelPass()" required>
                                                    <label for="login-username" id="l-pass">
                                                        <i class="fa fa-lock fa-lg" aria-hidden="true"></i>
                                                        Mật Khẩu
                                                    </label>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <div class="col">
                                                <div class="form-material floating">
                                                    <input type="password" class="f-control" id="confirmMatKhau2" name="confirmPass" onchange="setLabelCfPass()" required>
                                                    <label for="login-username" id="l-confirmPass">
                                                        <i class="fa fa-lock fa-lg" aria-hidden="true"></i></i>
                                                        Xác Nhận Mật Khẩu
                                                    </label>
                                                </div>
                                            </div>
                                        </div>



                                        <div class="form-group " onclick="checkLogin()" >
                                            <button  id="btnDangKy2" class="btn btn-primary btn-lg btn-block">Đăng ký</button>
                                        </div>
                                        <div class="login-register">
                                            <button onclick="changeLogin()" id="btnLogin" type="button" class="btn btn-primary btn-lg btn-block login-button">Đăng Nhập</button>
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <!--end đăng ký-->

            </div>

        </div>
        <!-- End: Login form -->


        <!-- form đăng ký -->



        <!-- Bootstrap core JavaScript-->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script>
            
            
            function checkLogin() {
                var x = document.forms["form"]["inputPhoneNumber"].value; //lấy ra giá trị của inputPhoneNumber
                if (x.trim() === "") {
                    alert("bạn chưa nhập Số điện thoại");
                    document.getElementById("btnDangKy2").type = "button";
                    return false;
                } else if (x.length !== 10) {
                    alert("Số điện thoại phải là 10 số");
                    document.getElementById("btnDangKy2").type = "button";
                    return false;
                } else {
                    document.getElementById("btnDangKy2").type = "submit";
                }
                
                
//                var btnDangKy = document.getElementById("btnDangKy");
                var m = document.forms["form"]["matKhau"].value;
                var c = document.forms["form"]["confirmMatKhau2"].value;
              
                if (m === c) {
                    document.getElementById("btnDangKy2").type = "submit";
                } else {
                    document.getElementById("btnDangKy2").type = "button";
                    alert("Mật khẩu không trùng khớp");
                }
            }
        </script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js "></script>

        <!-- <script src="assets/js/jquery/jquery.min.js"></script> -->
        <script src="loginForm/assets/js/bootstrap/popper.min.js"></script>
        <script src="loginForm/assets/js/bootstrap/bootstrap.min.js"></script>

        <!-- Validate -->
        <script src="loginForm/assets/js/authentic/jquery.validate.min.js"></script>
        <script src="loginForm/assets/js/authentic/op_auth_signin.js"></script>

        <!-- scrip form đăng ký -->
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script>
            function setLabelLogin() {
                var element = document.getElementById('l-login');
                element.classList.add("focus-lable");
            }



            function setLabelPassword() {
                var element = document.getElementById('l-password');
                element.classList.add("focus-lable");
            }


            function setLabelName() {
                var element = document.getElementById('l-name');
                element.classList.add("focus-lable");
            }
            function setLabelEmail() {
                var element = document.getElementById('l-email');
                element.classList.add("focus-lable");
            }
            function setLabelPass() {
                var element = document.getElementById('l-pass');
                element.classList.add("focus-lable");
            }
            function setLabelCfPass() {
                var element = document.getElementById('l-confirmPass');
                element.classList.add("focus-lable");
            }
            function setLabelCfPhoneNumer() {
                var element = document.getElementById('l-confirmPhoneNumber');
                element.classList.add("focus-lable");
            }
            function setLabelCfAddress() {
                var element = document.getElementById('l-confirmAddress');
                element.classList.add("focus-lable");
            }
            function setLabelCfGender() {
                var element = document.getElementById('l-confirmGender');
                element.classList.add("focus-lable");
            }
        </script>
        <script>
            function changeLogin() {
                var btnLogin = document.getElementById("dangNhap");
                var btnRegistration = document.getElementById("dangky");
                if (btnLogin.style.display === "none") {
                    btnLogin.style.display = "block";
                    btnRegistration.style.display = "none";
                } else {
                    btnLogin.style.display = "none";
                    btnRegistration.style.display = "block";
                }
            }
        </script>



    </body>

</html>
