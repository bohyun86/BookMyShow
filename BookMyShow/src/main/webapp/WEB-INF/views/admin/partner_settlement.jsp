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
                            <h2 class="pageheader-title" >파트너 관리페이지 </h2>
                            <p class="pageheader-text">Nulla euismod urna eros, sit amet scelerisque torton lectus vel
                                mauris facilisis faucibus at enim quis massa lobortis rutrum.</p>
                        </div>
                    </div>
                </div>
             
                
                <!-- ============================================================== -->
                <!-- end pageheader  -->
                <!-- ============================================================== -->
                 
<!-- ==================================================== -->
            

				<div class="col-xl-9 col-lg-12 col-md-6 col-sm-12 col-12">
                    <div class="card">
                        <h5 class="card-header">정산내역</h5>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead class="bg-light">
                                    <tr class="border-0">
                                        <th class="border-0">#</th>
                                        <th class="border-0">판매된 티켓 수</th>
                                        <th class="border-0">판매수익</th>
                                        <th class="border-0">수수료</th>
                                        <th class="border-0">정산금액</th>
                                        <th class="border-0">공연날짜</th>
                                        <th class="border-0">정산날짜</th>
                                        <th class="border-0">뮤지컬명</th>
                                    </tr>
                                    </thead>
                                    <tbody>
<!--                                     리스트의 총 크기를 계산 -->
                                    <c:choose>
                                        <c:when test="${empty partner_settlement}">
                                            <tr>
                                                <td colspan="8">데이터가 없습니다.</td>
                                            </tr>
                                        </c:when>
                                    </c:choose>


									
                                  <c:forEach var="partner_settlement" items="${partner_settlement}">
<%--                                   ${partnerQna.inquiry_id} --%>
<%--                                   ${partnerQna.user_name} --%>
<%--                                   ${partnerQna.inquiry_type} --%>
<%--                                   ${partnerQna.content} --%>
<%--                                   ${partnerQna.inquiry_id} --%>
                                  
                                  
                <tr>
                    <td><c:out value="${partner_settlement.settlement_id}"/></td>
                    <td>${partner_settlement.tickets_sold}</td>
                    <td>${partner_settlement.total_revenue}</td>
                    <td>${partner_settlement.fee}</td>
                    <td>${partner_settlement.settlement_amount}</td>
                    <td>${partner_settlement.performance_date}</td>
                    <td>${partner_settlement.settlement_date}</td>
                    <td>${partner_settlement.title}</td>
                </tr>
            </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                        
                    </div>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
 								 <button class="btn btn-primary me-md-2" type="reset" onclick = "location.href='${pageContext.request.contextPath}/admin/main'" >돌아가기</button>&nbsp;&nbsp;
							</div>
<!--                                <!-- product category  -->
                            <!-- ============================================================== -->
<!--                             <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12"> -->
<!--                                 <div class="card"> -->
<!--                                     <h5 class="card-header"> Product Category</h5> -->
<!--                                     <div class="card-body"> -->
<!--                                         <div class="ct-chart-category ct-golden-section" style="height: 315px;"></div> -->
<!--                                         <div class="text-center m-t-40"> -->
<!--                                             <span class="legend-item mr-3"> -->
<!--                                                     <span class="fa-xs text-primary mr-1 legend-tile"><i class="fa fa-fw fa-square-full "></i></span><span class="legend-text">Man</span> -->
<!--                                             </span> -->
<!--                                             <span class="legend-item mr-3"> -->
<!--                                                 <span class="fa-xs text-secondary mr-1 legend-tile"><i class="fa fa-fw fa-square-full"></i></span> -->
<!--                                             <span class="legend-text">Woman</span> -->
<!--                                             </span> -->
<!--                                             <span class="legend-item mr-3"> -->
<!--                                                 <span class="fa-xs text-info mr-1 legend-tile"><i class="fa fa-fw fa-square-full"></i></span> -->
<!--                                             <span class="legend-text">Accessories</span> -->
<!--                                             </span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
                            <!-- ============================================================== -->
                            <!-- end product category  -->
                            
                </div>
            </div>
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
