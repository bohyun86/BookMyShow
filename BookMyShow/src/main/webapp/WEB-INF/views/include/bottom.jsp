<%--
  Created by IntelliJ IDEA.
  User: ITWILL
  Date: 2024-09-02
  Time: 오후 4:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<footer class="container-fluid d-flex justify-content-center" id="extra-info">
    <div class="row d-flex row align-items-center" style="width: 1100px">
        <div class="col-3" id="cs-center">
            <div class="cs fs-5 fw-bold"><a class="text-decoration-none text-black" href="${pageContext.request.contextPath}/support/frequentQuestion">고객센터 ></a></div>
            <div class="cs-phone fs-4 fw-bolder mt-3">1599-1111</div>
            <div class="available-time">월-금 10:00-18:00(주말ㆍ공휴일 휴무)</div>
            <div class="logo">예매하다</div>

        </div>
        <div class="col-3" id="introduction">
            <a href="${pageContext.request.contextPath}/main/about/">회사소개</a>
            <a href="${pageContext.request.contextPath}/main/terms/">이용약관</a>
            <a href="${pageContext.request.contextPath}/main/privacy/">개인정보처리방침</a>
            <a href="${pageContext.request.contextPath}/main/partnership/">제휴문의</a>
            <a href="${pageContext.request.contextPath}/partner/login/">파트너 페이지</a>
        </div>
        <div class="col-6" id="introduction-detail">
            <div class="d-flex col-12 justify-content-between">
                <button class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/support/frequentQuestion'">🤔자주묻는질문</button>
                <button class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/support/inquiry'">📝1:1 문의하기</button>
                <button class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/support/notice'">📮공지사항</button>
            </div>
            <div class="col-12 mt-4">
                <p>(주)예매하다 | 대표이사: 홍길동 | 부산관역시 부산진구 동천로 109, 삼한골든게이트 7층</p>
                <p>사업자등록번호: 111-22-33333</p>
                <p>통신판매업신고: 2024-부산진구-1111</p>
                <p>개인정보관리책임자 : 김철수 (help@itwillbs.com)</p>
                <p>Hosting by I5(주) | Copyright @ BookMyShow All Rights Reserved</p>
            </div>
        </div>
    </div>
</footer>