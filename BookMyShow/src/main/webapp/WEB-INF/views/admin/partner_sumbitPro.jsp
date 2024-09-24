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
<!-- jquery 3.3.1 -->
<script src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
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
                            <h2 class="pageheader-title">파트너관리페이지 </h2>
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
        							<h4 class="card-title">파트너 승인신청대기</h4>
       									 <p class="card-text">
       									 	
       									 	<form class="was-validated" action="${pageContext.request.contextPath}/admin/partner_submitConfirm" id="PartnerSubmitForm" method="post" >
       									 	<c:forEach var="partnerDTO2" items="${partnerDTO2}">
       									 	
       									 	<div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">파트너ID</span>
  													<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${partnerDTO2.user_name}"readonly>
    													<div class="invalid-feedback">
     														 파트너ID를 입력해주세요.
   														 </div>
													</div>
       									 	
       									 	<div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">비밀번호</span>
  													<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" id="passwordInput" value="${partnerDTO2.password}" readonly>
    													<div class="invalid-feedback">
     														 비밀번호를 입력해주세요.
   														 </div>
													</div>
													
												<div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">이름</span>
  													<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"  id="startDate" name="daterange" value="${partnerDTO2.name}" readonly>
    													
    													<div class="invalid-feedback">
     														 이름을 입력해주세요.
   														 </div>
													</div> 
													
												<div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">회사명</span>
  													<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"  id="startDate" name="daterange" value="${partnerDTO2.company_name}" readonly>
    													
    													<div class="invalid-feedback">
     														 회사명을 입력해주세요.
   														 </div>
													</div> 
												
												<div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">사업자등록번호</span>
  													<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"  id="startDate" name="daterange" value="${partnerDTO2.business_id}" readonly>
    													
    													<div class="invalid-feedback">
     														 사업자등록번호를 입력해주세요.
   														 </div>
													</div> 
												
												<div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">계좌번호</span>
  													<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"  id="startDate" name="daterange" value="${partnerDTO2.account_number}" readonly>
    													
    													<div class="invalid-feedback">
     														 계좌번호를 입력해주세요.
   														 </div>
													</div> 
												
												<div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">은행</span>
  													<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"  id="startDate" name="daterange" value="${partnerDTO2.bank_name}" readonly>
    													
    													<div class="invalid-feedback">
     														 은행명을 입력해주세요.
   														 </div>
													</div> 
													
													<div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">연락처</span>
  													<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" onkeyup="phone(this.value);"  value="${partnerDTO2.phone_number}" readonly>
    													<div class="invalid-feedback">
     														 연락처를 입력해주세요.
   														 </div>
													</div>
													
													<div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">이메일</span>
  													<input type="email" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${partnerDTO2.email}" readonly>
    													<div class="invalid-feedback">
     														  이메일을 입력해주세요.
   														 </div>
													</div>
													
													 <div class="input-group input-group-sm mb-3">
 	 											<span class="input-group-text" id="inputGroup-sizing-sm">가입날짜</span>
  													<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${partnerDTO2.created_at}" readonly>
    													
													</div>
	 													
													
<!-- 													<div class="input-group input-group-sm mb-3"> -->
														
<!--  	 											<span class="input-group-text" id="inputGroup-sizing-sm">활동상태</span> -->
<!--   													<select name="findType" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required> -->
<!--     													<option value="">::활동상태::</option> -->
<!-- 															<option value="1">활동 </option> -->
<!-- 															<option value="2">탈퇴</option> -->
<!-- 														</select> -->
<!--     													<div class="invalid-feedback"> -->
<!--      														  활동상태를 선택해주세요. -->
<!--    														 </div> -->
<!-- 													</div> -->
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
				 										<input type="hidden" name="partner_id" value="${partnerDTO2.partner_id}">
  															<button class="btn btn-primary me-md-2" type="submit" onclick= "submitForm()" >승인</button> &nbsp; &nbsp;
  																<button class="btn btn-primary me-md-2" type="button" onclick="deleteok()">삭제</button>
  															</div>
														</c:forEach> 
														</form>
														
    												</div>
  												</div>
											</div>
  										
 									  </div>
 									 </div>
 									 
 									 
									<div class="d-grid gap-2 col-6 mx-auto">
  										<button class="btn btn-primary me-md-2" type="reset" onclick = "location.href='${pageContext.request.contextPath}/admin/partner'" >취소</button>
 									 </div>
 									 
 									 </div>
 									 </div>

 </div>


<script>



function submitForm(){
	 if (confirm("승인하시겠습니까?")) {
         alert("승인 되었습니다.");
         document.getElementById("PartnerSubmitForm").submit();
     } else {
         alert("취소되었습니다.");
     }
}

//삭제 컨펌가능
function deleteok(){
    if(!confirm('삭제하시면 복구할수 없습니다. \n 정말로 삭제하시겠습니까??')){
        return false;
    }
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
