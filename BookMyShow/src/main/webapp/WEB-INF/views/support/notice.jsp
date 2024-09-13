
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">

    <title>예매하다 - 원하는 뮤지컬을 바로!</title>

    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">

    <style>
        .site-logo {
            text-decoration: none;
            color: #ff4b4b;
            font-size: 30px;
            font-weight: bold;
        }
        
    
    
    
    </style>
</head>
</head>
<body id="board-body">
<jsp:include page="../include/top.jsp"/>

<main class="row d-flex justify-content-between align-items-center" id="board-main">

    <jsp:include page="../include/support/aside.jsp"/>

    <section class="h-100" id="board-content">
        <div class="title">
            공지사항
            
            <span class="d-block p-2 text-bg-Secondary">d-block</span>
            
            
            
<!--       <div style="margin-top:17px; "> -->

<!-- 	<ul class="bbs_list_header"> -->
<!-- 		<li style="width:75px;">번호</li> -->
<!-- 		<li style="width:590px;">제목</li> -->
<!-- 		<li style="width:90px">작성일</li> -->
<!-- 	</ul> -->
	      
            
        </div>
        
        
    </section>
</main>

<div id="noticenum">
    <span onclick="location.reload();" style="cursor:pointer"><b class="now">1</b></span>
    <a href="/bbs_list.php?tb=board_notice&amp;pg=2&amp;number=&amp;category=" class="pgnum">2</a>
    <a href="/bbs_list.php?tb=board_notice&amp;pg=3&amp;number=&amp;category=" class="pgnum">3</a>
    <a href="/bbs_list.php?tb=board_notice&amp;pg=4&amp;number=&amp;category=" class="pgnum">4</a>
    <a href="/bbs_list.php?tb=board_notice&amp;pg=5&amp;number=&amp;category=" class="pgnum">5</a>
    <b>>></b><a href="/bbs_list.php?tb=board_notice&amp;pg=6&amp;number=&amp;category=" class="next">다음</a>
</div>

 <!-- 내비게이션 버튼 추가 -->
            <button class="prev-btn time-sale position-absolute start-0"><i class="bi bi-caret-left-fill"></i></button>
            <button class="next-btn time-sale position-absolute end-0"><i class="bi bi-caret-right-fill"></i></button>
        </div>
    </section>
</main>

<jsp:include page="../include/bottom.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cards.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/dropdown.js"></script>
</body>
</html>