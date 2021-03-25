<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/headerTop.jsp"%>
<%@include file="../include/header.jsp"%>
<%@include file="../include/menu.jsp"%>

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
                                            <a href="javascript:envList()" class="btn btn-primary mr-1 mb-1">Search</a>
                                        </div>
                                        <div class="col-12">
                                            <button type="button" class="btn btn-outline-warning mr-1 mb-1 pull-right" id="addBtn">Add</button>
                                        </div>
                                    </div>
                                </div>
                                <div id="envListTable"></div>
                                <!-- Modal -->
                                <div class="modal fade text-left" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel160" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header bg-primary white">
                                                <h5 class="modal-title" id="myModalLabel160">ADD ENVIRONMENT</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">처리가 완료되었습니다.</div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
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
</div>

<%@include file="../include/footer.jsp"%>

<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script>
    $(document).ready(function() {
        envList();

        var result = '<c:out value="${result}"/>';
        console.log(result);
        checkModal(result);

        function checkModal(result) {
            if (result == '') {
                return;
            }
            if (parseInt(result) > 0) {
                $(".modal-body").html("게시글 " + parseInt(result) + "번이 등록되었습니다.");
            }
            $("#addModal").modal("show");
        }

        $('#addBtn').on("click", function() {
            location.href = "/env/register";
        });
    });

    function envList() {
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
                }
            });
        }

        return {
            getList: getList
        }
    })();
</script>
