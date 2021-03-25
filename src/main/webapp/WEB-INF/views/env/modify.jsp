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
                                <h4 class="card-title">Environment Modify Page</h4>
                            </div>
                            <div class="card-content">
                                <div class="card-body">
                                    <form class="form form-vertical" id="envUpdateForm" >
                                        <div class="form-body">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label for="name-vertical">Name</label>
                                                        <input type="text" class="form-control" name="env_nm" value='<c:out value="${env.env_nm}"/>' readonly="readonly">
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label for="title-vertical">Title</label>
                                                        <!-- <input type="text" class="form-control" name="env_title" value='<c:out value="${env.env_title}"/>'> -->
                                                        <input type="text" class="form-control" name="env_title" value='test'>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label for="content-vertical">Content</label>
                                                        <!-- <input type="text" class="form-control" name="env_val" value='<c:out value="${env.env_val}"/>'> -->
                                                        <input type="text" class="form-control" name="env_val" value='test'>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label for="content-vertical">Y/N</label>
                                                        <!-- <input type="text" class="form-control" name="use_yn" value='<c:out value="${env.use_yn}"/>'> -->
                                                        <input type="text" class="form-control" name="use_yn" value='Y'>
                                                    </div>
                                                </div>
                                                <!-- <div class="col-12">
                                                    <div class="form-group">
                                                        <label for="content-vertical">Update Date</label>
                                                        <input type="text" class="form-control" name="upd_dt" value='<fmt:formatDate value="${env.upd_dt}" type="date" pattern="yyyy-MM-dd"/>'>
                                                        <input type="text" class="form-control" name="upd_dt" value='<fmt:formatDate value="${env.upd_dt}" type="date" pattern="yyyy-MM-dd"/>'>
                                                    </div>
                                                </div> -->
                                                <div class="col-12">
                                                    <button class="btn btn-outline-light mr-1 mb-1" onclick="history.back()">List</button>
                                                    <a href="javascript:formModify()" class="btn btn-primary mr-1 mb-1">Modify</a>
                                                    <button type="submit" data-oper='delete' class="btn btn-warning mr-1 mb-1">Delete</button>
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                </div>
                                            </div>
                                        </div>
                                    </form>
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

<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script>
    function formModify() {
        var param = new Object();
        param = $("#envUpdateForm").serialize();
        console.log(param);

        $.ajax({
            url: '/env/modify',
            data: param,
            type: 'post',
            success: function (data) {
                console.log("success", data);

                if(data === 'success'){
                    alert("수정이 완료되었습니다.");
                    self.location ="/env/list";
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }
</script>