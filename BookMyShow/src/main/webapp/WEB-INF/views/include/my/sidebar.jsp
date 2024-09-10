<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="viewPath" value="/WEB-INF/views/" />
<c:set var="currentPath" value="${pageContext.request.servletPath}" />

<!--  || 으로 연관된 다른 페이지에 가있을때도 text-danger 사용하기 -->

<aside class="h-100">
    <div class="title">마이티켓</div>
    <div>
        <ul class="list-group list-group-flush mt-3">
            <li class="list-group-item">
                <a href="${contextPath}/my/bookings" 
                   class="${currentPath == viewPath.concat('my/bookings.jsp') ? 'text-danger' : ''}">
                    예매내역
                </a>
            </li>
            <li class="list-group-item">
                <a href="${contextPath}/my/refunds" 
                   class="${currentPath == viewPath.concat('my/refunds.jsp') ? 'text-danger' : ''}">
                    취소/환불내역
                </a>
            </li>
            <li class="list-group-item">
                <a href="${contextPath}/my/reviews" 
                   class="${currentPath == viewPath.concat('my/reviews.jsp') ? 'text-danger' : ''}">
                    나의 이용후기
                </a>
            </li>
            <li class="list-group-item">
                <a href="${contextPath}/my/points" 
                   class="${currentPath == viewPath.concat('my/points.jsp') ? 'text-danger' : ''}">
                    나의 포인트
                </a>
            </li>
            <li class="list-group-item">
                <a href="${contextPath}/my/coupon-redeem" 
                   class="${currentPath == viewPath.concat('my/coupon-redeem.jsp') ? 'text-danger' : ''}">
                    쿠폰 등록
                </a>
            </li>
            <li class="list-group-item">
                <a href="${contextPath}/my/profile-edit" 
                   class="${currentPath == viewPath.concat('my/profile-edit.jsp') ? 'text-danger' : ''}">
                    회원정보 수정
                </a>
            </li>
            
<!--             변경 url 주시  -->
            <li class="list-group-item">
                <a href="${contextPath}/support/notice" 
                   class="${currentPath == viewPath.concat('support/notice.jsp') ? 'text-danger' : ''}">
                    공지사항
                </a>
            </li>
            <li class="list-group-item">
                <a href="${contextPath}/support/faq" 
                   class="${currentPath == viewPath.concat('support/faq.jsp') ? 'text-danger' : ''}">
                    자주묻는질문
                </a>
            </li>
            <li class="list-group-item">
                <a href="${contextPath}/support/qna" 
                   class="${currentPath == viewPath.concat('support/qna.jsp') ? 'text-danger' : ''}">
                    1:1문의
                </a>
            </li>
        </ul>
    </div>
</aside>