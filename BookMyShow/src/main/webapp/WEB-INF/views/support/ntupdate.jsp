<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">

    <title>예매하다 - 공지사항 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
    <!-- Bootstrap icons  -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/support-ntwrite.css">
        <style>
        .site-logo {
            text-decoration: none;
            color: #000;
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
    .supportForm input[type=text] {
	width: 800px;
	height: 50px;
	border-radius: 10px;
	margin-bottom: 10px;
	margin-right: 150px;
    }
    </style>
     <style>
    textarea {
	width: 800px;
	height: 700px;
	border-radius: 10px;
    }
    </style>
    <style>
    .notice_2 {
    font-weight: bold;
	font-size: 22px;
    text-decoration: none;
    }
    </style>
    <style>
    .notice_1 {
    font-weight: bold;
	font-size: 22px;
    text-decoration: none;
    }
    </style>
    <style>
    .btn_bbs1 {
    border: 1px solid black;
    background-color: #fff;
    font-size: 20px;
    text-decoration: none;
    color: black; 
    border-radius: 5px;
    margin-left: 450px;
    }
    </style>
    <style>
    .btn_bbs2 {
    border: 1px solid black;
    background-color: #fff;
    font-size: 20px;
    text-decoration: none;
    color: black; 
    border-radius: 5px;
    }
    </style>
</head>
<body id="board-body">
<jsp:include page="../include/top.jsp"/>

<main class="support-notice-write" id="notice-main">
    <section class="h-100" id="board-content">	
    <form action="${pageContext.request.contextPath}/support/ntupdatePro" class="supportForm" method="post" name="fr">
    <input type="hidden" name="notice_id" value="${supportNoticeDTO.notice_id}">
				<p class="notice_1">공지사항 제목</p> <input type="text" name="title"  value="${supportNoticeDTO.title }">				
				<div class="editer_content">
					    <p class="notice_2">공지사항 내용</p> <textarea name="content" rows="10" cols="30">${supportNoticeDTO.content }</textarea>
					    </div>
					<p class="btn_line txt_right">
				<a href="javascript:document.fr.submit();" class="btn_bbs1">공지사항 수정</a>
				<a href="${pageContext.request.contextPath}/support/ntdelete?notice_id=${supportNoticeDTO.notice_id}" class="btn_bbs2">공지사항 삭제</a>
				<a href="${pageContext.request.contextPath}/support/notice" class="btn_bbs2">돌아가기</a>
			</p>
		</form>
    </section>
</main>

<jsp:include page="../include/bottom.jsp"/>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/dropdown.js"></script>
</body>
</html>