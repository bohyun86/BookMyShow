document.addEventListener('DOMContentLoaded', function() {
    initReviewActions();
    initStarRating();
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

function initStarRating() {
    document.querySelectorAll('.star-rating').forEach(ratingContainer => {
        const stars = ratingContainer.querySelectorAll('.star');
        const rating = parseFloat(ratingContainer.getAttribute('data-rating'));

        updateStars(stars, rating);

        // 리뷰 작성/수정 페이지에서만 별점 클릭 이벤트 추가
        if (document.getElementById('reviewForm')) {
            stars.forEach((star, index) => {
                star.addEventListener('click', function() {
                    const newRating = index + 1;
                    updateStars(stars, newRating);
                    document.getElementById('ratingInput').value = newRating;
                });
            });
        }
    });
}

function updateStars(stars, rating) {
    stars.forEach((star, index) => {
        if (index < rating) {
            star.textContent = '★';
            star.classList.add('filled');
        } else {
            star.textContent = '☆';
            star.classList.remove('filled');
        }
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