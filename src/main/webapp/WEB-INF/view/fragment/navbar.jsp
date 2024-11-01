<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div>
    <div style="display: flex; gap: 10px">
        <div>
            <a href="/board/list">글 목록</a>
        </div>
        <div>
            <a href="/board/new">글 작성</a>
        </div>
    </div>

    <c:if test="${not empty message}">
        <style>
            h5 {
                padding: 10px;
            }

            .success {
                background-color: skyblue;
            }

            .warning {
                background-color: darkorange;
            }

            .edited {
                background-color: lightyellow;
            }
        </style>
        <div class="${message.type}">
            <h5>
                    ${message.text}
            </h5>
        </div>
    </c:if>
</div>