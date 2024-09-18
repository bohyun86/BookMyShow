<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
			<div class="title">예매내역</div>

			<c:forEach var="booking" items="${bookings}" varStatus="status">
				<div class="booking-card">
					<div class="card-body">
						<div class="row h-100 no-gutters">
							<div
								class="col-md-3 h-100 d-flex align-items-center justify-content-start">
								<a
									href="<c:url value='/musical/detail/${performances[status.index].musicalId}'/>"
									class="img-container"> <img
									src="${pageContext.request.contextPath}/${attachFiles[status.index].postFilePath}"
									class="poster-img" alt="${musicals[status.index].title} 포스터">
								</a>
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
										<div class="col-8 pr-2">
											<h5 class="card-title mb-0">
												<a
													href="<c:url value='/musical/detail/${performances[status.index].musicalId}'/>"
													class="card-title-link">${musicals[status.index].title}</a>
											</h5>
										</div>
										<div class="col-4 pl-2">
											<button
												class="btn btn-outline-secondary w-100 seat-check-button"
												data-bs-toggle="modal"
												data-bs-target="#seatModal${booking.bookingId}"
												data-booking-id="${booking.bookingId}">좌석확인</button>
										</div>
									</div>
									<div class="row align-items-center no-gutters mb-2">
										<div class="col-8 pr-2">
											<p class="card-text mb-0">
												공연일:
												<fmt:parseDate
													value="${performances[status.index].performanceDate}"
													pattern="yyyy-MM-dd'T'HH:mm" var="parsedPerformanceDate"
													type="both" />
												<fmt:formatDate value="${parsedPerformanceDate}"
													pattern="yyyy-MM-dd HH:mm" />
											</p>
										</div>
										<div class="col-4 pl-2">
											<button
												onclick="location.href='<c:url value='/my/booking-detail/${booking.bookingId}'/>';"
												class="btn btn-outline-dark w-100">상세내역</button>
										</div>
									</div>
									<div class="row align-items-center no-gutters">
										<div class="col-8 pr-2">
											<p class="card-text mb-0 ticket-amount">
												총 ${booking.ticketCount}매 /
												<fmt:formatNumber
													value="${payments[status.index].paymentAmount}"
													type="currency" currencySymbol="₩" />
											</p>
										</div>
										<div class="col-4 pl-2">
											<c:set var="now" value="<%=new java.util.Date()%>" />
											<c:choose>
												<c:when test="${parsedPerformanceDate.after(now)}">
													<button
														onclick="location.href='<c:url value='/my/refund/${booking.bookingId}'/>';"
														class="btn btn-outline-danger w-100">환불신청</button>
												</c:when>
												<c:otherwise>
													<button onclick="writeReview('${booking.bookingId}');"
														class="btn btn-outline-success w-100">리뷰작성</button>
												</c:otherwise>
											</c:choose>
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

	<!-- 좌석 확인 모달 -->
	<c:forEach var="booking" items="${bookings}" varStatus="status">
		<div class="modal fade" id="seatModal${booking.bookingId}"
			tabindex="-1" aria-labelledby="seatModalLabel${booking.bookingId}"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="seatModalLabel${booking.bookingId}">좌석
							정보</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<ul>
							<c:forEach var="seat"
								items="${bookedSeatsMap[booking.bookingId]}">
								<li>${seat.seatNumber}</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

	<script>
        var contextPath = '${pageContext.request.contextPath}';
        
        function writeReview(bookingId) {
            window.location.href = contextPath + '/review/write/' + bookingId;
        }
    </script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/my/common.js"></script>
</body>
</html>