<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
    <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>タスク一覧</h2>

        <table id="tasks_list">
            <tbody>
                <tr>
                    <th class="tasks_id">ID</th>
                    <th class="tasks_title">タイトル</th>
                    <th class="tasks_content">タスク</th>
                </tr>
                <c:forEach var="task" items="${tasks}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td class="tasks_id"><a href="${pageContext.request.contextPath}/show?id=${task.id}"><c:out value="${task.id}" /></a></td>
                        <td class="tasks_title">${task.title}</td>
                        <td class="tasks_content"> ${task.content}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

<div id="pagination">
            （全 ${tasks_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((tasks_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/index?page=${i}"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>

        <p><a href="${pageContext.request.contextPath}/new">新規タスクの投稿</a></p>

    </c:param>
</c:import>