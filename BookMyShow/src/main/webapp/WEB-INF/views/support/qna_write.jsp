<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/my/header.jsp"%>
<link rel="stylesheet"
	href="<c:url value='/resources/css/my/card.css'/>">
</head>
<body id="board-body">
	<jsp:include page="../include/top.jsp" />

	<main id="board-main">
		<jsp:include page="../include/support/aside.jsp" />
		<section id="board-content">
			<div class="title">공지사항</div>

			<%-- <c:forEach var="booking" items="${bookings}"> --%>
<!-- 			<div class="booking-card"> -->
					<div class="row h-100 no-gutters">
						
					<div class="p-3 mb-2 bg-body-tertiary">                           
                            <div style="width:735px; margin-top:10px; border:1px solid #ccc; font-size:15px; padding:15px 20px; line-height:180%; background:#f9f9f9">
			· 티켓 환불은 <span style="color:#f00;">마이티켓 &gt; 예매내역</span>의 <span style="color:#f00;">환불신청 버튼</span>을 이용해주세요.<br>
			· 공연 티켓은 환불규정에 의거하여 <span style="color:#f00;">관람 당일 환불/취소 및 일정 변경이 불가</span>합니다.<br>
			· 답변은 업무일(평일10:00~18:00) 기준 24시간 내로 완료되며, 주말/공휴일은 답변이 지연될 수 있습니다.<br>
		</div>
                            <div class="m-2 bg-white form-body">
                            
                                <form action="${pageContext.request.contextPath}/support/qna" method="get"> 
<!--                                 프론트작업 편하게 페이지 이동을 위해 메소드 겟으로 해놓음  -->
                                    <div class="input-group mb-3 " >
  <span class="input-group-text" id="inputGroup-sizing-default">제목</span>
  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="제목을 입력해주세요">
</div>

                                   <div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">연락처</span>
  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="010-1234-5678">
</div>

                                               <div class="input-group">
  <span class="input-group-text">문의사항</span>
  <textarea class="form-control" aria-label="문의사항을 입력해주세요"></textarea>
</div>
                                    </div>
                                   <div class="d-grid gap-2 col-6 mx-auto">
                                       <input class="btn btn-danger " type="submit" value="등록신청">
                                    </div>
                                    
                                </form>

							
						</div>


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