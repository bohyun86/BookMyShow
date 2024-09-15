
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../include/my/header.jsp"%>
<link
	href="${pageContext.request.contextPath}/resources/css/new-user.css"
	rel="stylesheet">
<style type="text/css">
#current-pass-input,
#confirm-current-pass-input,
#new-pass-input,
#confirm-new-pass-input,
#update-button {
    height: 57px;
    width: 422px;
}
</style>

</head>
<body id="board-body">
	<jsp:include page="../include/top.jsp" />
	<jsp:include page="../include/my/myticket.jsp" />
	<main id="board-main">
		<jsp:include page="../include/my/sidebar.jsp" />
		
		<section id="board-content">
			<h1 class="title">프로필 수정</h1>
			<form class="p-4" id="profile-edit-form"
				action="${pageContext.request.contextPath}/my/profile-update" method="post">
				
				<c:set var="userDTO" value="${requestScope.userDTO }"></c:set>
				<div class="form-group pb-2 d-flex row align-items-stretch justify-content-center">

					<!-- 사용자 ID 필드 -->
					<div class="input-group px-0" id="id-input">
						<div class="input-group-prepend">
							<span class="input-group-text border-0 bg-white"> <i
								class="bi bi-person" style="color: #ff4b4b;"></i>
							</span>
						</div>
						<input type="text" class="form-control border-0" name="userName"
							value="${userDTO.userName}" readonly>
					</div>
					<div class="input-alert-id input-alert"></div>

					<!-- 이메일 필드 -->
					<div class="input-group px-0" id="email-input">
						<div class="input-group-prepend">
							<span class="input-group-text border-0 bg-white"> <i
								class="bi bi-envelope" style="color: #ff4b4b;"></i>
							</span>
						</div>
						<input type="email" class="form-control border-0" name="email"
							value="${userDTO.email}" placeholder="이메일">
					</div>
					<div class="input-alert-email input-alert"></div>

					<!-- 이름 필드 -->
					<div class="input-group px-0" id="name-input">
						<div class="input-group-prepend">
							<span class="input-group-text border-0 bg-white"> <i
								class="bi bi-emoji-smile" style="color: #ff4b4b;"></i>
							</span>
						</div>
						<input type="text" class="form-control border-0" name="name"
							value="${userDTO.name}" placeholder="이름">
					</div>
					<div class="input-alert-name input-alert"></div>

					<!-- 휴대폰 필드 -->
					<div class="input-group px-0" id="phone-input">
						<div class="input-group-prepend">
							<span class="input-group-text border-0 bg-white"> <i
								class="bi bi-phone" style="color: #ff4b4b;"></i>
							</span>
						</div>
						<input type="text" class="form-control border-0"
							name="phoneNumber" value="${userDTO.phoneNumber}"
							placeholder="휴대폰번호">
					</div>
					<div class="input-alert-phone input-alert"></div>

					<!-- 현재 비밀번호 필드 -->
					<div class="input-group px-0" id="current-pass-input">
						<div class="input-group-prepend">
							<span class="input-group-text border-0 bg-white"> <i
								class="bi bi-lock" style="color: #ff4b4b;"></i>
							</span>
						</div>
						<input type="password" class="form-control border-0"
							name="currentPassword" placeholder="현재 비밀번호">
					</div>
					<div class="input-alert-current-pass input-alert"></div>

					<!-- 현재 비밀번호 확인 필드 -->
					<div class="input-group px-0" id="confirm-current-pass-input">
						<div class="input-group-prepend">
							<span class="input-group-text border-0 bg-white"> <i
								class="bi bi-lock-fill" style="color: #ff4b4b;"></i>
							</span>
						</div>
						<input type="password" class="form-control border-0"
							name="confirmCurrentPassword" placeholder="현재 비밀번호 확인">
					</div>
					<div class="input-alert-confirm-current-pass input-alert"></div>

					<!-- 새 비밀번호 필드 -->
					<div class="input-group px-0" id="new-pass-input">
						<div class="input-group-prepend">
							<span class="input-group-text border-0 bg-white"> <i
								class="bi bi-lock" style="color: #ff4b4b;"></i>
							</span>
						</div>
						<input type="password" class="form-control border-0"
							name="newPassword" placeholder="새 비밀번호">
					</div>
					<div class="input-alert-new-pass input-alert"></div>

					<!-- 새 비밀번호 확인 필드 -->
					<div class="input-group px-0" id="confirm-new-pass-input">
						<div class="input-group-prepend">
							<span class="input-group-text border-0 bg-white"> <i
								class="bi bi-lock-fill" style="color: #ff4b4b;"></i>
							</span>
						</div>
						<input type="password" class="form-control border-0"
							name="confirmNewPassword" placeholder="새 비밀번호 확인">
					</div>
					<div class="input-alert-confirm-new-pass input-alert"></div>

					<!-- 프로필 수정 버튼 -->
					<button type="submit" class="btn btn-primary fw-bolder my-2 mt-4"
						id="update-button">프로필 수정</button>
				</div>
			</form>
		</section>
	</main>

	<jsp:include page="../include/bottom.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/my/profile-edit.js"></script>
</body>
</html>