<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<h1 class="title mb-4">내가 작성한 리뷰</h1>
				<div class="review-summary mb-4">
					<span>총 리뷰 수: ${totalReviews}</span> <span>평균 평점: <span
						class="average-rating"> <fmt:formatNumber
								value="${averageRating}" pattern="#.#" /></span>/5</span>
				</div>
				<div class="review-list">
					<c:forEach var="review" items="${reviews}">
						<div class="review-item">
							<div class="review-header">
								<h5 class="review-title mb-0">
									${review.musicalTitle} <small class="text-muted"> (<fmt:parseDate
											value="${review.performanceDate}"
											pattern="yyyy-MM-dd'T'HH:mm" var="parsedPerformanceDate"
											type="both" /> <fmt:formatDate
											value="${parsedPerformanceDate}" pattern="yyyy-MM-dd HH:mm" />)
									</small>
								</h5>
								<small class="text-muted"> <fmt:parseDate
										value="${review.createdAt}" pattern="yyyy-MM-dd'T'HH:mm"
										var="parsedDateTime" type="both" /> <fmt:formatDate
										value="${parsedDateTime}" pattern="yyyy-MM-dd HH:mm" />
								</small>
							</div>
							<div class="review-body">
								<div class="star-rating" data-rating="${review.rating}">
									<c:forEach begin="1" end="5" var="i">
										<span class="star ${i <= review.rating ? 'filled' : ''}"
											data-value="${i}"> ${i <= review.rating ? '★' : '☆'} </span>
									</c:forEach>
								</div>
								<p class="review-content">${review.content}</p>
							</div>
							<div class="review-footer">
								<button class="btn btn-outline-primary btn-sm edit-review"
									data-review-id="${review.reviewId}">수정</button>
								<button class="btn btn-outline-danger btn-sm delete-review"
									data-review-id="${review.reviewId}">삭제</button>
							</div>
						</div>
					</c:forEach>
				</div>

				<!-- 페이지네이션 -->
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
						<c:if test="${pageDTO.hasPrevious()}">
							<li class="page-item"><a class="page-link"
								href="?page=${pageDTO.number - 1}" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:if test="${pageDTO.totalPages > 0}">
							<c:forEach begin="0" end="${pageDTO.totalPages - 1}" var="i">
								<li class="page-item ${pageDTO.number == i ? 'active' : ''}">
									<a class="page-link" href="?page=${i}">${i + 1}</a>
								</li>
							</c:forEach>
						</c:if>
						<c:if test="${pageDTO.hasNext()}">
							<li class="page-item"><a class="page-link"
								href="?page=${pageDTO.number + 1}" aria-label="Next"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</section>
	</main>

	<jsp:include page="../include/bottom.jsp" />
	<script>
		var contextPath = '${pageContext.request.contextPath}';
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/my/common.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/my/review.js"></script>
</body>
</html>