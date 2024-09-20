<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<div class="title">회원탈퇴</div>
			<div class="withdrawal-card">
				<div class="alert bg-secondary bg-opacity-25">
					<h4 class="alert-heading">회원탈퇴를 원하시나요?</h4>
					<p>탈퇴 전 하단 유의사항을 꼭 확인해주세요.</p>
				</div>

				<p class="mb-4">
					<span class="text-primary fw-bold">${userName}</span> 회원님<br>
					지금까지 예매하다를 이용해 주셔서 고맙습니다.
					<!--                     이용 중 불편을 겪으셨거나 불만족스러운 부분이 있었다면 아래에 남겨주세요. 적극적으로 의견을 반영하며 개선할 수 있도록 노력하겠습니다. -->
				</p>

				<form id="withdrawalForm"
					action="${pageContext.request.contextPath}/my/withdraw"
					method="post">
					<div class="withdrawal-steps">
						<h5 class="text-danger">탈퇴 전 유의사항을 확인해주세요</h5>
						<ul class="list-unstyled">
							<li>탈퇴와 동시에 회원정보는 삭제되며 복구가 불가합니다. 보유 포인트 또한 삭제되며 복구/이전이
								불가합니다.</li>
							<li>탈퇴 후에는 해당 ID로 재가입이 불가합니다. 단, SNS 로그인은 별도의 제한 없이 재가입이
								가능합니다.</li>
							<li>[전자상거래등에서의소비자보호에관한법률], [정보통신망이용촉진및정보보호에관한법률]에 근거하여 예매,
								환불 등의 기록은 일정 기간 동안 보존합니다.</li>
						</ul>
					</div>

					<div class="d-flex justify-content-center mt-4 action-buttons">
						<button type="submit" id="withdrawalButton"
							class="btn btn-danger me-2 flex-grow-1">탈퇴하기</button>
						<button type="button" id="cancelButton"
							class="btn btn-secondary flex-grow-1">취소</button>
					</div>
				</form>

			</div>
		</section>
	</main>

	<jsp:include page="../include/bottom.jsp" />

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/my/common.js"></script>
</body>
</html>