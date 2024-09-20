<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">

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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/admin_partner/documentation/css/performanceEnroll.css">
    <title>공연 등록 - 예매하다</title>
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
    <jsp:include page="../include/adminTop.jsp"/>
    <!-- ============================================================== -->
    <!-- end navbar -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- left sidebar -->
    <!-- ============================================================== -->
    <jsp:include page="../include/adminSidebar.jsp"/>
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
                                <form action="${pageContext.request.contextPath}/partner/writePro"
                                      enctype="multipart/form-data" method="post" class="was-validated">
                                    <!--                                 프론트작업때문에 메소드 겟으로 잠시 변경 나중에 포스트로 바꿔야함 -->
                                    <div class="p-3 mb-2 bg-body-tertiary">
                                        <div class="form-group col">
                                            <label class=" col-form-label">공연명</label>
                                            <input type="text" class="form-control required-field"
                                                   placeholder="상품명을 입력해주세요." name="title">

                                        </div>

                                        <div class="form-group col">
                                            <label class="col-form-label">장르</label>
                                            <select class="form-select" name="genreId"
                                                    aria-label="Default select example">
                                                <option selected value="0">장르를 선택해주세요</option>
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
                                            <select class="form-select" name="ageLimit"
                                                    aria-label="Default select example">
                                                <option selected value="0">관람등급을 선택해주세요</option>
                                                <option name="ageLimit" value="0">전체관람가</option>
                                                <option name="ageLimit" value="1">12개월이상관람가</option>
                                                <option name="ageLimit" value="7">7세이상관람가</option>
                                                <option name="ageLimit" value="12">12세이상관람가</option>
                                                <option name="ageLimit" value="15">15세이상관람가</option>
                                                <option name="ageLimit" value="18">18세이상관람가</option>
                                            </select>

                                        </div>
                                        <div class="form-group col" id="venue">
                                            <label class="col-form-label">공연장</label>
                                            <div class="venue-sub-menu">
                                                <input type="text" class="form-control required-field"
                                                       placeholder="공연장 명을 작성해주세요." id="search" name="venueTitle"
                                                       autocomplete="off">
                                                <ul id="results" style="width: 500px"></ul>
                                                <div class="region">
                                                    <div class="input-group" style="width: 160px">
                                                        <span class="input-group-text">지역명</span>
                                                        <input type="text" class="region-name" name="regionName"
                                                               style="width: 100px">
                                                    </div>
                                                    <p class="region-p">※ 공연장이 대학로인 경우 "대학로"라고 직접 기입해주세요.</p>
                                                </div>

                                                <input type="hidden" class="theater-id" name="publicVenueId">

                                                <div class="input-group" id="address-detail">
                                                    <div class="address-first-line">
                                                        <input type="text"
                                                               class="post-address form-control required-field"
                                                               placeholder="우편번호" name="postCode">
                                                        <button type="button" class="btn btn-primary btn-address">주소검색
                                                        </button>
                                                    </div>

                                                    <input type="text" class="basic-address form-control required-field"
                                                           placeholder="기본주소"
                                                           style="border-radius: 5px; margin-top: 5px;"
                                                           name="basicAddress">
                                                    <input type="text" class="detail-address" placeholder="상세주소"
                                                           style="border-radius: 5px; margin-top: 5px;"
                                                           name="detailAddress">

                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group col">
                                            <label class="col-form-label">공연일시</label>
                                            <!--                                        공연일시 시작일, 종료일 -->
                                            <div id="perform-date">
                                                <label for="start-date" class="col-form-label">시작일</label>

                                                <input type="date" id="start-date" class="form-control required-field"
                                                       name="startDate">

                                                <label for="end-date" class="col-form-label">종료일</label>

                                                <input type="date" id="end-date" class="form-control required-field"
                                                       name="endDate">

                                            </div>
                                        </div>
                                        <div class="form-group col">
                                            <label class="col-form-label">공연시간</label>
                                            <div class="show-time">
                                                <div class="total-time">
                                                    <p>총 공연시간 :</p>
                                                    <input type="text"
                                                           class="form-control number required-field thousand-separator"
                                                           name="totalTime">
                                                </div>
                                                <div class="interval-time">
                                                    <p>인터벌 시간 :</p>
                                                    <input type="text"
                                                           class="form-control number required-field thousand-separator"
                                                           name="intervalTime">
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
                                                        <input type="radio" id="reserved-seat" name="reserved"
                                                               class="seat"
                                                               value="true" checked>
                                                    </div>
                                                    <div class="seat-unreserved">
                                                        <label for="unreserved-seat">비지정석</label>
                                                        <input type="radio" id="unreserved-seat" name="reserved"
                                                               class="seat"
                                                               value="false">
                                                    </div>
                                                </div>
                                                <div class="total-seat">
                                                    <p>총 좌석 수 :</p>
                                                    <div class="input-group">
                                                        <input type="text"
                                                               class="form-control number thousand-separator"
                                                               name="totalSeat" readonly>
                                                        <span class="input-group-text signal">석</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group col" id="show-class">
                                            <label class="col-form-label">좌석등급 및 가격</label>
                                            <div class="classify-grade">
                                                <div class="sub-group">
                                                    <div class="check-box">
                                                        <input type="checkbox" id="grade-vip" name="classes" value="1">
                                                        <label for="grade-vip">VIP</label>
                                                    </div>
                                                    <div class="input-group-parent">
                                                        <div class="input-group" style="width: 190px">
                                                            <span class="input-group-text">가격</span>
                                                            <input type="text"
                                                                   class="form-control number thousand-separator"
                                                                   name="price"
                                                                   disabled>
                                                            <span class="input-group-text signal">원</span>
                                                        </div>
                                                        <div class="input-group" style="width: 190px">
                                                            <span class="input-group-text">좌석수</span>
                                                            <input type="text"
                                                                   class="form-control number thousand-separator"
                                                                   name="numberOfSeats" disabled>
                                                            <span class="input-group-text signal">석</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="sub-group">
                                                    <div class="check-box">
                                                        <input type="checkbox" id="grade-r" name="classes" value="2"
                                                               class="r-grade">
                                                        <label for="grade-r">R</label>
                                                    </div>
                                                    <div class="input-group-parent">
                                                        <div class="input-group" style="width: 190px">
                                                            <span class="input-group-text">가격</span>
                                                            <input type="text"
                                                                   class="form-control r-grade number thousand-separator"
                                                                   name="price" disabled>
                                                            <span class="input-group-text signal">원</span>
                                                        </div>
    
                                                        <div class="input-group" style="width: 190px">
                                                            <span class="input-group-text">좌석수</span>
                                                            <input type="text"
                                                                   class="form-control r-grade number thousand-separator"
                                                                   name="numberOfSeats" disabled>
                                                            <span class="input-group-text signal">석</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="sub-group">
                                                    <div class="check-box">
                                                        <input type="checkbox" id="grade-s" name="classes" value="3">
                                                        <label for="grade-s">S</label>
                                                    </div>
                                                    <div class="input-group-parent">
                                                        <div class="input-group" style="width: 190px">
                                                            <span class="input-group-text number">가격</span>
                                                            <input type="text"
                                                                   class="form-control number thousand-separator"
                                                                   name="price"
                                                                   disabled>
                                                            <span class="input-group-text signal">원</span>
                                                        </div>
                                                        <div class="input-group" style="width: 190px">
                                                            <span class="input-group-text">좌석수</span>
                                                            <input type="text" class="form-control thousand-separator"
                                                                   name="numberOfSeats" disabled>
                                                            <span class="input-group-text signal">석</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="sub-group">
                                                    <div class="check-box">
                                                        <input type="checkbox" id="grade-a" name="classes" value="4">
                                                        <label for="grade-a">A</label>
                                                    </div>
                                                    <div class="input-group-parent">
                                                        <div class="input-group" style="width: 190px">
                                                            <span class="input-group-text">가격</span>
                                                            <input type="text"
                                                                   class="form-control number thousand-separator"
                                                                   name="price"
                                                                   disabled>
                                                            <span class="input-group-text signal">원</span>
                                                        </div>
                                                        <div class="input-group" style="width: 190px">
                                                            <span class="input-group-text">좌석수</span>
                                                            <input type="text"
                                                                   class="form-control number thousand-separator"
                                                                   name="numberOfSeats" disabled>
                                                            <span class="input-group-text signal">석</span>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="sub-group">
                                                    <div class="check-box">
                                                        <input type="checkbox" id="grade-b" name="classes" value="5">
                                                        <label for="grade-b">B</label>
                                                    </div>
                                                    <div class="input-group-parent">
                                                        <div class="input-group" style="width: 190px">
                                                            <span class="input-group-text ">가격</span>
                                                            <input type="text"
                                                                   class="form-control number thousand-separator"
                                                                   name="price"
                                                                   disabled>
                                                            <span class="input-group-text signal">원</span>
                                                        </div>
                                                        <div class="input-group" style="width: 190px">
                                                            <span class="input-group-text">좌석수</span>
                                                            <input type="text"
                                                                   class="form-control number thousand-separator"
                                                                   name="numberOfSeats" disabled>
                                                            <span class="input-group-text signal">석</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group col">
                                            <label class="col-form-label">인당 구매가능수</label>
                                            <input type="text" class="form-control number required-field"
                                                   name="ticketsPerPerson">
                                            <!-- 0이하로 안떨어지게 js로 구현-->
                                        </div>
                                        <div class="form-group col" id="discount-input">
                                            <label class="col-form-label">할인정보</label>
                                            <div>
                                                <div id="discount-date">
                                                    <label for="discount-start-date" class="col-form-label" >시작일</label>
                                                    <input type="date" id="startDate" name="startDate" onChange="setendmin(this.value)"
                                                           class="form-control required-field">
                                                    <label for="discount-end-date" class="col-form-label" >종료일</label>
                                                    <input type="date" id="endDate" name="endDate"
                                                           class="form-control required-field">
                                                </div>
                                                <div class="input-group">
                                                    <span class="input-group-text">할인율</span>
                                                    <input type="number" id="rate-input"
                                                           class="form-control p-0 required-field thousand-separator"
                                                           name=discountNum">
                                                    <span class="input-group-text signal">%</span>
                                                    <input type="hidden" id="discount-rate" name="discountRate">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group col musical-images" id="detail-info">
                                            <label class="col-form-label">공연상세정보</label>
                                            <div class="detail-info">
                                                <div class="musicalImage">
                                                    <p>포스터 이미지 :</p>
                                                    <input type="file" class="form-control required-field"
                                                           name="musicalPost" multiple>
                                                </div>
                                                <div class="img-container" id="poster-image"></div>
                                                <div class="musicalDescriptionImage">
                                                    <p>상세설명 이미지 :</p>
                                                    <input type="file" class="form-control required-field"
                                                           name="musicalImages" multiple>
                                                </div>
                                                <div class="img-container" id="description-image"></div>
                                            </div>
                                        </div>
                                        <div class="form-group col actor-menu">
                                            <label class="col-form-label">주요배우</label>
                                            <div class="actor-container">
                                                <input type="text" class="form-control required-field"
                                                       placeholder='배우 이름은 쉼표(",")로 구분해주세요.' name="actors">
                                                <div class="actor-list"></div>
                                                <div class="actor-name"></div>
                                            </div>
                                        </div>
                                        <div class="form-group col">
                                            <label class="col-form-label">주최주관</label>
                                            <input type="text" name="musicalSponsor">
                                        </div>
                                        <div class="form-group col request">
                                            <label class="col-form-label">요청사항</label>
                                            <textarea type="text" name="request"></textarea>
                                        </div>
                                        <input type="hidden" name="partnerId" value="${sessionScope.partnerId}">

                                        <input type="hidden" name="UserId" value="${sessionScope.userId}">
                                    </div>
                                    <!-- 프로그래스 바 추가 -->
                                    <div id="progress-bar" style="display: none; margin-top: 20px;">
                                        <progress id="progress" value="0" max="100" style="width: 100%;"></progress>
                                        <span id="progress-percent">0%</span>
                                    </div>
  															</form>
  															
  															<form action="${pageContext.request.contextPath}/admin/edit">
                                    	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
  															<button class="btn btn-primary me-md-2" type="submit" >수정완료</button> &nbsp; &nbsp;
  																<button class="btn btn-primary me-md-2" type="submit" onclick="deleteok()" >삭제</button>
  																</form>
														</div>
														
    												</div>
									<div class="d-grid gap-2 col-6 mx-auto" style="width: 100px">
  										<button class="btn btn-primary me-md-2" type="reset" onclick = "location.href='${pageContext.request.contextPath}/admin/edit'" >취소</button>
  												</div>
											</div>
  										
 									  </div>
 									 </div>
 									 
 									 
 									 </div>
 									 
 									 </div>
 									 </div>
                                </form>
                                <%-- 프로그래스바 생성 --%>
                                <!-- 보이지 않는 iframe 추가 -->
                                <iframe name="upload_iframe" style="display:none;"></iframe>
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
    <!-- bootstap bundle js -->
    <script src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin_partner/documentation/js/write.js"></script>
   <script>


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
	   
	   
//티켓가격 숫자만 입력 가능
	   function realshowMoney2(inMoney, Ev) {
       var evCode = (window.netscape) ? Ev.which : event.keyCode;

       if (!((evCode >= 37 && evCode <= 57)|| (evCode >= 96 && evCode <= 105)|| evCode == 8 || evCode == 9)) {

             alert("숫자만 입력해주세요. ");
             event.returnValue = false;
       }
       }
	
	   
//삭제컨펌
function deleteok(){
    if(!confirm('삭제하시면 복구할수 없습니다. \n 정말로 삭제하시겠습니까??')){
        return false;
    }
}




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
</script>

</body>

</html>