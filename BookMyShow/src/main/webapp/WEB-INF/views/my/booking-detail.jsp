<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
			<div class="title">예매 상세내역</div>
			<div class="detail-card">
				<div class="detail-row">
					<span class="detail-label">티켓명</span> <span class="detail-value">
						<a href="<c:url value='/musical/detail/${musical.musicalId}'/>"
						class="musical-title-link"> ${musical.title} </a>
					</span>
				</div>
				<div class="detail-row">
					<span class="detail-label">예매상태</span> <span
						class="detail-value status">${booking.status}</span>
				</div>
				<div class="detail-row">
					<span class="detail-label">장소</span> <span class="detail-value">${venue.venueName}</span>
				</div>
				<div class="detail-row">
					<span class="detail-label">주소</span> <span class="detail-value"
						data-address="${venue.address}"> ${venue.address}
						<button
							class="btn btn-sm btn-outline-danger action-button copy-address">주소복사</button>
					</span>
				</div>
				<div class="detail-row divider"></div>
				<div class="detail-row">
					<span class="detail-label">예매옵션</span> <span class="detail-value">
						${fn:substring(performance.performanceDate, 0, 16)}
						${booking.ticketCount}인권<br> <fmt:formatNumber
							value="${payment.paymentAmount / booking.ticketCount}"
							type="currency" currencySymbol="₩" /> * ${booking.ticketCount}매
						= <fmt:formatNumber value="${payment.paymentAmount}"
							type="currency" currencySymbol="₩" />
					</span>
				</div>
				<div class="detail-row">
					<span class="detail-label">예매번호</span> <span class="detail-value">${booking.bookingId}</span>
				</div>
				<div class="detail-row">
					<span class="detail-label">이용자</span> <span class="detail-value">${user.name}(${user.phoneNumber})</span>
				</div>
				<div class="detail-row divider"></div>
				<div class="detail-row">
					<span class="detail-label">결제금액</span> <span class="detail-value">
						<fmt:formatNumber value="${payment.paymentAmount}" type="currency"
							currencySymbol="₩" />
					</span>
				</div>
				<div class="detail-row">
					<span class="detail-label">결제수단</span> <span class="detail-value">
						${payment.paymentMethod}
<!-- 						<button -->
<!-- 							class="btn btn-sm btn-outline-danger action-button receipt-button" -->
<%-- 							data-payment-id="${payment.paymentId}">영수증 조회</button> --%>
					</span>
				</div>
				<div class="detail-row">
					<span class="detail-label">결제일시</span> <span class="detail-value">
						${fn:substring(payment.paymentDate, 0, 19)} </span>
				</div>
				<div class="detail-row divider"></div>
				<div class="detail-row">
					<span class="detail-label">환불기한</span> <span class="detail-value">
						이용 1일 전 자정까지 신청 가능
						<button
							class="btn btn-sm btn-outline-danger action-button refund-policy-btn"
							data-bs-toggle="modal" data-bs-target="#refundPolicyModal">환불
							규정</button>
					</span>
				</div>
			</div>
		</section>
	</main>

	<div class="modal fade" id="refundPolicyModal" tabindex="-1"
		aria-labelledby="refundPolicyModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="refundPolicyModalLabel">환불 규정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>밤12시 자정을 기준으로:</p>
					<ul>
						<li>7일 전: 전액 환불</li>
						<li>6~4일 전: 10% 공제</li>
						<li>3~2일 전: 20% 공제</li>
						<li>1일 전: 30% 공제</li>
						<li>당일: 환불 불가</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../include/bottom.jsp" />

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/my/common.js"></script>
</body>
</html>