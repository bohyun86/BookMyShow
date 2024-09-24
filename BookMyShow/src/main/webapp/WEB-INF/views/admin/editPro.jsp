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
    <title>공연 승인, 수정 - 예매하다</title>
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
                            <h2 class="pageheader-title">뮤지컬 수정</h2>
                            <div class="m-2 bg-white form-body">
                                <form enctype="multipart/form-data" class="was-validated">
                                    <div class="p-3 mb-2 bg-body-tertiary">
                                        <div class="form-group col">
                                            <label class=" col-form-label">공연명</label>
                                            <input type="text" class="form-control required-field"
                                                   placeholder="상품명을 입력해주세요." name="title"
                                                   value="${performanceTempDTO.title}">

                                        </div>

                                        <div class="form-group col">
                                            <label class="col-form-label">장르</label>
                                            <select class="form-select" opt-value="${performanceTempDTO.genreId}"
                                                    name="genreId"
                                                    aria-label="Default select example" id="genreSelect">
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
                                                    aria-label="Default select example" id="ageLimit">
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
                                                       autocomplete="off" value="${performanceTempDTO.venueTitle}">
                                                <ul id="results" style="width: 500px"></ul>
                                                <div class="region">
                                                    <div class="input-group" style="width: 160px">
                                                        <span class="input-group-text">지역명</span>
                                                        <input type="text" class="region-name" name="regionName"
                                                               style="width: 100px"
                                                               value="${performanceTempDTO.regionName}">
                                                    </div>
                                                    <p class="region-p">※ 공연장이 대학로인 경우 "대학로"라고 직접 기입해주세요.</p>
                                                </div>

                                                <input type="hidden" class="theater-id" name="publicVenueId"
                                                       value="${performanceTempDTO.publicVenueId}">

                                                <div class="input-group" id="address-detail">
                                                    <div class="address-first-line">
                                                        <input type="text"
                                                               class="post-address form-control required-field"
                                                               placeholder="우편번호" name="postCode"
                                                               value="${performanceTempDTO.postCode}">
                                                        <button type="button" class="btn btn-primary btn-address">주소검색
                                                        </button>
                                                    </div>

                                                    <input type="text" class="basic-address form-control required-field"
                                                           placeholder="기본주소"
                                                           style="border-radius: 5px; margin-top: 5px;"
                                                           name="basicAddress"
                                                           value="${performanceTempDTO.basicAddress}">
                                                    <input type="text" class="detail-address" placeholder="상세주소"
                                                           style="border-radius: 5px; margin-top: 5px;"
                                                           name="detailAddress"
                                                           value="${performanceTempDTO.detailAddress}">

                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group col">
                                            <label class="col-form-label">공연일시</label>
                                            <!--                                        공연일시 시작일, 종료일 -->
                                            <div id="perform-date">
                                                <label for="start-date" class="col-form-label">시작일</label>

                                                <input type="date" id="start-date" class="form-control required-field"
                                                       name="startDate" value="${performanceTempDTO.startDate}">

                                                <label for="end-date" class="col-form-label">종료일</label>

                                                <input type="date" id="end-date" class="form-control required-field"
                                                       name="endDate" value="${performanceTempDTO.endDate}">

                                            </div>
                                        </div>
                                        <div class="form-group col">
                                            <label class="col-form-label">공연시간</label>
                                            <div class="show-time">
                                                <div class="total-time">
                                                    <p>총 공연시간 :</p>
                                                    <input type="text"
                                                           class="form-control number required-field thousand-separator"
                                                           name="totalTime" value="${performanceTempDTO.totalTime}">
                                                </div>
                                                <div class="interval-time">
                                                    <p>인터벌 시간 :</p>
                                                    <input type="text"
                                                           class="form-control number required-field thousand-separator"
                                                           name="intervalTime"
                                                           value="${performanceTempDTO.intervalTime}">
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
                                                               class="seat" value="true"
                                                        <c:if test="${performanceTempDTO.reserved}">
                                                               checked
                                                        </c:if>>
                                                    </div>

                                                    <div class="seat-unreserved">
                                                        <label for="unreserved-seat">비지정석</label>
                                                        <input type="radio" id="unreserved-seat" name="reserved"
                                                               class="seat" value="false"
                                                        <c:if test="${!performanceTempDTO.reserved}">
                                                               checked
                                                        </c:if>>
                                                    </div>
                                                </div>
                                                <div class="total-seat">
                                                    <p>총 좌석 수 :</p>
                                                    <div class="input-group">
                                                        <input type="text"
                                                               class="form-control number thousand-separator"
                                                               name="totalSeat" value="${performanceTempDTO.totalSeat}"
                                                               readonly>
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
                                                   name="ticketsPerPerson"
                                                   value="${performanceTempDTO.ticketsPerPerson}">
                                            <!-- 0이하로 안떨어지게 js로 구현-->
                                        </div>
                                        <div class="form-group col" id="discount-input">
                                            <label class="col-form-label">할인정보</label>
                                            <div>
                                                <div id="discount-date">
                                                    <label for="discount-start-date" class="col-form-label">시작일</label>
                                                    <input type="date" id="discount-start-date" name="discountStartDate"
                                                           class="form-control required-field"
                                                           value="${performanceTempDTO.discountStartDate}">
                                                    <label for="discount-end-date" class="col-form-label">종료일</label>
                                                    <input type="date" id="discount-end-date" name="discountEndDate"
                                                           class="form-control required-field"
                                                           value="${performanceTempDTO.discountEndDate}">
                                                </div>
                                                <div class=" input-group">
                                                    <span class="input-group-text">할인율</span>
                                                    <input type="number" id="rate-input"
                                                           class="form-control p-0 required-field thousand-separator"
                                                           name=discountNum"
                                                           value="${performanceTempDTO.discountRate * 100}">
                                                    <span class="input-group-text signal">%</span>
                                                    <input type="hidden" id="discount-rate" name="discountRate"
                                                           value="${performanceTempDTO.discountRate}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" form-group col musical-images" id="detail-info">
                                            <label class="col-form-label">공연상세정보</label>
                                            <div class="detail-info">
                                                <div class="musicalImage">
                                                    <p>포스터 이미지 :</p>
                                                    <input type="file" class="form-control"
                                                           name="musicalPost" multiple>
                                                </div>
                                                <div class="img-container" id="poster-image">
                                                    <c:forEach var="image" items="${attachFileDTO}">
                                                        <c:if test="${image.uuid eq 'poster'}">
                                                            <div class="img-thumbnail">
                                                                <p>${image.fileName}</p>
                                                                <img src="${pageContext.request.contextPath}/${image.filePath}"
                                                                     style="width: 90px; height: 90px; margin: 5px;"
                                                                     alt=""/>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                                <div class="musicalDescriptionImage">
                                                    <p>상세설명 이미지 :</p>
                                                    <input type="file" class="form-control"
                                                           name="musicalImages" multiple>
                                                </div>
                                                <div class="img-container" id="description-image">
                                                    <c:forEach var="image" items="${attachFileDTO}">
                                                        <c:if test="${image.uuid eq 'description'}">
                                                            <div class="img-thumbnail">
                                                                <p>${image.fileName}</p>
                                                                <img src="${pageContext.request.contextPath}/${image.filePath}"
                                                                     style="width: 90px; height: 90px; margin: 5px;"
                                                                     alt=""/>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group col actor-menu">
                                            <label class="col-form-label">주요배우</label>
                                            <div class="actor-container">
                                                <input type="text" class="form-control required-field"
                                                       placeholder='배우 이름은 쉼표(",")로 구분해주세요.' name="actors"
                                                       value="${performanceTempDTO.actorList}">
                                                <div class="actor-list"></div>
                                                <div class="actor-name"></div>
                                            </div>
                                        </div>
                                        <div class="form-group col">
                                            <label class="col-form-label">주최주관</label>
                                            <input type="text" name="musicalSponsor"
                                                   value="${performanceTempDTO.musicalSponsor}">
                                        </div>
                                        <div class="form-group col request">
                                            <label class="col-form-label">요청사항</label>
                                            <textarea type="text" name="request"
                                                      value="${performanceTempDTO.request}"></textarea>
                                        </div>
                                        <div class="form-group col">
                                            <label class="col-form-label"></label>
                                            <div id="edit-button-group">
                                                <c:choose>
                                                    <c:when test="${!approval}">
                                                        <button class="btn btn-primary revise-btn"
                                                                Style="color: white">수정
                                                        </button>
                                                    </c:when>
                                                </c:choose>
                                                <button class="btn btn-primary delete-btn"
                                                        Style="color: white">삭제
                                                </button>
                                                <button class="btn btn-primary approve-btn"
                                                        Style="color: white">승인
                                                </button>
                                            </div>
                                        </div>
                                        <input type="hidden" name="UserId" value="${performanceTempDTO.partnerId}">
                                        <input type="hidden" name="partnerId" value="${performanceTempDTO.partnerId}">
                                        <input type="hidden" name="musicalId" value="${performanceTempDTO.musicalId}">
                                        <input type="hidden" name="venueId" value="${performanceTempDTO.venueId}">
                                    </div>
                                    <!-- 프로그래스 바 추가 -->
                                    <div id="progress-bar" style="display: none; margin-top: 20px;">
                                        <progress id="progress" value="0" max="100"
                                                  style="width: 100%;"></progress>
                                        <span id="progress-percent">0%</span>
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
    </script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const selectedGenreId = "${performanceTempDTO.genreId}"; // 서버에서 넘겨받은 genreId
            const genreSelect = document.getElementById('genreSelect');

            if (selectedGenreId && selectedGenreId !== 'null') {
                genreSelect.value = selectedGenreId; // 값과 일치하는 option 선택
            }

            const selectAgeLimit = "${performanceTempDTO.ageLimit}"; // 서버에서 넘겨받은 ageLimit
            const ageLimit = document.getElementById('ageLimit');

            if (selectAgeLimit && selectAgeLimit !== 'null') {
                ageLimit.value = selectAgeLimit; // 값과 일치하는 option 선택
            }

            const inputActor = document.querySelector('input[name="actors"]');
            const actorList = document.querySelector('.actor-list');
            const actorName = document.querySelector('.actor-name');

            // 초기화: 배우 이름 필드 비우기
            actorName.innerHTML = '';
            actorList.innerHTML = '';

            if (inputActor && inputActor.value.trim() !== '') {
                const actors = inputActor.value.split(',');
                actors.forEach((actor, index) => {
                    let intNum = index;
                    if (actor.trim()) {
                        const input = document.createElement('input');
                        input.type = 'hidden';
                        input.name = 'actorList';
                        input.value = actor.trim();
                        actorList.appendChild(input);
                        // 문자열 연결 방식으로 변경
                        actorName.innerHTML += '배우' + (index + 1) + ': ' + actor.trim() + ' | ';
                    }
                });
                // 마지막 " | " 제거
                if (actorName.innerHTML.endsWith(' | ')) {
                    actorName.innerHTML = actorName.innerHTML.slice(0, -3);
                }
            }

            // discountRate * 100, 소숫점 제거(정수로 반올림)
            const discountRate = document.querySelector('#rate-input');
            discountRate.value = Math.round(parseFloat(${performanceTempDTO.discountRate}) * 100);
        });
    </script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const selectedTicketClass = "${performanceTempDTO.classes}".split(",").map((item) => {
                return item.trim();
            });
            const selectedTicketPrice = "${performanceTempDTO.price}".split(",").map((item) => {
                return item.trim();
            });
            const selectedTicketNumberOfSeats = "${performanceTempDTO.numberOfSeats}".split(",").map((item) => {
                return item.trim();
            });


            const ticketPrice = document.getElementsByName('price');
            const ticketNumberOfSeats = document.getElementsByName('numberOfSeats');
            const ticketClass = document.getElementsByName('classes');

            ticketClass.forEach((item, index) => {
                if (selectedTicketClass.includes(item.value)) {
                    item.checked = true;
                    ticketPrice[index].disabled = false;
                    ticketPrice[index].value = selectedTicketPrice[selectedTicketClass.indexOf(item.value)];
                    ticketNumberOfSeats[index].disabled = false;
                    ticketNumberOfSeats[index].value = selectedTicketNumberOfSeats[selectedTicketClass.indexOf(item.value)];
                    // 천단위 구분기호 넣기
                    ticketPrice[index].value = ticketPrice[index].value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
                    ticketNumberOfSeats[index].value = ticketNumberOfSeats[index].value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
                }
            });
        });
    </script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const deleteBtn = document.querySelector('.delete-btn');
            deleteBtn.addEventListener('click', function (event) {
                event.preventDefault(); // submit 동작 차단
                if (confirm('정말 삭제하시겠습니까?')) {
                    location.href = '${pageContext.request.contextPath}/admin/deletePro?musicalId=${performanceTempDTO.musicalId}';
                }
            });

            const approveBtn = document.querySelector('.approve-btn');
            approveBtn.addEventListener('click', function (event) {
                event.preventDefault(); // submit 동작 차단
                if (confirm('정말 승인하시겠습니까?')) {
                    location.href = '${pageContext.request.contextPath}/admin/approvePro?musicalId=${performanceTempDTO.musicalId}';
                }
            });

            const reviseBtn = document.querySelector('.revise-btn');
            reviseBtn.addEventListener('click', function () {
                const progress = document.getElementById('progress');
                const progressBar = document.getElementById('progress-bar');
                const progressPercent = document.getElementById('progress-percent');
                progressBar.style.display = 'block';

                // submit 이벤트를 reviseBtn 클릭 시에만 추가
                const form = document.querySelector('form');
                form.addEventListener('submit', function handleSubmit(e) {
                    e.preventDefault();
                    const formData = new FormData(form);
                    const xhr = new XMLHttpRequest();
                    xhr.open('POST', '${pageContext.request.contextPath}/admin/writePro', true);
                    xhr.upload.onprogress = function (e) {
                        if (e.lengthComputable) {
                            const percent = (e.loaded / e.total) * 100;
                            progress.value = percent;
                            progressPercent.innerText = percent + '%';
                        }
                    };
                    xhr.onload = function () {
                        if (xhr.status === 200) {
                            alert('수정이 완료되었습니다.');
                            location.href = '${pageContext.request.contextPath}/admin/editPro?musicalId=${performanceTempDTO.musicalId}';
                        } else {
                            alert('수정에 실패하였습니다.');
                            location.href = '${pageContext.request.contextPath}/admin/editPro?musicalId=${performanceTempDTO.musicalId}';
                        }
                    };
                    xhr.send(formData);

                    // 한 번 실행 후에 해당 이벤트 리스너를 제거하여 중복 등록을 방지
                    form.removeEventListener('submit', handleSubmit);
                }, {once: true}); // 한 번만 실행되도록 설정
            });
        });
    </script>


</body>


>>>>>>> refs/heads/develop
</html>