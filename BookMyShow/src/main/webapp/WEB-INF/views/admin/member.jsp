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
                            <h2 class="pageheader-title">회원검색페이지 </h2>
                            <p class="pageheader-text">Nulla euismod urna eros, sit amet scelerisque torton lectus vel
                                mauris facilisis faucibus at enim quis massa lobortis rutrum.</p>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader  -->
                <!-- ============================================================== -->
                 
<!-- ==================================================== -->

			
				
<form name="findF" action="#" class="form-inline" >
	<select name="findType" class="form-control mr-2" onchange="changeSearch(this)" >
		<option value="">::검색 유형::</option>
		<option value="1">이름</option>
		<option value="2">아이디</option>
		<option value="3">이메일</option>
	</select>
		<input type="text" name="findKeyword"  placeholder="검색어를 입력하세요" class="form-control mr-2" id ="searchText">
			<button class="btn btn-success"  type="button" id="memberSearch">검 색</button>
			</form>

 						<ul class="list-group">

					  <li class="list-group-item" id="result"></li>
					  </ul>
<!-- </div> -->

<p><div class="d-grid gap-2 d-md-flex justify-content-md-end">
  <button class="btn btn-primary" type="button" id="editButton" disabled>정보 조회 및 수정</button>
</div></p> 

<p><div class="d-grid gap-2 d-md-flex justify-content-md-end">
  <button class="btn btn-primary" type="button" id="bookingButton" disabled>예매내역</button>
</div></p>

<p><div class="d-grid gap-2 d-md-flex justify-content-md-end">
  <button class="btn btn-primary" type="button"  id="paymentutton" disabled>결제내역</button>
</div></p>

  </div>
                </div>

<script>



$(function() {
    $('#memberSearch').click(function() {
    	
    	
        
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/result",
            data: {'user_name': $('#searchText').val()},
            dataType: "json",
            success: function(userDTO) {
                if (userDTO) {
                    $('#result').html('<li class="list-group-item"><a href="javascript:;">' + "아이디:"+userDTO.userName+",이메일:"+ userDTO.email+",연락처:"+userDTO.phoneNumber+",이름:"+userDTO.name+",비밀번호:"+userDTO.password+",회원가입일:"+userDTO.createdAt+ '</a></li>');
                    
                    $('#editButton').attr('onclick', 'location.href="' + '${pageContext.request.contextPath}/admin/memberPro?userName=' + userDTO.userName + '"').prop('disabled', false);
                    $('#bookingButton').attr('onclick', 'location.href="' + '${pageContext.request.contextPath}/admin/booking?userName=' + userDTO.userName + '"').prop('disabled', false);
                    $('#paymentutton').attr('onclick', 'location.href="' + '${pageContext.request.contextPath}/admin/payment?userName=' + userDTO.userName + '"').prop('disabled', false);
                } else {
                    $('#result').html("회원정보가 없습니다");
                    $('#editButton').prop('disabled', true);
                    $('#bookingButton').prop('disabled', true);
                    $('#paymentutton').prop('disabled', true);
                    
                }
            },
            error: function(err) {
//                 alert("회원정보가 없습니다");
 $('#result').html("회원정보가 없습니다");
                console.log("error");
            }
        });
    });
});


	function changeSearch(obj) {
		let key = $(obj).val();
			
		$('#searchText').attr('name', key);
		
			
		}
		
		






</script>







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
