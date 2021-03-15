<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@include file="../include/headerTop.jsp"%>

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
        </div>
        <div class="content-body">
            <!-- Dashboard Analytics Start -->
            <!-- Page view list -->
            <section id="basic-datatable">
                <div class="row">
                    <div class="col-12">
                        <p></p>
                    </div>
                </div>
                <!-- Bar Chart -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">API Call Count</h4>
                            </div>
                            <div class="card-content">
                                <div class="card-body card-dashboard">
                                    <div class="row">
                                        <div class="col-md-3 col-12 mb-1">
                                            <form>
                                                <input type='text' id="startDate" name="startDate" class="form-control pickadate-limits" />
                                            </form>
                                        </div>
                                        <div class="col-md-3 col-12 mb-1">
                                            <form>
                                                <input type='text' id="endDate" name="endDate" class="form-control pickadate-limits" />
                                            </form>
                                        </div>
                                        <div class="col-md-1 col-12 mb-1">
                                            <form id='searchForm'>
                                                <select name='type'>
                                                    <option value="">--</option>
                                                    <option value="code">code</option>
                                                    <option value="name">name</option>
                                                </select>
                                            </form>
                                        </div>
                                        <div class="col-md-3 col-12 mb-1">
                                            <input type="search" class="form-control form-control-sm" placeholder="" aria-controls="DataTables_Table_1">
                                        </div>
                                        <div class="col-md-2 col-12 mb-1">
                                            <a href="javascript:pageViewUpdate()" class="btn btn-outline-primary float-left btn-inline">Search</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="table">                               
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <th>Date</th>
                                            <th>Page cd</th>
                                            <th>Page nm</th>
                                            <th>Count</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${list}" var="data">
                                        <tr>
                                            <td><c:out value="${data.stat_date}" /></td>
                                            <td><c:out value="${data.api_cd}" /></td>
                                            <td><c:out value="${data.api_nm}" /></td>
                                            <td><c:out value="${data.tot_cnt}" /></td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>Date</th>
                                            <th>Page cd</th>
                                            <th>Page nm</th>
                                            <th>Count</th>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <div class="card">
                                    <ul class="pagination justify-content-center mt-2">
                                        <li class="page-item prev"><a class="page-link" href="#">Prev</a></li>
                                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item active"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                                        <li class="page-item next"><a class="page-link" href="#">Next</a></li>
                                    </ul>
                                    <!-- <ul class="pagination justify-content-center mt-2">
                                        <c:if test="${pageMaker.prev}">
                                            <li class="page-item prev">
                                                <a href="#">Prev</a>
                                            </li>
                                        </c:if>
                
                                        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                            <li class="page-item">
                                                <a href="#">${num}</a>
                                            </li>
                                        </c:forEach>
                
                                        <c:if test="${pageMaker.next}">
                                            <li class="page-item next">
                                                <a href="#">Next</a>
                                            </li>
                                        </c:if>
                                    </ul> -->
                                </div>
                                <!--  end Pagination -->         
                                <form id='actionForm' action="/testView/list" method='get'>
                                    <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
                                    <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>
<!-- END: Content-->

<div class="sidenav-overlay"></div>
<div class="drag-target"></div>

<%@include file="../include/footer.jsp"%>

<!-- BEGIN: Page Vendor JS-->
<script src="/resources/app-assets/vendors/js/charts/echarts/echarts.min.js"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Page JS-->

<script>
    $(document).ready(function () {
        var cur_date = new Date();
        var bef_date = new Date();
        var bef_time = bef_date.getTime() - (7*24*60*60*1000);
        bef_date.setTime(bef_time);

        var cur_year = cur_date.getFullYear();
        var cur_month = new String(cur_date.getMonth()+1);
        var cur_day = new String(cur_date.getDate());

        if(cur_month.length == 1){
            cur_month = "0" + cur_month;
        }
        if(cur_day.length == 1){
            cur_day = "0" + cur_day;
        }

        var bef_year = bef_date.getFullYear();
        var bef_month = new String(bef_date.getMonth()+1);
        var bef_day = new String(bef_date.getDate());

        if(bef_month.length == 1){
            bef_month = "0" + bef_month;
        }
        if(bef_day.length == 1){
            bef_day = "0" + bef_day;
        }

        $('#startDate').val(bef_year+"-"+bef_month+"-"+bef_day);
        $('#endDate').val(cur_year+"-"+cur_month+"-"+cur_day);

        pageViewUpdate();
    });

    function pageViewUpdate() {
        var itemObj = new Object();
        itemObj.startDate = $('#startDate').val().replaceAll('-', '');
        itemObj.endDate = $('#endDate').val().replaceAll('-', '');

        reportService.getList("/report/pageView", itemObj, function(data) {
            $("#pageViewTable").html(data);
            $('.zero-configuration').DataTable();
        });
    }
</script>
<!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>
