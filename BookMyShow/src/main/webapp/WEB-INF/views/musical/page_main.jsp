<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매하다 - 뮤지컬</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/musical.css">


</head>
<body>
<jsp:include page="../include/top.jsp"/>



<main class="w-100">
	<section class="container-fluid d-flex justify-content-between align-items-center"
	id="musical-page" style="width: 1100px; margin-top: 5px;">
		<ul class="nav nav-pills nav-fill" id="category-genre">
			<li class="nav-item"><a class="nav-link text-black active"
				aria-current="page" href="${pageContext.request.contextPath}/musical/page_main">장르 전체</a></li>
			<li class="nav-item"><a class="nav-link text-black" href="${pageContext.request.contextPath}/musical/page_romantic">로맨틱코미디</a></li>
			<li class="nav-item"><a class="nav-link text-black" href="${pageContext.request.contextPath}/musical/page_comic">코믹</a></li>
			<li class="nav-item"><a class="nav-link text-black" href="${pageContext.request.contextPath}/musical/page_drama">드라마</a></li>
			<li class="nav-item"><a class="nav-link text-black" href="${pageContext.request.contextPath}/musical/page_performance">퍼포먼스</a></li>
			<li class="nav-item"><a class="nav-link text-black" href="${pageContext.request.contextPath}/musical/page_child">어린이뮤지컬</a></li>
			<li class="nav-item"><a class="nav-link text-black" href="${pageContext.request.contextPath}/musical/page_other">기타</a></li>
		</ul>
	</section>

	<section class="container-fluid d-flex justify-content-between align-items-center"
	id="musical-page" style="width: 1100px; margin-top: 15px;">
		
		<!-- 좌측에 위치할 컨텐츠 -->
		<ul class="nav" >
			<li class="nav-item"><a class="nav-link text-secondary text-danger" 
				aria-current="page" href="${pageContext.request.contextPath}/musical/page_main">전체</a></li>
			<li class="nav-item"><a class="nav-link text-secondary" href="${pageContext.request.contextPath}/musical/page_Daehak">대학로</a></li>
			<li class="nav-item"><a class="nav-link text-secondary" href="${pageContext.request.contextPath}/musical/page_Seoul">서울</a></li>
			<li class="nav-item"><a class="nav-link text-secondary" href="${pageContext.request.contextPath}/musical/page_Gyeonggi">경기·인천</a></li>
			<li class="nav-item"><a class="nav-link text-secondary" href="${pageContext.request.contextPath}/musical/page_Chungcheong">충청·대전</a></li>
			<li class="nav-item"><a class="nav-link text-secondary" href="${pageContext.request.contextPath}/musical/page_Gyeongsang">경상·대구·부산</a></li>
			<li class="nav-item"><a class="nav-link text-secondary" href="${pageContext.request.contextPath}/musical/page_Jeolla">전라·광주</a></li>
			<li class="nav-item"><a class="nav-link text-secondary" href="${pageContext.request.contextPath}/musical/page_Gangwon">강원</a></li>
			<li class="nav-item"><a class="nav-link text-secondary" href="${pageContext.request.contextPath}/musical/page_Jeju">제주</a></li>
		
		</ul>
	
		<!-- 우측 끝에 위치할 컨텐츠 -->
		<ul class="nav justify-content-end" id="category-sort">
			<li class="nav-item"><a class="nav-link text-secondary active"
				aria-current="page" href="${pageContext.request.contextPath}/musical/page_pop">인기순</a></li>
			<li class="nav-item"><a class="nav-link text-secondary" href="${pageContext.request.contextPath}/musical/page_star">별점순</a></li>
		</ul>
	</section>

<section class="container-fluid d-flex justify-content-center"
        id="musical-page">
        <div class="cards-wrapper overflow-hidden position-relative"
            style="width: 1100px; margin-top: 10px;">
            
            <!-- CSS Grid를 적용한 부분, 한 줄에 4개의 카드 배치 -->
            <div class="cards new-open d-grid mt-2"
                style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; margin-bottom: 20px;">
            
            <c:forEach var="MusicalDTO" items="${getMusical}">
                <!-- 카드 간 위아래 margin 추가 -->
                <div class="card new-open" 
                     style="width: 100%; margin-bottom: 60px; display: flex; flex-direction: column;">
                    <a href="${pageContext.request.contextPath}/musical/page_detail">
                        <img src="${pageContext.request.contextPath}/resources/upload/${MusicalDTO.upload_path }/${MusicalDTO.uuid}+${MusicalDTO.file_name}"
                            class="card-img-top" alt="..." style="width: 100%; height: auto;">
                    </a>
                    <!-- 카드 바디가 콘텐츠에 맞춰 자연스럽게 확장되도록 설정 -->
                    <div class="card-body w-100" style="flex-grow: 1;">
                        <p class="area">${MusicalDTO.region_name}</p>
                        
                        <p class="category">🗂️${MusicalDTO.genre_name}</p>
                       
                        <h6 class="title">${MusicalDTO.title}</h6>
                        <div class="ticket-price d-flex justify-content-between">
                            <p class="discount">${MusicalDTO.discount_rate}%</p>
                            <p class="price">${MusicalDTO.price }원</p>
                        </div>
                    </div>
                </div>
            </c:forEach>

            </div>
        
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
