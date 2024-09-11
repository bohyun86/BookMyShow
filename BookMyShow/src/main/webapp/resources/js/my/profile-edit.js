// DOM이 로드된 후에 실행
document.addEventListener('DOMContentLoaded', function () {
    eventCheck(); // 유효성 검사 함수 실행
});

// 유효성 검사 이벤트 리스너 모음
function addMultipleEventListeners(element, events, handler) {
    events.forEach(event => element.addEventListener(event, handler));
}

function eventCheck() {
    const email = document.querySelector('input[name="email"]');
    const name = document.querySelector('input[name="name"]');
    const phone = document.querySelector('input[name="phoneNumber"]');
    const currentPassword = document.querySelector('input[name="currentPassword"]');
    const confirmCurrentPassword = document.querySelector('input[name="confirmCurrentPassword"]');
    const newPassword = document.querySelector('input[name="newPassword"]');
    const confirmNewPassword = document.querySelector('input[name="confirmNewPassword"]');

    // 각 요소가 제대로 선택되었는지 확인하는 로그
    console.log(email, name, phone, currentPassword, confirmCurrentPassword, newPassword, confirmNewPassword);

    addMultipleEventListeners(email, ['keyup', 'focus'], checkEmail);
    addMultipleEventListeners(name, ['keyup', 'focus'], checkName);
    addMultipleEventListeners(phone, ['keyup', 'focus'], checkPhone);
    addMultipleEventListeners(currentPassword, ['keyup', 'focus'], checkCurrentPw);
    addMultipleEventListeners(confirmCurrentPassword, ['keyup', 'focus'], checkConfirmCurrentPw);
    addMultipleEventListeners(newPassword, ['keyup', 'focus'], checkNewPw);
    addMultipleEventListeners(confirmNewPassword, ['keyup', 'focus'], checkConfirmNewPw);

    // blur 이벤트 추가
    blurEvent(email, name, phone, currentPassword, confirmCurrentPassword, newPassword, confirmNewPassword);
}

// 입력 필드 alert
const emailAlert = document.querySelector('.input-alert-email');
const nameAlert = document.querySelector('.input-alert-name');
const phoneAlert = document.querySelector('.input-alert-phone');
const currentPwAlert = document.querySelector('.input-alert-current-pass');
const confirmCurrentPwAlert = document.querySelector('.input-alert-confirm-current-pass');
const newPwAlert = document.querySelector('.input-alert-new-pass');
const confirmNewPwAlert = document.querySelector('.input-alert-confirm-new-pass');

