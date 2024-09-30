<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/my/header.jsp"%>
<link rel="stylesheet"
	href="<c:url value='/resources/css/my/card.css'/>">
</head>
<body id="board-body">
	
	<jsp:include page="../include/top.jsp" />
	<jsp:include page="../include/my/myticket.jsp" />

	<main id="board-main">
		<jsp:include page="../include/my/sidebar.jsp" />
		<section id="board-content">
			<div class="title">환불내역</div>

			<c:forEach var="booking" items="${refunds}" varStatus="status">
				<div class="booking-card">
					<div class="card-body">
						<div class="row h-100 no-gutters">
							<div
								class="col-md-3 h-100 d-flex align-items-center justify-content-start">
								<c:if
									test="${not empty musicals[status.index] and not empty attachFiles[status.index]}">
									<a
										href="<c:url value='/musical/page_detail?musical_id=${musicals[status.index].musicalId}'/>"
										class="img-container"> <img
										src="${pageContext.request.contextPath}/${attachFiles[status.index].postFilePath}"
										class="poster-img" alt="${musicals[status.index].title} 포스터">
									</a>
								</c:if>
							</div>
							<div class="col-md-9 d-flex flex-column h-100 pl-3">
								<div class="booking-info mb-2">
									<span class="status">${booking.status}</span> <span
										class="booking-date"> <fmt:parseDate
											value="${booking.bookingDate}" pattern="yyyy-MM-dd'T'HH:mm"
											var="parsedDate" type="both" /> <fmt:formatDate
											value="${parsedDate}" pattern="yyyy-MM-dd" />
									</span>
								</div>
								<div
									class="content-wrapper d-flex flex-column justify-content-between flex-grow-1">
									<div class="row align-items-center no-gutters mb-2">
										<div class="col-12">
											<h5 class="card-title mb-0">
												<c:if test="${not empty musicals[status.index]}">
													<a
														href="<c:url value='/musical/page_detail?musical_id=${musicals[status.index].musicalId}'/>"
														class="card-title-link">${musicals[status.index].title}</a>
												</c:if>
											</h5>
										</div>
									</div>
									<div class="row align-items-center no-gutters mb-2">
										<div class="col-8">
											<p class="card-text mb-0 performance-date">
												<c:if test="${not empty performances[status.index]}">
													<fmt:parseDate
														value="${performances[status.index].performanceDate}"
														pattern="yyyy-MM-dd'T'HH:mm" var="parsedPerformanceDate"
														type="both" />
													<fmt:formatDate value="${parsedPerformanceDate}"
														pattern="yyyy-MM-dd HH:mm" />
												</c:if>
											</p>
										</div>
										<div class="col-4">
											<button
												onclick="location.href='<c:url value='/my/refund-detail/${booking.bookingId}'/>';"
												class="btn btn-outline-dark w-100">상세내역</button>
										</div>
									</div>
									<div class="row align-items-center no-gutters">
										<div class="col-12">
											<p class="card-text mb-0 refund-amount">
												총 ${booking.ticketCount}매 
												<c:if test="${not empty payments[status.index]}">
													<fmt:formatNumber
														value="${payments[status.index].refundAmount * booking.ticketCount}"
														type="currency" currencySymbol="₩" />
												</c:if>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

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
		</section>
	</main>

	<jsp:include page="../include/bottom.jsp" />

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/my/common.js"></script>
</body>
</html>