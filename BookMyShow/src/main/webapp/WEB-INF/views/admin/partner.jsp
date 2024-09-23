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

	<select name="findType" class="form-control mr-2" onchange="changeSearch(this)">
		<option value="">::검색 유형::</option>
		<option value="1" >이름</option>
		<option value="2">아이디</option>
	</select>
	<input type="text" name="findKeyword" placeholder="검색어를 입력하세요" class="form-control mr-2" id ="searchText"  >
	<button class="btn btn-success" type="button"  id="partnerSearch"  onkeypress="searchFunction();" >검 색</button>
</form>
				
				
				<ul class="list-group">
					  <li class="list-group-item" id="partnerresult"></li>
					  </ul>
					
					<p><div class="d-grid gap-2 d-md-flex justify-content-md-end">
					  <button class="btn btn-primary" type="button" id="editButton"   disabled>정보 조회 및 수정</button>
					</div></p> 
					
					<p><div class="d-grid gap-2 d-md-flex justify-content-md-end">
					  <button class="btn btn-primary" type="button"  id="paymentButton" disabled>정산내역</button>
					</div></p>
					
<!-- 					<p><div class="d-grid gap-2 d-md-flex justify-content-md-end"> -->
<!-- 					  <button class="btn btn-primary" type="button"  id="qnaButton" disabled>1:1문의</button> -->
<!-- 					</div></p> -->




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

<script>

  
  
//검색유형
function changeSearch(obj) {
	let key = $(obj).val();
		
	$('#searchText').attr('name', key);
	
	if (key === "1") {
        $('#searchText').attr('name', 'name');  // 이름 검색
        $('#searchText').attr('placeholder', '이름을 입력하세요');  // 입력 힌트도 변경
    } else if (key === "2") {
        $('#searchText').attr('name', 'id');  // 아이디 검색
        $('#searchText').attr('placeholder', '아이디를 입력하세요');  // 입력 힌트도 변경
    } else {
        $('#searchText').attr('name', '');  // 기본값으로 초기화
        $('#searchText').attr('placeholder', '검색어를 입력하세요');
    }
		
	}
		
$(function() {
    // 검색 버튼 클릭 시 searchFunction 호출
    $('#partnerSearch').click(function() {
        searchFunction();  // 버튼 클릭 시 searchFunction 호출
    });

    // 입력 필드에서 Enter 키 입력 시 searchFunction 호출
    $('#searchText').on('keypress', function(event) {
        if (event.key === 'Enter' ) {
            event.preventDefault();  // 기본 Enter 동작 방지
            searchFunction();  // Enter 키를 누르면 searchFunction 호출
        }
    });
});

function searchFunction() {
    let searchValue = $('#searchText').val(); // 검색 필드 값
    let searchType = $('#searchText').attr('name');  // 현재 검색 유형

    // 화면에 출력할 메시지 초기화
    $('#partnerresult').html("");

    if (searchType === 'name') {
        if (/^[a-zA-Z가-힣\s]+$/.test(searchValue)) {
        	ajaxSearchPartner(searchValue);
//            
        }//if /^[a-zA-Z가-힣\s]+$ 
        else {
            $('#partnerresult').html("이름에는 한글, 영어, 공백만 포함될 수 있습니다.");
            return;
        }
    } else if (searchType === 'id') {
//     	alert("아이디"+searchValue);
        if (/^[a-zA-Z0-9]+$/.test(searchValue)) {
        	ajaxSearchPartner(searchValue);
        
        } else {
            $('#partnerresult').html("아이디는 영문자와 숫자만 포함될 수 있습니다.");
            return;
        }
    } else {
        $('#partnerresult').html("검색 유형을 선택하세요.");
        return;
    }
}


function ajaxSearchPartner(searchValue){
    $(function() {
//     	alert("d");
//         $('#partnerSearch').click(function() {
//         	alert("이름버튼클릭");

        	 
    			$.ajax({
                          url: "${pageContext.request.contextPath}/admin/partnerresult",
                          data: {'user_name': $('#searchText').val()},
                          dataType: "json",
                          success: function(partnerDTO) {
//                         	  console.log("AJAX 응답 성공: ", response);  // 응답 데이터 확인
                              // 성공적으로 응답을 받았을 때 처리
                              if (partnerDTO.userDTO) {
                            	  
                                  // 회원 정보 출력
                                  $('#partnerresult').html('<li class="list-group-item"><a href="javascript:;">'
                                      + "아이디: " + partnerDTO.userDTO.userName
                                      + ", 이메일: " + partnerDTO.userDTO.email
                                      + ", 연락처: " + partnerDTO.userDTO.phoneNumber
                                      + ", 이름: " + partnerDTO.userDTO.name
                                      + ", 비밀번호: " + partnerDTO.userDTO.password
                                      + ", 회원가입일: " + partnerDTO.userDTO.createdAt
                                      + ", 유형: " + partnerDTO.userDTO.userRole
                                      + '</a></li>');

                                  // 파트너 정보가 있으면 파트너 정보도 추가 출력
                                  if (partnerDTO) {
                                      
                                      $('#partnerresult').append('<li class="list-group-item"><a href="javascript:;">'
                                          + "회사명: " +partnerDTO.companyName
                                          + ", 사업자 ID: " + partnerDTO.businessId
                                          + ", 계좌번호: " + partnerDTO.accountNumber
                                          + '</a></li>');
                                  

                                  // 각 버튼에 대한 링크 설정 (버튼 활성화)
                                  $('#editButton').attr('onclick', 'location.href="' 
                                      + '${pageContext.request.contextPath}/admin/partnerPro?userName=' 
                                      + encodeURIComponent(partnerDTO.userDTO.userName)
//                                       +'&password='
//                                       + encodeURIComponent(partnerDTO.userDTO.password) 
//                                       +'&name='
//                                       + encodeURIComponent(partnerDTO.userDTO.name) 
//                                       +'&companyName='
//                                       + encodeURIComponent(partnerDTO.companyName) 
//                                       +'&businessId='
//                                       + encodeURIComponent(partnerDTO.businessId) 
//                                       +'&accountNumber='
//                                       + encodeURIComponent(partnerDTO.accountNumber) 
//                                       +'&bankName='
//                                       + encodeURIComponent(partnerDTO.bankName) 
//                                       +'&phoneNumber='
//                                       + encodeURIComponent(response.phoneNumber) 
//                                       +'&email='
//                                       + encodeURIComponent(partnerDTO.userDTO.email) 
//                                       +'&createdAt='
//                                       + encodeURIComponent(partnerDTO.createdAt) 
                                      
                                      + '"').prop('disabled', false);
                                  
                                  
                                  $('#qnaButton').attr('onclick', 'location.href="' + '${pageContext.request.contextPath}/admin/partner_qna?userName=' + response.userName + '"').prop('disabled', false);
                                  $('#paymentButton').attr('onclick', 'location.href="' + '${pageContext.request.contextPath}/admin/partner_settlement?userName=' + response.userName + '"').prop('disabled', false);
                              } 
                              }else {
//             	console.log("요청실패",userDTO);
                                  $('#partnerresult').html("회원정보가 없습니다");
                                  $('#editButton').prop('disabled', true);
                                  $('#qnaButton').prop('disabled', true);
                                  $('#paymentButton').prop('disabled', true);
                              }  
                              },
                 
                  error: function(err) {
//                       alert("회원정보가 없습니다");
       $('#partnerresult').html("회원정보가 없습니다");
                      console.log("error");
                  }
              });
//           });
      });
}




</script>
</body>

</html>
