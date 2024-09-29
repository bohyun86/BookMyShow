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
                            <h2 class="pageheader-title" >회원 관리페이지 </h2>
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
                        <h5 class="card-header">예매내역</h5>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead class="bg-light">
                                    <tr class="border-0">
                                        <th class="border-0">예매번호</th>
                                        <th class="border-0">예매한뮤지컬</th>
                                        <th class="border-0">관람일</th>
                                        <th class="border-0">공연장소</th>
                                        <th class="border-0">예매날짜</th>
                                        <th class="border-0">예매좌석 번호</th>
                                        <th class="border-0">리뷰작성 뮤지컬</th>
                                        <th class="border-0">예매인원 수</th>
                                    </tr>
                                    </thead>
                                    <tbody>
<!--                                     리스트의 총 크기를 계산 -->
                                    <c:choose>
                                        <c:when test="${empty memberBooked}">
                                            <tr>
                                                <td colspan="8">데이터가 없습니다.</td>
                                            </tr>
                                        </c:when>
                                    </c:choose>


									
                                  <c:forEach var="memberBooked" items="${memberBooked}">
<%--                                   ${partnerQna.inquiry_id} --%>
<%--                                   ${partnerQna.user_name} --%>
<%--                                   ${partnerQna.inquiry_type} --%>
<%--                                   ${partnerQna.content} --%>
<%--                                   ${partnerQna.inquiry_id} --%>
                                  
                                  
                <tr>
                    <td>${memberBooked.booking_id}</td>
                    <td>${memberBooked.title}</td>
                    <td>${memberBooked.start_date}</td>
                    <td>${memberBooked.venue_name}</td>
                    <td>${memberBooked.booking_date}</td>
                    <td>${memberBooked.seat_number}</td>
                    <td>${memberBooked.content}</td>
                    <td>${memberBooked.ticket_count}</td>
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
<!--                     <nav aria-label="Page navigation"> -->
<!--                         <ul class="pagination justify-content-center"> -->
<%--                             <c:if test="${currentPage > 1}"> --%>
<!--                                 <li class="page-item"> -->
<%--                                     <a class="page-link" href="?page=${currentPage - 1}">&laquo;</a> --%>
<!--                                 </li> -->
<%--                             </c:if> --%>
<%--                             <c:forEach var="i" begin="1" end="${totalPages}"> --%>
<%--                                 <li class="page-item <c:if test='${i == currentPage}'>active</c:if>'"> --%>
<%--                                     <a class="page-link" href="?page=${i}">${i}</a> --%>
<!--                                 </li> -->
<%--                             </c:forEach> --%>
<%--                             <c:if test="${currentPage < totalPages}"> --%>
<!--                                 <li class="page-item"> -->
<%--                                     <a class="page-link" href="?page=${currentPage + 1}">&raquo;</a> --%>
<!--                                 </li> -->
<%--                             </c:if> --%>
<!--                         </ul> -->
<!--                     </nav> -->
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
