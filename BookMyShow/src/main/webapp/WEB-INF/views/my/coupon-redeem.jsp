<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/my/header.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/my/point.css'/>">
</head>
<body id="board-body">
    <jsp:include page="../include/top.jsp"/>
    <jsp:include page="../include/my/myticket.jsp"/>
    
   <main id="board-main">
        <jsp:include page="../include/my/sidebar.jsp"/>
        <section id="board-content">
            <h1 class="title">쿠폰 등록</h1>
            <form id="couponForm" action="${pageContext.request.contextPath}/my/redeem-coupon" method="post">
                <div class="coupon-input">
                    <input type="text" maxlength="4" name="coupon1" required>
                    <span>-</span>
                    <input type="text" maxlength="4" name="coupon2" required>
                    <span>-</span>
                    <input type="text" maxlength="4" name="coupon3" required>
                </div>
                <button type="submit" class="btn btn-primary">등록하기</button>
            </form>
            <div class="coupon-info">
                <p>- 쿠폰 상품권을 등록하면 타임티켓 포인트로 전환됩니다.</p>
                <p>- 포인트는 타임티켓에서 결제시 현금처럼 사용 가능합니다.</p>
                <p>- 쿠폰을 등록한 뒤에는 환불 및 취소가 불가능합니다.</p>
                <p>- 지정된 유효기간이 지나면 포인트가 소멸됩니다.</p>
            </div>
        </section>
    </main>

    <jsp:include page="../include/bottom.jsp"/>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/my/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/my/point.js"></script>
</body>
</html>