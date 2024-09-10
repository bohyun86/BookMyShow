const slides = document.querySelectorAll('.slide');
const dots = document.querySelectorAll('.dot');
let currentIndex = 0;

// 모든 슬라이드에 부드러운 전환 효과 추가
slides.forEach((slide) => {
    slide.style.transition = 'transform 0.5s ease-in-out';
});

dots.forEach((dot, index) => {
    dot.addEventListener('click', () => {
        currentIndex = index;
        slides.forEach((slide) => {
            slide.style.transform = `translateX(-${currentIndex * 100}%)`;
        });
    });
});

document.addEventListener('keydown', (e) => {
    if (e.key === 'ArrowRight' && currentIndex < slides.length - 1) {
        currentIndex++;
    } else if (e.key === 'ArrowLeft' && currentIndex > 0) {
        currentIndex--;
    }
    slides.forEach((slide) => {
        slide.style.transform = `translateX(-${currentIndex * 100}%)`;
    });
});