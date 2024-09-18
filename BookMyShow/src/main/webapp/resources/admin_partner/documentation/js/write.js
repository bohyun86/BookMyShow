const reservedSeat = document.getElementById('reserved-seat');
const unreservedSeat = document.getElementById('unreserved-seat');
const totalSeat = document.querySelector('.total-seat input');
const checkboxGrades = document.querySelectorAll('.classify-grade input[type=checkbox]');
const priceOfGrades = document.querySelectorAll('.input-group-parent .input-group:nth-child(1) input');
const numberOfGrades = document.querySelectorAll('.input-group-parent .input-group:nth-child(2) input');

// 좌석 등급, 가격, 좌석수 초기화 함수
const resetFields = () => {
    checkboxGrades.forEach((grade, index) => {
        grade.disabled = false;
        grade.checked = false;
        priceOfGrades[index].disabled = true;
        priceOfGrades[index].value = "";
        numberOfGrades[index].disabled = true;
        numberOfGrades[index].value = "";
    });
    totalSeat.value = "";
};

// 좌석 등급 체크박스 선택 시 필드 활성화/비활성화 함수
const toggleGradeFields = (index, isChecked) => {
    if (isChecked) {
        priceOfGrades[index].disabled = false;
    } else {
        priceOfGrades[index].disabled = true;
        totalSeat.value -= parseInt(numberOfGrades[index].value) || 0;
        priceOfGrades[index].value = "";
        numberOfGrades[index].disabled = true;
        numberOfGrades[index].value = "";
    }
};

// 가격 입력 시 좌석수 필드 활성화 함수
const toggleNumberField = (price, index) => {
    if (price.value !== '') {
        numberOfGrades[index].disabled = false;
    } else {
        numberOfGrades[index].value = "";
        numberOfGrades[index].disabled = true;
    }
};

// 총 좌석수 계산 함수
const calculateTotalSeats = () => {
    let total = 0;
    numberOfGrades.forEach((number) => {
        total += parseInt(number.value) || 0;
    });
    totalSeat.value = total;
};

// reservedSeat 체크박스 선택 시 이벤트 핸들러
const handleReservedSeatClick = () => {
    resetFields();
};

// unreservedSeat 체크박스 선택 시 이벤트 핸들러
const handleUnreservedSeatClick = () => {
    resetFields();
    checkboxGrades.forEach((grade, index) => {
        grade.disabled = false;
        grade.checked = false;
        priceOfGrades[index].disabled = true;

    });
};

// 이벤트 리스너 등록
reservedSeat.addEventListener('click', handleReservedSeatClick);
unreservedSeat.addEventListener('click', handleUnreservedSeatClick);

// 좌석 등급 체크박스 선택 시 이벤트 리스너 등록
checkboxGrades.forEach((grade, index) => {
    grade.addEventListener('change', (e) => {
        toggleGradeFields(index, e.target.checked);
    });
});

// 가격 입력 시 좌석수 필드 활성화 이벤트 리스너 등록
priceOfGrades.forEach((price, index) => {
    price.addEventListener('input', () => {
        toggleNumberField(price, index);
    });
});

// 좌석수 입력 시 총 좌석수 계산 이벤트 리스너 등록
numberOfGrades.forEach((number) => {
    number.addEventListener('input', calculateTotalSeats);
});

/* ====================================== 공연장 검색 */
document.addEventListener('DOMContentLoaded', searchTheater);


function searchTheater() {
    const results = document.getElementById('results');
    const search = document.getElementById('search');
    const theaterId = document.querySelector('.theater-id');
    const regionName = document.querySelector('.region-name');

    let debounceTimer;

    search.addEventListener('input', function () {
        clearTimeout(debounceTimer);
        debounceTimer = setTimeout(() => {
            const query = search.value;  // 검색어를 가져오는 부분 수정
            if (query !== '') {
                fetch(`/theater/theater-info?theaterName=${encodeURIComponent(query)}`, {
                    headers: {
                        'Accept-Charset': 'UTF-8',  // UTF-8로 응답을 받도록 설정
                        'Content-Type': 'application/xml; charset=UTF-8'  // 요청의 Content-Type을 UTF-8로 설정
                    }
                })
                    .then(response => response.text())  // XML을 텍스트로 받아옴
                    .then(str => new window.DOMParser().parseFromString(str, "text/xml"))  // XML 파싱
                    .then(data => {
                        results.innerHTML = '';  // 기존 결과 제거

                        const theaters = data.getElementsByTagName('db');  // XML 내 <db> 요소 가져오기
                        Array.from(theaters).forEach(theater => {
                            const fcltynm = theater.getElementsByTagName('fcltynm')[0].textContent;  // 공연장명
                            const mt10id = theater.getElementsByTagName('mt10id')[0].textContent;  // 공연장 ID
                            const sidonm = theater.getElementsByTagName('sidonm')[0].textContent;  // 지역명

                            // 한글 URI 디코딩
                            const decodedFcltynm = decodeURIComponent(fcltynm);
                            const decodedSidonm = decodeURIComponent(sidonm);

                            const li = document.createElement('li');
                            li.textContent = `${decodedFcltynm}, ${decodedSidonm}`;  // 디코딩된 공연장명을 표시
                            li.setAttribute('data-theater-id', mt10id);
                            li.setAttribute('data-region-name', decodedSidonm);
                            results.appendChild(li);
                        });
                    })
                    .catch(error => console.error('Error fetching or parsing XML:', error));
            } else {
                results.innerHTML = '';  // 검색어가 없을 때 결과 초기화
            }
        }, 300)


        // 검색 결과 클릭 시 검색창에 텍스트 입력
        results.addEventListener('click', function (e) {
            if (e.target.tagName === 'LI') {
                search.value = e.target.textContent.split(",")[0].trim();
                theaterId.value = e.target.getAttribute('data-theater-id');
                regionName.value = e.target.getAttribute('data-region-name');
                results.innerHTML = '';  // 선택 후 결과 초기화
            }
        }); // results.addEventListener('click', function (e) 끝
    }); // search.addEventListener('input', function () 끝
}

