
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<aside class="h-100">
    <div class="title">
        고객센터
    </div>
    <div class="list_group">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice.css">
        <ul class="list-group list-group-flush mt-3">
            <li class="list-group-item "><a href="${pageContext.request.contextPath}/border/notice">공지사항</a></li>
            <li class="list-group-item "><a>자주 묻는 질문</a></li>
            <li class="list-group-item "><a>1:1문의</a></li>
        </ul>
    </div>
</aside>