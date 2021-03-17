<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/headerTop.jsp"%>

</head>
<!-- END: Head-->

<%@include file="../include/header.jsp"%>
<!-- BEGIN: Main Menu-->
<%@include file="../include/menu.jsp"%>
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
                        <h2 class="content-header-title float-left mb-0">Google Analytics</h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/main">Dashboard</a>
                                </li>
                                <li class="breadcrumb-item active">Google Analytics
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
            <!-- Dashboard Analytics Start -->
            <iframe width="1200" height="768" src="https://datastudio.google.com/embed/reporting/c5286a21-5f7d-435a-8102-3adf42759c63/page/0m2jB" frameborder="0" style="border:0" allowfullscreen></iframe>
            <!-- Dashboard Analytics end -->

        </div>
    </div>
</div>
<!-- END: Content-->

<div class="sidenav-overlay"></div>
<div class="drag-target"></div>

<%@include file="../include/footer.jsp"%>

</body>
<!-- END: Body-->

</html>
