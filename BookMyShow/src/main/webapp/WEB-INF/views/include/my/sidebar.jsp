<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="viewPath" value="/WEB-INF/views/" />
<c:set var="currentPath" value="${requestScope['javax.servlet.forward.servlet_path']}" />

<aside class="h-100">
    <div class="title">마이티켓</div>
    <div>
        <ul class="list-group list-group-flush mt-3">
            <li class="list-group-item">
                <a href="${contextPath}/my/bookings" 
                   class="${(currentPath == '/my/bookings' || currentPath == '/my/booking-complete' || currentPath == '/my/booking-detail') ? 'text-danger' : ''}">
                    예매내역
                </a>
            </li>
            <li class="list-group-item">
                <a href="${contextPath}/my/refunds" 
                   class="${(currentPath == '/my/refunds' || currentPath == '/my/refund-complete' || currentPath == '/my/refund-detail') ? 'text-danger' : ''}">
                    취소/환불내역
                </a>
            </li>
            <li class="list-group-item">      
                <a href="${contextPath}/my/reviews" 
                   class="${(currentPath == '/my/reviews' || currentPath == '/my/review-edit' || currentPath == '/my/review-write') ? 'text-danger' : ''}">
                    나의 이용후기
                </a>
            </li>
            <li class="list-group-item">
                <a href="${contextPath}/my/points" 
                   class="${(currentPath == '/my/points' || currentPath == '/my/coupon-redeem') ? 'text-danger' : ''}">
                    나의 포인트
                </a>
            </li>
            <li class="list-group-item">
                <a href="${contextPath}/my/coupon-redeem" 
                   class="${currentPath == '/my/coupon-redeem' ? 'text-danger' : ''}">
                    쿠폰 등록
                </a>
            </li>
            <li class="list-group-item">
                <a href="${contextPath}/my/profile-edit" 
                   class="${(currentPath == '/my/profile-edit' || currentPath == '/my/withdrawl') ? 'text-danger' : ''}">
                    회원정보 수정
                </a>
            </li>
            
            <li class="list-group-item">
                <a href="${contextPath}/support/notice" 
                   class="${currentPath == '/support/notice' ? 'text-danger' : ''}">
                    공지사항
                </a>
            </li>
            <li class="list-group-item">
                <a href="${contextPath}/support/faq" 
                   class="${currentPath == '/support/faq' ? 'text-danger' : ''}">
                    자주묻는질문
                </a>
            </li>
            <li class="list-group-item">
                <a href="${contextPath}/support/qna" 
                   class="${currentPath == '/support/qna' ? 'text-danger' : ''}">
                    1:1문의
                </a>
            </li>
        </ul>
    </div>
</aside>
