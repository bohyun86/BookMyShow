document.addEventListener('DOMContentLoaded', function() {
    initCouponForm();
    initCouponList();
});

function initCouponForm() {
    const couponForm = document.getElementById('couponForm');
    const couponInputs = document.querySelectorAll('.coupon-input input');
    const validationMessage = document.querySelector('.validation-message');
    const generateRandomCodeBtn = document.getElementById('generateRandomCode');

    const couponRegex = /^[A-Z0-9]{4}$/;

    function validateCouponInput(input) {
        return couponRegex.test(input.value.toUpperCase());
    }

    function updateValidationMessage() {
        const isValid = Array.from(couponInputs).every(validateCouponInput);
        if (isValid) {
            checkCouponAvailability();
        } else {
            validationMessage.textContent = '쿠폰 코드는 각 4자리의 영문 대문자와 숫자로 구성되어야 합니다.';
            validationMessage.style.color = 'red';
        }
    }

    function checkCouponAvailability() {
        const couponCode = Array.from(couponInputs).map(input => input.value).join('-');
        fetch(`${pageContext.request.contextPath}/admin/check-coupon`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `couponCode=${couponCode}`
        })
        .then(response => response.json())
        .then(data => {
            if (data.available) {
                validationMessage.textContent = '사용 가능한 쿠폰 코드입니다.';
                validationMessage.style.color = 'green';
            } else {
                validationMessage.textContent = '이미 존재하는 쿠폰 코드입니다.';
                validationMessage.style.color = 'red';
            }
        })
        .catch(error => {
            console.error('Error:', error);
            validationMessage.textContent = '쿠폰 코드 확인 중 오류가 발생했습니다.';
            validationMessage.style.color = 'red';
        });
    }

    couponInputs.forEach((input, index) => {
        input.addEventListener('input', function() {
            this.value = this.value.toUpperCase();
            updateValidationMessage();
            if (this.value.length === 4 && index < couponInputs.length - 1) {
                couponInputs[index + 1].focus();
            }
        });
    });

    generateRandomCodeBtn.addEventListener('click', function() {
        couponInputs.forEach(input => {
            input.value = generateRandomCode();
        });
        updateValidationMessage();
    });

    couponForm.addEventListener('submit', function(e) {
        e.preventDefault();
        if (Array.from(couponInputs).every(validateCouponInput)) {
            this.submit();
        } else {
            alert('유효하지 않은 쿠폰 형식입니다. 다시 확인해주세요.');
        }
    });
}

function initCouponList() {
    const couponSearch = document.getElementById('couponSearch');
    const dateSearch = document.getElementById('dateSearch');
    const statusCheckboxes = document.querySelectorAll('.status-checkbox input');
    const couponTable = document.querySelector('.coupon-table tbody');

    function filterCoupons() {
        const searchValue = couponSearch.value.toLowerCase();
        const dateValue = dateSearch.value;
        const statusValues = Array.from(statusCheckboxes)
            .filter(cb => cb.checked)
            .map(cb => cb.value);

        Array.from(couponTable.rows).forEach(row => {
            const code = row.cells[0].textContent.toLowerCase();
            const status = row.cells[2].textContent;
            const date = row.cells[3].textContent;

            const codeMatch = code.includes(searchValue);
            const dateMatch = !dateValue || date.includes(dateValue);
            const statusMatch = statusValues.length === 0 || statusValues.includes(status);

            row.style.display = codeMatch && dateMatch && statusMatch ? '' : 'none';
        });
    }

    couponSearch.addEventListener('input', filterCoupons);
    dateSearch.addEventListener('input', filterCoupons);
    statusCheckboxes.forEach(cb => cb.addEventListener('change', function() {
        statusCheckboxes.forEach(otherCb => {
            if (otherCb !== this) otherCb.checked = false;
        });
        filterCoupons();
    }));

    // 쿠폰 삭제 기능
    couponTable.addEventListener('click', function(e) {
        if (e.target.classList.contains('delete-coupon')) {
            const couponId = e.target.dataset.id;
            if (confirm('이 쿠폰을 삭제하시겠습니까?')) {
                deleteCoupon(couponId);
            }
        }
    });
}

function generateRandomCode() {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return Array.from({length: 4}, () => characters.charAt(Math.floor(Math.random() * characters.length))).join('');
}

function deleteCoupon(couponId) {
    fetch(`${pageContext.request.contextPath}/admin/delete-coupon`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `id=${couponId}`
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('쿠폰이 삭제되었습니다.');
            location.reload();
        } else {
            alert('쿠폰 삭제에 실패했습니다.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('쿠폰 삭제 중 오류가 발생했습니다.');
    });
}