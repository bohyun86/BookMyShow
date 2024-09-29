<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>로그인-예매하다</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">
</head>
<body class="bg-opacity-50">
<div class="w-100 min-vh-100 d-flex justify-content-center align-items-center bg-white">
    <form class="p-5 shadow" id="login-form" onsubmit="return false">
        <h2 class="pb-3 text-center mt-5 mb-3"><a href="${pageContext.request.contextPath}/main/main">예매하다</a></h2>
        <div class="form-group pb-2 d-flex row align-items-stretch">
            <div class="input-group my-2 px-0" id="id-input">
                <div class="input-group-prepend">
                    <span class="input-group-text border-0 bg-white">
                        <i class="bi bi-person"></i>
                    </span>
                </div>
                <input type="text" class="form-control border-0" placeholder="아이디" name="userName"
                       autocomplete="current-password">
            </div>
            <div class="input-group my-2 px-0" id="pass-input">
                <div class="input-group-prepend">
                    <span class="input-group-text border-0 bg-white">
                        <i class="bi bi-lock"></i>
                    </span>
                </div>
                <input type="password" class="form-control border-0" placeholder="비밀번호" name="password"
                       autocomplete="current-password">
            </div>
            <button class="btn btn-primary w-100 fw-bolder my-2" id="login-button">로그인</button>
        </div>

        <div id="login-submenu" class="d-flex justify-content-center">
            <a href="${pageContext.request.contextPath}/login/findidpw" class="text-decoration-none">아이디 찾기</a>
            <a href="${pageContext.request.contextPath}/login/findidpw" class="text-decoration-none">비밀번호 찾기</a>
            <a href="${pageContext.request.contextPath}/login/join" class="text-decoration-none">회원가입</a>
        </div>


        <div class="text-center" id="simple-login">
            <small class="fs-6 fw-bolder">간편 로그인</small>
        </div>

        <div class="text-center" id="simple-login-img">
            <button type="submit" class="btn btn-outline-none py-3" id="simple-login-btn-naver">
                <img src="${pageContext.request.contextPath}/resources/images/login/circle_naver.png" alt="naver"
                     class="icon">
            </button>
            <button type="submit" class="btn btn-outline-none py-3" id="simple-login-btn-kakao">
                <img src="${pageContext.request.contextPath}/resources/images/login/circle_kakao.png" alt="kakao"
                     class="icon">
            </button>
        </div>

        <div class="text-center mt-5" id="login-problem">
            <a href="${pageContext.request.contextPath}/support/qnacontent?faq_id=1" class="fs-6 fw-bolder">※ 회원가입/로그인에 문제가 있어요!></a>
        </div>
        <input type='hidden' name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</div>
<script>
    document.addEventListener("DOMContentLoaded", () => {
        document.querySelector("#login-button").addEventListener("click", login);
    });

    function login() {
        const username = document.querySelector("input[name='userName']").value;
        const password = document.querySelector("input[name='password']").value;

        if (username === "" || password === "") {
            alert("아이디와 비밀번호를 입력해주세요.");
            return;
        }

        fetch(`${pageContext.request.contextPath}/login/loginPro`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ userName: username, password: password }),
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    if (data.tempPassword) {
                        window.location.href = "${pageContext.request.contextPath}/my/profile-edit";
                    } else {
                        window.location.href = "${pageContext.request.contextPath}/main/main";
                    }
                } else {
                    alert("아이디 및 비밀번호가 일치하지 않습니다.");
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert("오류가 발생했습니다. 다시 시도해주세요.");
            });
    }

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script>
    const pageContext = {
        request: {
            contextPath: '${pageContext.request.contextPath}'
        }
    };

    document.addEventListener("DOMContentLoaded", () => {
        const loginBtnNaver = document.querySelector("#simple-login-btn-naver");
        const loginBtnKakao = document.querySelector("#simple-login-btn-kakao");

        loginBtnKakao.addEventListener("click", () => {
            window.location.href = "${pageContext.request.contextPath}/kakao/login";
        });

        loginBtnNaver.addEventListener("click", () => {
            window.location.href = "${pageContext.request.contextPath}/naver/login";
        });

    });
</script>
</body>
</html>