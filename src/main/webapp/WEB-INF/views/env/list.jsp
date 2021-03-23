<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<%@include file="../include/headerTop.jsp"%>

<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css" href="/resources/app-assets/vendors/css/charts/apexcharts.css">
<link rel="stylesheet" type="text/css" href="/resources/app-assets/vendors/css/extensions/tether-theme-arrows.css">
<link rel="stylesheet" type="text/css" href="/resources/app-assets/vendors/css/extensions/tether.min.css">
<link rel="stylesheet" type="text/css" href="/resources/app-assets/vendors/css/extensions/shepherd-theme-default.css">

<link rel="stylesheet" type="text/css" href="/resources/app-assets/vendors/css/tables/datatable/datatables.min.css">
<!-- END: Vendor CSS-->

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css" href="/resources/app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css" href="/resources/app-assets/css/core/colors/palette-gradient.css">
<!-- END: Page CSS-->

<%@include file="../include/header.jsp"%>
<!-- BEGIN: Main Menu-->

<%@include file="../include/menu.jsp"%>
<!-- END: Main Menu-->
</head>

<body>
<!-- BEGIN: Content-->
<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
        </div>
        <div class="content-body">
            <!-- Dashboard Analytics Start -->
            <!-- Page view list -->
            <section id="basic-datatable">
                <div class="row">
                    <div class="col-12"></div>
                </div>
                <!-- Table -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Environment Variable</h4>
                            </div>
                            <div class="card-content">
                                <div class="card-body card-dashboard">
                                    <div class="row">
                                        <div class="col-md-2 col-12 mb-1 btn-group dropdown">
                                            <select id="category" name="type">
                                                
                                            </select>
                                        </div>
                                        <div class="col-md-4 col-12 mb-1">
                                            <input type="text" class="form-control" id="keyword" name="keyword" value="" placeholder="Input keyword"/>                                       
                                        </div>
                                        <div class="col-md-6 col-12 mb-1">
                                            <a href="javascript:envUpdate()" class="btn btn-primary mr-1 mb-1">Search</a>
                                        </div>
                                    </div>
                                </div>
                                <div id="envListTable"></div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>

<%@include file="../include/footer.jsp"%>

<!-- BEGIN: Page Vendor JS-->
<script src="/resources/app-assets/vendors/js/charts/echarts/echarts.min.js"></script>

<script src="/resources/app-assets/vendors/js/tables/datatable/pdfmake.min.js"></script>
<script src="/resources/app-assets/vendors/js/tables/datatable/vfs_fonts.js"></script>
<script src="/resources/app-assets/vendors/js/tables/datatable/datatables.min.js"></script>
<script src="/resources/app-assets/vendors/js/tables/datatable/datatables.buttons.min.js"></script>
<script src="/resources/app-assets/vendors/js/tables/datatable/buttons.html5.min.js"></script>
<script src="/resources/app-assets/vendors/js/tables/datatable/buttons.print.min.js"></script>
<script src="/resources/app-assets/vendors/js/tables/datatable/buttons.bootstrap.min.js"></script>
<script src="/resources/app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js"></script>
<!-- END: Page Vendor JS-->

<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script>
    $(document).ready(function() {
        envUpdate();
    });

    function envUpdate() {
        var itemObj = new Object();

        envService.getList("/env/list", itemObj, function(data) {
            $("#envListTable").html(data);
        });
    }

    var envService = (function() {
        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";

        function getList(target, param, callback, error) {
            $.ajax({
                url: target,
                data: param,
                type: 'post',
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                },
                success: function (result, status, xhr) {
                    if(callback) {
                        callback(result);
                    }
                },
                error: function (xhr, status, e) {
                    if(error) {
                        error(e);
                    }
                    location.href = "/accessError";
                },
                complete: function () {
                }
            });
        }

        return {
            getList: getList
        }
    })();
</script>

</body>

</html>
