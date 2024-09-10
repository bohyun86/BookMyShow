<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">

    <title>예매하다 - 1:1문의</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
    <!-- Bootstrap icons  -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/support.css">
    <style>
        #extra-info {
            background-color: white;
        }
    </style>
</head>
<body id="board-body">
<jsp:include page="../include/top.jsp"/>

<main class="row d-flex justify-content-between align-items-center" id="board-main">
    <aside class="h-100">
        <div class="title">
            고객센터
        </div>
        <div>
            <ul class="list-group list-group-flush mt-3">
                <li class="list-group-item "><a href="${pageContext.request.contextPath}/support/notice">공지사항</a></li>
                <li class="list-group-item "><a href="${pageContext.request.contextPath}/support/frequentQuestion">자주 묻는 질문</a></li>
                <li class="list-group-item "><span class="iqlist">1:1문의</span></li>
            </ul>
        </div>
    </aside>
    <section class="h-100" id="board-content">
        <div class="title">
            1:1문의
            
    <ul class="notice-header">
		<li style="width:35px;">번호</li>
		<li style="width:570px;">제목</li>
		<li style="width:80px">작성일</li>
	</ul>
            
        </div>
    </section>
</main>

<div id="noticenum">
<span onclick="location.reload();" style="cursor:pointer"><b class="now">1</b></span>
<a href="${pageContext.request.contextPath}/support/inquiry?pageNum=${2}" class="pgnum">2</a>
<a href="${pageContext.request.contextPath}/support/inquiry?pageNum=${3}" class="pgnum">3</a>
<a href="${pageContext.request.contextPath}/support/inquiry?pageNum=${4}" class="pgnum">4</a>
<a href="${pageContext.request.contextPath}/support/inquiry?pageNum=${5}" class="pgnum">5</a>
<b>>></b><a href="${pageContext.request.contextPath}/support/inquiry?pageNum=${i}" class="next">다음</a></div>

<jsp:include page="../include/bottom.jsp"/>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/dropdown.js"></script>
</body>
</html>