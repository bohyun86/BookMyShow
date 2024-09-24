const contextPath = document.querySelector('meta[name="contextPath"]').getAttribute('content');

document.addEventListener('DOMContentLoaded', function() {
    initCouponForm();
    initCouponManagement();
});

function initCouponForm() {
    const couponForm = document.getElementById('couponForm');
    if (couponForm) {
        const couponInputs = document.querySelectorAll('.coupon-input input');
        const generateRandomCodeBtn = document.getElementById('generateRandomCode');

        couponInputs.forEach((input, index) => {
            input.addEventListener('input', function() {
                this.value = this.value.toUpperCase();
                if (this.value.length === 4 && index < couponInputs.length - 1) {
                    couponInputs[index + 1].focus();
                }
            });

            input.addEventListener('keydown', function(e) {
                if (e.key === 'Backspace' && this.value.length === 0 && index > 0) {
                    couponInputs[index - 1].focus();
                }
            });
        });

        if (generateRandomCodeBtn) {
            generateRandomCodeBtn.addEventListener('click', function() {
                couponInputs.forEach(input => {
                    input.value = generateRandomCode();
                });
            });
        }

        couponForm.addEventListener('submit', function(e) {
            e.preventDefault();
            const couponCode = Array.from(couponInputs).map(input => input.value).join('');
            if (couponForm.getAttribute('action').includes('admin')) {
                const couponAmount = document.getElementById('couponAmount').value;
                createCoupon(couponCode, couponAmount);
            } else {
                redeemCoupon(couponCode);
            }
        });
    }
}

function initCouponManagement() {
    const couponSearch = document.getElementById('couponSearch');
    const dateSearch = document.getElementById('dateSearch');
    const statusCheckboxes = document.querySelectorAll('.status-checkbox input');

    if (couponSearch && dateSearch && statusCheckboxes.length > 0) {
        couponSearch.addEventListener('input', filterCoupons);
        dateSearch.addEventListener('input', filterCoupons);
        statusCheckboxes.forEach(checkbox => checkbox.addEventListener('change', filterCoupons));

        document.querySelectorAll('.delete-coupon').forEach(button => {
            button.addEventListener('click', function() {
                deleteCoupon(this.getAttribute('data-coupon-id'));
            });
        });
    }
}

function generateRandomCode() {
    return Math.random().toString(36).substr(2, 4).toUpperCase();
}

function createCoupon(couponCode, couponAmount) {
    fetch(`${contextPath}/admin/create-coupon`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `coupon1=${couponCode.substr(0,4)}&coupon2=${couponCode.substr(4,4)}&coupon3=${couponCode.substr(8,4)}&couponAmount=${couponAmount}`
    })
    .then(response => response.text())
    .then(text => {
        try {
            const data = JSON.parse(text);
            if (data.success) {
                alert(data.message || '쿠폰이 성공적으로 생성되었습니다.');
                location.reload();
            } else {
                alert(data.message || '쿠폰 생성에 실패했습니다.');
            }
        } catch (e) {
            alert(text);
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('쿠폰 생성 중 오류가 발생했습니다.');
    });
}

function redeemCoupon(couponCode) {
    fetch(`${contextPath}/my/redeem-coupon`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `coupon1=${couponCode.substr(0,4)}&coupon2=${couponCode.substr(4,4)}&coupon3=${couponCode.substr(8,4)}`
    })
    .then(response => response.text())
    .then(text => {
        try {
            const data = JSON.parse(text);
            if (data.message) {
                alert(data.message);
                if (data.redirect) {
                    window.location.href = contextPath + data.redirect;
                } else {
                    location.reload();
                }
            } else if (data.error) {
                alert(data.error);
            }
        } catch (e) {
            alert(text);
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('쿠폰 등록 중 오류가 발생했습니다.');
    });
}


function filterCoupons() {
    const searchTerm = document.getElementById('couponSearch').value.toLowerCase();
    const dateFilter = document.getElementById('dateSearch').value;
    const statusFilter = Array.from(document.querySelectorAll('.status-checkbox input:checked')).map(cb => cb.value);

    document.querySelectorAll('table tbody tr').forEach(row => {
        const code = row.cells[0].textContent.toLowerCase();
        const status = row.cells[2].textContent;
        const date = row.cells[3].textContent;

        const matchesSearch = code.includes(searchTerm);
        const matchesDate = !dateFilter || date.includes(dateFilter);
        const matchesStatus = statusFilter.length === 0 || statusFilter.includes(status);

        row.style.display = matchesSearch && matchesDate && matchesStatus ? '' : 'none';
    });
}

function deleteCoupon(couponId) {
    if (confirm('정말로 이 쿠폰을 삭제하시겠습니까?')) {
        fetch(`${contextPath}/admin/delete-coupon`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `couponId=${couponId}`
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('쿠폰이 성공적으로 삭제되었습니다.');
                location.reload();
            } else {
                alert(data.message || '쿠폰 삭제에 실패했습니다.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('쿠폰 삭제 중 오류가 발생했습니다.');
        });
    }
}
