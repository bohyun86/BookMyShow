document.addEventListener('DOMContentLoaded', function() {
    initReviewActions();
});

function initReviewActions() {
    document.querySelectorAll('.edit-review').forEach(button => {
        button.addEventListener('click', function() {
            const reviewId = this.getAttribute('data-review-id');
            editReview(reviewId);
        });
    });

    document.querySelectorAll('.delete-review').forEach(button => {
        button.addEventListener('click', function() {
            const reviewId = this.getAttribute('data-review-id');
            deleteReview(reviewId);
        });
    });
}

function editReview(reviewId) {
    window.location.href = `${contextPath}/my/review-edit/${reviewId}`;
}

function deleteReview(reviewId) {
    if (confirm('정말로 이 리뷰를 삭제하시겠습니까?')) {
        fetch(`${contextPath}/api/reviews/${reviewId}`, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
            },
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('리뷰가 성공적으로 삭제되었습니다.');
                location.reload();
            } else {
                alert('리뷰 삭제에 실패했습니다. 다시 시도해주세요.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('리뷰 삭제 중 오류가 발생했습니다.');
        });
    }
}