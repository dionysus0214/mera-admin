<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="row">
    <div class="col-12">
        <div id="table-responsive">
            <table class="table table-bordered table-hover mb-0">
                <thead>
                <tr>
                    <th>No</th>
                    <th>Name</th>
                    <th>Title</th>
                    <th>Content</th>
                    <th>YN</th>
                    <th>Date</th>
                    <th>Button</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="data">
                <tr>
                    <td><c:out value="${data.seq}" /></td>
                    <td><c:out value="${data.env_nm}" /></td>
                    <td><c:out value="${data.env_title}" /></td>
                    <td><c:out value="${data.env_val}" /></td>
                    <td><c:out value="${data.use_yn}" /></td>
                    <td><c:out value="${data.reg_dt}" /></td>
                    <td>Delete</td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>