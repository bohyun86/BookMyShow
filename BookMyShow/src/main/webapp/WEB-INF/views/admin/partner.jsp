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
                            <h2 class="pageheader-title">파트너 검색 페이지 </h2>
                            <p class="pageheader-text">Nulla euismod urna eros, sit amet scelerisque torton lectus vel
                                mauris facilisis faucibus at enim quis massa lobortis rutrum.</p>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader  -->
                <!-- ============================================================== -->
                 
<!-- ==================================================== -->

<%-- 				<h1 class="text-center m-3">[검색어:<%=findKeyword %> ] 검색 결과</h1>				 --%>
<form name="findF" action="#" class="form-inline">

	<select name="findType" class="form-control mr-2">
		<option value="">::검색 유형::</option>
		<option value="1">이름</option>
		<option value="2">아이디</option>
	</select>
	<input type="text" name="findKeyword" placeholder="검색어를 입력하세요" 
	class="form-control mr-2">
	<button class="btn btn-success">검 색</button>
</form>
				
				
				<ul class="list-group">
					  <li class="list-group-item">검색된 파트너 정보 띄우기</li>
					  </ul>
					
					<p><div class="d-grid gap-2 d-md-flex justify-content-md-end">
					  <button class="btn btn-primary" onclick = "location.href='${pageContext.request.contextPath}/admin/partnerPro'" type="button">정보 조회 및 수정</button>
					</div></p> 
					
					<p><div class="d-grid gap-2 d-md-flex justify-content-md-end">
					  <button class="btn btn-primary" type="button" onclick = "location.href='${pageContext.request.contextPath}/admin/partner_settlement'">정산내역</button>
					</div></p>
					
					<p><div class="d-grid gap-2 d-md-flex justify-content-md-end">
					  <button class="btn btn-primary" type="button" onclick = "location.href='${pageContext.request.contextPath}/admin/partner_qna'">1:1문의</button>
					</div></p>

  </div>
                </div>

<!-- 					<div class="ecommerce-widget">  -->

<!--                     <div class="row"> -->
<!--                         <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12"> -->
<!--                             <div class="card"> -->
<!--                                 <div class="card-body"> -->
<!--                                     <h5 class="text-muted">Total Revenue</h5> -->
<!--                                     <div class="metric-value d-inline-block"> -->
<!--                                         <h1 class="mb-1">$12099</h1> -->
<!--                                     </div> -->
<!--                                     <div class="metric-label d-inline-block float-right text-success font-weight-bold"> -->
<!--                                         <span><i class="fa fa-fw fa-arrow-up"></i></span><span>5.86%</span> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div id="sparkline-revenue"></div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12"> -->
<!--                             <div class="card"> -->
<!--                                 <div class="card-body"> -->
<!--                                     <h5 class="text-muted">Affiliate Revenue</h5> -->
<!--                                     <div class="metric-value d-inline-block"> -->
<!--                                         <h1 class="mb-1">$12099</h1> -->
<!--                                     </div> -->
<!--                                     <div class="metric-label d-inline-block float-right text-success font-weight-bold"> -->
<!--                                         <span><i class="fa fa-fw fa-arrow-up"></i></span><span>5.86%</span> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div id="sparkline-revenue2"></div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12"> -->
<!--                             <div class="card"> -->
<!--                                 <div class="card-body"> -->
<!--                                     <h5 class="text-muted">Refunds</h5> -->
<!--                                     <div class="metric-value d-inline-block"> -->
<!--                                         <h1 class="mb-1">0.00</h1> -->
<!--                                     </div> -->
<!--                                     <div class="metric-label d-inline-block float-right text-primary font-weight-bold"> -->
<!--                                         <span>N/A</span> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div id="sparkline-revenue3"></div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12"> -->
<!--                             <div class="card"> -->
<!--                                 <div class="card-body"> -->
<!--                                     <h5 class="text-muted">Avg. Revenue Per User</h5> -->
<!--                                     <div class="metric-value d-inline-block"> -->
<!--                                         <h1 class="mb-1">$28000</h1> -->
<!--                                     </div> -->
<!--                                     <div class="metric-label d-inline-block float-right text-secondary font-weight-bold"> -->
<!--                                         <span>-2.00%</span> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div id="sparkline-revenue4"></div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="row"> -->
<!--                         ============================================================== -->

<!--                         ============================================================== -->

