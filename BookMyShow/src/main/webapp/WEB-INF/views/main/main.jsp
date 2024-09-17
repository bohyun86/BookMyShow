
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">

    <title>예매하다 - 원하는 뮤지컬을 바로!</title>

    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">

    <style>
        .site-logo {
            text-decoration: none;
            color: #ff4b4b;
            font-size: 30px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<jsp:include page="../include/top.jsp"/>

<section class="container-fluid d-flex mt-3 justify-content-center align-items-center" id="carousel">
    <div class="px-3">
        <div class="carousel slide " data-bs-ride="carousel" id="carousel_control">

            <!-- Carousel Slides -->
            <div class="carousel-inner">

                <!-- Slide-1 -->
                <div class="carousel-item active" data-bs-interval="4000">
                    <img src="${pageContext.request.contextPath}/resources/images/eventImage/event1.jpg" alt="">

                </div>

                <!-- Slide-2 -->
                <div class="carousel-item" data-bs-interval="4000">
                    <img src="${pageContext.request.contextPath}/resources/images/eventImage/event2.jpg" alt="">
                </div>

                <!-- Slide-3 -->
                <div class="carousel-item" data-bs-interval="4000">
                    <img src="${pageContext.request.contextPath}/resources/images/eventImage/event3.jpg" alt="">
                </div>
            </div>


            <!-- Carousel Indicators -->
            <div class="carousel-indicators">
                <!-- Indicator for slide-1 -->
                <button type="button" data-bs-target="#carousel_control" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>

                <!-- Indicator for slide-2 -->
                <button type="button" data-bs-target="#carousel_control" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>

                <!-- Indicator for slide-3 -->
                <button type="button" data-bs-target="#carousel_control" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
            </div>

            <!-- Controls -->
            <button class="carousel-control-prev" type="button" data-bs-target="#carousel_control" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carousel_control" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
            </button>

        </div>
    </div>


</section>
<main class="w-100">
    <section class="container-fluid d-flex justify-content-center" id="new-open">
        <div id="new-open-container" class="position-relative" style="width: 1100px;">
            <div class="row mt-5">
                <div class="fs-3 fw-bold">신규 오픈</div>
            </div>
            <div class="col d-flex justify-content-between mt-1">
                <div>최근 새로 등록된 티켓<i class="bi bi-ticket-perforated-fill"></i>을 만나보세요</div>
                <div><a href="#" class="fs-6 fw-bold text-dark">더보기></a></div>
            </div>

            <div class="cards-wrapper overflow-hidden position-relative" style="width: 1100px;">
                <div class="cards new-open d-flex mt-2" style="width: 2200px;">
                    <c:forEach var="newCarousel" items="${newCarouselDTOS}">
                        <div class="card new-open">
                            <img src="${pageContext.request.contextPath}/${newCarousel.postFilePath}" class="card-img-top new-carousel" alt="...">
                            <div class="card-body w-100">
                                <p class="area new-carousel">${newCarousel.area}</p>
                                <p class="category new-carousel">
                                    🗂️${newCarousel.category}</p>
                                <p class="title new-carousel">${newCarousel.title}</p>
                                <div class="ticket-price d-flex justify-content-between new-carousel">

                                    <p class="discount new-carousel">${newCarousel.discountRate}%</p>
                                    <p class="price new-carousel">${newCarousel.price}원</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- 내비게이션 버튼 추가 -->
            <button class="prev-btn new-open position-absolute start-0"><i class="bi bi-caret-left-fill"></i></button>
            <button class="next-btn new-open position-absolute end-0"><i class="bi bi-caret-right-fill"></i></button>
        </div>
    </section>

    <section class="container-fluid d-flex justify-content-center" id="time-sale">
        <div id="time-sale-container" class="position-relative" style="width: 1100px;">
            <!-- 제목 섹션 -->
            <div class="row mt-5">
                <div class="fs-3 fw-bold">타임 세일</div>
            </div>
            <div class="col d-flex justify-content-between mt-1">
                <div>한정기간/한정수량 최저가<i class="bi bi-cash-stack"></i> 티켓을 만나보세요</div>
                <div><a href="#" class="fs-6 fw-bold text-dark">더보기></a></div>
            </div>

            <!-- 카드 래퍼 추가 -->
            <div class="cards-wrapper overflow-hidden position-relative" style="width: 1100px;">
                <div class="cards time-sale d-flex mt-2" style="width: 2200px;">
                    <div class="card time-sale">
                        <img src="${pageContext.request.contextPath}/resources/images/poster/newopen1.jpg" class="card-img-top" alt="...">
                        <div class="card-body w-100">
                            <p class="area">경상/대구</p>
                            <p class="category">
                                🗂️로맨틱코미디</p>
                            <h6 class="title">내 모든걸(대구)</h6>
                            <div class="ticket-price d-flex justify-content-between">
                                <div class="rating">
                                    <i class="bi bi-star-fill"></i>
                                    4.5
                                    <span>(15)</span>
                                </div>
                                <div class="d-flex">
                                    <p class="discount me-2">60%</p>
                                    <p class="price">15,900원</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card time-sale">
                        <img src="${pageContext.request.contextPath}/resources/images/poster/newopen2.jpg" class="card-img-top" alt="...">
                        <div class="card-body w-100">
                            <p class="area">경상/대구</p>
                            <p class="category">
                                🗂️로맨틱코미디</p>
                            <h6 class="title">내 모든걸(대구)</h6>
                            <div class="ticket-price d-flex justify-content-between">
                                <div class="rating">
                                    <i class="bi bi-star-fill"></i>
                                    4.5
                                    <span>(15)</span>
                                </div>
                                <div class="d-flex">
                                    <p class="discount me-2">60%</p>
                                    <p class="price">15,900원</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card time-sale">
                        <img src="${pageContext.request.contextPath}/resources/images/poster/newopen3.jpg" class="card-img-top" alt="...">
                        <div class="card-body w-100">
                            <p class="area">경상/대구</p>
                            <p class="category">
                                🗂️로맨틱코미디</p>
                            <h6 class="title">내 모든걸(대구)</h6>
                            <div class="ticket-price d-flex justify-content-between">
                                <div class="rating">
                                    <i class="bi bi-star-fill"></i>
                                    4.5
                                    <span>(15)</span>
                                </div>
                                <div class="d-flex">
                                    <p class="discount me-2">60%</p>
                                    <p class="price">15,900원</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card time-sale">
                        <img src="${pageContext.request.contextPath}/resources/images/poster/newopen4.jpg" class="card-img-top" alt="...">
                        <div class="card-body w-100">
                            <p class="area">경상/대구</p>
                            <p class="category">
                                🗂️로맨틱코미디</p>
                            <h6 class="title">내 모든걸(대구)</h6>
                            <div class="ticket-price d-flex justify-content-between">
                                <div class="rating">
                                    <i class="bi bi-star-fill"></i>
                                    4.5
                                    <span>(15)</span>
                                </div>
                                <div class="d-flex">
                                    <p class="discount me-2">60%</p>
                                    <p class="price">15,900원</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card time-sale">
                        <img src="${pageContext.request.contextPath}/resources/images/poster/newopen5.jpg" class="card-img-top" alt="...">
                        <div class="card-body w-100">
                            <p class="area">경상/대구</p>
                            <p class="category">
                                🗂️로맨틱코미디</p>
                            <h6 class="title">내 모든걸(대구)</h6>
                            <div class="ticket-price d-flex justify-content-between">
                                <div class="rating">
                                    <i class="bi bi-star-fill"></i>
                                    4.5
                                    <span>(15)</span>
                                </div>
                                <div class="d-flex">
                                    <p class="discount me-2">60%</p>
                                    <p class="price">15,900원</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card time-sale">
                        <img src="${pageContext.request.contextPath}/resources/images/poster/newopen6.jpg" class="card-img-top" alt="...">
                        <div class="card-body w-100">
                            <p class="area">경상/대구</p>
                            <p class="category">
                                🗂️로맨틱코미디</p>
                            <h6 class="title">내 모든걸(대구)</h6>
                            <div class="ticket-price d-flex justify-content-between">
                                <div class="rating">
                                    <i class="bi bi-star-fill"></i>
                                    4.5
                                    <span>(15)</span>
                                </div>
                                <div class="d-flex">
                                    <p class="discount me-2">60%</p>
                                    <p class="price">15,900원</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card time-sale">
                        <img src="${pageContext.request.contextPath}/resources/images/poster/newopen7.jpg" class="card-img-top" alt="...">
                        <div class="card-body w-100">
                            <p class="area">경상/대구</p>
                            <p class="category">
                                🗂️로맨틱코미디</p>
                            <h6 class="title">내 모든걸(대구)</h6>
                            <div class="ticket-price d-flex justify-content-between">
                                <div class="rating">
                                    <i class="bi bi-star-fill"></i>
                                    4.5
                                    <span>(15)</span>
                                </div>
                                <div class="d-flex">
                                    <p class="discount me-2">60%</p>
                                    <p class="price">15,900원</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card time-sale">
                        <img src="${pageContext.request.contextPath}/resources/images/poster/newopen8.jpg" class="card-img-top" alt="...">
                        <div class="card-body w-100">
                            <p class="area">경상/대구</p>
                            <p class="category">
                                🗂️로맨틱코미디</p>
                            <h6 class="title">내 모든걸(대구)</h6>
                            <div class="ticket-price d-flex justify-content-between">
                                <div class="rating">
                                    <i class="bi bi-star-fill"></i>
                                    4.5
                                    <span>(15)</span>
                                </div>
                                <div class="d-flex">
                                    <p class="discount me-2">60%</p>
                                    <p class="price">15,900원</p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <!-- 내비게이션 버튼 추가 -->
            <button class="prev-btn time-sale position-absolute start-0"><i class="bi bi-caret-left-fill"></i></button>
            <button class="next-btn time-sale position-absolute end-0"><i class="bi bi-caret-right-fill"></i></button>
        </div>
    </section>
</main>

<jsp:include page="../include/bottom.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cards.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/dropdown.js"></script>
</body>
</html>