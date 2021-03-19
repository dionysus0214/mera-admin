<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



<div class="row">
    <div class="col-12">
        <div id="table-responsive">
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
                <a class="page-link" href="javascript:testViewUpdate(${pageMaker.startPage -1})">Prev</a>
            </li>
        </c:if>

        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
            <li class="page-item ${pageMaker.cri.pageNum == num ? "active":""} ">
                <a class="page-link" href="javascript:testViewUpdate(${num})">${num}</a>
            </li>
        </c:forEach>

        <c:if test="${pageMaker.next}">
            <li class="page-item next">
                <a class="page-link" href="javascript:testViewUpdate(${pageMaker.endPage +1})">Next</a>
            </li>
        </c:if>
    </ul>
</div>
