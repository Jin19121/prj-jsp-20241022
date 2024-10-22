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
    <div>제목
        <input type="text" value="${board.title}">
    </div>
    <div>본문
        <textarea id="" cols="30" rows="10">${board.content}</textarea>
    </div>
    <div>작성자
        <input type="text" value="${board.writer}">
    </div>
    <div>
        <button>수정</button>
    </div>
</form>
</body>
</html>
