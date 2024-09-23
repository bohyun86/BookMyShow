<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <!-- jquery 3.3.1 -->
    <script src="${pageContext.request.contextPath}/resources/admin_partner/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
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
                            <h2 class="pageheader-title">문의답장페이지</h2>
                            <div class="m-2 bg-white form-body">
                            
<!--                                 <form enctype="multipart/form-data" class="was-validated"> -->

									<form action="${pageContext.request.contextPath}/admin/qnaAnswerOK"  id="answerForm"  method="post">
									
                                <c:if test="${not empty partnerQna}">
    						<c:forEach var="partnerQna" items="${partnerQna}">
                                    <div class="p-3 mb-2 bg-body-tertiary">
                                        <div class="form-group col">
                                            <label class=" col-form-label">문의제목</label>
                                            <input type="text" readonly="readonly" value="${partnerQna.title}">

                                        </div>

                                       
                                                
                                        <div class="form-group col request">
                                            <label class="col-form-label">문의내용</label>
                                            <textarea type="text" name="request" readonly="readonly"
                                                      >${partnerQna.content}</textarea>
                                                      </div>
                                                      
                                        <div class="form-group col answer">
                                            <label class="col-form-label">답변내용</label>
                                           
                                            <c:choose>
                           					 <c:when test="${partnerQna.answerContent == null}">
                                            <textarea type="text" name="answerContent" placeholder="답변할 내용을 입력해주세요" style="width: 600px;"
                                                      ></textarea>
                                                      </c:when>
                                                      <c:otherwise>
                                                      <textarea type="text" name="answerContent" style="width: 600px;"
                                                      >${partnerQna.answerContent}</textarea>
                                                      
                                                      </c:otherwise>
                                                      </c:choose>
                                                      </div>
                                                      
                                        <input type="hidden" name="inquiryId" value="${partnerQna.inquiryId}">
                                        <input type="hidden" name="answerContent" value="${partnerQnaList.answerContent}">
                                        </div>
                                        </c:forEach>
                                        </c:if>
                                        <div class="form-group col">
                                            <label class="col-form-label"></label>
                                            
                            <div id= "edit-button-group"class="d-grid gap-2 d-md-flex justify-content-md-end">
                                                <button class="btn btn-primary me-md-2" type="button"  onclick="submitForm();">답변등록</button>
                                                <button class="btn btn-primary me-md-2" type="button" onclick="editForm()();">수정</button>
 								 <button class="btn btn-primary me-md-2" type="reset" onclick = "location.href='${pageContext.request.contextPath}/admin/partner_qna'" >돌아가기</button>&nbsp;&nbsp;
							</div>
                                </div>
                                </form>
                                
                                                
                                            </div>
                                        </div>
<%--                                         <input type="hidden" name="UserId" value="${performanceTempDTO.partnerId}"> --%>
<%--                                         <input type="hidden" name="partnerId" value="${performanceTempDTO.partnerId}"> --%>
<%--                                         <input type="hidden" name="venueId" value="${performanceTempDTO.venueId}"> --%>
                                    </div>
                                    <!-- 프로그래스 바 추가 -->
                                    <div id="progress-bar" style="display: none; margin-top: 20px;">
                                        <progress id="progress" value="0" max="100"
                                                  style="width: 100%;"></progress>
                                        <span id="progress-percent">0%</span>
                                    </div>

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
     
     
        function submitForm() {
        	 document.getElementById("answerForm").submit();
            alert("답변이 등록되었습니다.");
            
        }
        
        function editForm() {
            // 사용자에게 확인을 받는 컨펌창
            if (confirm("답변을 수정 하시겠습니까?")) {
                alert("답변이 등록되었습니다.");
                document.getElementById("answerForm").submit();
            } else {
                alert("답변 등록이 취소되었습니다.");
            }
        }
        
        
        
    </script>
    
    
    
    <script>

//         const postAddress = document.querySelector('.post-address');
//         const basicAddress = document.querySelector('.basic-address');
//         const detailAddress = document.querySelector('.detail-address');
//         const btnSearch = document.querySelector('.btn-address');

//         btnSearch.addEventListener('click', function () {
//             searchPost.open();
//         });

//         const searchPost = new daum.Postcode({
//             oncomplete: function (data) {
//                 postAddress.value = data.zonecode;
//                 basicAddress.value = data.address;
//                 detailAddress.focus();
//             }
//         });
    </script>

    <script>
//         document.addEventListener('DOMContentLoaded', function () {
//             const selectedGenreId = "${performanceTempDTO.genreId}"; // 서버에서 넘겨받은 genreId
//             const genreSelect = document.getElementById('genreSelect');

//             if (selectedGenreId && selectedGenreId !== 'null') {
//                 genreSelect.value = selectedGenreId; // 값과 일치하는 option 선택
//             }

//             const selectAgeLimit = "${performanceTempDTO.ageLimit}"; // 서버에서 넘겨받은 ageLimit
//             const ageLimit = document.getElementById('ageLimit');

//             if (selectAgeLimit && selectAgeLimit !== 'null') {
//                 ageLimit.value = selectAgeLimit; // 값과 일치하는 option 선택
//             }

//             const inputActor = document.querySelector('input[name="actors"]');
//             const actorList = document.querySelector('.actor-list');
//             const actorName = document.querySelector('.actor-name');

