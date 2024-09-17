document.addEventListener('DOMContentLoaded', function() {
    initAddressCopy();
    initReceiptLookup();
    initRefundProcess();
    initSeatCheck();
    initReviewWriting();
    initBookingComplete();
    initWithdrawal();
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

function initSeatCheck() {
    const seatCheckButtons = document.querySelectorAll('.seat-check-button');
    seatCheckButtons.forEach(button => {
        button.addEventListener('click', function() {
            const bookingId = this.getAttribute('data-booking-id');
            showSeats(bookingId);
        });
    });
}

function showSeats(bookingId) {
    const seatList = document.getElementById(`seatList${bookingId}`);
    seatList.innerHTML = ''; // 기존 내용 초기화

    // 예시 데이터 (실제로는 서버에서 가져와야 함)
    const seats = [
        { seat_number: 'A10', seat_class: '일반' },
        { seat_number: 'A11', seat_class: '일반' }
    ];

    seats.forEach(seat => {
        const li = document.createElement('li');
        li.textContent = `${seat.seat_number} (${seat.seat_class})`;
        seatList.appendChild(li);
    });
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
    if (hasReview) {
        window.location.href = `${contextPath}/my/review-edit/${bookingId}`;
    } else {
        window.location.href = `${contextPath}/my/review-write/${bookingId}`;
    }
}

function initBookingComplete() {
    console.log('예매 완료 페이지 초기화');
    // 예매 완료 페이지에 특화된 기능을 여기에 추가
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
