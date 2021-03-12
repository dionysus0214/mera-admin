<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- Zero configuration table -->

                        <div class="table-responsive">
                            <table class="table zero-configuration">
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
                                <tfoot>
                                <tr>
                                    <th>Date</th>
                                    <th>Page cd</th>
                                    <th>Page nm</th>
                                    <th>Count</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>

<!--/ Zero configuration table -->
