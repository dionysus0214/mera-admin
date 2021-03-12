<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@include file="include/headerTop.jsp"%>

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/app-assets/vendors/css/charts/apexcharts.css">
    <link rel="stylesheet" type="text/css" href="/resources/app-assets/vendors/css/extensions/tether-theme-arrows.css">
    <link rel="stylesheet" type="text/css" href="/resources/app-assets/vendors/css/extensions/tether.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/app-assets/vendors/css/extensions/shepherd-theme-default.css">

    <link rel="stylesheet" type="text/css" href="/resources/app-assets/vendors/css/tables/datatable/datatables.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/app-assets/vendors/css/pickers/pickadate/pickadate.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/app-assets/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="/resources/app-assets/css/core/colors/palette-gradient.css">
    <!-- END: Page CSS-->

</head>
<!-- END: Head-->

<%@include file="include/header.jsp"%>

<!-- BEGIN: Main Menu-->
<%@include file="include/menu.jsp"%>
<!-- END: Main Menu-->

<!-- BEGIN: Content-->
<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
            <div class="content-header-left col-md-9 col-12 mb-2">
                <div class="row breadcrumbs-top">
                    <div class="col-12">
                        <h2 class="content-header-title float-left mb-0">Main Page</h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/menu">Home</a>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
<%--            <div class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">--%>
<%--                <div class="form-group breadcrum-right">--%>
<%--                    <div class="dropdown">--%>
<%--                        <button class="btn-icon btn btn-primary btn-round btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="feather icon-settings"></i></button>--%>
<%--                        <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="#">Chat</a><a class="dropdown-item" href="#">Email</a><a class="dropdown-item" href="#">Calendar</a></div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>
        <div class="content-body">
        </div>
    </div>
</div>
<!-- END: Content-->

<div class="sidenav-overlay"></div>
<div class="drag-target"></div>

<%@include file="include/footer.jsp"%>


<!-- BEGIN: Page Vendor JS-->
<script src="/resources/app-assets/vendors/js/charts/echarts/echarts.min.js"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Theme JS-->
<script src="/resources/app-assets/vendors/js/pickers/pickadate/picker.js"></script>
<script src="/resources/app-assets/vendors/js/pickers/pickadate/picker.date.js"></script>
<script src="/resources/app-assets/vendors/js/pickers/pickadate/picker.time.js"></script>
<script src="/resources/app-assets/vendors/js/pickers/pickadate/legacy.js"></script>

<script src="/resources/app-assets/vendors/js/tables/datatable/pdfmake.min.js"></script>
<script src="/resources/app-assets/vendors/js/tables/datatable/vfs_fonts.js"></script>
<script src="/resources/app-assets/vendors/js/tables/datatable/datatables.min.js"></script>
<script src="/resources/app-assets/vendors/js/tables/datatable/datatables.buttons.min.js"></script>
<script src="/resources/app-assets/vendors/js/tables/datatable/buttons.html5.min.js"></script>
<script src="/resources/app-assets/vendors/js/tables/datatable/buttons.print.min.js"></script>
<script src="/resources/app-assets/vendors/js/tables/datatable/buttons.bootstrap.min.js"></script>
<script src="/resources/app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js"></script>

<!-- BEGIN: Page JS-->
<%--<script src="/resources/app-assets/js/scripts/charts/chart-echart.js"></script>--%>

<script>
    $(document).ready(function () {

    });
</script>
<!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>