//             // 초기화: 배우 이름 필드 비우기
//             actorName.innerHTML = '';
//             actorList.innerHTML = '';

//             if (inputActor && inputActor.value.trim() !== '') {
//                 const actors = inputActor.value.split(',');
//                 actors.forEach((actor, index) => {
//                     let intNum = index;
//                     if (actor.trim()) {
//                         const input = document.createElement('input');
//                         input.type = 'hidden';
//                         input.name = 'actorList';
//                         input.value = actor.trim();
//                         actorList.appendChild(input);
//                         // 문자열 연결 방식으로 변경
//                         actorName.innerHTML += '배우' + (index + 1) + ': ' + actor.trim() + ' | ';
//                     }
//                 });
//                 // 마지막 " | " 제거
//                 if (actorName.innerHTML.endsWith(' | ')) {
//                     actorName.innerHTML = actorName.innerHTML.slice(0, -3);
//                 }
//             }

            // discountRate * 100, 소숫점 제거(정수로 반올림)
//             const discountRate = document.querySelector('#rate-input');
//             discountRate.value = Math.round(parseFloat(${performanceTempDTO.discountRate}) * 100);
//         });
    </script>

    <script>
//         document.addEventListener('DOMContentLoaded', function () {
//             const selectedTicketClass = "${performanceTempDTO.classes}".split(",").map((item) => {
//                 return item.trim();
//             });
//             const selectedTicketPrice = "${performanceTempDTO.price}".split(",").map((item) => {
//                 return item.trim();
//             });
//             const selectedTicketNumberOfSeats = "${performanceTempDTO.numberOfSeats}".split(",").map((item) => {
//                 return item.trim();
//             });


//             const ticketPrice = document.getElementsByName('price');
//             const ticketNumberOfSeats = document.getElementsByName('numberOfSeats');
//             const ticketClass = document.getElementsByName('classes');

//             ticketClass.forEach((item, index) => {
//                 if (selectedTicketClass.includes(item.value)) {
//                     item.checked = true;
//                     ticketPrice[index].disabled = false;
//                     ticketPrice[index].value = selectedTicketPrice[selectedTicketClass.indexOf(item.value)];
//                     ticketNumberOfSeats[index].disabled = false;
//                     ticketNumberOfSeats[index].value = selectedTicketNumberOfSeats[selectedTicketClass.indexOf(item.value)];
//                     // 천단위 구분기호 넣기
//                     ticketPrice[index].value = ticketPrice[index].value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
//                     ticketNumberOfSeats[index].value = ticketNumberOfSeats[index].value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
//                 }
//             });
//         });
    </script>

    <script>
//         document.addEventListener('DOMContentLoaded', function () {
//             const deleteBtn = document.querySelector('.delete-btn');
//             deleteBtn.addEventListener('click', function (event) {
//                 event.preventDefault(); // submit 동작 차단
//                 if (confirm('정말 삭제하시겠습니까?')) {
//                     location.href = '${pageContext.request.contextPath}/admin/deletePro?musicalId=${performanceTempDTO.musicalId}';
//                 }
//             });

//             const approveBtn = document.querySelector('.approve-btn');
//             approveBtn.addEventListener('click', function (event) {
//                 event.preventDefault(); // submit 동작 차단
//                 if (confirm('정말 승인하시겠습니까?')) {
//                     location.href = '${pageContext.request.contextPath}/admin/approvePro?musicalId=${performanceTempDTO.musicalId}';
//                 }
//             });

//             const reviseBtn = document.querySelector('.revise-btn');
//             reviseBtn.addEventListener('click', function () {
//                 const progress = document.getElementById('progress');
//                 const progressBar = document.getElementById('progress-bar');
//                 const progressPercent = document.getElementById('progress-percent');
//                 progressBar.style.display = 'block';

//                 // submit 이벤트를 reviseBtn 클릭 시에만 추가
//                 const form = document.querySelector('form');
//                 form.addEventListener('submit', function handleSubmit(e) {
//                     e.preventDefault();
//                     const formData = new FormData(form);
//                     const xhr = new XMLHttpRequest();
//                     xhr.open('POST', '${pageContext.request.contextPath}/admin/writePro', true);
//                     xhr.upload.onprogress = function (e) {
//                         if (e.lengthComputable) {
//                             const percent = (e.loaded / e.total) * 100;
//                             progress.value = percent;
//                             progressPercent.innerText = percent + '%';
//                         }
//                     };
//                     xhr.onload = function () {
//                         if (xhr.status === 200) {
//                             alert('수정이 완료되었습니다.');
//                             location.href = '${pageContext.request.contextPath}/admin/editPro?musicalId=${performanceTempDTO.musicalId}';
//                         } else {
//                             alert('수정에 실패하였습니다.');
//                             location.href = '${pageContext.request.contextPath}/admin/editPro?musicalId=${performanceTempDTO.musicalId}';
//                         }
//                     };
//                     xhr.send(formData);

//                     // 한 번 실행 후에 해당 이벤트 리스너를 제거하여 중복 등록을 방지
//                     form.removeEventListener('submit', handleSubmit);
//                 }, { once: true }); // 한 번만 실행되도록 설정
//             });
//         });
    </script>


</body>


</html>