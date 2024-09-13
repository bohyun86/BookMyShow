<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/my/header.jsp"%>
<link rel="stylesheet"
	href="<c:url value='/resources/css/my/review.css'/>">
</head>
<body id="board-body">
	<jsp:include page="../include/top.jsp" />
	<jsp:include page="../include/my/myticket.jsp" />

	   <main id="board-main">
        <jsp:include page="../include/my/sidebar.jsp" />
        <section id="board-content">
            <h1 class="title">리뷰 작성</h1>
            <form id="reviewForm" action="${pageContext.request.contextPath}/my/review-write" method="post" enctype="multipart/form-data">
                <input type="hidden" name="musicalId" value="${musical.id}">
                <div class="form-group">
                    <label for="musicalTitle">뮤지컬 제목</label>
                    <input type="text" class="form-control" id="musicalTitle" value="${musical.title}" readonly>
                </div>
                <div class="form-group">
                    <label>평점</label>
                    <div class="star-rating" data-rating="0">
                        <span class="star" data-value="1">&#9733;</span>
                        <span class="star" data-value="2">&#9733;</span>
                        <span class="star" data-value="3">&#9733;</span>
                        <span class="star" data-value="4">&#9733;</span>
                        <span class="star" data-value="5">&#9733;</span>
                    </div>
                    <input type="hidden" name="rating" id="ratingInput" value="0">
                </div>
                <div class="form-group">
                    <label for="content">리뷰 내용</label>
                    <textarea class="form-control" id="content" name="content" rows="5" required></textarea>
                </div>
                <div class="form-group">
                    <label for="image">이미지 첨부</label>
                    <input type="file" class="form-control-file" id="image" name="image" accept="image/*">
                </div>
                <button type="submit" class="btn btn-primary">리뷰 작성</button>
            </form>
        </section>
    </main>


	<jsp:include page="../include/bottom.jsp" />

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/my/common.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/my/review.js"></script>
</body>
</html>