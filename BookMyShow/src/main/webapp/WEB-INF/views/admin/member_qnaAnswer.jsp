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
                            <h2 class="pageheader-title">문의답변페이지</h2>
                            <div class="m-2 bg-white form-body">
                            
<!--                                 <form enctype="multipart/form-data" class="was-validated"> -->

									<form action="${pageContext.request.contextPath}/admin/memberqnaAnswerOK"  id="answerForm"  method="post">
									
                                <c:if test="${not empty memberQna}">
    						<c:forEach var="memberQna" items="${memberQna}">
                                    <div class="p-3 mb-2 bg-body-tertiary">
                                        <div class="form-group col">
                                            <label class=" col-form-label">문의제목</label>
                                            <input type="text" readonly="readonly" value="${memberQna.title}">

                                        </div>

                                       
                                                
                                        <div class="form-group col request">
                                            <label class="col-form-label">문의내용</label>
                                            <textarea type="text" name="request" readonly="readonly"
                                                      >${memberQna.content}</textarea>
                                                      </div>
                                                      
                                        <div class="form-group col answer">
                                            <label class="col-form-label">답변내용</label>
                                           
                                            <c:choose>
                           					 <c:when test="${memberQna.answer_content == null}">
                                            <textarea type="text" name="answerContent" placeholder="답변할 내용을 입력해주세요" style="width: 600px;"
                                                      ></textarea>
                                                      </c:when>
                                                      <c:otherwise>
                                                      <textarea type="text" name="answerContent" style="width: 600px;"
                                                      >${memberQna.answer_content}</textarea>
                                                      
                                                      </c:otherwise>
                                                      </c:choose>
                                                      </div>
                                                      
                                        <input type="hidden" name="inquiryId" value="${memberQna.inquiry_id}">
                                        <input type="hidden" name="answerContent" value="${memberQnaList.answer_content}">
                                        </div>
                                        </c:forEach>
                                        </c:if>
                                        <div class="form-group col">
                                            <label class="col-form-label"></label>
                                            
                            <div id= "edit-button-group"class="d-grid gap-2 d-md-flex justify-content-md-end">
                                                <button class="btn btn-primary me-md-2" type="button"  onclick="submitForm();">답변등록</button>
                                                <button class="btn btn-primary me-md-2" type="button" onclick="editForm()();">수정</button>
							</div> 								 <button class="btn btn-primary me-md-2" type="reset" onclick = "location.href='${pageContext.request.contextPath}/admin/memberQna_qna'" >돌아가기</button>&nbsp;&nbsp;

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
    
    
    
  


</body>


</html>