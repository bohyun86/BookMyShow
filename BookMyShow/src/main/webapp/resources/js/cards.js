document.addEventListener('DOMContentLoaded', function () {
    CardsMove("new-open");
    CardsMove("time-sale");

    function CardsMove(className) {
        // 선택자에서 .${className} 대신 `.className` 사용
        const cardsContainer = document.querySelector(`.${className}.cards`);
        const cards = document.querySelectorAll(`.${className}.card`);
        const prevBtn = document.querySelector(`.${className}.prev-btn`);
        const nextBtn = document.querySelector(`.${className}.next-btn`);

        console.log(cardsContainer, cards, prevBtn, nextBtn);

        let currentIndex = 0;
        const maxIndex = cards.length - 5; // 5개가 한 번에 보이기 때문

        function updateCardsPosition() {
            cardsContainer.style.transform = `translateX(-${currentIndex * 240}px)`; // 220px 카드 너비 + 20px 마진
        }

        nextBtn.addEventListener('click', function () {
            if (currentIndex < maxIndex) {
                currentIndex++;
                updateCardsPosition();
            }
        });

        prevBtn.addEventListener('click', function () {
            if (currentIndex > 0) {
                currentIndex--;
                updateCardsPosition();
            }
        });
    }
});
