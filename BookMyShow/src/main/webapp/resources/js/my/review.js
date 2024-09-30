document.addEventListener('DOMContentLoaded', function() {
    initReviewActions();
    initStarRating();
});

function initReviewActions() {
    document.querySelectorAll('.edit-review').forEach(button => {
        button.addEventListener('click', function() {
            const reviewId = this.getAttribute('data-review-id');
            window.location.href = `${contextPath}/my/review-form/${reviewId}`;
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
    const reviewForm = document.getElementById('reviewForm');
    if (reviewForm) {
        const starRating = reviewForm.querySelector('.star-rating');
        const stars = starRating.querySelectorAll('.star');
        const ratingInput = document.getElementById('ratingInput');

        stars.forEach((star, index) => {
            star.addEventListener('click', () => {
                const rating = index + 1;
                updateStars(stars, rating);
                ratingInput.value = rating;
            });

            star.addEventListener('mouseover', () => {
                updateStars(stars, index + 1);
            });

            star.addEventListener('mouseout', () => {
                const currentRating = parseInt(ratingInput.value);
                updateStars(stars, currentRating);
            });
        });
    }
}

function updateStars(stars, rating) {
    stars.forEach((star, index) => {
        if (index < rating) {
            star.classList.add('filled');
            star.textContent = '★';
        } else {
            star.classList.remove('filled');
            star.textContent = '☆';
        }
    });
}

function deleteReview(reviewId) {
    if (confirm('정말로 이 리뷰를 삭제하시겠습니까?')) {
        fetch(`${contextPath}/my/review-delete/${reviewId}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
        })
        .then(response => {
            if (response.ok) {
                alert('리뷰가 성공적으로 삭제되었습니다.');
                window.location.href = `${contextPath}/my/reviews`;
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

document.addEventListener('DOMContentLoaded', function() {
    const deleteButton = document.getElementById('deleteReview');
    if (deleteButton) {
        deleteButton.addEventListener('click', function() {
            if (confirm('정말로 이 리뷰를 삭제하시겠습니까?')) {
                const reviewId = this.getAttribute('data-review-id');
                fetch(`${contextPath}/my/review-delete/${reviewId}`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    }
                })
                .then(response => {
                    if (response.ok) {
                        alert('리뷰가 성공적으로 삭제되었습니다.');
                        window.location.href = `${contextPath}/my/reviews`;
                    } else {
                        alert('리뷰 삭제에 실패했습니다.');
                    }
                })
                .catch(() => alert('리뷰 삭제 중 오류가 발생했습니다.'));
            }
        });
    }
});