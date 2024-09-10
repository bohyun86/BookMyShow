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
    
        <main class="container" id="board-main">
        <jsp:include page="../include/my/sidebar.jsp"/>
        <section id="board-content">
            <h1 class="title">내가 작성한 리뷰</h1>
            <div class="review-summary">
                <span>총 리뷰 수: ${reviewCount}</span>
                <span>평균 평점: <span class="average-rating">${averageRating}</span>/5</span>
            </div>
            <div class="review-list row">
                <c:choose>
                    <c:when test="${not empty reviews}">
                        <c:forEach var="review" items="${reviews}">
                            <div class="col-md-6 col-lg-4 mb-4">
                                <div class="card review-item">
                                    <div class="card-header">
                                        <h5 class="card-title">${review.musicalTitle}</h5>
                                        <div class="review-date"><fmt:formatDate value="${review.createdAt}" pattern="yyyy-MM-dd"/></div>
                                    </div>
                                    <div class="card-body">
                                        <div class="review-rating mb-2">
                                            <c:forEach begin="1" end="5" var="star">
                                                <span class="star ${star <= review.rating ? 'filled' : ''}">★</span>
                                            </c:forEach>
                                        </div>
                                        <p class="card-text review-content">${review.content}</p>
                                        <c:if test="${not empty review.imageUrl}">
                                            <img src="${review.imageUrl}" class="img-fluid rounded" alt="리뷰 이미지">
                                        </c:if>
                                    </div>
                                    <div class="card-footer">
                                        <button class="btn btn-outline-primary btn-sm edit-review" data-review-id="${review.id}">수정</button>
                                        <button class="btn btn-outline-danger btn-sm delete-review" data-review-id="${review.id}">삭제</button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <!-- 예시 데이터 -->
                        <div class="col-md-6 col-lg-4 mb-4">
                            <div class="card review-item">
                                <div class="card-header">
                                    <h5 class="card-title">뮤지컬 제목 (예: 옥탑방 고양이)</h5>
                                    <div class="review-date">2024-09-10</div>
                                </div>
                                <div class="card-body">
                                    <div class="review-rating mb-2">
                                        <span class="star filled">★</span>
                                        <span class="star filled">★</span>
                                        <span class="star filled">★</span>
                                        <span class="star filled">★</span>
                                        <span class="star">★</span>
                                    </div>
                                    <p class="card-text review-content">정말 재미있는 공연이었습니다. 배우들의 연기가 훌륭했고, 스토리도 감동적이었습니다.</p>
                                    <img src="예시 이미지 URL" class="img-fluid rounded" alt="리뷰 이미지 예시">
                                </div>
                                <div class="card-footer">
                                    <button class="btn btn-outline-primary btn-sm edit-review" data-review-id="예시ID">수정</button>
                                    <button class="btn btn-outline-danger btn-sm delete-review" data-review-id="예시ID">삭제</button>
                                </div>
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