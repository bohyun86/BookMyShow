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

let debounceTimer;

function searchTheater() {
    const results = document.getElementById('results');
    const search = document.getElementById('search');
    const theaterId = document.querySelector('.theater-id');
    const regionName = document.querySelector('.region-name');

    debounceTimer = setTimeout(() => {

    search.addEventListener('input', function () {
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
    })}, 300);

    // 검색 결과 클릭 시 검색창에 텍스트 입력
    results.addEventListener('click', function (e) {
        if (e.target.tagName === 'LI') {
            search.value = e.target.textContent.split(",")[0].trim();
            theaterId.value = e.target.getAttribute('data-theater-id');
            regionName.value = e.target.getAttribute('data-region-name');
            results.innerHTML = '';  // 선택 후 결과 초기화
        }
    });
}