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
                            <h2 class="pageheader-title">수정할 뮤지컬 선택</h2>
                            <p class="pageheader-text">Nulla euismod urna eros, sit amet scelerisque torton lectus vel
                                mauris facilisis faucibus at enim quis massa lobortis rutrum.</p>
                        </div>
                   </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader  -->
                <!-- ============================================================== -->
                 
<!-- ==================================================== -->

				
<div class="list-group">

  <button type="button" class="list-group-item list-group-item-action " aria-current="true">
   <img src="${pageContext.request.contextPath}/resources/images/poster/newopen1.jpg" class="img-thumbnail" alt="new1" style="width: 100px">
   옥탑방 고양이
    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
  <a class="btn btn-outline-primary btn-sm" href="${pageContext.request.contextPath}/admin/editPro" role="button">수정</a> &nbsp;&nbsp;
  <form action="${pageContext.request.contextPath}/admin/edit">
  		<a class="btn btn-outline-danger" type="submit" onclick="deleteok()" >삭제</a>
  </form>
  
  </div>
  </button>
 
  <button type="button" class="list-group-item list-group-item-action">
   <img src="${pageContext.request.contextPath}/resources/images/poster/newopen2.jpg" class="img-thumbnail" alt="new2" style="width: 100px">
   최상급 요트에서 특별한 여행 추억 쌓기!
  <div class="d-grid gap-2 d-md-flex justify-content-md-end">
  <a class="btn btn-outline-primary btn-sm" href="#" role="button">수정</a>&nbsp;&nbsp;
  <form action="${pageContext.request.contextPath}/admin/edit">
  		<a class="btn btn-outline-danger" type="submit" onclick="deleteok()" >삭제</a>
  </form>
  </div>
  </button>
  
  
  <button type="button" class="list-group-item list-group-item-action">
   <img src="${pageContext.request.contextPath}/resources/images/poster/newopen3.jpg" class="img-thumbnail" alt="new3" style="width: 100px">
  어린이 CAT
  <div class="d-grid gap-2 d-md-flex justify-content-md-end">
  <a class="btn btn-outline-primary btn-sm" href="#" role="button">수정</a>&nbsp;&nbsp;
  <form action="${pageContext.request.contextPath}/admin/edit">
  		<a class="btn btn-outline-danger" type="submit" onclick="deleteok()" >삭제</a>
  </form>
  </div>
   </button>
  
  <button type="button" class="list-group-item list-group-item-action">
   <img src="${pageContext.request.contextPath}/resources/images/poster/newopen4.jpg" class="img-thumbnail" alt="new4" style="width: 100px">
   썸데이
  <div class="d-grid gap-2 d-md-flex justify-content-md-end">
  <a class="btn btn-outline-primary btn-sm" href="#" role="button">수정</a>&nbsp;&nbsp;
  <form action="${pageContext.request.contextPath}/admin/edit">
  		<a class="btn btn-outline-danger" type="submit" onclick="deleteok()" >삭제</a>
  </form>
  </div>
  </button>

</div>




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
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

</div>
</div>

<script>


function deleteok(){
    if(!confirm('삭제하시면 복구할수 없습니다. \n 정말로 삭제하시겠습니까??')){
        return false;
    }
}

</script>

<!-- 					
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
