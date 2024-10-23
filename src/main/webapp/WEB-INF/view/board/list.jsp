<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <style>
        table {
            margin: 5px;
        }

        .active {
            padding: 3px;
            background-color: lightskyblue;
        }
    </style>
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

<%--pagination--%>
<div>
    <%--    이전--%>
    <c:if test="${pageInfo.hasPrevPage}">
        <a href="/board/list?page=${pageInfo.prevPageNumber}">이전</a>
    </c:if>
    <c:forEach begin="${pageInfo.leftPageNumber}"
               end="${pageInfo.rightPageNumber}"
               var="pageNumber">
        <a class="${pageInfo.currentPageNumber == pageNumber? 'active':''}"
           href="/board/list?page=${pageNumber}">${pageNumber}</a>
    </c:forEach>
    <%--    다음--%>
    <c:if test="${pageInfo.hasNextPage}">
        <a href="/board/list?page=${pageInfo.nextPageNumber}">다음</a>
    </c:if>
</div>
</body>
</html>