// 사진만 업로드

const inputMusicalPoster = document.querySelector('input[name="musicalPost"]');
const inputMusicalImages = document.querySelector('input[name="musicalImages"]');

const imgContainer1 = document.querySelector('.img-container#poster-image');
const imgContainer2 = document.querySelector('.img-container#description-image');

inputMusicalPoster.addEventListener('change', (event) => addImageThumbnail(event, 1, imgContainer1));
inputMusicalImages.addEventListener('change', (event) => addImageThumbnail(event, 5, imgContainer2));

function addImageThumbnail(e, imgNum, imgContainer) {
    const imageFiles = e.target.files;

    // 이미지가 5장 이상 업로드된 경우 경고 및 초기화
    if (imageFiles.length > imgNum) {
        alert(`사진은 ${imgNum}장까지만 업로드 가능합니다.`);
        inputMusicalImages.value = "";
        imgContainer.innerHTML = "";
        return;
    }

    // 파일 확장자 및 크기 확인
    for (let i = 0; i < imageFiles.length; i++) {
        if (!checkExtension(imageFiles[i].name, imageFiles[i].size)) {
            alert("파일 사이즈는 10MB 이하, jpg, jpeg, png 파일만 업로드 가능합니다.");
            inputMusicalImages.value = "";
            imgContainer.innerHTML = "";
            return;
        }
    }

    // 썸네일을 추가할 컨테이너

    imgContainer.innerHTML = ""; // 이전에 추가된 썸네일을 제거

    // 파일을 읽어서 썸네일 생성
    for (let i = 0; i < imageFiles.length; i++) {
        const file = imageFiles[i];
        const reader = new FileReader();

        reader.onload = function (e) {
            // 파일이 읽힌 후 썸네일 생성
            const imgDiv = document.createElement('div');
            imgDiv.className = 'img-thumbnail';
            const imgTitle = document.createElement('p');
            const img = document.createElement('img');
            img.src = e.target.result; // 파일 내용을 img 태그의 src 속성에 설정
            imgTitle.textContent = file.name;
            img.style.width = '90px';
            img.style.height = '90px';
            img.style.margin = '5px'; // 이미지 간격 추가
            imgDiv.appendChild(imgTitle);
            imgDiv.appendChild(img);
            imgContainer.appendChild(imgDiv);
        };

        reader.readAsDataURL(file); // 파일을 DataURL로 읽어옴
    }
}

// 파일 확장자와 크기를 확인하는 함수
function checkExtension(fileName, fileSize) {
    const maxFileSize = 10 * 1024 * 1024; // 10MB
    const allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i;

    if (!allowedExtensions.exec(fileName)) {
        return false; // 확장자가 맞지 않으면 false 반환
    }

    return fileSize <= maxFileSize;


}

// 웹페이지를 불러왔을때, input file에 파일이 있는 경우 썸네일 생성
document.addEventListener('DOMContentLoaded', () => {
    if (inputMusicalPoster.files.length > 0) {
        addImageThumbnail({target: {files: inputMusicalPoster.files}}, 1, imgContainer1);
    }
    if (inputMusicalImages.files.length > 0) {
        addImageThumbnail({target: {files: inputMusicalImages.files}}, 5, imgContainer2);
    }
});

// 배우이름 쉽표로 구분하기
const inputActor = document.querySelector('input[name="actors"]');
const actorList = document.querySelector('.actor-list');
const actorName = document.querySelector('.actor-name');

inputActor.addEventListener('blur', () => {
    if (inputActor.value.trim() === '') {
        actorName.innerHTML = '';
        return;
    }
    const actors = inputActor.value.split(',');
    for (let i = 0; i < actors.length; i++) {
        const input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'actorList';
        input.value = actors[i].trim();
        actorList.appendChild(input);
        actorName.innerHTML += `배우${i + 1}: ${actors[i].trim()} | `;
    }
    // 뒤에서 3글자 제거
    actorName.innerHTML = actorName.innerHTML.slice(0, -3);
});

inputActor.addEventListener('focus', () => {
    actorName.innerHTML = '';
});


