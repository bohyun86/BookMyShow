<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">

    <title>예매하다 - 공지사항 글쓰기</title>
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
    #board-main {
    height: 920px;
    width: 1100px;
    padding: 40px;
    }
    </style>
</head>
<body id="board-body">
<jsp:include page="../include/top.jsp"/>

<main class="support-notice-write" id="board-main">
    <section class="h-100" id="board-content">
    <form action="${pageContext.request.contextPath}/support/writePro" class="supportForm" method="post" name="fr">		
			<ul class="notice-write">
				<li class="notice_title">글제목 : <input type="text" name="subject"></li>
				<li class="notice_content">
					<div class="editer_content">
					    글내용 : <textarea name="content" rows="10" cols="30"></textarea>
                    </div>
				</li>
			</ul>
					<p class="btn_line txt_right">
				<a href="javascript:document.fr.submit();" class="btn_bbs">공지사항 작성</a>
				<a href="${pageContext.request.contextPath}/support/notice" class="btn_bbs">돌아가기</a>
			</p>
		</form>
    </section>
</main>

<jsp:include page="../include/bottom.jsp"/>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/dropdown.js"></script>
</body>
</html>