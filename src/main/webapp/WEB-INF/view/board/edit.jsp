<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
    String currentDateTime = sdf.format(new java.util.Date());
%>
<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>edit</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
      integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
      crossorigin="anonymous" referrerpolicy="no-referrer"/>
<body>
<c:import url="/WEB-INF/view/fragment/newbar.jsp"></c:import>

<div class="container">
    <div class="row">
        <div class="col">
            <h2 class="my-3">${board.id}번 게시물 수정</h2>
            <form method="post">
                <div class="mb-3">
                    <label for="editNo" class="form-label">번호</label>
                    <input id="editNo" class="form-control" type="number" name="id" value="${board.id}" readonly>
                </div>
                <div class="mb-3">
                    <label for="editTitle" class="form-label">제목</label>
                    <input id="editTitle" class="form-control" type="text" value="${board.title}" name="title">
                </div>
                <div class="mb-3">
                    <label for="editTextarea" class="form-label">본문</label>
                    <textarea class="form-control" id="editTextarea" cols="30" rows="5" name="content">${board.content}
                    </textarea>
                </div>
                <div class="mb-3">
                    <label for="editWriter" class="form-label">작성자</label>
                    <input id="editWriter" class="form-control" type="text" name="writer" value="${board.writer}">
                </div>
                <div class="mb-3">
                    <label for="editTime" class="form-label">수정 일시</label>
                    <input id="editTime" class="form-control" type="datetime-local" name="inserted" id="dateTimeInput"
                           value="<%= currentDateTime %>"
                           readonly>
                </div>
                <div>
                    <button>수정</button>
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
