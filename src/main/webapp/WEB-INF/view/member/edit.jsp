<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
    String currentDateTime = sdf.format(new java.util.Date());
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>member edit</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<c:import url="/WEB-INF/view/fragment/newbar.jsp"/>

<div class="container">
    <div class="row">
        <div class="col">
            <h2 class="my-3">${member.id} 회원 정보 수정</h2>

            <form method="post">
                <div class="mb-3">
                    <label class="form-label" for="fixedId">ID</label>
                    <input class="form-control" type="text" id="fixedId" readonly value="${member.id}">
                </div>
                <div class="mb-3">
                    <label class="form-label" for="editPsd">Password</label>
                    <input class="form-control" type="text" id="editPsd" value="${member.password}">
                </div>
                <div class="mb-3">
                    <label class="form-label" for="editNick">Nickname</label>
                    <input class="form-control" type="text" id="editNick" value="${member.nickname}">
                </div>
                <div class="mb-3">
                    <label class="form-label" for="editDescript">Description</label>
                    <textarea class="form-control" name="description" id="editDescript" cols="30"
                              rows="5">${member.description}</textarea>
                </div>
                <div class="mb-3">
                    <label for="editDate" class="form-label">수정 일시</label>
                    <input id="editDate" class="form-control" type="datetime-local" name="inserted"
                           value="<%= currentDateTime %>"
                           readonly>
                </div>
                <div class="mb-3">
                    <button class="btn btn-outline-warning">
                        <i class="fa-solid fa-floppy-disk"></i>
                        수정 저장
                    </button>
                </div>
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
