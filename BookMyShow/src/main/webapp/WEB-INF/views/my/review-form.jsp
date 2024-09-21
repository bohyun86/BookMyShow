<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/my/header.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='/resources/css/my/review.css'/>">
</head>
<body id="board-body">
	<jsp:include page="../include/top.jsp" />
	<jsp:include page="../include/my/myticket.jsp" />

	<main id="board-main">
		<jsp:include page="../include/my/sidebar.jsp" />
		<section id="board-content">
			<div class="container">
				<h1 class="title mb-4">${isEdit ? '리뷰 수정' : '리뷰 작성'}</h1>
				<form id="reviewForm"
					action="${pageContext.request.contextPath}/my/${isEdit ? 'review-update' : 'review-create'}"
					method="post">
					<input type="hidden"
						name="${isEdit ? 'reviewId' : 'performanceId'}"
						value="${isEdit ? review.reviewId : performance.performanceId}">
					<input type="hidden" name="musicalId"
						value="${isEdit ? review.musicalId : performance.musicalId}">
					<div class="mb-3">
						<label for="musicalTitle" class="form-label">뮤지컬 제목</label> <input
							type="text" class="form-control" id="musicalTitle"
							value="${isEdit ? review.musicalTitle : performance.musicalTitle}"
							readonly>
					</div>
					<div class="mb-3">
						<label for="performanceId" class="form-label">공연 ID</label> <input
							type="text" class="form-control" id="performanceId"
							name="performanceId"
							value="${isEdit ? review.performanceId : performance.performanceId}"
							readonly>
					</div>
					<div class="mb-3">
						<label for="performanceDate" class="form-label">공연 날짜</label> <input
							type="text" class="form-control" id="performanceDate"
							value="${formattedPerformanceDate}" readonly>
					</div>
					<div class="mb-3">
						<label class="form-label">평점</label>
						<div class="star-rating"
							data-rating="${isEdit ? review.rating : 5}">
							<c:forEach begin="1" end="5" var="i">
								<span
									class="star ${i <= (isEdit ? review.rating : 5) ? 'filled' : ''}"
									data-value="${i}"> ${i <= (isEdit ? review.rating : 5) ? '★' : '☆'}
								</span>
							</c:forEach>
						</div>
						<input type="hidden" name="rating" id="ratingInput"
							value="${isEdit ? review.rating : 5}">
					</div>
					<div class="mb-3">
						<label for="content" class="form-label">리뷰 내용</label>
						<textarea class="form-control" id="content" name="content"
							rows="5" required>${isEdit ? review.content : ''}</textarea>
					</div>
					<button type="submit" class="btn btn-primary">${isEdit ? '리뷰 수정' : '리뷰 작성'}</button>
					<c:if test="${isEdit}">
						<button type="button" class="btn btn-danger" id="deleteReview"
							data-review-id="${review.reviewId}">리뷰 삭제</button>
					</c:if>
				</form>
			</div>
		</section>
	</main>

	<jsp:include page="../include/bottom.jsp" />

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		var contextPath = '${pageContext.request.contextPath}';
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/js/my/common.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/my/review.js"></script>
</body>
</html>