<%--
  Created by IntelliJ IDEA.
  User: ITWILL
  Date: 2024-09-03
  Time: 오후 1:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="UTF-8">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/bootstrap/css/bootstrap.min.css">
<link
	href="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/fonts/circular-std/style.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin_partner/assets/libs/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/charts/chartist-bundle/chartist.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/charts/morris-bundle/morris.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/charts/c3charts/c3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
<title>예매하다. 관리자 페이지</title>
</head>

<body>

	<div class="dashboard-main-wrapper">

		<jsp:include page="../include/adminTop.jsp" />

		<jsp:include page="../include/adminSidebar.jsp" />

		<div class="dashboard-wrapper">
			<div class="dashboard-ecommerce">
				<div class="container-fluid dashboard-content ">

					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="page-header">
								<h2 class="pageheader-title">쿠폰관리</h2>
								<p class="pageheader-text">Nulla euismod urna eros, sit amet
									scelerisque torton lectus vel mauris facilisis faucibus at enim
									quis massa lobortis rutrum.</p>
							</div>
						</div>
					</div>

					<!-- 					↓주석 풀면 주소 주소이동x 일단 주석처리 -->
					<!-- 				String id =(String)session.getAttribute("id"); -->

					<%-- 				<c:if test="${empty sessionScope.id }"> --%>
					<%-- 					<c:redirect url="${pageContext.request.contextPath}/main/main"/> --%>
					<%-- 				</c:if> --%>


					<%-- 				<c:if test="${ !empty sessionScope.id}"> --%>
					<%-- 			<c:if test="${sessionScope.id == 'admin' }"> --%>

					${sessionScope.id }님이 로그인 하셨습니다.<br>


					<!-- 				관리자 아이디로 로그인 하셨습니다 -->
					<%-- 				<a href ="${pageContext.request.contextPath}/musical/insert">뮤지컬등록</a><br> <%// 관리자만 사용가능 %> --%>
					<!-- 				<a href = "write.bo">글쓰기</a><br> -->
					<!-- 				<a href = "list.bo">글목록</a><br> -->

					<%-- 			</c:if>		 --%>
					<%-- 		</c:if> --%>

					<div class="coupon-container">

						<div class="coupon-list">
							<h3>쿠폰 목록</h3>
							<div class="search-options">
								<input type="text" id="couponSearch" placeholder="쿠폰 코드 검색"
									class="form-control"> <input type="date"
									id="dateSearch" class="form-control">
								<div class="status-checkbox">
									<label><input type="checkbox" id="statusActive"
										value="Active"> 미사용</label> <label><input
										type="checkbox" id="statusUsed" value="Used"> 사용됨</label>
								</div>
							</div>
							<table class="table coupon-table">
								<thead>
									<tr>
										<th>쿠폰 코드</th>
										<th>쿠폰 금액</th>
										<th>상태</th>
										<th>생성일</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="coupon" items="${coupons}">
										<tr>
											<td>${coupon.code}</td>
											<td>${coupon.couponAmount}원</td>
											<td>${coupon.status}</td>
											<td>${coupon.createdAt}</td>
											<td>
												<button class="btn btn-danger btn-sm delete-coupon"
													data-id="${coupon.couponId}">삭제</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>


			<!-- 바텀 밑으로 내려야함 -->
			<%--         <jsp:include page="../include/adminBottom.jsp"/> --%>

		</div>
		<!-- ============================================================== -->
		<!-- end wrapper  -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- end main wrapper  -->
	<!-- ============================================================== -->
	<!-- Optional JavaScript -->
	<!-- jquery 3.3.1 -->
	<script
		src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<!-- bootstap bundle js -->
	<script
		src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<!-- slimscroll js -->
	<script
		src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
	<!-- main js -->
	<script
		src="${pageContext.request.contextPath}/resources/admin_partner/assets/libs/js/main-js.js"></script>
	<!-- chart chartist js -->
	<script
		src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/charts/chartist-bundle/chartist.min.js"></script>
	<!-- sparkline js -->
	<script
		src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/charts/sparkline/jquery.sparkline.js"></script>
	<!-- morris js -->
	<script
		src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/charts/morris-bundle/raphael.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/charts/morris-bundle/morris.js"></script>
	<!-- chart c3 js -->
	<script
		src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/charts/c3charts/c3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/charts/c3charts/d3-5.4.0.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/charts/c3charts/C3chartjs.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin_partner/assets/libs/js/dashboard-ecommerce.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/my/coupon.js"></script>
</body>

</html>