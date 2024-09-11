
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin_partner/assets/libs/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/charts/chartist-bundle/chartist.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/charts/morris-bundle/morris.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/charts/c3charts/c3.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin_partner/documentation/css/performanceEnroll.css">
    <title>Concept - Bootstrap 4 Admin Dashboard Template</title>
</head>

<body>
<!-- ============================================================== -->
<!-- main wrapper -->
<!-- ============================================================== -->
<div class="dashboard-main-wrapper">
    <!-- ============================================================== -->
    <!-- navbar -->
    <!-- ============================================================== -->
    <jsp:include page="../include/partner/top.jsp"/>
    <!-- ============================================================== -->
    <!-- end navbar -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- left sidebar -->
    <!-- ============================================================== -->
    <jsp:include page="../include/partner/sidebar.jsp"/>
    <!-- ============================================================== -->
    <!-- end left sidebar -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
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
                            <h2 class="pageheader-title">1:1문의등록</h2>
<div class="p-3 mb-2 bg-body-tertiary">                           
                            <div style="width:735px; margin-top:10px; border:1px solid #ccc; font-size:15px; padding:15px 20px; line-height:180%; background:#f9f9f9">
			· 티켓 환불은 <span style="color:#f00;">마이티켓 &gt; 예매내역</span>의 <span style="color:#f00;">환불신청 버튼</span>을 이용해주세요.<br>
			· 공연 티켓은 환불규정에 의거하여 <span style="color:#f00;">관람 당일 환불/취소 및 일정 변경이 불가</span>합니다.<br>
			· 답변은 업무일(평일10:00~18:00) 기준 24시간 내로 완료되며, 주말/공휴일은 답변이 지연될 수 있습니다.<br>
		</div>
                            <div class="m-2 bg-white form-body">
                            
                                <form action="${pageContext.request.contextPath}/partner/qna" method="get"> 
<!--                                 프론트작업 편하게 페이지 이동을 위해 메소드 겟으로 해놓음  -->
                                    <div class="input-group mb-3 " >
  <span class="input-group-text" id="inputGroup-sizing-default">제목</span>
  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="제목을 입력해주세요">
</div>

                                   <div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">연락처</span>
  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="010-1234-5678">
</div>

                                               <div class="input-group">
  <span class="input-group-text">문의사항</span>
  <textarea class="form-control" aria-label="문의사항을 입력해주세요"></textarea>
</div>
                                    </div>
                                   <div class="d-grid gap-2 col-6 mx-auto">
                                       <input class="btn btn-primary " type="submit" value="등록신청">
                                    </div>
                                    
                                </form>


                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader  -->
                <!-- ============================================================== -->
            </div>
        </div>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

//     const postAddress = document.querySelector('.post-address');
//     const basicAddress = document.querySelector('.basic-address');
//     const detailAddress = document.querySelector('.detail-address');
//     const btnSearch = document.querySelector('.btn-address');

//     btnSearch.addEventListener('click', function () {
//         searchPost.open();
//     });

//     const searchPost = new daum.Postcode({
//         oncomplete: function (data) {
//             postAddress.value = data.zonecode;
//             basicAddress.value = data.address;
//             detailAddress.focus();
//         }
//     });
</script>
</body>

</html>