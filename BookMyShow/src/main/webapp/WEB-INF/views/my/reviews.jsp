<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../include/my/header.jsp"%>
    <link rel="stylesheet" href="<c:url value='/resources/css/my/review.css'/>">
</head>
<body id="board-body">
    <jsp:include page="../include/top.jsp" />
    <jsp:include page="../include/my/myticket.jsp" />

    <main id="board-main">
        <jsp:include page="../include/my/sidebar.jsp" />
        <section id="board-content">
            <h1 class="title">내가 작성한 리뷰</h1>
            <div class="review-summary">
                <span>총 리뷰 수: ${reviewCount}</span>
                <span>평균 평점: <span class="average-rating"><fmt:formatNumber value="${averageRating}" pattern="#.#"/></span>/5</span>
            </div>
            <div class="review-list">
                <c:forEach var="review" items="${reviews}">
                    <div class="review-item">
                        <div class="review-header">
                            <h5 class="review-title">${review.musicalTitle}</h5>
                            <div class="review-date">
                                <fmt:parseDate value="${review.createdAt}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                                <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${parsedDateTime}" />
                            </div>
                        </div>
                        <div class="review-body">
                            <div class="star-rating" data-rating="${review.rating}">
                                <c:forEach begin="1" end="5" var="i">
                                    <span class="star ${i <= review.rating ? 'filled' : ''}" data-value="${i}">&#9733;</span>
                                </c:forEach>
                            </div>
                            <p class="review-content">${review.content}</p>
                        </div>
                        <div class="review-footer">
                            <button class="btn btn-outline-primary btn-sm edit-review" data-review-id="${review.reviewId}">수정</button>
                            <button class="btn btn-outline-danger btn-sm delete-review" data-review-id="${review.reviewId}">삭제</button>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
    </main>

    <jsp:include page="../include/bottom.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/my/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/my/review.js"></script>
</body>
</html>