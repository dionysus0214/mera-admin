<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
            <div id="basic-datatable">
                <div class="row">
                    <div class="col-12"></div>
                </div>
                <!-- Vertical Layout -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Environment Register</h4>
                            </div>
                            <div class="card-content">
                                <div class="card-body">
                                    <form class="form form-vertical" id="envInsertForm" name="envInsertForm">
                                        <div class="form-body">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label for="name-vertical">Name</label>
                                                        <input type="text" class="form-control" name="env_nm" placeholder="Name">
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label for="title-vertical">Title</label>
                                                        <input type="text" class="form-control" name="env_title" placeholder="Title">
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label for="content-vertical">Content</label>
                                                        <input type="text" class="form-control" name="env_val" placeholder="Content">
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label for="content-vertical">Y/N</label>
                                                        <input type="text" class="form-control" name="use_yn" placeholder="Y/N">
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <a href="javascript:formSubmit()" class="btn btn-primary mr-1 mb-1">Submit</a>
                                                    <button type="reset" class="btn btn-outline-warning mr-1 mb-1">Reset</button>
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                </div>
                                            </div>
                                        </div>
                                    </form>
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
                                                <div class="modal-body">환경변수 등록이 완료되었습니다.</div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
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
        </div>
    </div>
</div>

<%@include file="../include/footer.jsp"%>

<!-- BEGIN: Page JS-->
<script src="/resources/app-assets/js/scripts/modal/components-modal.js"></script>
<!-- END: Page JS-->

<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script>
    function formSubmit() {
        var param = new Object();
        param = $("#envInsertForm").serialize();

        $.ajax({
            url: '/env/register',
            data: param,
            type: 'post',
            success: function (data) {
                console.log("success", data);

                if(data === 'success'){
                    alert("등록이 완료되었습니다.");
                    self.location = "/env/list";
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }
</script>