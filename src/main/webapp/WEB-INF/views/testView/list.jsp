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
                                                <input type="text" id="startDate" name="startDate" class="form-control pickadate-limits" />
                                            </form>
                                        </div>
                                        <div class="col-md-3 col-12 mb-1">
                                            <form>
                                                <input type="text" id="endDate" name="endDate" class="form-control pickadate-limits" />
                                            </form>
                                        </div>
                                        <form id="searchForm" action="/testView/list" method="get">
                                            <div class="btn-group dropdown mr-1 mb-1">
                                                <select name='type'>
                                                    <option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>Category</option>
                                                    <option value="CD" <c:out value="${pageMaker.cri.type eq 'CD'?'selected':''}"/>>code</option>
                                                    <option value="NM" <c:out value="${pageMaker.cri.type eq 'NM'?'selected':''}"/>>name</option>
                                                </select>
                                            </div>
                                            <input type="text" class="form-control" name="keyword" value="<c:out value='${pageMaker.cri.keyword}'/>" />
                                            <input type="hidden" name="pageNum" value="<c:out value='${pageMaker.cri.pageNum}'/>" /> 
                                            <input type="hidden" name="amount" value="<c:out value='${pageMaker.cri.amount}'/>" />                                           
                                            <div class="col-md-2 col-12 mb-1">
                                                <button type="button" class="btn btn-primary mr-1 mb-1">Search</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">                                        
                                        <div class="table-responsive">
                                            <table class="table table-bordered mb-0">
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
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <ul class="pagination justify-content-center mt-2">
                                        <c:if test="${pageMaker.prev}">
                                            <li class="page-item prev">
                                                <a class="page-link" href="${pageMaker.startPage -1}">Prev</a>
                                            </li>
                                        </c:if>
                
                                        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                            <li class="page-item ${pageMaker.cri.pageNum == num ? "active":""} ">
                                                <a class="page-link" href="${num}">${num}</a>
                                            </li>
                                        </c:forEach>
                
                                        <c:if test="${pageMaker.next}">
                                            <li class="page-item next">
                                                <a class="page-link" href="${pageMaker.endPage +1}">Next</a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div>
                                <!--  end Pagination -->                                        
                            </div>
                            <form id="actionForm" action="/testView/list" method= "get">
                                <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                                <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                                <input type="hidden" name="type" value="<c:out value='${pageMaker.cri.type}'/>" />
                                <input type="hidden" name="keyword" value="<c:out value='${pageMaker.cri.keyword}'/>" />
                            </form>
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

        pageViewUpdate();
        
        var actionForm = $("#actionForm");
        $(".page-item a").on("click", function(e) {
            e.preventDefault();
            actionForm.find("input[name='pageNum']").val($(this).attr("href"));
            actionForm.submit();
        });

        var searchForm = $("#searchForm");
        $("#searchForm button").on("click", function(e) {
            if (!searchForm.find("option:selected").val()) {
                alert("카테고리를 선택하세요.");
                return false;
            }

            if (!searchForm.find("input[name='keyword']").val()) {
                alert("키워드를 입력하세요.");
                return false;
            }

            searchForm.find("input[name='pageNum']").val("1");
            e.preventDefault();
            
            searchForm.submit();
        });
    });

    function pageViewUpdate() {
        var itemObj = new Object();
        itemObj.startDate = $('#startDate').val().replaceAll('-', '');
        itemObj.endDate = $('#endDate').val().replaceAll('-', '');
    }
</script>
<!-- END: Page JS-->

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
<script src="/resources/app-assets/js/scripts/datatables/datatable.js"></script>
<!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>