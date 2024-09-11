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
                            <h2 class="pageheader-title">뮤지컬수정페이지 </h2>
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
   							 <div class="col-md-4">
     							 <img src="${pageContext.request.contextPath}/resources/images/poster/newopen1.jpg" class="img-fluid rounded-start" alt="new1">
   							 </div>
    						<div class="col-md-8">
      							<div class="card-body">
        							<h4 class="card-title">뮤지컬 수정</h4>
       									 <p class="card-text">
       									 	
       									 	<form class="was-validated" action="${pageContext.request.contextPath}/admin/edit">
       									 	<div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">뮤지컬 제목</span>
  													<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required>
    													<div class="invalid-feedback">
     														 뮤지컬 제목을 입력해주세요.
   														 </div>
													</div>
													
												<div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">공연기간</span>
  													<input type="date" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"  id="startDate" name="daterange"onChange="setendmin(this.value)" required>
  													<input type="date" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"  id="endDate" name="daterange" required>
    													
    													
    													<div class="invalid-feedback">
     														 공연 기간을 입력해주세요.
   														 </div>
													</div> 
<!-- 													공연기간 종료날짜가 시작날짜보다 전 날짜로 선택 못하게 설정해야함 -->
													
													<div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">공연장소</span>
  													<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required>
    													<div class="invalid-feedback">
     														 공연장소를 입력해주세요.
   														 </div>
													</div>
													
													<div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">관람연령</span>
  													<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required>
    													<div class="invalid-feedback">
     														  관람연령을 입력해주세요.
   														 </div>
													</div>
	 													 
	 													 <div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">티켓가격</span>
  													<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required>
    													<div class="invalid-feedback">
     														  티켓가격을 입력해주세요.
   														 </div>
													</div>
	 													 
	 													  <div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">출연진</span>
  													<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required>
    													<div class="invalid-feedback">
     														  출연진을 입력해주세요.
   														 </div>
													</div>
													
													 <div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">제작진</span>
  													<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required>
    													<div class="invalid-feedback">
     														  제작진을 입력해주세요.
   														 </div>
													</div>
													
													 <div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">주최.주관</span>
  													<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required>
    													<div class="invalid-feedback">
     														  주최.주관을 입력해주세요.
   														 </div>
													</div>
													
													<div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">기획.제작</span>
  													<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required>
    													<div class="invalid-feedback">
     														  기획.제작을 입력해주세요.
   														 </div>
													</div>
<!-- 	 																					
	 								 													 
	 													
<!-- 	 													 		 <div class="col-md-6"> -->
<!--     											<label for="validationCustom11" class="form-label">소개</label> -->
<!--     												<textarea class="form-control" id="validationCustom11" required> -->
<!--     													<div class="invalid-feedback"> -->
<!--      														 뮤지컬 제목을 입력해주세요. -->
<!--    														 </div> -->
<!-- 	 													 </div>  -->
<!-- 소개 //사이드바 드롭다운 x 일단 주석  -->
			
				 										
				 										<div class="d-grid gap-2 d-md-flex justify-content-md-end">
  															<button class="btn btn-primary me-md-2" type="submit" >수정완료</button> &nbsp; &nbsp;
  															</form>
  															
  															<form action="${pageContext.request.contextPath}/admin/edit">
  																<button class="btn btn-primary" type="submit" onclick="deleteok()" >삭제</button>
  																</form>
														</div>
														
    												</div>
  												</div>
											</div>
  										
 									  </div>
 									 </div>
 									 
 									 
									<div class="d-grid gap-2 col-6 mx-auto">
  										<button class="btn btn-primary me-md-2" type="reset" onclick = "location.href='${pageContext.request.contextPath}/admin/edit'" >취소</button>
 									 </div>
 									 
 									 </div>
 									 </div>
 									 
 									 


<script>
$(function(){
	   var today = new Date();
	   var dd = today.getDate();
	   var mm = today.getMonth()+1; 
	
	   var yyyy = today.getFullYear();
	   if(dd<10){
	     dd='0'+dd
	   } 
	   if(mm<10){
	     mm='0'+mm
	   } 
	   today = yyyy+'-'+mm+'-'+dd;
	
	   document.getElementById("startDate").setAttribute("min", today);
	  })
	     
	
	function setendmin(e){
	   console.log(e);
	   document.getElementById("endDate").setAttribute("min", e);
	   }  
	   
	   //startDate 오늘날짜 가져옴
	   //endDate는 startDate 전날짜 못가져옴
	   
function deleteok(){
    if(!confirm('삭제하시면 복구할수 없습니다. \n 정말로 삭제하시겠습니까??')){
        return false;
    }
}

</script>




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
