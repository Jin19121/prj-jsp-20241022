<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<c:import url="/WEB-INF/view/fragment/newbar.jsp"></c:import>

<div class="container">
    <div class="row">
        <div class="col">
            <h2 class="my-3">회원 가입</h2>
            <form action="" method="post">
                <%--        id, password, nickName, description--%>
                <div class="mb-3">
                    <label for="inputId" class="form-label">ID</label>
                    <input type="text" class="form-control" id="inputId">
                </div>

                <div class="mb-3">
                    <label for="inputPass" class="form-label">Password</label>
                    <input type="text" class="form-control" id="inputPass">
                </div>

                <div class="mb-3">
                    <label for="inputNick" class="form-label">Nickname</label>
                    <input type="text" class="form-control" id="inputNick">
                </div>

                <div class="mb-3">
                    <label for="inputDescript" class="form-label">Description</label>
                    <textarea type="text"
                              class="form-control"
                              id="inputDescript"
                              rows="10"
                              name="description"></textarea>
                </div>
                <div class="mb-3">
                    <button class="btn btn-primary">
                        <i class="fa-solid fa-user-plus"></i>
                        가입
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
