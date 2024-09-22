<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/my/header.jsp"%>
<link rel="stylesheet"
	href="<c:url value='/resources/css/my/card.css'/>">
	
	<style type="text/css">
	


	

	</style>
</head>
<body id="board-body">
	<jsp:include page="../include/top.jsp" />

	<main id="board-main">
		<jsp:include page="../include/support/aside.jsp" />
		<section id="board-content">
			<div class="title">자주묻는질문</div>

			<%-- <c:forEach var="booking" items="${bookings}"> --%>
<!-- 			<div class="booking-card"> -->
					<div class="row h-100 no-gutters">
					
<!-- 					<ul class="bbs_list_faq_top"> -->
<!-- 					</ul> -->
					<div style="margin-top:17px; border-bottom:1px solid #e2e2e2;">

	<ul class="bbs_detail_header">
		<li>티켓을 환불/취소하고 싶어요!</li>
	</ul>
					
					
					
					
	</div>
	
					
			
			
							
						</div>
					</div>
				</div>
<!-- 			</div> -->
			<%-- </c:forEach> --%>

		</section>
	</main>

	<jsp:include page="../include/bottom.jsp" />

	

	<script> var contextPath = '${pageContext.request.contextPath}'; </script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/dropdown.js"></script>
</body>
</html>