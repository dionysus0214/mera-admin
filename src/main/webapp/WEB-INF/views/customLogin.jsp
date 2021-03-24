<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>Login Page - Vuexy - Bootstrap HTML admin template</title>
    <link rel="apple-touch-icon" href="/resources/app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/app-assets/vendors/css/vendors.min.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/resources/app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="/resources/app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="/resources/app-assets/css/components.css">
    <link rel="stylesheet" type="text/css" href="/resources/app-assets/css/themes/dark-layout.css">
    <link rel="stylesheet" type="text/css" href="/resources/app-assets/css/themes/semi-dark-layout.css">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/app-assets/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="/resources/app-assets/css/core/colors/palette-gradient.css">
    <link rel="stylesheet" type="text/css" href="/resources/app-assets/css/pages/authentication.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/style.css">
    <!-- END: Custom CSS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern 1-column  navbar-floating footer-static bg-full-screen-image  blank-page blank-page" data-open="click" data-menu="vertical-menu-modern" data-col="1-column">
    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <section class="row flexbox-container">
                    <div class="col-xl-8 col-11 d-flex justify-content-center">
                        <div class="card bg-authentication rounded-0 mb-0">
                            <div class="row m-0">
                                <div class="col-lg-6 d-lg-block d-none text-center align-self-center px-1 py-0">
                                    <img src="/resources/app-assets/images/pages/login.png" alt="branding logo">
                                </div>
                                <div class="col-lg-6 col-12 p-0">
                                    <div class="card rounded-0 mb-0 px-2">
                                        <div class="card-header pb-1">
                                            <div class="card-title">
                                                <h4 class="mb-0">Loginnnnn</h4>
                                            </div>
                                        </div>
                                        <p class="px-2">Welcome back, please login to your account.</p>
                                        <div class="card-content">
                                            <div class="card-body pt-1">
                                                <form id="loginForm" name="loginForm" action="/login" method="post">
                                                    <fieldset class="form-label-group form-group position-relative has-icon-left">
                                                        <input type="text" class="form-control" id="user-name" name="username" placeholder="Username" required>
                                                        <div class="form-control-position">
                                                            <i class="feather icon-user"></i>
                                                        </div>
                                                        <label for="user-name">Username</label>
                                                    </fieldset>

                                                    <fieldset class="form-label-group position-relative has-icon-left">
                                                        <input type="password" class="form-control" id="user-password" name="password" placeholder="Password" required>
                                                        <div class="form-control-position">
                                                            <i class="feather icon-lock"></i>
                                                        </div>
                                                        <label for="user-password">Password</label>
                                                    </fieldset>
                                                    <div class="form-group d-flex justify-content-between align-items-center">
                                                        <div class="text-left">
                                                            <fieldset class="checkbox" name="storedId" id="storedId">
                                                                <div class="vs-checkbox-con vs-checkbox-primary">
                                                                    <input type="checkbox" name="remember-me">
                                                                    <span class="vs-checkbox">
                                                                        <span class="vs-checkbox--check">
                                                                            <i class="vs-icon feather icon-check"></i>
                                                                        </span>
                                                                    </span>
                                                                    <span class="">Remember me</span>
                                                                </div>
                                                            </fieldset>
                                                        </div>
<%--                                                        <div class="text-right"><a href="auth-forgot-password.html" class="card-link">Forgot Password?</a></div>--%>
                                                    </div>
<%--                                                    <a href="auth-register.html" class="btn btn-outline-primary float-left btn-inline">Register</a>--%>
<%--                                                    <a href="javascript:login()" class="btn btn-primary float-right btn-inline">Login</a>--%>
                                                    <button type="submit" class="btn btn-primary float-right btn-inline">Login</button>
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                </form>
                                            </div>
                                        </div>
                                        <div class="login-footer">
<%--                                            <div class="divider">--%>
<%--                                                <div class="divider-text">OR</div>--%>
<%--                                            </div>--%>
<%--                                            <div class="footer-btn d-inline">--%>
<%--                                                <a href="#" class="btn btn-facebook"><span class="fa fa-facebook"></span></a>--%>
<%--                                                <a href="#" class="btn btn-twitter white"><span class="fa fa-twitter"></span></a>--%>
<%--                                                <a href="#" class="btn btn-google"><span class="fa fa-google"></span></a>--%>
<%--                                                <a href="#" class="btn btn-github"><span class="fa fa-github-alt"></span></a>--%>
<%--                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

            </div>
        </div>
    </div>
    <!-- END: Content-->


    <!-- BEGIN: Vendor JS-->
    <script src="/resources/app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="/resources/app-assets/js/core/app-menu.js"></script>
    <script src="/resources/app-assets/js/core/app.js"></script>
    <script src="/resources/app-assets/js/scripts/components.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <!-- END: Page JS-->

    <script>
        function login() {
            var param = new Object();
            param = $("#loginForm").serialize();

            $.ajax({
                url: "/loginPost2",
                data: param,
                type: 'post',
                success: function (data) {
                    console.log(data);
                    // redirectPage(0);
                },
                error: function (e) {
                    console.log(e);
                },
                complete: function () {
                }
            });
        }

        function redirectPage(code) {
            $('<form></form>', {name: "frmMenuHandle"}).appendTo($('body'));

            var frm = makeform("/dashboard/googleReport");
            if (code == "880") {
                frm.appendChild(AddData("loginResult", code));
            }
            frm.submit();
        }

        function cacheLoginInfo() {
            var storeId = $("#storedId").prop('checked');

            setCookie("soLoginUserSno", "", 0);
            if (storeId) {
                setCookie("soLoginUserSno", $("#uid").val(), 999);
            }
        }

        function setCookie(cname, cvalue, exdays) {
            var d = new Date();
            d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
            var expires = "expires=" + d.toUTCString();
            document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
        }

        function getCookie(cname) {
            var name = cname + "=";
            var ca = document.cookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }
    </script>
</body>
<!-- END: Body-->

</html>
