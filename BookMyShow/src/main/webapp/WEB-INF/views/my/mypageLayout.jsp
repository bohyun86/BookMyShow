<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/my/header.jsp"%>
<%-- <link rel="stylesheet" href="<c:url value='/resources/css/my/@@@.css'/>"> --%>
</head>
<body id="board-body">
    <jsp:include page="../include/top.jsp"/>
    <jsp:include page="../include/my/myticket.jsp"/>
    
    <main class="row d-flex justify-content-between align-items-center" id="board-main">
        <jsp:include page="../include/my/sidebar.jsp"/>
        <section class="h-100" id="board-content">
            <div class="title">
                제목
            </div>
            	내용
        </section>
    </main>

    <jsp:include page="../include/bottom.jsp"/>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/my/common.js"></script>
</body>
</html>