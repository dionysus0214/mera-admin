<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
                <c:forEach items="${list}" var="env">
                <tr>
                    <td><c:out value="${env.seq}"/></td>
                    <td><a href='/env/get?seq=<c:out value="${env.seq}"/>'><c:out value="${env.env_nm}"/></a></td>
                    <td><c:out value="${env.env_title}"/></td>
                    <td><c:out value="${env.env_val}"/></td>
                    <td><c:out value="${env.use_yn}"/></td>
                    <td><fmt:formatDate value="${env.reg_dt}" type="date" pattern="yyyy-MM-dd"/></td>
                    <td>Delete</td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>