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
    <title >예매하다. 관리자 페이지</title>
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
                            <h2 class="pageheader-title" >파트너 정산페이지 </h2>
                            <p class="pageheader-text">Nulla euismod urna eros, sit amet scelerisque torton lectus vel
                                mauris facilisis faucibus at enim quis massa lobortis rutrum.</p>
                        </div>
                    </div>
                </div>
            
                <!-- ============================================================== -->
                <!-- end pageheader  -->
                <!-- ============================================================== -->
                 
<!-- ==================================================== -->



				${sessionScope.id }파트너님의 정산내역입니다.<br>
				
				<div class="card text-bg-light mb-3" style="max-width: 18rem;">
  					<div class="card-header">정산내역</div>
  						<div class="card-body">
    						<p class="card-text">
    
    							<table class="table">
									  <thead>
									    <tr>
									      <th scope="col">#</th>
									      <th scope="col">결제수단</th>
									      <th scope="col">건수</th>
									      <th scope="col">금액</th>
									    </tr>
									  </thead>
									  <tbody>
									    <tr>
									      <th scope="row">1</th>
									      <td>현금</td>
									      <td>~건</td>
									      <td>~원</td>
									    </tr>
									    <tr>
									      <th scope="row">2</th>
									      <td>카드</td>
									      <td>~건</td>
									      <td>@~원</td>
									    </tr>
									    <tr>
									      <th scope="row">3</th>
									      <td>합계</td>
									      <td>~건</td>
									      <td>@~원</td>
									    </tr>
									  </tbody>
									</table>
									</p>
									  </div>
									</div>

									<div class="card text-bg-light mb-3" style="max-width: 18rem;">
									  <div class="card-header">정산내역</div>
									  <div class="card-body">
									    <p class="card-text">
									    
									     <table class="table">
									  <thead>
									    <tr>
									      <th scope="col">#</th>
									      <th scope="col">결제수단</th>
									      <th scope="col">건수</th>
									      <th scope="col">금액</th>
									    </tr>
									  </thead>
									  <tbody>
									    <tr>
									      <th scope="row">1</th>
									      <td>현금</td>
									      <td>~건</td>
									      <td>~원</td>
									    </tr>
									    <tr>
									      <th scope="row">2</th>
									      <td>카드</td>
									      <td>~건</td>
									      <td>@~원</td>
									    </tr>
									    <tr>
									      <th scope="row">3</th>
									      <td>합계</td>
									      <td>~건</td>
									      <td>@~원</td>
									    </tr>
									  </tbody>
									</table>
									    
									    </p>
									  </div>
									</div>
				
				 					<table class="table">
										  <thead>
										    <tr>
										      <th >수수료</th>
										      <th >총매출</th>
										    </tr>
										  </thead>
										  
										  <tbody>
										  <tr>
										      <th >~원</th>
										      <td>~원</td>
										    </tr>
										  </tbody>
										  
										  
										</table>


											<p><div class="d-grid gap-2 col-6 mx-auto">
											  <button class="btn btn-primary" type="button" onclick = "location.href='${pageContext.request.contextPath}/admin/partnerDTO'">돌아가기</button>
											</div></p>

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
