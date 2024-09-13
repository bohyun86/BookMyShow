
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
<% request.setCharacterEncoding("UTF-8"); %>
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
                            <h2 class="pageheader-title">신규등록</h2>
                            <div class="m-2 bg-white form-body">
                            
                                <form action="${pageContext.request.contextPath}/partner/status" method="get" class="was-validated">
<!--                                 프론트작업때문에 메소드 겟으로 잠시 변경 나중에 포스트로 바꿔야함 -->
                                <div class="p-3 mb-2 bg-body-tertiary">
                                    <div class="form-group col">
                                        <label class=" col-form-label">공연명</label>
                                        <input type="text" class="form-control"


                                               placeholder="상품명을 입력해주세요." name="title">

                                    </div>

                                    <div class="form-group col">
                                        <label class="col-form-label">장르</label>
                                        <select class="form-select" aria-label="Default select example">
                                            <option selected>장르를 선택해주세요</option>
                                            <option name="genreId" value="1">로맨틱코미디</option>
                                            <option name="genreId" value="2">코믹</option>
                                            <option name="genreId" value="3">드라마</option>
                                            <option name="genreId" value="4">퍼포먼스</option>
                                            <option name="genreId" value="5">어린이뮤지컬</option>
                                            <option name="genreId" value="6">기타</option>

                                        </select>
                                    </div>
                                    <div class="form-group col">
                                        <label class="col-form-label">관람등급</label>
                                        <select class="form-select" aria-label="Default select example">
                                            <option selected>관람등급을 선택해주세요</option>
                                            <option name="ageLimit" value="1">전체관람가</option>
                                            <option name="ageLimit" value="2">12세이상관람가</option>
                                            <option name="ageLimit" value="3">15세이상관람가</option>
                                            <option name="ageLimit" value="4">18세이상관람가</option>
                                        </select>

                                    </div>
                                    <div class="form-group col" id="venue">
                                        <label class="col-form-label">공연장</label>
                                        <div class="venue-sub-menu">
                                            <input type="text" class="form-control"

                                                   placeholder="공연장 명을 작성해주세요." id="search" name="venueTitle" autocomplete="off">
                                            <ul id="results" style="width: 500px"></ul>
                                            <input type="hidden" class="region-name" name="regionName">
                                            <input type="hidden" class="theater-id" name="theaterId">

                                            <div class="input-group" id="address-detail">
                                                <div class="address-first-line">

                                                    <input type="text" class="post-address"
                                                           placeholder="우편번호" name="postCode">

                                                    <button type="button" class="btn btn-primary btn-address">주소검색</button>
                                                     <div class="invalid-feedback">
     														 우편번호를 입력해주세요.
   														 </div>
                                                </div>

                                                <input type="text" class="basic-address" placeholder="기본주소"
                                                       style="border-radius: 5px; margin-top: 5px;" name="basicAddress">
                                                <input type="text" class="detail-address" placeholder="상세주소"
                                                       style="border-radius: 5px; margin-top: 5px;" name="detailAddress">

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group col">
                                        <label class="col-form-label">공연일시</label>
                                        <!--                                        공연일시 시작일, 종료일 -->
                                        <div id="perform-date">
                                            <label for="start-date" class="col-form-label">시작일</label>

                                            <input type="date" id="start-date" class="form-control"
                                            name="startDate">

                                            <label for="end-date" class="col-form-label">종료일</label>

                                            <input type="date" id="end-date" class="form-control"
                                            name="endDate">

                                        </div>
                                    </div>
                                    <div class="form-group col">
                                        <label class="col-form-label">공연시간</label>
                                        <div class="show-time">
                                            <div class="total-time">
                                                <p>총 공연시간 :</p>
                                                <input type="text" class="form-control" name="totalTime">
                                            </div>
                                            <div class="interval-time">
                                                <p>인터벌 시간 :</p>
                                                <input type="text" class="form-control" name="intervalTime">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group col">
                                        <label class="col-form-label">좌석판매형태</label>
                                        <div class="seat-check-box">
                                            <div class="reservation-check">
                                                <!-- 지정석 비지정석 -->
                                                <div class="seat-reserved">
                                                    <label for="reserved-seat">지정석</label>
                                                    <input type="radio" id="reserved-seat" name="reserved" class="seat"
                                                           value="true" checked>
                                                </div>
                                                <div class="seat-unreserved">
                                                    <label for="unreserved-seat">비지정석</label>
                                                    <input type="radio" id="unreserved-seat" name="reserved" class="seat"
                                                           value="false">
                                                </div>
                                            </div>
                                            <div class="total-seat">
                                                <p>총 좌석 수 :</p>
                                                <input type="text" class="form-control" name="totalSeat" disabled>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group col" id="show-class">
                                        <label class="col-form-label">좌석등급 및 가격</label>
                                        <div class="classify-grade">
                                            <div class="sub-group">
                                                <div class="check-box">
                                                    <input type="checkbox" id="grade-vip" name="class" value="1">
                                                    <label for="grade-vip">VIP</label>
                                                </div>
                                                <div class="input-group-parent">
                                                    <div class="input-group" style="width: 190px">
                                                        <span class="input-group-text">가격</span>
                                                        <input type="number" class="form-control"  name="price" disabled>
                                                    </div>
                                                    <div class="input-group" style="width: 190px">
                                                        <span class="input-group-text">좌석수</span>
                                                        <input type="number" class="form-control" name="numberOfSeats" disabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="sub-group">
                                                <div class="check-box">
                                                    <input type="checkbox" id="grade-r" name="class" value="2" class="r-grade">
                                                    <label for="grade-r">R</label>
                                                </div>
                                                <div class="input-group-parent">
                                                    <div class="input-group" style="width: 190px">
                                                        <span class="input-group-text">가격</span>
                                                        <input type="number" class="form-control r-grade" name="price" disabled>
                                                    </div>
                                                    <div class="input-group" style="width: 190px">
                                                        <span class="input-group-text">좌석수</span>
                                                        <input type="number" class="form-control r-grade" name="numberOfSeats" disabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="sub-group">
                                                <div class="check-box">
                                                    <input type="checkbox" id="grade-s" name="class" value="3">
                                                    <label for="grade-s">S</label>
                                                </div>
                                                <div class="input-group-parent">
                                                    <div class="input-group" style="width: 190px">
                                                        <span class="input-group-text">가격</span>
                                                        <input type="number" class="form-control" name="price" disabled>
                                                    </div>
                                                    <div class="input-group" style="width: 190px">
                                                        <span class="input-group-text">좌석수</span>
                                                        <input type="number" class="form-control" name="numberOfSeats" disabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="sub-group">
                                                <div class="check-box">
                                                    <input type="checkbox" id="grade-a" name="class" value="4" >
                                                    <label for="grade-a">A</label>
                                                </div>
                                                <div class="input-group-parent">
                                                    <div class="input-group" style="width: 190px">
                                                        <span class="input-group-text">가격</span>
                                                        <input type="number" class="form-control" name="price" disabled>
                                                    </div>
                                                    <div class="input-group" style="width: 190px">
                                                        <span class="input-group-text">좌석수</span>
                                                        <input type="number" class="form-control" name="numberOfSeats" disabled>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="sub-group">
                                                <div class="check-box">
                                                    <input type="checkbox" id="grade-b" name="class" value="5">
                                                    <label for="grade-b">B</label>
                                                </div>
                                                <div class="input-group-parent">
                                                    <div class="input-group" style="width: 190px">
                                                        <span class="input-group-text">가격</span>
                                                        <input type="number" class="form-control" name="price" disabled>
                                                    </div>
                                                    <div class="input-group" style="width: 190px">
                                                        <span class="input-group-text">좌석수</span>
                                                        <input type="number" class="form-control" name="numberOfSeats" disabled>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group col">
                                        <label class="col-form-label">인당 구매가능수</label>
                                        <input type="number">
                                        <!-- 0이하로 안떨어지게 js로 구현-->
                                    </div>
                                    <!--           <div class="form-group col" id="discount-input">
                                                   <label class="col-form-label">할인정보</label>
                                                   <div>
                                                       <div id="discount-date">
                                                           <label for="discount-start-date" class="col-form-label">시작일</label>
                                                           <input type="date" id="discount-start-date" class="form-control">
                                                           <label for="discount-end-date" class="col-form-label">종료일</label>
                                                           <input type="date" id="discount-end-date" class="form-control">
                                                       </div>
                                                       <div class="input-group">
                                                           <span class="input-group-text">할인율</span>
                                                           <input type="number" id="rate-input" class="form-control p-0">
                                                       </div>
                                                   </div>
                                                   0이하로 안떨어지게 js로 구현
                                               </div>-->
                                    <div class="form-group col" id="detail-info">
                                        <label class="col-form-label">공연상세정보</label>
                                        <div class="detail-info">
                                            <div class="musicalImage">
                                                <p>포스터 이미지 :</p>
                                                <input type="file" class="form-control">
                                            </div>
                                            <div class="musicalDescriptionImage">
                                                <p>상세설명 이미지 :</p>
                                                <input type="file" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group col">
                                        <label class="col-form-label">주요배우</label>
                                        <input type="text" placeholder='배우 이름은 쉼표(",")로 구분해주세요.' name="name">
                                    </div>
                                    <div class="form-group col">
                                        <label class="col-form-label">제작진</label>
                                        <input type="text" name="musicalStaff">
                                    </div>
                                    <div class="form-group col">
                                        <label class="col-form-label">주최주관</label>
                                        <input type="text"  name="">
                                    </div>
                                    <div class="form-group col inquire">
                                        <label class="col-form-label">기획제작</label>
                                        <input type="text">
                                    </div>
                                    <div class="form-group col">
                                        <label class="col-form-label" name="request">요청사항</label>
                                        <input type="text">
                                    </div>
                                    <div class="form-group col">
                                        <label></label>
                                        <input type="submit" value="등록신청" class="btn btn-primary" Style="color: white">
                                    </div>

                                    <input type="hidden" name="UserId" value="${sessionScope.userId}">



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
<script src="${pageContext.request.contextPath}/resources/admin_partner/documentation/js/write.js"></script>
<script>

    const postAddress = document.querySelector('.post-address');
    const basicAddress = document.querySelector('.basic-address');
    const detailAddress = document.querySelector('.detail-address');
    const btnSearch = document.querySelector('.btn-address');

    btnSearch.addEventListener('click', function () {
        searchPost.open();
    });

    const searchPost = new daum.Postcode({
        oncomplete: function (data) {
            postAddress.value = data.zonecode;
            basicAddress.value = data.address;
            detailAddress.focus();
        }
    });
    


  //startDate 오늘날짜 가져옴
  //endDate는 startDate 전날짜 못가져옴
  $(function(){
  var today = new Date();
  var dd = today.getDate();
  var mm = today.getMonth()+1; 
  	  
  	   var yyyy = today.getFullYear();
  	   if(dd<10){
  	     dd='0'+dd
  	   } 
  	   if(mm<10){
  	     mm='0'+mm
  	   } 
  	   today = yyyy+'-'+mm+'-'+dd;
  	
  	   document.getElementById("startDate").setAttribute("min", today);
  	  })
  	     
  	
  	function setendmin(e){
  	   document.getElementById("endDate").setAttribute("min", e);
  	   }  
</script>
</body>

</html>