<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>view member</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<c:import url="/WEB-INF/view/fragment/newbar.jsp"/>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-12 col-md-9 col-lg-6">
            <h2 class="my-3">
                회원 정보
            </h2>
            <div class="mb-3">
                <label for="inputId1" class="form-label">
                    ID
                </label>
                <input value="${member.id}" readonly id="inputId1" name="id" type="text" class="form-control">
            </div>
            <div class="mb-3">
                <label for="inputPassword1" class="form-label">
                    암호
                </label>
                <div class="input-group">
                <input value="${member.password}" readonly id="inputPassword1" name="password" type="text"
                       class="form-control">
                    <a href="/member/edit-password?id=${member.id}" class="btn btn-outline-secondary">
                        변경
                    </a>
                </div>
            </div>
            <div class="mb-3">
                <label for="inputNickName1" class="form-label">
                    별명
                </label>
                <input value="${member.nickname}" readonly id="inputNickName1" name="nickname" type="text"
                       class="form-control">
            </div>
            <div class="mb-3">
                <label for="textareaDescription1" class="form-label">
                    자기소개
                </label>
                <textarea readonly type="text"
                          class="form-control"
                          id="textareaDescription1"
                          rows="10"
                          name="description">${member.description}</textarea>
            </div>
            <div class="mb-3">
                <label for="inputInserted1" class="form-label">
                    가입 일시
                </label>
                <input class="form-control" value="${member.inserted}" readonly type="datetime-local"
                       id="inputInserted1">
            </div>

            <div class="mb-3">
                <button class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteConfirmModal1">
                    <i class="fa-solid fa-trash-can"></i>
                    삭제
                </button>
                <a class="btn btn-outline-primary" href="/member/edit?id=${member.id}">
                    <i class="fa-solid fa-pen-to-square"></i>
                    수정
                </a>
            </div>
        </div>
    </div>
</div>

<%--modal--%>
<div class="modal fade" id="deleteConfirmModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5">탈퇴 요청</h1>
                <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div>
                    <form action="/member/delete" method="post" id="deleteMember1">
                        <input type="hidden" name="id" value="${member.id}">
                        <label for="inputPassword2">암호</label>
                        <input type="text" class="form-control" name="password" id="inputPassword2">
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" data-bs-dismiss="modal">
                    닫기
                </button>
                <button class="btn btn-danger" form="deleteMember1">
                    삭제
                </button>

            </div>
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
