window.onload = function () {
    // 이용약관 관련 함수 호출
    clickSubCheck();
    clickAllCheckButton();

    // 유효성 검사 함수 실행
    eventCheck();
};

// 유효성 검사 이벤트 리스너 모음
function addMultipleEventListeners(element, events, handler) {
    events.forEach(event => element.addEventListener(event, handler));
}

function eventCheck() {
    addMultipleEventListeners(email, ['keyup', 'focus'], checkEmail);
    addMultipleEventListeners(name, ['keyup', 'focus'], checkName);
    addMultipleEventListeners(phone, ['keyup', 'focus'], checkPhone);
}

// 이용약관 ===================================================================================
const agreeCheck = document.querySelector('#agree-check');
const subChecks = document.querySelectorAll('.sub-check');

function clickAllCheckButton() {
    agreeCheck.addEventListener('change', function () {
        subChecks.forEach(function (subCheck) {
            subCheck.checked = agreeCheck.checked;
        });
    });
}

function clickSubCheck() {
    subChecks.forEach(sub => {
        sub.addEventListener('change', function () {
            agreeCheck.checked = Array.from(subChecks).every(subCheck => subCheck.checked);
        });
    });
}

clickAllCheckButton();
clickSubCheck();

// 입력필드 alert ===================================================================================
const email = document.querySelector('input[name="email"]');
const name = document.querySelector('input[name="name"]');
const phone = document.querySelector('input[name="phoneNumber"]');

const inputs = [email, name, phone];

const emailAlert = document.querySelector('.input-alert-email');
const nameAlert = document.querySelector('.input-alert-name');
const phoneAlert = document.querySelector('.input-alert-phone');

const alerts = [emailAlert, nameAlert, phoneAlert];

function checkName() {
    if (name.value.trim() === '') {
        nameAlert.innerText = '이름은 반드시 실명으로 기재해주세요';
        nameAlert.style.color = 'red';
    } else {
        nameAlert.innerText = '';
    }
}

function checkPhone() {
    const phoneValue = phone.value;
    const phoneRegExp = /^010\d{4}\d{4}$/;

    if (phoneRegExp.test(phoneValue)) {
        phoneAlert.innerText = '사용가능한 전화번호입니다.';
        phoneAlert.style.color = 'blue';
    } else if (phoneValue.includes('-')) {
        phoneAlert.innerText = '-를 제외한 숫자만 입력해주세요.';
        phoneAlert.style.color = 'red';
    } else {
        phoneAlert.innerText = '전화번호 형식을 확인해주세요.';
        phoneAlert.style.color = 'red';
    }
}

function checkEmail() {
    const emailValue = email.value;
    const emailRegExp = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

    if (emailRegExp.test(emailValue)) {
        emailAlert.innerText = '사용가능한 이메일입니다.';
        emailAlert.style.color = 'blue';
    } else {
        emailAlert.innerText = '이메일 형식을 확인해주세요.';
        emailAlert.style.color = 'red';
    }
}

blurEvent();

function blurEvent() {
    inputs.forEach((input, index) =>
        input.addEventListener('blur', function () {
            if (input.value === '') {
                alerts[index].innerText = '';
            }
        }));
}

// 회원가입 버튼 클릭시 유효성 검사
const submitBtn = document.querySelector('#join-button');
const formElement = document.querySelector('#join-form');
const pageContext = formElement.dataset.pageContext;

submitBtn.addEventListener('click', function (e) {
    e.preventDefault();

    if (agreeCheck.checked) {
        fetch(`checkEmailAndPhoneNumber?email=${email.value}&phoneNumber=${phone.value}`, {
            method: 'GET'
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('네트워크 응답에 문제가 있습니다.');
                }
                return response.json();
            })
            .then(result => {
                const emailUser = result.emailUser;
                const phoneUser = result.phoneUser;
                console.log(emailUser);
                console.log(phoneUser);
                const phoneValue = phone.value;
                const phoneRegExp = /^010\d{4}\d{4}$/;
                const emailValue = email.value;
                const emailRegExp = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
                if (emailUser.userId === 0 && phoneUser.userId === 0) {
                    if (phoneRegExp.test(phoneValue) && emailRegExp.test(emailValue)) {
                        alert('회원가입이 완료되었습니다.');
                        formElement.submit();
                    } else {
                        alert('이메일과 전화번호를 확인해주세요.');
                    }
                } else if (phoneUser.userId !== 0) {
                    if (phoneUser.oauth === "kakao") {
                        alert('카카오 간편회원으로 등록된 전화번호입니다.');
                    } else if (phoneUser.oauth === "naver") {
                        alert('네이버 간편회원으로 등록된 전화번호입니다.');
                    } else {
                        alert('일반회원으로 등록된 전화번호입니다.');
                    }
                } else if (emailUser.userId !== 0) {
                    if (emailUser.oauth === "kakao") {
                        alert('카카오 간편회원으로 등록된 이메일입니다.');
                    } else if (emailUser.oauth === "naver") {
                        alert('네이버 간편회원으로 등록된 이메일입니다.');
                    } else {
                        alert('일반회원으로 등록된 이메일입니다.');
                    }
                }
            })
            .catch(error => {
                console.error('에러 발생:', error);
                alert('에러가 발생했습니다.');
            });
    } else {
        alert('이용약관에 동의해주세요.');
    }
});
