<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
pageContext.setAttribute("formatter", formatter);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/my/header.jsp"%>
<link rel="stylesheet"
	href="<c:url value='/resources/css/my/card.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/my/detail.css'/>">
</head>
<body id="board-body">
	<jsp:include page="../include/top.jsp" />
	<jsp:include page="../include/my/myticket.jsp" />

	<main id="board-main">
		<jsp:include page="../include/my/sidebar.jsp" />
		<section id="board-content">
			<div class="title">예매 완료</div>
			<div class="booking-complete-card">
				<p class="text-center mb-2">결제가 정상적으로 완료되었습니다.</p>
				<p class="text-center mb-4">하단의 티켓 배부 및 좌석 배정 방식을 확인해주세요.</p>

				<div class="booking-card mb-4">
					<div class="card-body">
						<div class="row h-100 no-gutters">
							<div
								class="col-md-3 h-100 d-flex align-items-center justify-content-start">
								<a href="<c:url value='/musical/detail/${musical.musicalId}'/>"
									class="img-container"> <!--                                     musical.image -->
									<img
										src="${pageContext.request.contextPath}/${attachFile.postFilePath}"
									class="poster-img" alt="${musical.title} 포스터">
								</a>
							</div>
							<div class="col-md-9 d-flex flex-column h-100 pl-3">
								<div class="booking-info mb-2">
									<span class="status">${booking.status}</span> <span
										class="booking-date"> ${booking.bookingDate.format(formatter)}
									</span>
								</div>
								<div
									class="content-wrapper d-flex flex-column justify-content-between flex-grow-1">
									<div class="row align-items-center no-gutters mb-2">
										<div class="col-8 pr-2">
											<h5 class="card-title mb-0">
												<a
													href="<c:url value='/musical/detail/${musical.musicalId}'/>"
													class="card-title-link">${musical.title}</a>
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
												${performance.performanceDate.format(DateTimeFormatter.ofPattern('yyyy-MM-dd HH:mm'))}
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
												<fmt:formatNumber value="${payment.paymentAmount}"
													type="currency" currencySymbol="₩" />
											</p>
										</div>
										<div class="col-4 pl-2">
											<button
												onclick="location.href='<c:url value='/my/refund/${booking.bookingId}'/>';"
												class="btn btn-outline-danger w-100">환불신청</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="ticket-info bg-secondary bg-opacity-25 p-4 rounded">
					<h3 class="mb-3">티켓 배부 및 좌석 배정 안내</h3>
					<ul>
						<li>공연 전날 자정 예매 마감</li>
						<li>공연 시작 1시간 전부터 공연장 매표소에서 티켓 배부</li>
						<li>문자/예매내역 제시 및 본인확인 후 수령</li>
						<li>공연 시작 20분 전부터 공연장 입장</li>
						<li>지정석: 예매 시 지정한 좌석</li>
					</ul>
				</div>

				<div class="d-flex justify-content-center mt-4 action-buttons">
					<a href="<c:url value='/'/>"
						class="btn btn-outline-secondary me-2 flex-grow-1">홈으로</a> <a
						href="<c:url value='/my/bookings'/>"
						class="btn btn-outline-dark flex-grow-1">예매 내역 확인</a>
				</div>
			</div>
		</section>
	</main>

	<!-- 좌석 확인 모달 -->
<div class="modal fade" id="seatModal${booking.bookingId}"
    tabindex="-1" aria-labelledby="seatModalLabel${booking.bookingId}"
    aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="seatModalLabel${booking.bookingId}">좌석 정보</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                    aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <ul id="seatList${booking.bookingId}">
                </ul>
            </div>
        </div>
    </div>
</div>

	<jsp:include page="../include/bottom.jsp" />

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/my/common.js"></script>
		
</body>
</html>