// discount 입력 시 discountPercent 자동 계산 및 유효성 검사
const discountPercent = document.querySelector('#rate-input');
const discount = document.querySelector('#discount-rate');

discountPercent.addEventListener('input', () => {
    // 입력된 값을 숫자로 변환
    let percentValue = parseFloat(discountPercent.value);

    // 유효성 검사: 값이 0~100 사이여야 함
    if (percentValue > 100) {
        percentValue = 100;
    } else if (percentValue < 0 || isNaN(percentValue)) {
        percentValue = 0;
    }

    // 다시 할당하여 입력 필드에 반영
    discountPercent.value = percentValue;

    // 할인율을 계산해서 0.00 ~ 1.00 범위로 설정
    discount.value = (percentValue / 100).toFixed(2); // 소수점 두 자리까지 계산
});


// input type number에 천단위 구분기호 추가
const thousandSeparator = document.querySelectorAll('.thousand-separator')
thousandSeparator.forEach(input => {
    input.addEventListener('input', () => {
        let value = input.value.replace(/[^0-9]/g, ''); // 숫자가 아닌 값 제거
        if (value < 0) {
            value = 0;
        }
        input.value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ','); // 천 단위 구분자 추가
    });
});

const submitBtn = document.querySelector('input[type=submit]');
const requiredFiled = document.querySelectorAll('.required-field');
const ageLimit = document.querySelector('select[name="ageLimit"]');
const genreId = document.querySelector('select[name="genreId"]');
const inputPrice = document.querySelectorAll('input[name="price"]');
const inputNumberOfSeats = document.querySelectorAll('input[name="numberOfSeats"]');

const form = document.querySelector('form');

form.addEventListener('submit', (e) => {
    let isValid = true; // 유효성 검사를 통과했는지 확인하는 플래그

    // 필수 항목 체크
    for (let input of requiredFiled) {
        if (input.value.trim() === '') {
            alert('체크표시된 항목은 필수입력사항입니다.');
            input.focus();
            isValid = false;
            break; // 유효성 검사를 통과하지 못한 경우 루프 종료
        }
    }

    if (!isValid) {
        e.preventDefault();
        return; // 필수 항목 유효성 검사를 통과하지 못하면 폼 제출을 중단
    }

    // 나이 제한 체크
    if (ageLimit.value === '0') {
        alert('나이 제한을 선택해주세요.');
        ageLimit.focus();
        isValid = false;
    }

    if (!isValid) {
        e.preventDefault();
        return; // 나이 제한 유효성 검사를 통과하지 못하면 폼 제출을 중단
    }

    // 장르 체크
    if (genreId.value === '0') {
        alert('장르를 선택해주세요.');
        genreId.focus();
        isValid = false;
    }

    if (!isValid) {
        e.preventDefault();
        return; // 장르 유효성 검사를 통과하지 못하면 폼 제출을 중단
    }

    // 가격 체크
    let numberOfPrices = 0;
    for (let input of inputPrice) {
        if (input.value !== '') {
            numberOfPrices++;
            break;
        }
    }

    if (numberOfPrices === 0) {
        alert('하나 이상의 가격을 설정해주세요.');
        inputPrice[0].focus();
        e.preventDefault();
        return; // 유효성 검사를 통과하지 못하면 폼 제출을 중단
    }

    // 좌석수 체크
    let numberOfSeats = 0;
    for (let input of inputNumberOfSeats) {
        if (input.value !== '') {
            numberOfSeats++;
        }
    }

    if (numberOfSeats === 0) {
        alert('좌석수를 설정해주세요.');
        inputNumberOfSeats[0].focus();
        e.preventDefault();
        return; // 유효성 검사를 통과하지 못하면 폼 제출을 중단
    }

    // input 천단위 구분기호 제거
    thousandSeparator.forEach(input => {
        if (input.type !== 'file') {
            input.value = input.value.replace(/,/g, '');
        }
    });

    // 프로그래스 바 표시
    document.getElementById('progress-bar').style.display = 'block';

    // 업로드 진행 상태를 업데이트하는 함수 호출
    updateProgressBar();
});

// 업로드 진행 상태를 업데이트하는 함수
function updateProgressBar() {
    let progressBar = document.getElementById('progress');
    let progressPercent = document.getElementById('progress-percent');
    let percent = 0;

    let interval = setInterval(() => {
        if (percent < 98) {
            percent += 1;
            progressBar.value = percent;
            progressPercent.textContent = percent + '%';
        } else {
            clearInterval(interval);
        }
    }, 100); // 진행 속도 조절 (100ms마다 1% 증가)
}

// iframe의 로드 완료 이벤트를 통해 업로드 완료 시 프로그래스 바를 숨기고 페이지를 이동합니다.
const iframe = document.querySelector('iframe[name="upload_iframe"]');
iframe.addEventListener('load', () => {
    // 프로그래스 바 숨기기
    document.getElementById('progress-bar').style.display = 'none';
    // 업로드 완료 후 서버에서 리다이렉트된 페이지로 이동
    window.location.href = iframe.contentWindow.location.href;
});
