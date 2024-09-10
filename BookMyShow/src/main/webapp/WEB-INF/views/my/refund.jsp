<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/my/header.jsp"%>
<link rel="stylesheet"
	href="<c:url value='/resources/css/my/detail.css'/>">
</head>
<body id="board-body">
	<jsp:include page="../include/top.jsp" />
	<jsp:include page="../include/my/myticket.jsp" />

	<main id="board-main">
		<jsp:include page="../include/my/sidebar.jsp" />
		<section id="board-content">
			<div class="title">환불 신청</div>
			<div class="refund-card">
				<div class="booking-info">
					<div class="poster">
						<img
							src="<c:url value='/resources/images/poster/${booking.musical.posterImage}'/>"
							alt="포스터">
					</div>
					<div class="info">
						<h2>${booking.musical.title}</h2>
						<p>
							<strong>장소:</strong> ${booking.musical.venue.venueName}
						</p>
						<p>
							<strong>주소:</strong> ${booking.musical.venue.address}
						</p>
						<p>
							<strong>연령:</strong> ${booking.musical.ageRating}
						</p>
						<p>
							<strong>옵션:</strong> ${booking.performanceDate}
							${booking.ticketOption}
						</p>
						<p>
							<strong>가격:</strong>
							<fmt:formatNumber value="${booking.totalAmount}" type="currency"
								currencySymbol="₩" />
							(${booking.ticketCount}매)
						</p>
					</div>
				</div>
				<div class="refund-details">
					<h3>위약 공제금 확인</h3>
					<p class="text-danger">이용 7일 이전으로 전액환불 진행됩니다.</p>
					<h3>환불금액</h3>
					<table class="table">
						<tr>
							<td>결제 금액</td>
							<td><fmt:formatNumber value="${booking.totalAmount}"
									type="currency" currencySymbol="₩" /></td>
						</tr>
						<tr>
							<td>결제 수단</td>
							<td>${booking.payment.paymentMethod}</td>
						</tr>
						<tr>
							<td>최종 환불 금액</td>
							<td><fmt:formatNumber value="${booking.totalAmount}"
									type="currency" currencySymbol="₩" /></td>
						</tr>
					</table>
					<div class="refund-notice">
						<h3>환불진행 안내</h3>
						<ul>
							<li>${booking.payment.paymentMethod}를통해 환불 금액에 대한 결제 취소가
								진행됩니다.</li>
							<li>${booking.payment.paymentMethod}내 결제수단에 따라 환불 완료까지 영업일
								기준 3~5일 가량 소요될 수 있으며, 포인트를 이용한 경우 동일한 포인트로 환불됩니다.</li>
							<li>환불은 즉시 처리되며 이후 철회 또는 티켓 사용이 불가합니다. 결제/취소 세부사항은
								${booking.payment.paymentMethod}를 통해 확인해주세요.</li>
						</ul>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" id="agreeRefund">
						<label class="form-check-label" for="agreeRefund"> 환불진행
							안내사항을 확인했습니다. </label>
					</div>
					<button id="refundButton" class="btn btn-outline-danger mt-3"
						disabled>환불 진행하기</button>
				</div>
			</div>
		</section>
	</main>

	<jsp:include page="../include/bottom.jsp" />

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script> var contextPath = '${pageContext.request.contextPath}'; </script>
	<script src="<c:url value='/resources/js/my/common.js'/>"></script>
</body>
</html>