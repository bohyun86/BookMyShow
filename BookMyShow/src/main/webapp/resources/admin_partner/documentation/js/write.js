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
        if (!grade.classList.contains('r-grade')) {
            grade.disabled = true;
        } else {
            grade.disabled = true;
            grade.checked = true;
            priceOfGrades[index].disabled = false;
        }
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
    if (discountPercent.value.trim() === '') {
        return;
    }

    let discountValue = parseFloat(discountPercent.value.replace(/,/g, '')); // 쉼표 제거 후 숫자 변환

    if (discountValue > 100) {
        discountValue = 100;
        discountPercent.value = discountValue.toLocaleString(); // 천 단위 구분자 추가
    } else if (discountValue < 0) {
        discountValue = 0;
        discountPercent.value = discountValue.toLocaleString();
    } else {
        discountPercent.value = discountValue.toLocaleString();
    }

    discount.value = discountValue / 100; // 할인율 필드에 100으로 나눈 값 설정
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
const numberInput = document.querySelectorAll('.number');
const ageLimit = document.querySelector('select[name="ageLimit"]');
const genreId = document.querySelector('select[name="genreId"]');
const inputPrice = document.querySelector('input[name="price"]');
const inputNumberOfSeats = document.querySelector('input[name="numberOfSeats"]');

submitBtn.addEventListener('click', (e) => {
    e.preventDefault();

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
        return; // 필수 항목 유효성 검사를 통과하지 못하면 폼 제출을 중단
    }

    // 나이 제한 체크
    if (ageLimit.value === '0') {
        alert('나이 제한을 선택해주세요.');
        ageLimit.focus();
        isValid = false;
    }

    if (!isValid) {
        return; // 나이 제한 유효성 검사를 통과하지 못하면 폼 제출을 중단
    }

    // 장르 체크
    if (genreId.value === '0') {
        alert('장르를 선택해주세요.');
        genreId.focus();
        isValid = false;
    }

    if (!isValid) {
        return; // 장르 유효성 검사를 통과하지 못하면 폼 제출을 중단
    }

    // 가격 체크
    let numberOfPrices = 0;
    for (let input of requiredFiled) {
        if (input.value !== '') {
            numberOfPrices++;
            break;
        }
    }

    if (numberOfPrices === 0) {
        alert('하나 이상의 가격을 설정해주세요.');
        inputPrice.focus();
        return; // 유효성 검사를 통과하지 못하면 폼 제출을 중단
    }

    // 좌석수 체크
    let numberOfSeats = 0;
    if (inputNumberOfSeats.value !== '') {
        numberOfSeats++;
    }

    if (numberOfSeats === 0) {
        alert('좌석수를 설정해주세요.');
        inputNumberOfSeats.focus();
        return; // 유효성 검사를 통과하지 못하면 폼 제
    }

    // input 천단위 구분기호 제거
    thousandSeparator.forEach(input => {
        if (input.type !== 'file') {
            input.value = input.value.replace(/,/g, '');
        }
    });

    // 유효성 검사를 모두 통과했을 때 폼을 제출
    document.querySelector('form').submit();  // 이 부분에서 폼을 제출
});