<!--                         recent orders  -->
<!--                         ============================================================== -->
<!--                         <div class="col-xl-9 col-lg-12 col-md-6 col-sm-12 col-12"> -->
<!--                             <div class="card"> -->
<!--                                 <h5 class="card-header">Recent Orders</h5> -->
<!--                                 <div class="card-body p-0"> -->
<!--                                     <div class="table-responsive"> -->
<!--                                         <table class="table"> -->
<!--                                             <thead class="bg-light"> -->
<!--                                             <tr class="border-0"> -->
<!--                                                 <th class="border-0">#</th> -->
<!--                                                 <th class="border-0">Image</th> -->
<!--                                                 <th class="border-0">Product Name</th> -->
<!--                                                 <th class="border-0">Product Id</th> -->
<!--                                                 <th class="border-0">Quantity</th> -->
<!--                                                 <th class="border-0">Price</th> -->
<!--                                                 <th class="border-0">Order Time</th> -->
<!--                                                 <th class="border-0">Customer</th> -->
<!--                                                 <th class="border-0">Status</th> -->
<!--                                             </tr> -->
<!--                                             </thead> -->
<!--                                             <tbody> -->
<!--                                             <tr> -->
<!--                                                 <td>1</td> -->
<!--                                                 <td> -->
<!--                                                     <div class="m-r-10"><img -->
<%--                                                             src="${pageContext.request.contextPath}/resources/admin_partner/assets/images/product-pic.jpg" --%>
<!--                                                             alt="user" class="rounded" width="45"> -->
<!--                                                     </div> -->
<!--                                                 </td> -->
<!--                                                 <td>Product #1</td> -->
<!--                                                 <td>id000001</td> -->
<!--                                                 <td>20</td> -->
<!--                                                 <td>$80.00</td> -->
<!--                                                 <td>27-08-2018 01:22:12</td> -->
<!--                                                 <td>Patricia J. King</td> -->
<!--                                                 <td><span class="badge-dot badge-brand mr-1"></span>InTransit</td> -->
<!--                                             </tr> -->
<!--                                             <tr> -->
<!--                                                 <td>2</td> -->
<!--                                                 <td> -->
<!--                                                     <div class="m-r-10"><img -->
<%--                                                             src="${pageContext.request.contextPath}/resources/admin_partner/assets/images/product-pic-2.jpg" --%>
<!--                                                             alt="user" class="rounded" width="45"> -->
<!--                                                     </div> -->
<!--                                                 </td> -->
<!--                                                 <td>Product #2</td> -->
<!--                                                 <td>id000002</td> -->
<!--                                                 <td>12</td> -->
<!--                                                 <td>$180.00</td> -->
<!--                                                 <td>25-08-2018 21:12:56</td> -->
<!--                                                 <td>Rachel J. Wicker</td> -->
<!--                                                 <td><span class="badge-dot badge-success mr-1"></span>Delivered</td> -->
<!--                                             </tr> -->
<!--                                             <tr> -->
<!--                                                 <td>3</td> -->
<!--                                                 <td> -->
<!--                                                     <div class="m-r-10"><img -->
<%--                                                             src="${pageContext.request.contextPath}/resources/admin_partner/assets/images/product-pic-3.jpg" --%>
<!--                                                             alt="user" class="rounded" width="45"> -->
<!--                                                     </div> -->
<!--                                                 </td> -->
<!--                                                 <td>Product #3</td> -->
<!--                                                 <td>id000003</td> -->
<!--                                                 <td>23</td> -->
<!--                                                 <td>$820.00</td> -->
<!--                                                 <td>24-08-2018 14:12:77</td> -->
<!--                                                 <td>Michael K. Ledford</td> -->
<!--                                                 <td><span class="badge-dot badge-success mr-1"></span>Delivered</td> -->
<!--                                             </tr> -->
<!--                                             <tr> -->
<!--                                                 <td>4</td> -->
<!--                                                 <td> -->
<!--                                                     <div class="m-r-10"><img -->
<%--                                                             src="${pageContext.request.contextPath}/resources/admin_partner/assets/images/product-pic-4.jpg" --%>
<!--                                                             alt="user" class="rounded" width="45"> -->
<!--                                                     </div> -->
<!--                                                 </td> -->
<!--                                                 <td>Product #4</td> -->
<!--                                                 <td>id000004</td> -->
<!--                                                 <td>34</td> -->
<!--                                                 <td>$340.00</td> -->
<!--                                                 <td>23-08-2018 09:12:35</td> -->
<!--                                                 <td>Michael K. Ledford</td> -->
<!--                                                 <td><span class="badge-dot badge-success mr-1"></span>Delivered</td> -->
<!--                                             </tr> -->
<!--                                             <tr> -->
<!--                                                 <td colspan="9"><a href="#" class="btn btn-outline-light float-right">View -->
<!--                                                     Details</a></td> -->
<!--                                             </tr> -->
<!--                                             </tbody> -->
<!--                                         </table> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         ============================================================== -->
<!--                         end recent orders  -->


<!--                         ============================================================== -->
<!--                         ============================================================== -->
<!--                         customer acquistion  -->
<!--                         ============================================================== -->
<!--                         <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12"> -->
<!--                             <div class="card"> -->
<!--                                 <h5 class="card-header">Customer Acquisition</h5> -->
<!--                                 <div class="card-body"> -->
<!--                                     <div class="ct-chart ct-golden-section" style="height: 354px;"></div> -->
<!--                                     <div class="text-center"> -->
<!--                                             <span class="legend-item mr-2"> -->
<!--                                                     <span class="fa-xs text-primary mr-1 legend-tile"><i -->
<!--                                                             class="fa fa-fw fa-square-full"></i></span> -->
<!--                                             <span class="legend-text">Returning</span> -->
<!--                                             </span> -->
<!--                                         <span class="legend-item mr-2"> -->

<!--                                                     <span class="fa-xs text-secondary mr-1 legend-tile"><i -->
<!--                                                             class="fa fa-fw fa-square-full"></i></span> -->
<!--                                             <span class="legend-text">First Time</span> -->
<!--                                             </span> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         ============================================================== -->
<!--                         end customer acquistion  -->
<!--                         ============================================================== -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->

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
