<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@include file="../include/headerTop.jsp"%>

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/app-assets/vendors/css/vendors.min.css">

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
                    <div class="col-12"></div>
                </div>
                <!-- Table -->
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
                                                <input type="text" id="startDate" name="startDate" class="form-control format-picker" />
                                            </form>
                                        </div>
                                        <div class="col-md-3 col-12 mb-1">
                                            <form>
                                                <input type="text" id="endDate" name="endDate" class="form-control format-picker" />
                                            </form>
                                        </div>
                                        <div class="col-md-auto col-12 mb-1 btn-group dropdown">
                                            <select id="category" name="type">
                                                <option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>Category</option>
                                                <option value="CD" <c:out value="${pageMaker.cri.type eq 'CD'?'selected':''}"/>>code</option>
                                                <option value="NM" <c:out value="${pageMaker.cri.type eq 'NM'?'selected':''}"/>>name</option>
                                            </select>
                                        </div>
                                        <div class="col-md-auto col-12 mb-1">
                                            <input type="text" class="form-control" id="keyword" name="keyword" value="<c:out value='${pageMaker.cri.keyword}'/>" placeholder="Input keyword"/>                                       
                                        </div>
                                        <div class="col-md-auto col-12 mb-1">
                                            <a href="javascript:testViewUpdate(1)" class="btn btn-primary mr-1 mb-1">Search</a>
                                        </div>
                                    </div>
                                </div>
                                    <div id="testViewTable"></div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>
<!-- END: Content-->

<%@include file="../include/footer.jsp"%>

<!-- BEGIN: Page Vendor JS-->
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
<!-- END: Page Vendor JS-->

<!-- BEGIN: Page JS-->
<script src="/resources/app-assets/js/scripts/pickers/dateTime/pick-a-datetime.js"></script>
<script src="/resources/app-assets/js/scripts/datatables/datatable.js"></script>
<!-- END: Page JS-->

<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
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

        testViewUpdate(1);
    });

    function testViewUpdate(pageNum) {
        var itemObj = new Object();
        itemObj.startDate = $('#startDate').val().replaceAll('-', '');
        itemObj.endDate = $('#endDate').val().replaceAll('-', '');
        itemObj.pageNum = pageNum;
        itemObj.category =  $('#category').val();
        itemObj.keyword = $('#keyword').val();

        testViewService.getList("/testView/list", itemObj, function(data) {
            $("#testViewTable").html(data);
        });
    }

    var testViewService = (function() {
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

    (function(window, document, $) {
        'use strict';

         // Date limits
        $('.format-picker').pickadate({
            format: 'yyyy-mm-dd',
            min: [2020,9,1],
            max: [2030,12,31]
        });

        // Disabled Dates & Weeks
        $('.pickadate-disable').pickadate({
            disable: [
                1,
                [2019,3,6],
                [2019,3,20]
            ]
        });
    })(window, document, jQuery);

</script>
<!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>