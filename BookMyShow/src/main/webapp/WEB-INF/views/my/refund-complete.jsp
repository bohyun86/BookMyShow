<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="../include/my/header.jsp"%>
	<link rel="stylesheet" href="<c:url value='/resources/css/my/card.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/my/detail.css'/>">
</head>
<body id="board-body">
    <jsp:include page="../include/top.jsp" />
    <jsp:include page="../include/my/myticket.jsp" />

    <main id="board-main">
        <jsp:include page="../include/my/sidebar.jsp" />
        <section id="board-content">
            <div class="title">환불 완료</div>
            <div class="refund-complete-card">
                <p class="text-center mb-4">환불 처리가 완료되었습니다</p>

                <!-- 환불 정보 카드 -->
                <div class="booking-card mb-4">
                    <div class="card-body">
                        <div class="row h-100 no-gutters">
                            <div class="col-md-3 h-100 d-flex align-items-center justify-content-start">
                                <a href="<c:url value='/musical/detail/${refund.booking.musicalId}'/>" class="img-container">
                                    <img src="<c:url value='/resources/images/poster/${refund.booking.musical.posterImage}'/>" 
                                         class="poster-img" alt="${refund.booking.musical.title} 포스터">
                                </a>
                            </div>
                            <div class="col-md-9 d-flex flex-column h-100 pl-3">
                                <div class="booking-info mb-2">
                                    <span class="status">환불완료</span>
                                    <span class="booking-date"><fmt:formatDate value="${refund.refundDate}" pattern="yyyy-MM-dd" /></span>
                                </div>
                                <div class="content-wrapper d-flex flex-column justify-content-between flex-grow-1">
                                    <div class="row align-items-center no-gutters mb-2">
                                        <div class="col-12">
                                            <h5 class="card-title mb-0">
                                                <a href="<c:url value='/musical/detail/${refund.booking.musicalId}'/>" class="card-title-link">
                                                    ${refund.booking.musical.title}
                                                </a>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="row align-items-center no-gutters mb-2">
                                        <div class="col-12">
                                            <p class="card-text mb-0">
                                                공연일: <fmt:formatDate value="${refund.booking.performanceDate}" pattern="yyyy-MM-dd HH:mm" />
                                            </p>
                                        </div>
                                    </div>
                                    <div class="row align-items-center no-gutters">
                                        <div class="col-12">
                                            <p class="card-text mb-0 refund-amount">
                                                환불금액: <fmt:formatNumber value="${refund.refundAmount}" type="currency" currencySymbol="₩" />
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 환불 상세 정보 -->
                <div class="refund-details bg-secondary bg-opacity-25 p-4 rounded mb-4">
                    <h3 class="mb-3">환불 상세 정보</h3>
                    <ul class="list-unstyled">
                        <li>결제금액: <fmt:formatNumber value="${refund.booking.totalAmount}" type="currency" currencySymbol="₩" /></li>
                        <li>공제금액: <fmt:formatNumber value="${refund.deductionAmount}" type="currency" currencySymbol="₩" /></li>
                        <li>환불금액: <fmt:formatNumber value="${refund.refundAmount}" type="currency" currencySymbol="₩" /></li>
                        <li>환불수단: ${refund.refundMethod}</li>
                        <li>환불 예정일: 즉시 또는 평일 3~5일 이내</li>
                    </ul>
                </div>

                <!-- 환불 안내 사항 -->
                <div class="refund-notice bg-secondary bg-opacity-50 p-4 rounded mb-4">
                    <h3 class="mb-3">환불 안내 사항</h3>
                    <ul class="list-unstyled">
                        <li>${refund.refundMethod} 내 결제수단에 따라 최종 환불까지 3~5일이 소요될 수 있습니다.</li>
                        <li>${refund.refundMethod} 포인트로 결제하신 경우 동일한 포인트로 즉시 환불이 완료됩니다.</li>
                        <li>세부사항은 ${refund.refundMethod} 내 결제내역을 확인해주세요.</li>
                        <li>해당 티켓은 환불 승인이 완료되었기에 사용할 수 없으며, 환불 철회 또한 불가한 점 유의 부탁드립니다.</li>
                    </ul>
                </div>

                <p class="text-center mb-4">
                    상세 내역은 예매내역 > 취소/환불내역을 확인해주시고, 문의사항은 1:1 문의 게시판으로 남겨주세요.
                </p>

                <div class="d-flex justify-content-center mt-4 action-buttons">
                    <a href="<c:url value='/my/refunds'/>" class="btn btn-outline-secondary me-2 flex-grow-1">취소/환불내역</a>
                    <a href="<c:url value='/support/qna'/>" class="btn btn-outline-dark flex-grow-1">1:1 문의</a>
                </div>
            </div>
        </section>
    </main>

    <jsp:include page="../include/bottom.jsp"/>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/my/common.js"></script>
</body>
</html>