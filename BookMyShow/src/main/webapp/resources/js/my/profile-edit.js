// DOM이 로드된 후에 실행
document.addEventListener('DOMContentLoaded', function () {
    eventCheck(); // 유효성 검사 함수 실행
    initialValidation(); // 초기 유효성 검사 실행
});

// 유효성 검사 이벤트 리스너 모음
function addMultipleEventListeners(element, events, handler) {
    events.forEach(event => element.addEventListener(event, handler));
}

function eventCheck() {
    const email = document.querySelector('input[name="email"]');
    const name = document.querySelector('input[name="name"]');
    const phone = document.querySelector('input[name="phoneNumber"]');
    const password = document.querySelector('input[name="password"]');
    const confirmPassword = document.querySelector('input[name="confirmPassword"]');
    const newPassword = document.querySelector('input[name="newPassword"]');
    const confirmNewPassword = document.querySelector('input[name="confirmNewPassword"]');

    // 각 요소가 제대로 선택되었는지 확인하는 로그
    console.log(email, name, phone, password, confirmPassword, newPassword, confirmNewPassword);

    addMultipleEventListeners(email, ['keyup', 'focus', 'blur'], checkEmail);
    addMultipleEventListeners(name, ['keyup', 'focus', 'blur'], checkName);
    addMultipleEventListeners(phone, ['keyup', 'focus', 'blur'], checkPhone);
    addMultipleEventListeners(password, ['keyup', 'focus', 'blur'], checkPassword);
    addMultipleEventListeners(confirmPassword, ['keyup', 'focus', 'blur'], checkConfirmPassword);
    addMultipleEventListeners(newPassword, ['keyup', 'focus', 'blur'], checkNewPassword);
    addMultipleEventListeners(confirmNewPassword, ['keyup', 'focus', 'blur'], checkConfirmNewPassword);

    // blur 이벤트 추가
    blurEvent(email, name, phone, password, confirmPassword, newPassword, confirmNewPassword);
}

// 초기 유효성 검사
function initialValidation() {
    checkEmail();
    checkName();
    checkPhone();
    checkPassword();
    checkConfirmPassword();
}

// 입력 필드 alert
const emailAlert = document.querySelector('.input-alert-email');
const nameAlert = document.querySelector('.input-alert-name');
const phoneAlert = document.querySelector('.input-alert-phone');
const passwordAlert = document.querySelector('.input-alert-current-pass');
const confirmPasswordAlert = document.querySelector('.input-alert-confirm-current-pass');
const newPasswordAlert = document.querySelector('.input-alert-new-pass');
const confirmNewPasswordAlert = document.querySelector('.input-alert-confirm-new-pass');

// 이메일 유효성 검사
let debounceTimer;
function checkEmail() {
    const emailValue = document.querySelector('input[name="email"]').value;
    const emailRegExp = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    const currentUserEmail = document.querySelector('input[name="email"]').dataset.currentEmail;

    clearTimeout(debounceTimer);
    debounceTimer = setTimeout(() => {
        if (emailRegExp.test(emailValue)) {
            if (emailValue === currentUserEmail) {
                emailAlert.innerText = '현재 사용 중인 이메일입니다.';
                emailAlert.style.color = 'blue';
            } else {
                fetch(`/i5/login/checkUserEmail?email=${emailValue}`, {
                    method: 'get',
                    headers: { 'Accept': 'application/json' }
                })
                .then(response => {
                    if (response.ok) return response.json();
                    throw new Error('네트워크 반응이 없습니다.');
                })
                .then(result => {
                    if (result.result) {
                        emailAlert.innerText = '이미 사용중인 이메일입니다.';
                        emailAlert.style.color = 'red';
                    } else {
                        emailAlert.innerText = '사용가능한 이메일입니다.';
                        emailAlert.style.color = 'blue';
                    }
                })
                .catch(_ => {
                    emailAlert.innerText = '에러가 발생했습니다.';
                    emailAlert.style.color = 'red';
                });
            }
        } else {
            emailAlert.innerText = '이메일 형식을 확인해주세요.';
            emailAlert.style.color = 'red';
        }
    }, 300);
}

function checkName() {
    const nameValue = document.querySelector('input[name="name"]').value;
    if (nameValue.trim() === '') {
        nameAlert.innerText = '이름은 반드시 실명으로 기재해주세요.';
        nameAlert.style.color = 'red';
    } else {
        nameAlert.innerText = '';
    }
}

