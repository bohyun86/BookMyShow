<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="contextPath" content="${pageContext.request.contextPath}">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/bootstrap/css/bootstrap.min.css">
<link
	href="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/fonts/circular-std/style.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin_partner/assets/libs/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<title>예매하다. 관리자 페이지 - 쿠폰 생성</title>
</head>

<body>
	<div class="dashboard-main-wrapper">
		<jsp:include page="../include/adminTop.jsp" />
		<jsp:include page="../include/adminSidebar.jsp" />

		<div class="dashboard-wrapper">
			<div class="container-fluid dashboard-content">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="page-header">
							<h2 class="pageheader-title">쿠폰 생성</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<div class="card-body">

								<form id="couponForm"
									action="${pageContext.request.contextPath}/admin/create-coupon"
									method="post">
									<div class="form-group">
										<label for="coupon1" class="col-form-label">쿠폰 코드</label>
										<div class="coupon-input">
											<input type="text" id="coupon1" maxlength="4" name="coupon1"
												required> <span>-</span> <input type="text"
												id="coupon2" maxlength="4" name="coupon2" required>
											<span>-</span> <input type="text" id="coupon3" maxlength="4"
												name="coupon3" required>
										</div>
									</div>
									<div class="form-group">
										<label for="couponAmount" class="col-form-label">쿠폰 금액</label>
										<input id="couponAmount" name="couponAmount" type="number"
											class="form-control" required>
									</div>
									<div class="form-group">
										<button type="submit" class="btn btn-primary">쿠폰 생성</button>
										<button type="button" class="btn btn-secondary"
											id="generateRandomCode">랜덤 코드 생성</button>
									</div>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin_partner/assets/libs/js/main-js.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/my/couponPoint.js"></script>

</body>
</html>