<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="/board/list">게시판 메뉴</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link ${param.active == 'list' ? 'active' : ''}" href="/board/list">
                            <i class="fa-solid fa-list"></i>
                            목록
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${param.active == 'new' ? 'active' : ''}" href="/board/new">
                            <i class="fa-solid fa-file-pen"></i>
                            작성
                        </a>
                    </li>
                </ul>
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
    <div>
        <c:if test="${message.type=='written'}">
            <div class="alert alert-primary written alert-dismissible fade show" role="alert">
                <h5>${message.text}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"/>
            </div>
        </c:if>
        <c:if test="${message.type=='edited'}">
            <div class="alert alert-warning edited alert-dismissible fade show" role="alert">
                <h5>${message.text}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"/>
            </div>
        </c:if>
        <c:if test="${message.type=='deleted'}">
            <div class="alert alert-danger deleted alert-dismissible fade show" role="alert">
                <h5>${message.text}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"/>
            </div>
        </c:if>
    </div>


    <%--    <div class="alert alert-primary" role="alert">--%>
    <%--        A simple primary alert—check it out!--%>
    <%--    </div>--%>
</div>