<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/my/header.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/my/review.css'/>">
</head>
<body id="board-body">
    <jsp:include page="../include/top.jsp"/>
    <jsp:include page="../include/my/myticket.jsp"/>
    
     <body id="board-body">
    <jsp:include page="../include/top.jsp"/>
    <jsp:include page="../include/my/myticket.jsp"/>
    
     <main id="board-main">
        <jsp:include page="../include/my/sidebar.jsp"/>
        <section id="board-content">
            <h1 class="title">내가 작성한 리뷰</h1>
            <div class="review-summary">
                <span>총 리뷰 수: ${reviewCount != null ? reviewCount : '3'}</span>
                <span>평균 평점: <span class="average-rating">${averageRating != null ? averageRating : '4.2'}</span>/5</span>
            </div>
            <div class="review-list">
                <c:choose>
                    <c:when test="${not empty reviews}">
                        <c:forEach var="review" items="${reviews}">
                            <div class="review-item">
                                <div class="review-header">
                                    <h5 class="review-title">${review.musicalTitle}</h5>
                                    <div class="review-date"><fmt:formatDate value="${review.createdAt}" pattern="yyyy-MM-dd"/></div>
                                </div>
                                <div class="review-body">
                                    <div class="star-rating" data-rating="${review.rating}">
                                        <span class="star" data-value="1">☆</span>
                                        <span class="star" data-value="2">☆</span>
                                        <span class="star" data-value="3">☆</span>
                                        <span class="star" data-value="4">☆</span>
                                        <span class="star" data-value="5">☆</span>
                                    </div>
                                    <p class="review-content">${review.content}</p>
                                    <c:if test="${not empty review.imageUrl}">
                                        <img src="${review.imageUrl}" class="review-image" alt="리뷰 이미지">
                                    </c:if>
                                </div>
                                <div class="review-footer">
                                    <button class="btn btn-outline-primary btn-sm edit-review" data-review-id="${review.id}">수정</button>
                                    <button class="btn btn-outline-danger btn-sm delete-review" data-review-id="${review.id}">삭제</button>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <!-- 예시 데이터 -->
                        <div class="review-item">
                            <div class="review-header">
                                <h5 class="review-title">뮤지컬 '레미제라블'</h5>
                                <div class="review-date">2024-03-15</div>
                            </div>
                            <div class="review-body">
                                <div class="star-rating" data-rating="4">
                                    <span class="star" data-value="1">☆</span>
                                    <span class="star" data-value="2">☆</span>
                                    <span class="star" data-value="3">☆</span>
                                    <span class="star" data-value="4">☆</span>
                                    <span class="star" data-value="5">☆</span>
                                </div>
                                <p class="review-content">감동적인 스토리와 훌륭한 음악이 어우러진 최고의 공연이었습니다. 배우들의 열연에 깊은 감동을 받았습니다.</p>
                                <img src="${pageContext.request.contextPath}/resources/images/review_example1.jpg" class="review-image" alt="레미제라블 공연 사진">
                            </div>
                            <div class="review-footer">
                                <button class="btn btn-outline-primary btn-sm edit-review" data-review-id="1">수정</button>
                                <button class="btn btn-outline-danger btn-sm delete-review" data-review-id="1">삭제</button>
                            </div>
                        </div>
                        <div class="review-item">
                            <div class="review-header">
                                <h5 class="review-title">뮤지컬 '오페라의 유령'</h5>
                                <div class="review-date">2024-02-20</div>
                            </div>
                            <div class="review-body">
                                <div class="star-rating" data-rating="5">
                                    <span class="star" data-value="1">☆</span>
                                    <span class="star" data-value="2">☆</span>
                                    <span class="star" data-value="3">☆</span>
                                    <span class="star" data-value="4">☆</span>
                                    <span class="star" data-value="5">☆</span>
                                </div>
                                <p class="review-content">환상적인 무대와 음악, 배우들의 뛰어난 연기력까지 모든 것이 완벽했습니다. 꼭 다시 보고 싶은 작품입니다!</p>
                            </div>
                            <div class="review-footer">
                                <button class="btn btn-outline-primary btn-sm edit-review" data-review-id="2">수정</button>
                                <button class="btn btn-outline-danger btn-sm delete-review" data-review-id="2">삭제</button>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>
    </main>



    <jsp:include page="../include/bottom.jsp"/>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/my/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/my/review.js"></script>
</body>
</html>