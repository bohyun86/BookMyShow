<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/my/header.jsp"%>
<link rel="stylesheet"
	href="<c:url value='/resources/css/my/point.css'/>">
</head>
<body id="board-body">
	<jsp:include page="../include/top.jsp" />
	<jsp:include page="../include/my/myticket.jsp" />

	<main id="board-main">
		<jsp:include page="../include/my/sidebar.jsp" />
		<section id="board-content">
			<h1 class="title">포인트 내역</h1>
			<div class="points-summary">
				<span>총 포인트: <strong>${totalPoints}</strong></span> <a
					href="${pageContext.request.contextPath}/my/coupon-redeem"
					class="btn btn-primary">쿠폰 등록</a>
			</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>유형</th>
						<th>초기 금액</th>
						<th>현재 금액</th>
						<th>일시</th>
						<th>관련 ID</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="point" items="${pointHistory}">
						<tr>
							<td>${point.type}</td>
							<td>${point.originalAmount}</td>
							<td>${point.currentAmount}</td>
							<td><my:formatDateTime date="${point.createdAt}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>${point.relatedId}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 페이지네이션 -->
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-center">
					<c:if test="${pageInfo.hasPrevious()}">
						<li class="page-item"><a class="page-link"
							href="?page=${pageInfo.number - 1}" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:if test="${pageInfo.totalPages > 0}">
						<c:forEach begin="0" end="${pageInfo.totalPages - 1}" var="i">
							<li class="page-item ${pageInfo.number == i ? 'active' : ''}">
								<a class="page-link" href="?page=${i}">${i + 1}</a>
							</li>
						</c:forEach>
					</c:if>
					<c:if test="${pageInfo.hasNext()}">
						<li class="page-item"><a class="page-link"
							href="?page=${pageInfo.number + 1}" aria-label="Next"> <span
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
	<script
		src="${pageContext.request.contextPath}/resources/js/my/couponPoint.js"></script>
</body>
</html>