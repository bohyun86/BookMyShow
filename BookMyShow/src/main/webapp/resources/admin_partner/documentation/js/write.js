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

