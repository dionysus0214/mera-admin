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
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="env">
                <tr>
                    <td><c:out value="${env.rownum}"/></td>
                    <td><a href='/env/modify?seq=<c:out value="${env.seq}"/>'><c:out value="${env.env_nm}"/></a></td>
                    <td><c:out value="${env.env_title}"/></td>
                    <td><c:out value="${env.env_val}"/></td>
                    <td><c:out value="${env.use_yn}"/></td>
                    <td><fmt:formatDate value="${env.reg_dt}" type="date" pattern="yyyy-MM-dd"/></td>
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
                <a class="page-link" href="javascript:envList(${pageMaker.startPage -1})">Prev</a>
            </li>
        </c:if>

        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
            <li class="page-item ${pageMaker.cri.pageNum == num ? "active":""} ">
                <a class="page-link" href="javascript:envList(${num})">${num}</a>
            </li>
        </c:forEach>

        <c:if test="${pageMaker.next}">
            <li class="page-item next">
                <a class="page-link" href="javascript:envList(${pageMaker.endPage +1})">Next</a>
            </li>
        </c:if>
    </ul>
</div>