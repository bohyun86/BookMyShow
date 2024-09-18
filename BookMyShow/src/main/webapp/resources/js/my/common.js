document.addEventListener('DOMContentLoaded', function() {
    initAddressCopy();
    initReceiptLookup();
    initRefundProcess();
    initReviewWriting();
    initBookingComplete();
    initWithdrawal();
});

document.addEventListener('DOMContentLoaded', function() {
    var myModals = document.querySelectorAll('.modal');
    myModals.forEach(function(modal) {
        new bootstrap.Modal(modal);
    });
});

function initAddressCopy() {
    const copyAddressBtn = document.querySelector('.copy-address');
    if (copyAddressBtn) {
        copyAddressBtn.addEventListener('click', function() {
            const address = document.querySelector('.detail-value[data-address]').getAttribute('data-address');
            navigator.clipboard.writeText(address).then(() => {
                alert('주소가 클립보드에 복사되었습니다.');
            }).catch(err => {
                console.error('주소 복사 실패:', err);
                alert('주소 복사에 실패했습니다. 수동으로 복사해주세요.');
            });
        });
    }
}

function initReceiptLookup() {
    const receiptButton = document.querySelector('.receipt-button');
    if (receiptButton) {
        receiptButton.addEventListener('click', function() {
            const paymentId = this.getAttribute('data-payment-id');
            console.log('영수증 조회:', paymentId);
            window.open('https://order.pay.naver.com/home', '_blank');
        });
    }
}

function initRefundProcess() {
    const agreeCheckbox = document.getElementById('agreeRefund');
    const refundButton = document.getElementById('refundButton');
    if (agreeCheckbox && refundButton) {
        agreeCheckbox.addEventListener('change', function() {
            refundButton.disabled = !this.checked;
        });
        refundButton.addEventListener('click', function() {
            if (confirm('정말로 환불을 진행하시겠습니까? 이 작업은 취소할 수 없습니다.')) {
                alert('환불이 정상적으로 처리되었습니다.');
                window.location.href = contextPath + '/my/refunds';
            }
        });
    }
}

function initReviewWriting() {
    const reviewButtons = document.querySelectorAll('.review-button');
    reviewButtons.forEach(button => {
        button.addEventListener('click', function() {
            const bookingId = this.getAttribute('data-booking-id');
            const hasReview = this.getAttribute('data-has-review') === 'true';
            writeReview(bookingId, hasReview);
        });
    });
}

function writeReview(bookingId, hasReview) {
     const url = hasReview ? `/my/review-edit/${bookingId}` : `/my/review-write/${bookingId}`;
    window.location.href = url;
}

function initBookingComplete() {
    // 티켓 정보 표시 버튼 이벤트 리스너 추가
    const ticketInfoButton = document.getElementById('ticketInfoButton');
    if (ticketInfoButton) {
        ticketInfoButton.addEventListener('click', showTicketInfo);
    }
}

function showTicketInfo() {
    alert('티켓 정보: 공연 당일 매표소에서 예매번호와 신분증을 제시해 주세요.');
}

function initWithdrawal() {
    const withdrawalButton = document.getElementById('withdrawalButton');
    const cancelButton = document.getElementById('cancelButton');

    if (withdrawalButton) {
        withdrawalButton.addEventListener('click', handleWithdrawal);
    }

    if (cancelButton) {
        cancelButton.addEventListener('click', handleCancel);
    }
}

function handleWithdrawal(e) {
    e.preventDefault();
    if (confirm('정말로 회원탈퇴를 진행하시겠습니까? 이 작업은 취소할 수 없습니다.')) {
        document.getElementById('withdrawalForm').submit();
    }
}

function handleCancel(event) {
    event.preventDefault();
    window.location.href = '/i5/my/profile-edit';
}
