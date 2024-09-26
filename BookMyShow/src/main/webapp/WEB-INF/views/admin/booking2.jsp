<%--
  Created by IntelliJ IDEA.
  User: ITWILL
  Date: 2024-09-03
  Time: 오후 1:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="UTF-8">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/fonts/circular-std/style.css"
          rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin_partner/assets/libs/css/style.css">
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

    <jsp:include page="../include/adminTop.jsp"/>

    <jsp:include page="../include/adminSidebar.jsp"/>

    <!-- wrapper  -->
    <!-- ============================================================== -->
    <div class="dashboard-wrapper">
        <div class="dashboard-ecommerce">
            <div class="container-fluid dashboard-content ">
                <!-- ============================================================== -->
                <!-- pageheader  -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <h2 class="pageheader-title" >회원예매내역페이지 </h2>
                            <p class="pageheader-text">Nulla euismod urna eros, sit amet scelerisque torton lectus vel
                                mauris facilisis faucibus at enim quis massa lobortis rutrum.</p>
                  </div>
                  </div>
                  </div>
            
                
                <!-- ============================================================== -->
                <!-- end pageheader  -->
                <!-- ============================================================== -->
                 
<!-- ==================================================== -->


			

			
	



				
			<div class="card mb-3" style="max-width: 540px;">
  
					<div class="card mb-3" style="max-width: 540px;">
  						<div class="row g-0">
    						<div class="col-md-8">
      							<div class="card-body">
        							<h4 class="card-title">예매내역</h4>
       									 <p class="card-text">
       									 
       									 
       									 
									<c:if test="${not empty memberBooked}">       									 	
       									 <c:forEach var="memberBooked" items="${memberBooked}">
       									
       									<c:out value="${memberBooked.user_name}"/>님의 예매내역
       									 <hr>
       									 	<div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">예매번호</span>
  													<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"  value="${memberBooked.booking_id}" readonly="readonly" >
													</div>
													
												<div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">예매한 뮤지컬</span>
  													<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"  id="startDate" name="daterange" value="${memberBooked.title}"  readonly="readonly">
													</div> 
													
													<div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">관람일</span>
  													<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" onkeyup="phone(this.value);"  value="${memberBooked.start_date}"  readonly="readonly">
													</div>
													
													<div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">공연장소</span>
  													<input type="email" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${memberBooked.venue_name}" readonly="readonly">
													</div>
													
													<div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">예매날짜</span>
  													<input type="email" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${memberBooked.booking_date}" readonly="readonly" >
	 													 </div>
	 												
	 													 
	 													  <div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">예매좌석 번호</span>
  													<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${memberBooked.seat_number}"readonly >
    													</div>
													
													 <div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">리뷰작성 뮤지컬</span>
  													<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${memberBooked.content}" readonly>
    													
													</div>
													
													 <div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">예매인원 수</span>
  													<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${memberBooked.ticket_count}" readonly>
    													
													</div>
													
													
													
			
  																</c:forEach>
  																</c:if>
  																
  																
  																
  																
														</div>
    												</div>
  												</div>
											</div>
  										</div>
  										</div>
  										
									<div class="d-grid gap-2 col-6 mx-auto">
  										<button class="btn btn-primary me-md-2" type="reset" onclick = "location.href='${pageContext.request.contextPath}/admin/member'" >돌아가기</button>
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
<script src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<!-- bootstap bundle js -->
<script src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<!-- slimscroll js -->
<script src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
<!-- main js -->
<script src="${pageContext.request.contextPath}/resources/admin_partner/assets/libs/js/main-js.js"></script>
<!-- chart chartist js -->
<script src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/charts/chartist-bundle/chartist.min.js"></script>
<!-- sparkline js -->
<script src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/charts/sparkline/jquery.sparkline.js"></script>
<!-- morris js -->
<script src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/charts/morris-bundle/raphael.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/charts/morris-bundle/morris.js"></script>
<!-- chart c3 js -->
<script src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/charts/c3charts/c3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/charts/c3charts/d3-5.4.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/charts/c3charts/C3chartjs.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_partner/assets/libs/js/dashboard-ecommerce.js"></script>
</body>

</html>