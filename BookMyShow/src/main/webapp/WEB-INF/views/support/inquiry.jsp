<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
    margin-left: 570px;
    border-radius: 5px
    }
    </style>
    <style>
    .inquiry-body {
    list-style: none;
    margin-top: 24px;
    height: 40px;
    border-radius: 8px;
    }
    </style>
     <style>
    .inquiry-body li {
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
                <li class="list-group-item "><a href="${pageContext.request.contextPath}/support/notice">공지사항</a></li>
                <li class="list-group-item "><a href="${pageContext.request.contextPath}/support/frequentQuestion">자주 묻는 질문</a></li>
                <li class="list-group-item "><span class="iqlist">1:1문의</span></li>
            </ul>
        </div>
    </aside>
    <section class="h-100" id="board-content">
        <div class="title">
            1:1문의
            
            <c:if test="${ ! empty sessionScope.userRole }">
           <a href="${pageContext.request.contextPath}/support/inwrite" class="btn_srch">문의하기</a>
          </c:if>
            
    <ul class="notice-header">
		<li style="width:35px;">번호</li>
		<li style="width:570px;">제목</li>
		<li style="width:80px">작성일</li>
	</ul>
	
	<c:forEach var="supportinquiryDTO" items="${inList }">
	<ul class="inquiry-body">
		<li style="width:35px;">${supportinquiryDTO.inquiry_id }</li>
		<li style="width:570px;"><a href="${pageContext.request.contextPath}/support/incontent?inquiry_id=${supportinquiryDTO.inquiry_id}">${supportinquiryDTO.title }</a></li>
		<li style="width:90px"><fmt:formatDate value="${supportinquiryDTO.created_at }" pattern="yyyy-MM-dd"/></li>
	</ul>
	</c:forEach>
	
	<div id="noticenum">
				<c:if test="${pageDTO.currentPage ne 1}">
					<a href="${pageContext.request.contextPath}/support/inquiry?pageNum=${pageDTO.currentPage-1}" class="prevpage  pbtn">이전</a>
				</c:if>
				
				<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
					<c:if test="${pageDTO.currentPage eq i}">
						<a href="${pageContext.request.contextPath}/support/inquiry?pageNum=${i}"><span class="pagenum currentpage">${i}</span></a>
					</c:if>
					<c:if test="${pageDTO.currentPage ne i}">
						<a href="${pageContext.request.contextPath}/support/inquiry?pageNum=${i}"><span class="pagenum">${i}</span></a>
					</c:if>
				</c:forEach>
				<c:if test="${pageDTO.currentPage ne pageDTO.pageCount}">
					<a href="${pageContext.request.contextPath}/support/inquiry?pageNum=${pageDTO.currentPage+1}" class="nextpage  pbtn">다음</a>
				</c:if>
			</div>
            
        </div>
    </section>
</main>

<jsp:include page="../include/bottom.jsp"/>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/dropdown.js"></script>
</body>
</html>