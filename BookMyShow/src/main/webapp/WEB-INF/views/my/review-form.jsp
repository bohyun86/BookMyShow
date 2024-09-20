<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../include/my/header.jsp"%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value='/resources/css/my/review.css'/>">
</head>
<body id="board-body">
    <jsp:include page="../include/top.jsp" />
    <jsp:include page="../include/my/myticket.jsp" />

    <main id="board-main" class="container mt-5">
        <jsp:include page="../include/my/sidebar.jsp" />
        <section id="board-content">
            <h1 class="mb-4">${isEdit ? '리뷰 수정' : '리뷰 작성'}</h1>
            <form id="reviewForm" action="${pageContext.request.contextPath}/my/${isEdit ? 'review-update' : 'review-create'}" method="post">
                <input type="hidden" name="${isEdit ? 'reviewId' : 'performanceId'}" value="${isEdit ? review.reviewId : performance.performanceId}">
                <div class="mb-3">
                    <label for="musicalTitle" class="form-label">뮤지컬 제목</label>
                    <input type="text" class="form-control" id="musicalTitle" value="${isEdit ? review.musicalTitle : performance.musicalTitle}" readonly>
                </div>
                <div class="mb-3">
                    <label for="performanceId" class="form-label">공연 ID</label>
                    <input type="text" class="form-control" id="performanceId" value="${isEdit ? review.performanceId : performance.performanceId}" readonly>
                </div>
                <div class="mb-3">
                    <label for="performanceDate" class="form-label">공연 날짜</label>
                    <input type="text" class="form-control" id="performanceDate" 
                           value="<fmt:formatDate value='${isEdit ? review.performanceDate : performance.performanceDate}' pattern='yyyy-MM-dd HH:mm'/>" readonly>
                </div>
                <div class="mb-3">
                    <label class="form-label">평점</label>
                    <div class="star-rating" data-rating="${isEdit ? review.rating : 5}">
                        <c:forEach begin="1" end="5" var="i">
                            <span class="star ${i <= (isEdit ? review.rating : 5) ? 'filled' : ''}" data-value="${i}">&#9733;</span>
                        </c:forEach>
                    </div>
                    <input type="hidden" name="rating" id="ratingInput" value="${isEdit ? review.rating : 5}">
                </div>
                <div class="mb-3">
                    <label for="content" class="form-label">리뷰 내용</label>
                    <textarea class="form-control" id="content" name="content" rows="5" required>${isEdit ? review.content : ''}</textarea>
                </div>
                <button type="submit" class="btn btn-primary">${isEdit ? '리뷰 수정' : '리뷰 작성'}</button>
                <c:if test="${isEdit}">
                    <button type="button" class="btn btn-danger" id="deleteReview" data-review-id="${review.reviewId}">리뷰 삭제</button>
                </c:if>
            </form>
        </section>
    </main>

    <jsp:include page="../include/bottom.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/my/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/my/review.js"></script>
</body>
</html>