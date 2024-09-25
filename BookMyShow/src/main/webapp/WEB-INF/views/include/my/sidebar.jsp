<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="viewPath" value="/WEB-INF/views/" />
<c:set var="currentPath"
	value="${requestScope['javax.servlet.forward.servlet_path']}" />

<aside class="h-100">
	<div class="title">마이티켓</div>
	<div>
		<ul class="list-group list-group-flush mt-3">
			<li class="list-group-item"><a href="${contextPath}/my/bookings"
				class="${fn:startsWith(currentPath, '/my/booking') ? 'text-danger' : ''}">
					예매내역 </a></li>
			<li class="list-group-item"><a href="${contextPath}/my/refunds"
				class="${fn:startsWith(currentPath, '/my/refund') ? 'text-danger' : ''}">
					취소/환불내역 </a></li>
			<li class="list-group-item"><a href="${contextPath}/my/reviews"
				class="${currentPath == '/my/reviews' || fn:startsWith(currentPath, '/my/review-') ? 'text-danger' : ''}">
					나의 이용후기 </a></li>
			<li class="list-group-item"><a href="${contextPath}/my/points"
				class="${currentPath == '/my/points' ? 'text-danger' : ''}"> 나의
					포인트 </a></li>
			<li class="list-group-item"><a
				href="${contextPath}/my/coupon-redeem"
				class="${currentPath == '/my/coupon-redeem' ? 'text-danger' : ''}">
					쿠폰 등록 </a></li>
			<li class="list-group-item"><a
				href="${contextPath}/my/profile-edit"
				class="${currentPath == '/my/profile-edit' || currentPath == '/my/withdrawal' ? 'text-danger' : ''}">
					회원정보 수정 </a></li>
			<li class="list-group-item"><a
				href="${contextPath}/support/notice"
				class="${currentPath == '/support/notice' ? 'text-danger' : ''}">
					공지사항 </a></li>
			<li class="list-group-item"><a href="${contextPath}/support/faq"
				class="${currentPath == '/support/faq' ? 'text-danger' : ''}">
					자주묻는질문 </a></li>
			<li class="list-group-item"><a href="${contextPath}/support/qna"
				class="${currentPath == '/support/qna' ? 'text-danger' : ''}">
					1:1문의 </a></li>
		</ul>
	</div>
</aside>
