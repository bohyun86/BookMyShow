<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">

    <title>예매하다 - 공지사항</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
    <!-- Bootstrap icons  -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/support.css">
        <style>
        .site-logo {
            text-decoration: none;
            color: #ff4b4b;
            font-size: 30px;
            font-weight: bold;
        }
    </style>
    <style>
        #extra-info {
            background-color: white;
        }
    </style>
    <style>
    .btn_srch {
    border: 1px solid black;
    background-color: #eee;
    font-size: 16px;
    margin-left: 510px;
    border-radius: 5px
    }
    </style>
    <style>
    .notice-body {
    list-style: none;
    margin-top: 24px;
    height: 40px;
    border-radius: 8px;
    }
    </style>
     <style>
    .notice-body li {
    float: left;
    padding-top: 11px;
    text-align: center;
    font-size: 15px;
    font-weight: 600;
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
                <li class="list-group-item "><span class="noticelist">공지사항</span></li>
                <li class="list-group-item "><a href="${pageContext.request.contextPath}/support/frequentQuestion">자주 묻는 질문</a></li>
                <li class="list-group-item "><a href="${pageContext.request.contextPath}/support/inquiry">1:1문의</a></li>
            </ul>
        </div>
    </aside>
    <section class="h-100" id="board-content">
        <div class="title">
            공지사항
         
<%--          <c:if test="${ ! empty sessionScope.userName }"> --%>
<%--           <c:if test="${sessionScope.userName eq 'admin'}"> --%>
           <a href="${pageContext.request.contextPath}/support/ntwrite" class="btn_srch">공지사항 작성</a>
<%--           </c:if> --%>
<%--          </c:if> --%>
         
    <ul class="notice-header">
		<li style="width:35px;">번호</li>
		<li style="width:570px;">제목</li>
		<li style="width:80px">작성일</li>
	</ul>
	
	<c:forEach var="supportNoticeDTO" items="${noticeList }">
	<ul class="notice-body">
		<li style="width:35px;">${supportNoticeDTO.notice_id }</li>
		<li style="width:570px;"><a href="javascript:;">${supportNoticeDTO.title }</a></li>
		<li style="width:90px"><fmt:formatDate value="${supportNoticeDTO.created_at }" pattern="yyyy-MM-dd"/></li>
	</ul>
	</c:forEach>
            
        </div>
    </section>
</main>

<div id="noticenum">
<span onclick="location.reload();" style="cursor:pointer"><b class="now">
<a href="${pageContext.request.contextPath}/support/notice?pageNum=${1}">1</a></b></span>
<a href="${pageContext.request.contextPath}/support/notice?pageNum=${2}" class="pgnum">2</a>
<a href="${pageContext.request.contextPath}/support/notice?pageNum=${3}" class="pgnum">3</a>
<a href="${pageContext.request.contextPath}/support/notice?pageNum=${4}" class="pgnum">4</a>
<a href="${pageContext.request.contextPath}/support/notice?pageNum=${5}" class="pgnum">5</a>
<b>>></b><a href="${pageContext.request.contextPath}/support/notice?pageNum=${i}" class="next">다음</a></div>

<jsp:include page="../include/bottom.jsp"/>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/dropdown.js"></script>
</body>
</html>