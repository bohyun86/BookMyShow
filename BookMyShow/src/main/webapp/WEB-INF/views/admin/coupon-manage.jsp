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
<title>예매하다. 관리자 페이지 - 쿠폰 관리</title>
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
							<h2 class="pageheader-title">쿠폰 관리</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<div class="card-body">
								<div class="search-options mb-3">
									<input type="text" id="couponSearch" placeholder="쿠폰 코드 검색"
										class="form-control"> <input type="date"
										id="dateSearch" class="form-control">
									<div class="status-checkbox">
										<label><input type="checkbox" id="statusActive"
											value="Active"> 미사용</label> <label><input
											type="checkbox" id="statusUsed" value="Used"> 사용됨</label>
									</div>
								</div>
								<div class="table-responsive">
									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>쿠폰 코드</th>
												<th>금액</th>
												<th>상태</th>
												<th>생성일</th>
												<th>액션</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="coupon" items="${coupons}">
												<tr>
													<td>${coupon.code}</td>
													<td>${coupon.couponAmount}</td>
													<td>${coupon.status}</td>
													<td><my:formatDateTime date="${coupon.createdAt}"
															pattern="yyyy-MM-dd HH:mm:ss" /></td>
													<td><c:if test="${coupon.status eq 'Active'}">
															<button class="btn btn-sm btn-danger delete-coupon"
																data-coupon-id="${coupon.couponId}">삭제</button>
														</c:if></td>
												</tr>
											</c:forEach>
										</tbody>

									</table>
								</div>
								<!-- 페이지네이션 -->
								<c:url var="pageUrl" value="/admin/coupon-manage">
									<c:param name="searchTerm" value="${param.searchTerm}" />
									<c:param name="dateFilter" value="${param.dateFilter}" />
									<c:forEach items="${param.status}" var="status">
										<c:param name="status" value="${status}" />
									</c:forEach>
								</c:url>

								<nav aria-label="Page navigation">
									<ul class="pagination justify-content-center">
										<c:if test="${pageInfo.hasPrevious()}">
											<li class="page-item"><a class="page-link"
												href="${pageUrl}&page=${pageInfo.number - 1}"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
										</c:if>
										<c:forEach begin="0" end="${pageInfo.totalPages - 1}" var="i">
											<li class="page-item ${pageInfo.number == i ? 'active' : ''}">
												<a class="page-link" href="${pageUrl}&page=${i}">${i + 1}</a>
											</li>
										</c:forEach>
										<c:if test="${pageInfo.hasNext()}">
											<li class="page-item"><a class="page-link"
												href="${pageUrl}&page=${pageInfo.number + 1}"
												aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											</a></li>
										</c:if>
									</ul>
								</nav>
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