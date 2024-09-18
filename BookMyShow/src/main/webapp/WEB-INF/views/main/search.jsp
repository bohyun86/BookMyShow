
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

</head>
<body>
<jsp:include page="../include/top.jsp"/>

<main class="w-100">
    <section class="container-fluid d-flex justify-content-center" id="time-sale">
        <div id="time-sale-container" class="position-relative" style="width: 1100px;">

                    <c:forEach var="timeSaleCarousel" items="${timeSaleCarouselDTOS}">
                        <div class="card time-sale">
                            <img src="${pageContext.request.contextPath}/${timeSaleCarousel.postFilePath}" class="card-img-top" alt="...">
                            <div class="card-body w-100">
                                <p class="area">${timeSaleCarousel.area}</p>
                                <p class="category">
                                    🗂️${timeSaleCarousel.category}</p>
                                <p class="title new-carousel">${timeSaleCarousel.title}</p>
                                <div class="ticket-price d-flex justify-content-between">
                                    <div class="rating">

                                        <c:if test="${timeSaleCarousel.rating} != 0">
                                            <i class="bi bi-star-fill"></i>
                                            ${timeSaleCarousel.rating}
                                        </c:if>
                                        <span><c:if test="${timeSaleCarousel.reviewCount} != 0">(${timeSaleCarousel.reviewCount})</c:if></span>
                                    </div>
                                    <div class="d-flex">
                                        <p class="discount me-2">${timeSaleCarousel.discountRate}%</p>
                                        <p class="price">${timeSaleCarousel.price}원</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
    </section>
</main>

<jsp:include page="../include/bottom.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/cards.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/dropdown.js"></script>
</body>
</html>