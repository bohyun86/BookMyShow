
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원가입 작성-예매하다</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/resources/css/new-user.css" rel="stylesheet">
</head>
<body class="bg-opacity-50">
<div class="w-100 min-vh-100 d-flex justify-content-center align-items-center bg-white">
    <form class="p-5" id="join-form" action="${pageContext.request.contextPath}/user/joinPro/" method="post">
        <h2 class="pb-3 text-center mt-5"><a class="site-logo" href="${pageContext.request.contextPath}/main/main">예매하다</a></h2>
        <div class="form-group pb-2 d-flex row align-items-stretch justify-content-center">
            <div class="input-group  px-0" id="id-input">
                <div class="input-group-prepend">
                    <span class="input-group-text border-0 bg-white">
                        <i class="bi bi-person"></i>
                    </span>
                </div>
                <input type="text" class="form-control border-0" name="userName" placeholder="아이디" autofocus>
            </div>
            <div class="input-alert-id input-alert"></div>
            <div class="input-group  px-0" id="pass-input">
                <div class="input-group-prepend">
                    <span class="input-group-text border-0 bg-white">
                        <i class="bi bi-lock"></i>
                    </span>
                </div>
                <input type="password" class="form-control border-0" name="password" placeholder="비밀번호">
            </div>
            <div class="input-alert-pass input-alert"></div>
            <div class="input-group  px-0" id="repass-input">
                <div class="input-group-prepend">
                    <span class="input-group-text border-0 bg-white">
                        <i class="bi bi-lock-fill"></i>
                    </span>
                </div>
                <input type="password" class="form-control border-0" name="password2" placeholder="비밀번호 확인">
            </div>
            <div class="input-alert-pass2 input-alert"></div>
            <div class="input-group  px-0" id="email-input">
                <div class="input-group-prepend">
                    <span class="input-group-text border-0 bg-white">
               <i class="bi bi-envelope"></i>
                    </span>
                </div>
                <input type="email" class="form-control border-0" name="email" placeholder="이메일">
            </div>
            <div class="input-alert-email input-alert"></div>
            <div class="input-group  px-0" id="name-input">
                <div class="input-group-prepend">
                    <span class="input-group-text border-0 bg-white">
                        <i class="bi bi-emoji-smile"></i>
                    </span>
                </div>
                <input type="text" class="form-control border-0" name="name" placeholder="이름">
            </div>
            <div class="input-alert-name input-alert"></div>
            <div class="input-group px-0" id="phone-input">
                <div class="input-group-prepend">
                    <span class="input-group-text border-0 bg-white">
                        <i class="bi bi-phone"></i>
                    </span>
                </div>
                <input type="text" class="form-control border-0" name="phoneNumber" placeholder="휴대폰번호">
            </div>
            <div class="input-alert-phone input-alert"></div>
            <div class="section-title mt-5">이용약관 동의</div>
            <div class="check-group">
                <div class="form-check form-switch my-1 px-0">
                    <input class="check-input" type="checkbox" id="agree-check">
                    <label class="form-check-label" for="agree-check">전체동의</label>
                </div>
                <div class="form-check form-switch my-1 px-0">
                    <input class="check-input sub-check" type="checkbox" id="age-check">
                    <label class="form-check-label" for="age-check">만 14세 이상입니다 <span>(필수)</span></label>
                </div>
                <div class="form-check form-switch my-1 px-0">
                    <div class="small-group">
                        <input class="check-input sub-check" type="checkbox" id="terms-check">
                        <label class="form-check-label" for="terms-check">이용약관 동의 <span>(필수)</span></label>
                    </div>
                    <div class="check-detail">
                        <a href="${pageContext.request.contextPath}/main/terms/">내용보기</a>
                    </div>
                </div>
                <div class="form-check form-switch my-1 px-0">
                    <div class="small-group">
                        <input class="check-input sub-check" type="checkbox" id="privacy-check">
                        <label class="form-check-label" for="privacy-check">개인정보 수집 이용 동의 <span>(필수)</span></label>
                    </div>
                    <div class="check-detail">
                        <a href="${pageContext.request.contextPath}/main/privacy/">내용보기</a>
                    </div>
                </div>
            </div>
            <input type="hidden" name="userRole" value="member">
            <button type="submit" class="btn btn-primary fw-bolder my-2 mt-4" id="join-button">가입완료</button>
        </div>
    </form>
</div>
<script src="${pageContext.request.contextPath}/resources/js/new-user.js"></script>
</body>
</html>