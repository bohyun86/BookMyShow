document.addEventListener('DOMContentLoaded', function() {
    initCouponForm();
});

function initCouponForm() {
    const couponForm = document.getElementById('couponForm');
    if (couponForm) {
        const couponInputs = document.querySelectorAll('.coupon-input input');
        
        couponInputs.forEach((input, index) => {
            input.addEventListener('input', function() {
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

        couponForm.addEventListener('submit', function(e) {
            e.preventDefault();
            const couponCode = Array.from(couponInputs).map(input => input.value).join('-');
            
            // AJAX를 사용하여 서버에 쿠폰 코드 전송
            fetch('/api/redeem-coupon', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ couponCode: couponCode }),
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('쿠폰이 성공적으로 등록되었습니다.');
                    window.location.href = '/my/points';
                } else {
                    alert(data.message || '쿠폰 등록에 실패했습니다. 다시 시도해주세요.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('쿠폰 등록 중 오류가 발생했습니다.');
            });
        });
    }
}

