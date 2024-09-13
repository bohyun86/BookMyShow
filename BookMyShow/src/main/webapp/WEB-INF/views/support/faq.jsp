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
	
	.bbs_list_faq_top {
    padding: 30px;
    display: flex;
    justify-content: space-around;
    margin: 50px;
}
	
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
					
					<ul class="bbs_list_faq_top">
			
			<li onclick="location.href='${pageContext.request.contextPath}/support/faq_answer1'">
<!-- 			on click test중 -->
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/support/icon_circle_refund.png">
				</div>
				<div>
					<span class="bbs_list_faq_q" style="color: red;"><b>Q</b></span> 환불/취소는 어떻게 하나요?
				</div>
			</li>
			<li onclick="">
				<div>
          <img src="${pageContext.request.contextPath}/resources/images/support/icon_circle_paper.png">
				</div>
				<div>
					<span class="bbs_list_faq_q"style="color: red;"><b>Q</b></span> 좌석 배정은 어떻게 하나요?
				</div>
			</li>
			<li onclick="">
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/support/icon_circle_ticket.png">
				</div>
				<div>
					<span class="bbs_list_faq_q"style="color: red;"><b>Q</b></span> 티켓은 어떻게 사용하나요?
				</div>
			</li>
		</ul>
					
					
					
					
					
						
						<table class="table">
  <thead class="table-danger">
    <tr >
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">작성일</th>
    </tr>
  </thead>
  <tbody>
    <tr onclick = "location.href='${pageContext.request.contextPath}/support/'">
      <th scope="row">1</th>
      <td>데이터없음 테스트중</td>
      <td>2024-09-13</td>
    </tr>
    <tr onclick = "location.href='${pageContext.request.contextPath}/support/'">
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
    </tr>
    
  </tbody>
</table>
							
						</div>
					</div>
				</div>
<!-- 			</div> -->
			<%-- </c:forEach> --%>
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">4</a></li>
    <li class="page-item"><a class="page-link" href="#">5</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
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