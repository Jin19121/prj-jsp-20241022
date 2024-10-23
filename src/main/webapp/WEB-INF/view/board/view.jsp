<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>view ${board.id}</title>
</head>
<body>
<c:import url="/WEB-INF/view/fragment/bsbar.jsp"></c:import>

<h2> ${board.id}번 게시글 보기</h2>
<div> 제목
    <input type="text" value="${board.title}" readonly>
</div>
<div> 본문
    <textarea id="" cols="30" rows="10" readonly>${board.content}</textarea>
</div>
<div> 작성자
    <input type="text" value="${board.writer}" readonly>
</div>
<div> 작성 일시
    <input type="datetime-local" value="${board.inserted}" readonly>
</div>

<div>
    <form action="/board/delete" method="post">
        <input type="hidden" name="id" value="${board.id}">
        <button>삭제</button>
    </form>
</div>
<a href="/board/edit?id=${board.id}">수정</a>
</body>
</html>