function checkPhone() {
    const phoneValue = document.querySelector('input[name="phoneNumber"]').value;
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

function checkPassword() {
    const passwordValue = document.querySelector('input[name="password"]').value;
    if (passwordValue === '') {
        passwordAlert.innerText = '현재 비밀번호를 입력해주세요.';
        passwordAlert.style.color = 'red';
    } else {
        passwordAlert.innerText = '';
    }
}

function checkConfirmPassword() {
    const passwordValue = document.querySelector('input[name="password"]').value;
    const confirmPasswordValue = document.querySelector('input[name="confirmPassword"]').value;
    if (confirmPasswordValue === '') {
        confirmPasswordAlert.innerText = '현재 비밀번호 확인을 입력해주세요.';
        confirmPasswordAlert.style.color = 'red';
    } else if (passwordValue === confirmPasswordValue) {
        confirmPasswordAlert.innerText = '비밀번호가 일치합니다.';
        confirmPasswordAlert.style.color = 'blue';
    } else {
        confirmPasswordAlert.innerText = '비밀번호가 일치하지 않습니다.';
        confirmPasswordAlert.style.color = 'red';
    }
}

function checkNewPassword() {
    const newPasswordValue = document.querySelector('input[name="newPassword"]').value;
    const pwRegExp = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,20}$/;
    if (newPasswordValue === '') {
        newPasswordAlert.innerText = '비밀번호를 변경하려면 새 비밀번호를 입력하세요.';
        newPasswordAlert.style.color = 'blue';
    } else if (pwRegExp.test(newPasswordValue)) {
        newPasswordAlert.innerText = '사용가능한 비밀번호입니다.';
        newPasswordAlert.style.color = 'blue';
    } else {
        newPasswordAlert.innerText = '비밀번호는 8~20자의 영문/숫자/특수문자를 사용해주세요.';
        newPasswordAlert.style.color = 'red';
    }
}

function checkConfirmNewPassword() {
    const newPasswordValue = document.querySelector('input[name="newPassword"]').value;
    const confirmNewPasswordValue = document.querySelector('input[name="confirmNewPassword"]').value;
    if (newPasswordValue === '') {
        confirmNewPasswordAlert.innerText = '새 비밀번호를 먼저 입력해주세요.';
        confirmNewPasswordAlert.style.color = 'red';
    } else if (confirmNewPasswordValue === '') {
        confirmNewPasswordAlert.innerText = '새 비밀번호 확인을 입력해주세요.';
        confirmNewPasswordAlert.style.color = 'blue';
    } else if (newPasswordValue === confirmNewPasswordValue) {
        confirmNewPasswordAlert.innerText = '비밀번호가 일치합니다.';
        confirmNewPasswordAlert.style.color = 'blue';
    } else {
        confirmNewPasswordAlert.innerText = '비밀번호가 일치하지 않습니다.';
        confirmNewPasswordAlert.style.color = 'red';
    }
}

function blurEvent(email, name, phone, password, confirmPassword, newPassword, confirmNewPassword) {
    const inputs = [email, name, phone, password, confirmPassword, newPassword, confirmNewPassword];
    const alerts = [emailAlert, nameAlert, phoneAlert, passwordAlert, confirmPasswordAlert, newPasswordAlert, confirmNewPasswordAlert];

    inputs.forEach((input, index) => {
        input.addEventListener('blur', function () {
            if (input.value === '') {
                if (input === newPassword) {
                    alerts[index].innerText = '비밀번호를 변경하려면 새 비밀번호를 입력하세요.';
                    alerts[index].style.color = 'blue';
                } else if (input === confirmNewPassword && newPassword.value !== '') {
                    alerts[index].innerText = '새 비밀번호 확인을 입력해주세요.';
                    alerts[index].style.color = 'blue';
                } else {
                    alerts[index].innerText = '';
                }
            }
        });
    });
}

document.addEventListener('DOMContentLoaded', function () {
    const submitBtn = document.querySelector('#update-button');
    submitBtn.addEventListener('click', function (e) {
        e.preventDefault();
        if (checkValidForm()) {
            document.getElementById('profile-edit-form').submit();
        } else {
            alert('입력값을 확인해주세요.');
        }
    });

    const withdrawalBtn = document.querySelector('#withdrawal-button');
    withdrawalBtn.addEventListener('click', function (e) {
        e.preventDefault();
        window.location.href = `${contextPath}/my/withdrawal`;
    });
});

function checkValidForm() {
    const isEmailValid = (emailAlert.innerText === '사용가능한 이메일입니다.' || emailAlert.innerText === '현재 사용 중인 이메일입니다.');
    const isNameValid = nameAlert.innerText === '';
    const isPhoneValid = phoneAlert.innerText === '사용가능한 전화번호입니다.';
    const isPasswordValid = confirmPasswordAlert.innerText === '비밀번호가 일치합니다.';
    const isNewPasswordValid = (newPasswordAlert.innerText === '' || newPasswordAlert.innerText === '사용가능한 비밀번호입니다.' || newPasswordAlert.innerText === '비밀번호를 변경하려면 새 비밀번호를 입력하세요.');
    const isConfirmNewPasswordValid = (confirmNewPasswordAlert.innerText === '비밀번호가 일치합니다.' || (newPasswordAlert.innerText === '' && confirmNewPasswordAlert.innerText === ''));

    return isEmailValid && isNameValid && isPhoneValid && isPasswordValid && isNewPasswordValid && isConfirmNewPasswordValid;
}