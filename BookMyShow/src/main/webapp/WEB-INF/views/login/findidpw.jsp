<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">

    <title>예매하다 - 원하는 뮤지컬을 바로!</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
    <link href="${pageContext.request.contextPath}/resources/css/find.css" rel="stylesheet">

</head>
<body>
<jsp:include page="../include/top.jsp"/>

<main class="w-100 mt-4">
    <section class="container-fluid d-flex justify-content-center" id="find-id-pw">
        <div id="find-container" class="position-relative d-flex flex-wrap" style="width: 1100px;">
            <div class="submit-forms" id="submit-forms">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#find-id" type="button"
                                role="tab">아이디
                        </button>
                    </li>
                    <li class="nav-item">
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#find-pw" type="button"
                                role="tab">비밀번호
                        </button>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class=" tab-pane show active" id="find-id" role="tabpanel">
                        <form class="find" onsubmit="return false">
                            <div class="text-center mt-2">
                                <p>가입한 회원 정보로</p>
                                <p><span>아이디</span>를 확인하세요.</p>
                            </div>
                            <div class="input-group px-0" id="phone-input">
                                <div class="input-group-prepend">
                                    <span class="input-group-text border-0 bg-white">
                                        <i class="bi bi-phone"></i>
                                    </span>
                                </div>
                                <input type="text" class="form-control border-0" name="phoneNumber" placeholder="휴대폰번호">
                            </div>
                            <div class="input-group  px-0" id="email-input">
                                <div class="input-group-prepend">
                                        <span class="input-group-text border-0 bg-white">
                                            <i class="bi bi-envelope"></i>
                                        </span>
                                </div>
                                <input type="email" class="form-control border-0" name="email" placeholder="이메일">
                            </div>
                            <button class="btn btn-primary fw-bolder my-2 find-id-button">아이디 찾기</button>
                            <div class="info">
                                · <span style="font-weight:600">간편 로그인으로 가입한 경우</span> 아이디/비밀번호를 저장하지 않습니다. 해당되는 간편 로그인
                                버튼을 클릭해 로그인하세요.<br/>
                                · 아이디 찾기에 실패한 경우 <a href='#' target='_blank'>불편사항 접수</a>를 이용해주세요.
                            </div>
                        </form>
                    </div>
                    <div class=" tab-pane" id="find-pw" role="tabpanel">
                        <form class="find" onsubmit="return false">
                            <div class="text-center mt-2">
                                <p>가입한 이메일 주소로</p>
                                <p><span>임시 비밀번호</span>를 보내드려요.</p>
                            </div>
                            <div class="input-group px-0 id-input">
                                <div class="input-group-prepend">
                                        <span class="input-group-text border-0 bg-white">
                                            <i class="bi bi-person"></i>
                                        </span>
                                </div>
                                <input type="text" class="form-control border-0 check-userName" placeholder="아이디" name="userName"
                                       autocomplete="current-password">
                            </div>
                            <div class="input-group px-0" id="email-input2">
                                <div class="input-group-prepend">
                                        <span class="input-group-text border-0 bg-white">
                                            <i class="bi bi-envelope"></i>
                                        </span>
                                </div>
                                <input type="email" class="form-control border-0 check-email" name="email" placeholder="이메일">
                            </div>
                            <button class="btn btn-primary fw-bolder my-2 find-pw-button">임시 비밀번호 발급</button>
                            <div class="info">
                                · <span style="font-weight:600">간편 로그인으로 가입한 경우</span> 아이디/비밀번호를 저장하지 않습니다. 해당되는 간편 로그인
                                버튼을 클릭해 로그인하세요.<br/>
                                · 메일이 수신되지 않은 경우 스팸메일함을 확인해주세요.<br/>
                                · 비밀번호 찾기에 실패한 경우 <a href='#' target='_blank'>불편사항 접수</a>를 이용해주세요.
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </section>
</main>

<jsp:include page="../include/bottom.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/cards.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/dropdown.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', () => {

        const findIdButton = document.querySelector('.find-id-button');
        const findPwButton = document.querySelector('.find-pw-button');

        findIdButton.addEventListener('click', () => {
            const phoneNumber = document.querySelector('input[name="phoneNumber"]').value;
            const email = document.querySelector('input[name="email"]').value;

            if (!phoneNumber || !email) {
                alert('휴대폰번호와 이메일을 입력해주세요.');
                return;
            }

            fetch(`${pageContext.request.contextPath}/login/findIdPro`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({phoneNumber, email})
            }).then(response => response.json())
                .then(data => {
                    const id = data.userId;
                    alert("회원님의 아이디는 '" + id + "'입니다.");
                }).catch(error => {
                    alert('휴대폰번호 및 이메일을 다시 확인해주세요.');
                });
        });


        findPwButton.addEventListener('click', () => {
            const userName = document.querySelector('.check-userName').value;
            const email = document.querySelector('.check-email').value;

            if (!userName || !email) {
                alert('아이디와 이메일을 입력해주세요.');
                return;
            }

            fetch(`${pageContext.request.contextPath}/login/findPwPro`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({userName, email})
            }).then(response => response.json())
                .then(data => {
                    alert('임시 비밀번호가 발급되었습니다. 이메일을 확인해주세요.');
                }).catch(error => {
                    alert('아이디 및 이메일을 다시 확인해주세요.');
                });
        });
    });
</script>
</body>
</html>