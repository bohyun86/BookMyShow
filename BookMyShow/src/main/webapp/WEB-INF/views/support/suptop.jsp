<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="w-100 bg-white sticky-top border-bottom">
    <div class="d-flex row p-0" id="sticky">
        <ul class="nav justify-content-end pt-3" id="top-nav">
            <li class="nav-item" >
                <a class="nav-link text-black active" href="${pageContext.request.contextPath}/login/">로그인</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-black" href="#">회원가입</a>
            </li>
            <li class="nav-item">
<<<<<<< HEAD
                <a class="nav-link text-black" id="cs-dropdown" href="${pageContext.request.contextPath}/support/frequentQuestion">고객센터</a>
=======
                <a class="nav-link text-black" id="cs-dropdown" href="${pageContext.request.contextPath}/support/faq">고객센터</a>
>>>>>>> refs/heads/develop
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
            <li class="nav-item"><a class="navbar-brand ms-3 fs-4 fst-italic" href="${pageContext.request.contextPath}/main/">예매하다</a></li>
            <li class="nav-item ms-5">
                <form class="d-flex border border-2 border-gray rounded-5 px-2">
                    <input class="bg-transparent text-gray border-0" aria-label="Search">
                    <i class="bi bi-search fs-5 p-2"></i>
                </form>
            </li>
        </ul>