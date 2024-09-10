<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
            <h1 class="title">포인트 내역</h1>
            <div class="points-summary">
                <span>총 포인트: <strong>${totalPoints != null ? totalPoints : '10,000'}</strong></span>
                <a href="${pageContext.request.contextPath}/my/coupon-redeem" class="btn btn-primary">쿠폰 등록</a>
            </div>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>유형</th>
                        <th>포인트 변동</th>
                        <th>잔여 포인트</th>
                        <th>일시</th>
                        <th>유효기간</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="point" items="${pointHistory}">
                        <tr>
                            <td>${point.type}</td>
                            <td class="${point.change > 0 ? 'positive' : 'negative'}">
                                <c:choose>
                                    <c:when test="${point.change > 0}">+${point.change}</c:when>
                                    <c:otherwise>${point.change}</c:otherwise>
                                </c:choose>
                            </td>
                            <td>${point.balance}</td>
                            <td><fmt:formatDate value="${point.date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>
                                <c:choose>
                                    <c:when test="${point.change > 0 && point.expiryDate != null}">
                                        <fmt:formatDate value="${point.expiryDate}" pattern="yyyy-MM-dd"/>
                                    </c:when>
                                    <c:otherwise>-</c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="points-info">
                <p>* 포인트 적립 시 유효기간은 적립일로부터 1년입니다.</p>
                <p>* 포인트 사용 시 유효기간이 가장 짧은 포인트부터 사용됩니다.</p>
            </div>
        </section>
    </main>

    <jsp:include page="../include/bottom.jsp"/>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/my/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/my/point.js"></script>
</body>
</html>