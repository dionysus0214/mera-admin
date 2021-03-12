<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- Zero configuration table -->

                        <div class="table-responsive">
                            <table class="table table-striped dataex-html5-selectors">
                                <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Game Title</th>
                                    <th>Count</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${list}" var="data">
                                <tr>
                                    <td><c:out value="${data.stat_date}" /></td>
                                    <td><c:out value="${data.game_nm}" /></td>
                                    <td><c:out value="${data.count}" /></td>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <th>Date</th>
                                    <th>Game Title</th>
                                    <th>Count</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>

<!--/ Zero configuration table -->
