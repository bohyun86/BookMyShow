<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionScope.userRole != 'admin'}">
    <script>
        alert('관리자로 로그인해주세요.');
        location.href = '${pageContext.request.contextPath}/admin/login/';
    </script>
</c:if>
<div class="dashboard-header">
    <nav class="navbar navbar-expand-lg bg-white fixed-top">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/main">관리자 페이지</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
       
        <div class="collapse navbar-collapse " id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto navbar-right-top">
                <li class="nav-item dropdown connection">
                    <a class="nav-link" href="${pageContext.request.contextPath}/main/main"><i class="bi bi-box-arrow-right"></i> main</a>
                </li>
                <li class="nav-item dropdown connection">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/logout"><i class="bi bi-box-arrow-right"></i> 로그아웃</a>
                </li>
            </ul>
        </div>
        
    </nav>
</div>
