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
                                    <form class="form form-vertical" id="envInsertForm">
                                        <div class="form-body">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label for="name-vertical">Name</label>
                                                        <input type="text" id="env_nm" value="test" class="form-control" name="env_nm" placeholder="Name">
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label for="title-vertical">Title</label>
                                                        <input type="text" id="env_title" value="test" class="form-control" name="env_title" placeholder="Title">
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label for="content-vertical">Content</label>
                                                        <input type="text" id="env_val" value="test" class="form-control" name="env_val" placeholder="Content">
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label for="content-vertical">Y/N</label>
                                                        <input type="text" id="use_yn" value="test" class="form-control" name="use_yn" placeholder="Y/N">
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <button type="button" class="btn btn-primary mr-1 mb-1" onclick="formSubmit()">Submit</button>
                                                    <button type="button" class="btn btn-outline-warning mr-1 mb-1">Reset</button>
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
    var csrfHeaderName = "${_csrf.headerName}";
    var csrfTokenValue = "${_csrf.token}"

    function formSubmit() {
        var param = $("#envInsertForm").serialize();
        console.log(param);
        $.ajax({
            url: '/env/register',
            data: param,
            type: 'post',
            dataType: 'text',
            contentType: 'application/json',
            beforeSend: function (xhr) {
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            },
            success: function (data) {
                // alert(data);
                console.log("success", data);
            },
            error: function (xhr, status, e) {
                if(e) {
                    console.error('form submit ajaxs error : ', e);
                }
                location.href = "/accessError";
            }
        });
    }
</script>