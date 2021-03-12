<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/headerTop.jsp"%>

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/app-assets/vendors/css/ui/prism.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/app-assets/vendors/css/file-uploaders/dropzone.min.css">
    <!-- END: Vendor CSS-->

    <link rel="stylesheet" type="text/css" href="/resources/app-assets/css/plugins/file-uploaders/dropzone.css">

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
                        <h2 class="content-header-title float-left mb-0">Gyanking</h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/main">Home</a>
                                </li>
                                <li class="breadcrumb-item"><a href="/gyanking/gyanMainList">Main List</a>
                                </li>
                                <li class="breadcrumb-item active">Detail View
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
                <div class="form-group breadcrum-right">

                    <button type="button" class="btn btn-outline-success" data-toggle="modal" data-backdrop="false" data-target="#backdrop">
                        답변 하기
                    </button>
<%--                    <div class="dropdown">--%>
<%--                        <button class="btn-icon btn btn-primary btn-round btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="feather icon-settings"></i></button>--%>
<%--                        <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="#">Chat</a><a class="dropdown-item" href="#">Email</a><a class="dropdown-item" href="#">Calendar</a></div>--%>
<%--                    </div>--%>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade text-left" id="backdrop" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel33">Inline Login Form </h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <label>카테고리 선택: </label>
                            <div class="form-group mb-1">
                                <div class="dropdown">
                                    <button class="btn btn-info dropdown-toggle mr-1" type="button" id="dropdownMenuButton3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Info
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton3">
                                        <a class="dropdown-item" href="#">Option 1</a>
                                        <a class="dropdown-item" href="#">Option 2</a>
                                        <a class="dropdown-item" href="#">Option 3</a>
                                    </div>
                                </div>
                            </div>

                            <label>Tag: </label>
                            <div class="form-group">
                                <input type="text" placeholder="tag" class="form-control">
                            </div>

                            <label>Title: </label>
                            <div class="form-group">
                                <input type="text" placeholder="title" class="form-control">
                            </div>
                            <label>Content: </label>
                            <div class="form-group">
                                <input type="text" placeholder="title" class="form-control">
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" id="basicTextarea" rows="3" placeholder="Textarea"></textarea>
                            </div>

                            <div class="form-group dropzone dropzone-area" id="dpz-file-limits">
                                <div class="dz-message">Drop Files Here To Upload</div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Accept</button>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <div class="content-body">

            <section id="collapsible">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card collapse-icon accordion-icon-rotate">
                            <div class="card-header">
                                <h4 class="card-title">Default</h4>
                            </div>
                            <div class="card-content">
                                <div class="card-body">
                                    <p>
                                        With basic collapse you can open multiple items at a time. to add
                                        bottom border use <code>.collapse-bordered</code> as a wrapper of collapse cards and
                                        for icons on the right of collapse use
                                        <code>.collapse-icon</code> <code>.accordion-icon-rotate</code>
                                    </p>
                                    <div class="default-collapse collapse-bordered">
                                        <div class="card collapse-header">
                                            <div id="headingCollapse1" class="card-header" data-toggle="collapse" role="button" data-target="#collapse1" aria-expanded="false" aria-controls="collapse1">
                                                    <span class="lead collapse-title">
                                                        Collapse Item 1
                                                    </span>
                                            </div>
                                            <div id="collapse1" role="tabpanel" aria-labelledby="headingCollapse1" class="collapse">
                                                <div class="card-content">
                                                    <div class="card-body">
                                                        Pie dragée muffin. Donut cake liquorice marzipan carrot cake topping powder candy. Sugar plum
                                                        brownie brownie cotton candy.

                                                        Tootsie roll cotton candy pudding bonbon chocolate cake lemon drops candy. Jelly marshmallow
                                                        chocolate cake carrot cake bear claw ice cream chocolate. Fruitcake apple pie pudding jelly beans
                                                        pie candy canes candy canes jelly-o. Tiramisu brownie gummi bears soufflé dessert cake.
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card collapse-header">
                                            <div id="headingCollapse2" class="card-header collapse-header" data-toggle="collapse" role="button" data-target="#collapse2" aria-expanded="false" aria-controls="collapse2">
                                                    <span class="lead collapse-title">
                                                        Collapse Item 2</span>
                                            </div>
                                            <div id="collapse2" role="tabpanel" aria-labelledby="headingCollapse2" class="collapse" aria-expanded="false">
                                                <div class="card-content">
                                                    <div class="card-body">

                                                        Jelly-o brownie marshmallow soufflé I love jelly beans oat cake. I love gummies chocolate bar
                                                        marshmallow sugar plum. Pudding carrot cake sweet roll marzipan I love jujubes. Sweet roll tart
                                                        sugar plum halvah donut.

                                                        Cake gingerbread tart. Tootsie roll soufflé danish powder marshmallow sugar plum halvah sweet
                                                        chocolate bar. Jujubes cupcake I love toffee biscuit.
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card collapse-header">
                                            <div id="headingCollapse3" class="card-header collapse-header" data-toggle="collapse" role="button" data-target="#collapse3" aria-expanded="false" aria-controls="collapse3">
                                                    <span class="lead collapse-title">
                                                        Collapse Item 3
                                                    </span>
                                            </div>
                                            <div id="collapse3" role="tabpanel" aria-labelledby="headingCollapse3" class="collapse" aria-expanded="false">
                                                <div class="card-content">
                                                    <div class="card-body">
                                                        Pudding lollipop dessert chocolate gingerbread. Cake cupcake bonbon cupcake marshmallow. Gummi
                                                        bears carrot cake bonbon cake.

                                                        Sweet roll fruitcake bear claw soufflé. Apple pie ice cream liquorice sesame snaps brownie. Donut
                                                        marshmallow donut pudding chupa chups.
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card collapse-header">
                                            <div id="headingCollapse4" class="card-header" data-toggle="collapse" role="button" data-target="#collapse4" aria-expanded="false" aria-controls="collapse4">
                                                    <span class="lead collapse-title">
                                                        Collapse Item 4
                                                    </span>
                                            </div>
                                            <div id="collapse4" role="tabpanel" aria-labelledby="headingCollapse4" class="collapse" aria-expanded="false">
                                                <div class="card-content">
                                                    <div class="card-body">
                                                        Brownie sweet carrot cake dragée caramels fruitcake. Gummi bears tootsie roll croissant
                                                        gingerbread dragée tootsie roll. Cookie caramels tootsie roll pie. Sesame snaps cookie cake donut
                                                        wafer.

                                                        Wafer cookie jelly-o candy muffin cake. Marzipan topping lollipop. Gummies chocolate sugar plum.
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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

<div class="sidenav-overlay"></div>
<div class="drag-target"></div>

<%@include file="../include/footer.jsp"%>

<!-- BEGIN: Page Vendor JS-->
<script src="/resources/app-assets/vendors/js/pickers/pickadate/picker.js"></script>
<script src="/resources/app-assets/vendors/js/pickers/pickadate/picker.date.js"></script>
<script src="/resources/app-assets/vendors/js/pickers/pickadate/picker.time.js"></script>
<script src="/resources/app-assets/vendors/js/pickers/pickadate/legacy.js"></script>

<!-- BEGIN: Page Vendor JS-->
<script src="/resources/app-assets/vendors/js/extensions/dropzone.min.js"></script>
<script src="/resources/app-assets/vendors/js/ui/prism.min.js"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Page JS-->
<script src="/resources/app-assets/js/scripts/extensions/dropzone.js"></script>
<!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>
