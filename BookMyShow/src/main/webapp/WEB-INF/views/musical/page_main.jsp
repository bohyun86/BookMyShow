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
			<li class="nav-item"><button class="filter-button genre-button nav-link text-black"
				aria-current="page"  name="all1" id="all1" value="">장르 전체</button></li>
			<li class="nav-item"><button class="filter-button genre-button nav-link text-black" name="ro" id="ro" value="로맨틱코미디">로맨틱코미디</button></li>
			<li class="nav-item"><button class="filter-button genre-button nav-link text-black" name="co" id="co" value="코믹">코믹</button></li>
			<li class="nav-item"><button class="filter-button genre-button nav-link text-black" name="dr" id="dr" value="드라마">드라마</button></li>
			<li class="nav-item"><button class="filter-button genre-button nav-link text-black" name="pe" id="pe" value="퍼포먼스">퍼포먼스</button></li>
			<li class="nav-item"><button class="filter-button genre-button nav-link text-black" name="ch" id="ch" value="어린이뮤지컬">어린이뮤지컬</button></li>
			<li class="nav-item"><button class="filter-button genre-button nav-link text-black" name="ot" id="ot" value="기타">기타</button></li>
		</ul>
	</section>

	<section class="container-fluid d-flex justify-content-between align-items-center"
	id="musical-page" style="width: 1100px; margin-top: 15px;">
		
		<!-- 좌측에 위치할 컨텐츠 -->
		<ul class="nav" id="category-area">
			<li class="nav-item"><button class="filter-button region-button nav-link text-secondary" 
				aria-current="page" name="all2" id="all2" value="">전체</button></li>
			<li class="nav-item"><button class="filter-button region-button nav-link text-secondary" name="da" id="da" value="대학로">대학로</button></li>
			<li class="nav-item"><button class="filter-button region-button nav-link text-secondary" name="se" id="se" value="서울">서울</button></li>
			<li class="nav-item"><button class="filter-button region-button nav-link text-secondary" name="gy" id="gy" value="경기">경기·인천</button></li>
			<li class="nav-item"><button class="filter-button region-button nav-link text-secondary" name="cd" id="cd" value="충청">충청·대전</button></li>
			<li class="nav-item"><button class="filter-button region-button nav-link text-secondary" name="gp" id="gp" value="경상">경상·대구·부산</button></li>
			<li class="nav-item"><button class="filter-button region-button nav-link text-secondary" name="jg" id="jg" value="전라">전라·광주</button></li>
			<li class="nav-item"><button class="filter-button region-button nav-link text-secondary" name="ga" id="ga" value="강원">강원</button></li>
			<li class="nav-item"><button class="filter-button region-button nav-link text-secondary" name="je" id="je" value="제주">제주</button></li>
		
		</ul>
	
		<!-- 우측 끝에 위치할 컨텐츠 -->
		<ul class="nav justify-content-end" id="category-sort">
			<li class="nav-item"><button class="filter-button sort-button nav-link text-secondary"
				aria-current="page" name="reviewCheck" id="reviewCheck" value="reviewcheck">인기순</button></li>
			<li class="nav-item"><button class="filter-button sort-button nav-link text-secondary" name="ratingCheck" id="ratingCheck" value="ratingCheck">별점순</button></li>
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
<%--                     <a href="${pageContext.request.contextPath}/musical/page_detail?musical_id=${MusicalDTO.musical_id}"> --%>
                        <img src="${pageContext.request.contextPath}/resources/upload/${MusicalDTO.upload_path }/${MusicalDTO.uuid}_${MusicalDTO.file_name}"
                            class="card-img-top" alt="..." style="width: 100%; height: auto;">
                    </a>
                    <!-- 카드 바디가 콘텐츠에 맞춰 자연스럽게 확장되도록 설정 -->
                    <div class="card-body w-100" style="flex-grow: 1;">
                        <c:if test="${!MusicalDTO.region_name1 eq null }" >
                        	<p class="area">${MusicalDTO.region_name1}</p>
                	 	</c:if>
                       	<c:if test="${!MusicalDTO.region_name2 eq null }" >
                       	 	<p class="area">${MusicalDTO.region_name2}</p>
                     	 </c:if>
                      	 <c:if test="${!MusicalDTO.region_name3 eq null }" >
                      	 	<p class="area">${MusicalDTO.region_name3}</p>
                       	 </c:if>
                     	 <c:if test="${!MusicalDTO.region_name4 eq null }" >
                     	 	<p class="area">${MusicalDTO.region_name4}</p>
                        </c:if>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/musical.js"></script>




</body>
</html>
