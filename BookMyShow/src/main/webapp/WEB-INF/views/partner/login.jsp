
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/resources/admin_partner/documentation/css/login.css" rel="stylesheet">
</head>


<body class="bg-opacity-50">


<c:if test="${sessionScope.userRole == 'partner'}">
    <script>
        location.href = "${pageContext.request.contextPath}/partner/main";
    </script>
</c:if>
<div class="w-100 min-vh-100 d-flex justify-content-center align-items-center bg-white">
    <form class="p-5 shadow" id="login-form" method="post" action="${pageContext.request.contextPath}/partner/loginPro">
        <h2 class="pb-3 text-center mt-5 mb-3">파트너 로그인</h2>
        <div class="form-group pb-2 d-flex row align-items-stretch">
            <div class="input-group my-2 px-0" id="id-input">
                <div class="input-group-prepend">
                    <span class="input-group-text border-0 bg-white">
                        <i class="bi bi-person"></i>
                    </span>
                </div>
                <input type="text" name="userName" class="form-control border-0" placeholder="아이디">
            </div>
            <div class="input-group my-2 px-0" id="pass-input">
                <div class="input-group-prepend">
                    <span class="input-group-text border-0 bg-white">
                        <i class="bi bi-lock"></i>
                    </span>
                </div>
                <input type="password" name="password" class="form-control border-0" placeholder="비밀번호">
            </div>
            <button type="submit" class="btn btn-primary w-100 fw-bolder my-2" id="login-button">로그인</button>
        </div>
        <div id="login-submenu" class="sub-info">
            <p>* 파트너 계정 생성 및 ID/PW 찾기는</p>
            <p>메일(cs@itwillbs.com)로 문의해주세요</p>
        </div>
    </form>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</html>
