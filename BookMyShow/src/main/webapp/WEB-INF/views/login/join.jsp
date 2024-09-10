<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원가입-예매하다</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">
</head>
<body class="bg-opacity-50">
<div class="w-100 min-vh-100 d-flex justify-content-center align-items-center bg-white">
    <div class="p-5 shadow" id="login-form">
        <h2 class="pb-3 text-center mt-5 mb-3 site-logo"><a href="${pageContext.request.contextPath}/main/">예매하다</a></h2>
        <div class="form-group pb-2 d-flex row align-items-stretch">

<%--            button onclick시 ${pageContext.request.contextPath}/login/newUser 로 이동 --%>
            <button class="btn btn-primary w-100 fw-bolder my-2" id="login-button" onclick="location.href='${pageContext.request.contextPath}/login/newUser'">예매하다 회원가입</button>
        </div>


        <div class="text-center" id="simple-login">
            <small class="fs-6 fw-bolder">간편 회원가입</small>
        </div>

        <div class="text-center" id="simple-login-img">
            <button type="submit" class="btn btn-outline-none py-3">
                <img src="${pageContext.request.contextPath}/resources/images/login/circle_naver.png" alt="naver" class="icon">
            </button>
            <button type="submit" class="btn btn-outline-none py-3">
                <img src="${pageContext.request.contextPath}/resources/images/login/circle_kakao.png" alt="kakao" class="icon">
            </button>
        </div>

        <div class="text-center mt-5" id="login-problem">
            <a href="#" class="fs-6 fw-bolder">※ 회원가입/로그인에 문제가 있어요!></a>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>