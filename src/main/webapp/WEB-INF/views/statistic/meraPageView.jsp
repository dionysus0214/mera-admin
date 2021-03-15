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
<%--                <div class="row">--%>
<%--                    <div class="col-12">--%>
<%--                        <div class="card">--%>
<%--                            <div class="card-header">--%>
<%--                                <h4 class="card-title">Bar Chart</h4>--%>
<%--                            </div>--%>
<%--                            <div class="card-content">--%>
<%--                                <div class="card-body">--%>
<%--                                    <div id="bar-chart" class="height-400"></div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">API Call Count</h4>
                            </div>
                            <div class="card-content">
                                <div class="card-body card-dashboard">
                                    <div class="row">
                                        <div class="col-md-4 col-12 mb-1">
<%--                                            <h5 class="text-bold-500">Start Date Range</h5>--%>
                                            <form>
                                               <input type='text' id="startDate" name="startDate" class="form-control pickadate-limits" />
                                            </form>
                                        </div>
                                        <div class="col-md-4 col-12 mb-1">
<%--                                            <h5 class="text-bold-500">End Date Range</h5>--%>
                                            <form>
                                                <input type='text' id="endDate" name="endDate" class="form-control pickadate-limits" />
                                            </form>
                                        </div>
                                        <div class="col-md-2 col-12 mb-1">
                                            <a href="javascript:pageViewUpdate()" class="btn btn-outline-primary float-left btn-inline">Update</a>
                                        </div>
                                    </div>

                                    <div id="pageViewTable"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">GAME Call Count</h4>
                            </div>
                            <div class="card-content">
                                <div class="card-body card-dashboard">
                                    <div class="row">
                                        <div class="col-md-4 col-12 mb-1">
                                            <%--                                            <h5 class="text-bold-500">Start Date Range</h5>--%>
                                            <form>
                                                <input type='text' id="gameSDate" name="gameSDate" class="form-control pickadate-limits" />
                                            </form>
                                        </div>
                                        <div class="col-md-4 col-12 mb-1">
                                            <%--                                            <h5 class="text-bold-500">End Date Range</h5>--%>
                                            <form>
                                                <input type='text' id="gameEDate" name="gameEDate" class="form-control pickadate-limits" />
                                            </form>
                                        </div>
                                        <div class="col-md-2 col-12 mb-1">
                                            <a href="javascript:gameCallUpdate()" class="btn btn-outline-primary float-left btn-inline">Update</a>
                                        </div>
                                    </div>

                                    <div id="gamePageViewTable"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Dashboard Analytics end -->


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
        var cur_date = new Date();
        var bef_date = new Date();
        var bef_time = bef_date.getTime() - (7*24*60*60*1000);
        bef_date.setTime(bef_time);

        var cur_year = cur_date.getFullYear();
        var cur_month = new String(cur_date.getMonth()+1);
        var cur_day = new String(cur_date.getDate());

        // 한자리수일 경우 0을 채워준다.
        if(cur_month.length == 1){
            cur_month = "0" + cur_month;
        }
        if(cur_day.length == 1){
            cur_day = "0" + cur_day;
        }

        var bef_year = bef_date.getFullYear();
        var bef_month = new String(bef_date.getMonth()+1);
        var bef_day = new String(bef_date.getDate());

        // 한자리수일 경우 0을 채워준다.
        if(bef_month.length == 1){
            bef_month = "0" + bef_month;
        }
        if(bef_day.length == 1){
            bef_day = "0" + bef_day;
        }

        $('#startDate').val(bef_year+"-"+bef_month+"-"+bef_day);
        $('#endDate').val(cur_year+"-"+cur_month+"-"+cur_day);

        $('#gameSDate').val(bef_year+"-"+bef_month+"-"+bef_day);
        $('#gameEDate').val(cur_year+"-"+cur_month+"-"+cur_day);

        pageViewUpdate();
        gameCallUpdate();
    });
    //
    // $(window).on("load", function() {
    //
    //     var $dark_green = '#4ea397';
    //     var $green = '#22c3aa';
    //     var $light_green = '#7bd9a5';
    //     var $lighten_green = '#a8e7d2';
    //
    //
    //     // Bar chart
    //     // ------------------------------
    //
    //     var barChart = echarts.init(document.getElementById('bar-chart'));
    //
    //
    //     // var i;
    //     function randomize() {
    //         return Math.round(300 + Math.random() * 700) / 10
    //     };
    //
    //     var barChartoption = {
    //         legend: {},
    //         tooltip: {},
    //         dataset: {
    //             source: [
    //                 ['product', '2015', '2016', '2017'],
    //                 ['Matcha Latte', randomize(), randomize(), randomize()],
    //                 ['Milk Tea', randomize(), randomize(), randomize()],
    //                 ['Cheese Cocoa', randomize(), randomize(), randomize()],
    //                 ['Walnut Brownie', randomize(), randomize(), randomize()],
    //             ],
    //         },
    //
    //
    //         xAxis: {
    //             type: 'category',
    //             splitLine: {show: true},
    //         },
    //         yAxis: {},
    //         // Declare several bar series, each will be mapped
    //         // to a column of dataset.source by default.
    //         series: [
    //             {
    //                 type: 'bar',
    //                 itemStyle: {color: $dark_green},
    //             },
    //             {
    //                 type: 'bar',
    //                 itemStyle: {color: $green},
    //             },
    //             {
    //                 type: 'bar',
    //                 itemStyle: {color: $light_green},
    //             }
    //         ]
    //     };
    //     barChart.setOption(barChartoption);
    // });

    function pageViewUpdate() {
        // var param = new Object();
        // param = $("#myForm").serialize();
        //
        var itemObj = new Object();
        itemObj.startDate = $('#startDate').val().replaceAll('-', '');
        itemObj.endDate = $('#endDate').val().replaceAll('-', '');

        reportService.getList("/report/pageView", itemObj, function(data) {
            $("#pageViewTable").html(data);
            $('.zero-configuration').DataTable();
        });
    }

    function gameCallUpdate() {
        var itemObj2 = new Object();
        itemObj2.startDate = $('#gameSDate').val().replaceAll('-', '');
        itemObj2.endDate = $('#gameEDate').val().replaceAll('-', '');
        reportService.getList("/report/gamePageView", itemObj2, function(data) {
            $("#gamePageViewTable").html(data);
            $('.dataex-html5-selectors').DataTable( {
                dom: 'Bfrtip',
                buttons: [
                    {
                        extend: 'copyHtml5',
                        exportOptions: {
                            columns: [ 0, ':visible' ]
                        }
                    },
                    {
                        extend: 'pdfHtml5',
                        exportOptions: {
                            columns: ':visible'
                        }
                    },
                    {
                        text: 'JSON',
                        action: function ( e, dt, button, config ) {
                            var data = dt.buttons.exportData();

                            $.fn.dataTable.fileSave(
                                new Blob( [ JSON.stringify( data ) ] ),
                                'Export.json'
                            );
                        }
                    },
                    {
                        extend: 'print',
                        exportOptions: {
                            columns: ':visible'
                        }
                    }
                ]
            });
        });
    }

    function barChart() {
        var barChart = echarts.init(document.getElementById('bar-chart'));


        // var i;
        function randomize() {
            return Math.round(300 + Math.random() * 700) / 10
        };

        var barChartoption = {
            legend: {},
            tooltip: {},
            dataset: {
                source: [
                    ['product', '2015', '2016', '2017'],
                    ['Matcha Latte', randomize(), randomize(), randomize()],
                    ['Milk Tea', randomize(), randomize(), randomize()],
                    ['Cheese Cocoa', randomize(), randomize(), randomize()],
                    ['Walnut Brownie', randomize(), randomize(), randomize()],
                ],
            },


            xAxis: {
                type: 'category',
                splitLine: { show: true },
            },
            yAxis: {},
            // Declare several bar series, each will be mapped
            // to a column of dataset.source by default.
            series: [
                {
                    type: 'bar',
                    itemStyle: {color: $dark_green},
                },
                {
                    type: 'bar',
                    itemStyle: {color: $green},
                },
                {
                    type: 'bar',
                    itemStyle: {color: $light_green},
                }
            ]
        };
        barChart.setOption(barChartoption);
    }

    var reportService = (function() {

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
                    if( callback ) {
                        callback(result);
                    }
                },
                error: function (xhr, status, e) {
                    if( error ) {
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
        $('.pickadate-limits').pickadate({
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
