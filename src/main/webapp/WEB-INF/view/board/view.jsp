<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>view ${board.id}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<c:import url="/WEB-INF/view/fragment/newbar.jsp"></c:import>

<%--그리드 시스템 활용--%>
<div class="container">
    <div class="row">
        <div class="col">
            <h2 class="my-3"> ${board.id}번 게시글 보기</h2>

            <div class="mb-3">
                <label for="viewTitle1" class="form-label">
                    제목
                </label>
                <input id="viewTitle1" class="form-control" type="text" value="${board.title}" readonly>
            </div>
            <div class="mb-3">
                <label for="viewTextarea1" class="form-label">본문</label>
                <textarea class="form-control" id="viewTextarea1" cols="30" rows="10"
                          readonly>${board.content}</textarea>
            </div>
            <div class="mb-3">
                <label for="viewWriter" class="form-label">
                    작성자
                </label>
                <input class="form-control" id="viewWriter" type="text" value="${board.writer}" readonly>
            </div>
            <div class="mb-3">
                <label for="viewDate" class="form-label">
                    작성일시
                </label>
                <input class="form-control" id="viewDate" type="datetime-local" value="${board.inserted}" readonly>
            </div>

            <button form="deleteForm1" class="btn btn-outline-danger">
                <i class="fa-solid fa-trash"></i>
                삭제
            </button>
            <a class="btn btn-outline-primary" href="/board/edit?id=${board.id}">
                <i class="fa-solid fa-pen-to-square"></i>
                수정
            </a>

            <form action="/board/delete" class="d-none" id="deleteForm1" method="post">
                <input type="hidden" name="id" value="${board.id}">
            </form>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>
</body>
</html>
