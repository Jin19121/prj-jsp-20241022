<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<style>
    .active {
        background-color: yellow;
    }
</style>
<head>
    <title>list</title>
</head>
<body>
<c:import url="/WEB-INF/view/fragment/navbar.jsp"></c:import>
<h2>게시글 목록</h2>
<table>
    <thead>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성 일시</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${boardList}" var="board">
        <tr>
            <td>${board.id}</td>
            <td>
                <a href="/board/view?id=${board.id}">
                        ${board.title}
                </a>
            </td>
            <td>${board.writer}</td>
            <td>${board.inserted}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div style="margin: 10px">
    <%--이전--%>
    <c:if test="${currentPage!=1}">
        <c:url value="/board/list" var="pageLink">
            <c:param name="page" value="${prev}"/>
        </c:url>
        <a href="${pageLink}">&lt; 이전</a>
    </c:if>
    <%--페이지 리스트--%>
    <c:forEach begin="${endLeft}" end="${endRight}" var="pageNumber">
        <c:url value="/board/list" var="pageLink">
            <c:param name="page" value="${pageNumber}"/>
        </c:url>
        <span class="${currentPage == pageNumber ? 'active' : ''}">
            <a href="${pageLink}">${pageNumber}</a>
        </span>
    </c:forEach>
    <%--다음--%>
    <c:if test="${currentPage<lastPage}">
        <c:url value="/board/list" var="pageLink">
            <c:param name="page" value="${next}"/>
        </c:url>
        <a href="${pageLink}">다음 &gt;</a>
    </c:if>
</div>

</body>
</html>