// 이메일 유효성 검사
let debounceTimer2;
function checkEmail() {
    const emailValue = document.querySelector('input[name="email"]').value;
    const emailRegExp = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

    clearTimeout(debounceTimer2);
    debounceTimer2 = setTimeout(() => {
        if (emailRegExp.test(emailValue)) {
            fetch(`checkUserEmail?email=${emailValue}`, {
                method: 'get',
                headers: { 'Accept': 'application/json' }
            })
            .then(response => {
                if (response.ok) {
                    return response.json();
                } else {
                    throw new Error('네트워크 반응이 없습니다.');
                }
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

// 전화번호 유효성 검사
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

// 현재 비밀번호 유효성 검사
function checkCurrentPw() {
    const currentPasswordValue = document.querySelector('input[name="currentPassword"]').value;
    if (currentPasswordValue === '') {
        currentPwAlert.innerText = '현재 비밀번호를 입력해주세요.';
        currentPwAlert.style.color = 'red';
    } else {
        currentPwAlert.innerText = '';
    }
}

// 현재 비밀번호 확인 유효성 검사
function checkConfirmCurrentPw() {
    const currentPasswordValue = document.querySelector('input[name="currentPassword"]').value;
    const confirmCurrentPasswordValue = document.querySelector('input[name="confirmCurrentPassword"]').value;
    
    if (confirmCurrentPasswordValue === '') {
        confirmCurrentPwAlert.innerText = '현재 비밀번호 확인을 입력해주세요.';
        confirmCurrentPwAlert.style.color = 'red';
    } else if (currentPasswordValue === confirmCurrentPasswordValue) {
        confirmCurrentPwAlert.innerText = '비밀번호가 일치합니다.';
        confirmCurrentPwAlert.style.color = 'blue';
    } else {
        confirmCurrentPwAlert.innerText = '비밀번호가 일치하지 않습니다.';
        confirmCurrentPwAlert.style.color = 'red';
    }
}

// 새 비밀번호 유효성 검사
function checkNewPw() {
    const pwValue = document.querySelector('input[name="newPassword"]').value;
    const pwRegExp = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,20}$/;

    if (pwValue === '') {
        newPwAlert.innerText = '비밀번호를 변경하려면 새 비밀번호를 입력하세요.';
        newPwAlert.style.color = 'blue';
    } else if (pwRegExp.test(pwValue)) {
        newPwAlert.innerText = '사용가능한 비밀번호입니다.';
        newPwAlert.style.color = 'blue';
    } else {
        newPwAlert.innerText = '비밀번호는 8~20자의 영문/숫자/특수문자를 사용해주세요.';
        newPwAlert.style.color = 'red';
    }
}

// 새 비밀번호 확인 유효성 검사
function checkConfirmNewPw() {
    const newPasswordValue = document.querySelector('input[name="newPassword"]').value;
    const confirmNewPasswordValue = document.querySelector('input[name="confirmNewPassword"]').value;
    
    if (newPasswordValue === '') {
        confirmNewPwAlert.innerText = '새 비밀번호를 먼저 입력해주세요.';
        confirmNewPwAlert.style.color = 'blue';
    } else if (confirmNewPasswordValue === '') {
        confirmNewPwAlert.innerText = '새 비밀번호 확인을 입력해주세요.';
        confirmNewPwAlert.style.color = 'blue';
    } else if (newPasswordValue === confirmNewPasswordValue) {
        confirmNewPwAlert.innerText = '비밀번호가 일치합니다.';
        confirmNewPwAlert.style.color = 'blue';
    } else {
        confirmNewPwAlert.innerText = '비밀번호가 일치하지 않습니다.';
        confirmNewPwAlert.style.color = 'red';
    }
}

// 필드에 포커스가 떠날 때 value가 없다면 alert 지우기
function blurEvent(email, name, phone, currentPassword, confirmCurrentPassword, newPassword, confirmNewPassword) {
    const inputs = [email, name, phone, currentPassword, confirmCurrentPassword, newPassword, confirmNewPassword];
    const alerts = [emailAlert, nameAlert, phoneAlert, currentPwAlert, confirmCurrentPwAlert, newPwAlert, confirmNewPwAlert];

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

// 프로필 수정 버튼 클릭시 유효성 검사
const submitBtn = document.querySelector('#update-button');
submitBtn.addEventListener('click', function (e) {
    e.preventDefault();
    if (emailAlert.innerText === '사용가능한 이메일입니다.' &&
        nameAlert.innerText === '' &&
        phoneAlert.innerText === '사용가능한 전화번호입니다.' &&
        confirmCurrentPwAlert.innerText === '비밀번호가 일치합니다.' &&
        (newPwAlert.innerText === '' || newPwAlert.innerText === '사용가능한 비밀번호입니다.') &&
        (confirmNewPwAlert.innerText === '' || confirmNewPwAlert.innerText === '비밀번호가 일치합니다.')) {
        
        // 현재 비밀번호 확인을 위한 서버 요청
        fetch('/api/check-password', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ currentPassword: document.querySelector('input[name="currentPassword"]').value }),
        })
        .then(response => response.json())
        .then(data => {
            if (data.isValid) {
                document.querySelector('form').submit();
            } else {
                alert('현재 비밀번호가 일치하지 않습니다.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('비밀번호 확인 중 오류가 발생했습니다.');
        });
    } else {
        alert('입력값을 확인해주세요.');
    }
});