<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>edit</title>
</head>
<body>
<c:import url="/WEB-INF/view/fragment/navbar.jsp"></c:import>

<h2>${board.id}번 게시물 수정</h2>
<form method="post">
    <div>번호
        <input type="number" name="id" value="${board.id}" readonly>
    </div>
    <div>제목
        <input type="text" value="${board.title}" name="title">
    </div>
    <div>본문
        <textarea id="" cols="30" rows="10" name="content">${board.content}
        </textarea>
    </div>
    <div>작성자
        <input type="text" name="writer" value="${board.writer}">
    </div>
    <div>수정 일시
        <input type="datetime-local" name="inserted" id="currentDatetime">
    </div>
    <div>
        <button>수정</button>
    </div>
</form>
</body>
</html>
