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
    addMultipleEventListeners(id, ['keyup', 'focus'], checkId);
    addMultipleEventListeners(pw, ['keyup', 'focus'], checkPw);
    addMultipleEventListeners(pw2, ['keyup', 'focus'], checkPw2);
    addMultipleEventListeners(email, ['keyup', 'focus'], checkEmail);
    addMultipleEventListeners(name, ['keyup', 'focus'], checkName);
    addMultipleEventListeners(phone, ['keyup', 'focus'], checkPhone);
}


// 이용약관 ===================================================================================
// 전체 동의 체크박스와 서브 체크박스들 가져오기
const agreeCheck = document.querySelector('#agree-check');
const subChecks = document.querySelectorAll('.sub-check');

// 전체 동의 체크박스를 클릭하면 서브 체크박스의 상태를 변경하는 함수
function clickAllCheckButton() {
    agreeCheck.addEventListener('change', function () {
        subChecks.forEach(function (subCheck) {
            subCheck.checked = agreeCheck.checked;
        });
    });
}

// 서브 체크박스의 상태를 변경하면 전체 동의 체크박스의 상태를 업데이트하는 함수
function clickSubCheck() {
    subChecks.forEach(sub => {
        sub.addEventListener('change', function () {
            // 모든 서브 체크박스가 체크되었는지 확인
            agreeCheck.checked = Array.from(subChecks).every(subCheck => subCheck.checked);
        });
    });
}

// 함수 호출로 이벤트 리스너 등록
clickAllCheckButton();
clickSubCheck();


// 입력필드 alert ===================================================================================

const id = document.querySelector('input[name="userName"]');
const pw = document.querySelector('input[name="password"]');
const pw2 = document.querySelector('input[name="password2"]');
const email = document.querySelector('input[name="email"]');
const name = document.querySelector('input[name="name"]');
const phone = document.querySelector('input[name="phoneNumber"]');

const inputs = [id, pw, pw2, email, name, phone];

const idAlert = document.querySelector('.input-alert-id');
const pwAlert = document.querySelector('.input-alert-pass');
const pw2Alert = document.querySelector('.input-alert-pass2');
const emailAlert = document.querySelector('.input-alert-email');
const nameAlert = document.querySelector('.input-alert-name');
const phoneAlert = document.querySelector('.input-alert-phone');

const alerts = [idAlert, pwAlert, pw2Alert, emailAlert, nameAlert, phoneAlert];


// id 유효성 검사
let debounceTimer;

function checkId() {
    clearTimeout(debounceTimer);

    debounceTimer = setTimeout(() => {
        const idValue = id.value;
        const idRegExp = /^[a-zA-Z0-9_-]{4,20}$/;

        if (idRegExp.test(idValue)) {
            // 중복되는 아이디가 있는지 GET 요청 보내기
            idAlert.innerText = '';

            // GET 요청으로 ID 중복 검사
            fetch(`checkUserId?userName=${encodeURIComponent(idValue)}`, {
                method: 'GET',
                headers: {
                    'Accept': 'application/json'  // JSON 응답을 기대한다고 명시
                }
            })
                .then(response => {
                    if (response.ok) {
                        console.log('response.ok');
                        return response.json();
                    } else {
                        throw new Error('네트워크 반응이 없습니다.');
                    }
                })
                .then(result => {
                    if (result.result) {
                        idAlert.innerText = '이미 사용중인 아이디입니다.';
                        idAlert.style.color = 'red';
                    } else {
                        idAlert.innerText = '사용가능한 아이디입니다.';
                        idAlert.style.color = 'blue';
                    }
                })
                .catch(_ => {
                    idAlert.innerText = '에러가 발생했습니다.';
                    idAlert.style.color = 'red';
                });
        } else {
            idAlert.innerText = '4~20자의 영문, 숫자, 특수기호(_),(-)만 사용할 수 있어요.';
        }
    }, 300);
}

// 비밀번호 유효성 검사
function checkPw() {
    const pwValue = pw.value;
    const pwRegExp = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,20}$/;

    if (pwRegExp.test(pwValue)) {
        pwAlert.innerText = '사용가능한 비밀번호입니다.';
        pwAlert.style.color = 'blue';
    } else {
        pwAlert.innerText = '비밀번호는 8~20자의 영문/숫자/특수문자를 사용해주세요.';
        pwAlert.style.color = 'red';
    }
}

// 비밀번호 확인 유효성 검사
function checkPw2() {
    const pwValue = pw.value;
    const pw2Value = pw2.value;

    if (pwValue !== '') {
        if (pwValue === pw2Value) {
            pw2Alert.innerText = '비밀번호가 일치합니다.';
            pw2Alert.style.color = 'blue';
        } else {
            pw2Alert.innerText = '비밀번호가 일치하지 않습니다.';
            pw2Alert.style.color = 'red';
        }
    } else {
        pw2Alert.innerText = '비밀번호를 먼저 입력해주세요.';
    }
}

// 이메일 유효성 검사
let debounceTimer2;


function checkEmail() {
    const emailValue = email.value;
    const emailRegExp = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

    clearTimeout(debounceTimer2);

    debounceTimer2 = setTimeout(() => {
        if (emailRegExp.test(emailValue)) {

            fetch(`checkUserEmail?email=${emailValue}`, {
                method: 'get',
                headers: {
                    'Accept': 'application/json'
                }
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
                }) // catch, fetch
        } else {
            emailAlert.innerText = '이메일 형식을 확인해주세요.';
            emailAlert.style.color = 'red';
        } // else
    }, 300);
} // checkEmail

function checkName() {
    if (name.value.trim() === '') {
        nameAlert.innerText = '이름은 반드시 실명으로 기재해주세요';
        nameAlert.style.color = 'red';
    } else {
        nameAlert.innerText = '';
    }
}

// 전화번호 유효성 검사
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


blurEvent();

// 필드에 포커스가 떠날때 value값이 없다면 alert를 지워주는 함수
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
submitBtn.addEventListener('click', function (e) {
    e.preventDefault();

    if (agreeCheck.checked) {
        if (idAlert.innerText === '사용가능한 아이디입니다.' &&
            pwAlert.innerText === '사용가능한 비밀번호입니다.' &&
            pw2Alert.innerText === '비밀번호가 일치합니다.' &&
            emailAlert.innerText === '사용가능한 이메일입니다.' &&
            nameAlert.innerText === '' &&
            phoneAlert.innerText === '사용가능한 전화번호입니다.') {
            document.querySelector('form').submit();
        } else {
            alert('입력값을 확인해주세요.');
        }
    } else {
        alert('이용약관에 동의해주세요.');
    }
});