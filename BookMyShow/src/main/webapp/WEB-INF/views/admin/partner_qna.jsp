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
                        <h5 class="card-header">문의현황</h5>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead class="bg-light">
                                    <tr class="border-0">
                                        <th class="border-0">#</th>
                                        <th class="border-0">문의작성자</th>
                                        <th class="border-0">문의유형</th>
                                        <th class="border-0">제목</th>
                                        <th class="border-0">내용</th>
                                        <th class="border-0">작성일</th>
                                        <th class="border-0">파트너성함</th>
                                        <th class="border-0">회사명</th>
                                        <th class="border-0">처리상태</th>
                                    </tr>
                                    </thead>
                                    <tbody>
<!--                                     리스트의 총 크기를 계산 -->
                                    <c:choose>
                                        <c:when test="${empty partnerQnaList}">
                                            <tr>
                                                <td colspan="9">데이터가 없습니다.</td>
                                            </tr>
                                        </c:when>
                                    </c:choose>



                                  <c:forEach var="partnerQna" items="${partnerQnaList}">
<%--                                   ${partnerQna.inquiry_id} --%>
<%--                                   ${partnerQna.user_name} --%>
<%--                                   ${partnerQna.inquiry_type} --%>
<%--                                   ${partnerQna.content} --%>
<%--                                   ${partnerQna.inquiry_id} --%>
                                  
                                  
                <tr>
                    <td>${partnerQna.inquiry_id}</td>
                    <td>${partnerQna.user_name}</td>
                    <td>${partnerQna.inquiry_type}</td>
                    <td><a href="${pageContext.request.contextPath}/admin/partner_qnaAnswer?inquiry_id=${partnerQna.inquiry_id}">${partnerQna.title}</a></td>
                    <td>${partnerQna.content}</td>
                    <td>${partnerQna.created_at}</td>
                    <td>${partnerQna.name}</td>
                    <td>${partnerQna.company_name}</td>
                    <td>
                        <c:choose>
                            <c:when test="${partnerQna.answered == 1}">
                                <span class="badge-dot badge-info mr-1"></span>완료
                            </c:when>
                            <c:otherwise>
                                <span class="badge-dot badge-brand mr-1"></span>처리중
                            </c:otherwise>
                        </c:choose>
                    </td>
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

                </div>
            </div>
        </div>
    </div>

               
				

</div>
				
				


                
                <script>
	

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
