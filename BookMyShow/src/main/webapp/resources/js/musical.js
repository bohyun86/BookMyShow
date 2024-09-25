document.addEventListener('DOMContentLoaded', function () {
    // 현재 URL에서 파라미터 값을 가져와 각 필터 상태를 설정
    setInitialActiveButtons();

    // 모든 버튼에 대해 클릭 이벤트 추가
    document.querySelectorAll('.filter-button').forEach(function (button) {
        button.addEventListener('click', function () {
            if (button.classList.contains('genre-button')) {
                // 장르 버튼의 경우 모든 장르 버튼에서 active 제거
                document.querySelectorAll('.genre-button').forEach(function (btn) {
                    btn.classList.remove('active');
                });
            }

            if (button.classList.contains('region-button')) {
                // 지역 버튼의 경우 모든 지역 버튼에서 active 제거
                document.querySelectorAll('.region-button').forEach(function (btn) {
                    btn.classList.remove('text-danger');
                });
            }

            if (button.classList.contains('sort-button')) {
                // 정렬 버튼의 경우 모든 정렬 버튼에서 active 제거
                document.querySelectorAll('.sort-button').forEach(function (btn) {
                    btn.classList.remove('text-danger');
                });
            }

            // 클릭된 버튼에 active 추가
            button.classList.add('active');
			button.classList.add('text-danger');
            // URL 파라미터를 업데이트하여 페이지 새로고침
            updateUrlWithFilters();
        });
    });
});

// 페이지 로드 시 URL 파라미터를 확인하여 해당 버튼들을 활성화하는 함수
function setInitialActiveButtons() {
    let params = new URLSearchParams(window.location.search);
    let genreValue = params.get('genreValue');
    let regionValue = params.get('regionValue');
    let sortValue = params.get('sortValue');

    // 장르 버튼 설정
    if (genreValue) {
        let genreButton = document.querySelector(`.genre-button[value="${genreValue}"]`);
        if (genreButton) {
            genreButton.classList.add('active');
        }
    } else {
        // 기본적으로 '장르 전체' 버튼을 활성화
        let allGenreButton = document.querySelector(`.genre-button[name="all1"]`);
        if (allGenreButton) {
            allGenreButton.classList.add('active');
        }
    }

    // 지역 버튼 설정
    if (regionValue) {
        let regionButton = document.querySelector(`.region-button[value="${regionValue}"]`);
        if (regionButton) {
            regionButton.classList.add('text-danger');
        }
    }

    // 정렬 버튼 설정
    if (sortValue) {
        let sortButton = document.querySelector(`.sort-button[value="${sortValue}"]`);
        if (sortButton) {
            sortButton.classList.add('text-danger');
        }
    }
}

// 선택된 필터를 URL 파라미터로 업데이트하여 페이지 새로고침
function updateUrlWithFilters() {
    let currentUrl = new URL(window.location.href);
    let params = currentUrl.searchParams;

    // 장르, 지역, 정렬 필터 값 초기화
    let genreValue = null;
    let regionValue = null;
    let sortValue = null;

    // 활성화된 장르 버튼의 값을 가져오기
    let activeGenreButton = document.querySelector('.genre-button.active');
    if (activeGenreButton) {
        genreValue = activeGenreButton.value;
    }

    // 활성화된 지역 버튼의 값을 가져오기
    let activeRegionButton = document.querySelector('.region-button.text-danger');
    if (activeRegionButton) {
        regionValue = activeRegionButton.value;
    }

    // 활성화된 정렬 버튼의 값을 가져오기
    let activeSortButton = document.querySelector('.sort-button.text-danger');
    if (activeSortButton) {
        sortValue = activeSortButton.value;
    }

    // URL 파라미터 업데이트
    if (genreValue) {
        params.set('genreValue', genreValue);
    } else {
        params.delete('genreValue'); // 값이 없으면 파라미터 삭제
    }

    if (regionValue) {
        params.set('regionValue', regionValue);
    } else {
        params.delete('regionValue'); // 값이 없으면 파라미터 삭제
    }

    if (sortValue) {
        params.set('sortValue', sortValue);
    } else {
        params.delete('sortValue'); // 값이 없으면 파라미터 삭제
    }

    // 새로운 URL로 페이지 이동 (새로고침)
    window.location.href = currentUrl.toString();
}