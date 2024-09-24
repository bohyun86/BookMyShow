<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/my/header.jsp"%>
<link rel="stylesheet"
	href="<c:url value='/resources/css/my/detail.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/my/card.css'/>">
</head>
<body id="board-body">
	<jsp:include page="../include/top.jsp" />
	<jsp:include page="../include/my/myticket.jsp" />

	<main id="board-main">
		<jsp:include page="../include/my/sidebar.jsp" />
		<section id="board-content">
			<div class="title">환불 완료</div>
			<div class="booking-complete-card">
				<p class="text-center mb-4">환불 처리가 완료되었습니다</p>
				<div class="booking-card mb-4">
					<div class="card-body">
						<div class="row h-100 no-gutters">
							<div
								class="col-md-3 h-100 d-flex align-items-center justify-content-start">
								<a href="<c:url value='/musical/detail/${musical.musicalId}'/>"
									class="img-container"> <img
									src="${pageContext.request.contextPath}/${attachFile.postFilePath}"
									class="poster-img" alt="${musical.title} 포스터">
								</a>
							</div>
							<div class="col-md-9 d-flex flex-column h-100 pl-3">
								<div class="booking-info mb-2">
									<span class="status">${payment.status}</span> <span
										class="booking-date"> <fmt:parseDate
											value="${payment.updatedAt}" pattern="yyyy-MM-dd'T'HH:mm"
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
													href="<c:url value='/musical/detail/${musical.musicalId}'/>"
													class="card-title-link">${musical.title}</a>
											</h5>
										</div>
										<div class="col-4 pl-2"></div>
									</div>
								</div>
								<div class="row align-items-center no-gutters mb-2">
									<div class="col-8 pr-2">
										<p class="card-text mb-0">
											<fmt:parseDate value="${booking.bookingDate}"
												pattern="yyyy-MM-dd'T'HH:mm" var="parsedBookingDate"
												type="both" />
											<fmt:formatDate value="${parsedBookingDate}"
												pattern="yyyy-MM-dd HH:mm" />
										</p>
										<p class="card-text mb-0">티켓 수량: ${booking.ticketCount}매</p>
									</div>
									<div class="col-4 pl-2">
										<button
											onclick="location.href='<c:url value='/my/refund-detail/${booking.bookingId}'/>';"
											class="btn btn-outline-dark w-100">상세내역</button>
									</div>
								</div>
								<div class="row align-items-center no-gutters">
									<div class="col-12">
										<p class="card-text mb-0 refund-amount">
											환불금액:
											<fmt:formatNumber value="${payment.refundAmount}"
												type="currency" currencySymbol="₩" />
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div
				class="refund-details bg-secondary bg-opacity-25 p-4 rounded mb-4">
				<h3 class="mb-3">환불 상세 정보</h3>
				<ul class="list-unstyled">
					<li>결제금액: <fmt:formatNumber value="${payment.paymentAmount}"
							type="currency" currencySymbol="₩" /></li>
					<li>공제금액: <fmt:formatNumber
							value="${payment.paymentAmount - payment.refundAmount}"
							type="currency" currencySymbol="₩" /></li>
					<li>환불금액: <fmt:formatNumber value="${payment.refundAmount}"
							type="currency" currencySymbol="₩" /></li>
					<li>환불수단: ${payment.paymentMethod}</li>
					<li>환불 예정일: 즉시 또는 평일 3~5일 이내</li>
				</ul>
			</div>

			<div
				class="refund-notice bg-secondary bg-opacity-50 p-4 rounded mb-4">
				<h3 class="mb-3">환불 안내 사항</h3>
				<ul class="list-unstyled">
					<li>
<%-- 					${payment.paymentMethod} 내  --%>
					결제수단에 따라 최종 환불까지 3~5 일이 소요 될 수 있습니다.</li>
					<li>
<%-- 					${payment.paymentMethod}  --%>
					포인트로 결제하신 경우 동일한 포인트로 즉시 환불이 완료됩니다.</li>
<%-- 					<li>세부사항은 ${payment.paymentMethod} 내 결제내역을 확인해주세요.</li> --%>
					<li>해당 티켓은 환불 승인이 완료되었기에 사용할 수 없으며, 환불 철회 또한 불가한 점 유의 부탁드립니다.</li>
				</ul>
			</div>

			<div class="d-flex justify-content-center mt-4 action-buttons">
				<a href="<c:url value='/my/refunds'/>"
					class="btn btn-outline-secondary me-2 flex-grow-1">취소/환불내역</a> <a
					href="<c:url value='/support/qna'/>"
					class="btn btn-outline-dark flex-grow-1">1:1 문의</a>
			</div>
		</section>
	</main>

	<jsp:include page="../include/bottom.jsp" />

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/my/common.js"></script>
</body>
</html>