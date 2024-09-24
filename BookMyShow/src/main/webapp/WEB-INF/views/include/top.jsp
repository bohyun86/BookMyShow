<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="w-100 bg-white sticky-top border-bottom">
    <div class="d-flex row p-0" id="sticky">
        <ul class="nav justify-content-end pt-3" id="top-nav">
            <c:if test="${sessionScope.userId == null}">
                <li class="nav-item">
                    <a class="nav-link text-black active" href="${pageContext.request.contextPath}/login/">로그인</a>
                </li>
            </c:if>
            <c:if test="${sessionScope.userId != null}">
                <li class="nav-item">
                    <a class="nav-link text-black active" href="${pageContext.request.contextPath}/login/logout/">로그아웃</a>
                </li>
            </c:if>
            <c:if test="${sessionScope.userRole == 'admin'}">
                <li class="nav-item">
<<<<<<< HEAD
                    <a class="nav-link text-black" href="${pageContext.request.contextPath}/admin/">관리자 페이지</a>
=======
                    <a class="nav-link text-black" href="${pageContext.request.contextPath}/admin/main">관리자 페이지</a>
>>>>>>> refs/heads/develop
                </li>
            </c:if>
            <c:if test="${sessionScope.userRole == 'member'}">
                <li class="nav-item">
                    <a class="nav-link text-black" href="${pageContext.request.contextPath}/mypage/">마이페이지</a>
                </li>
            </c:if>
            <c:if test="${sessionScope.userRole == null}">
                <li class="nav-item">
                    <a class="nav-link text-black" href="${pageContext.request.contextPath}/login/join">회원가입</a>
                </li>
            </c:if>
            <li class="nav-item">
                <a class="nav-link text-black" id="cs-dropdown" href="${pageContext.request.contextPath}/support/frequentQuestion">고객센터</a>
                <!-- Dropdown menu -->
                <div class="dropdown-menu shadow border-0 " id="cs-dropdown-menu">
                    <div class="h-100 d-flex row justify-content-between align-items-center">
                        <div class="w-100"><a class="text-decoration-none text-dark" href="${pageContext.request.contextPath}/support/notice">공지사항</a></div>
                        <div><a class="text-decoration-none text-dark" href="${pageContext.request.contextPath}/support/frequentQuestion">FAQ</a></div>
                        <div><a class="text-decoration-none text-dark" href="${pageContext.request.contextPath}/support/inquiry">1:1문의</a></div>
                    </div>
                </div>
            </li>
        </ul>
        <ul class="nav justify-content-start align-items-center">
            <li class="nav-item"><a class="site-logo ms-3" href="${pageContext.request.contextPath}/main/main">예매하다</a></li>
            <li class="nav-item ms-5">
                <form class="d-flex border border-2 border-gray rounded-5 px-2">
                    <input class="bg-transparent text-gray border-0" aria-label="Search">
                    <i class="bi bi-search fs-5 p-2"></i>
                </form>
            </li>
        </ul>
        <ul class="nav justify-content-between px-3 mt-3">
            <li class="nav-item col-6">
<!--             	뮤지컬 버튼 클릭으로 페이지 연결 -->
                <a class="nav-link text-black fw-bold fs-6 px-0" href="${pageContext.request.contextPath}/musical/page_main" id="musical_page">뮤지컬</a>

            </li>
            <li class="nav-item d-flex border-start ps-3">

                <a class="nav-link text-black fw-bold fs-6" href="${pageContext.request.contextPath}/main/time_sale">타임세일</a>
                <a class="nav-link text-black fw-bold fs-6" href="${pageContext.request.contextPath}/main/event">이벤트</a>

            </li>
        </ul>
    </div>
</header>