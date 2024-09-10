<%--
  Created by IntelliJ IDEA.
  User: ITWILL
  Date: 2024-09-03
  Time: 오후 1:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="dashboard-header">
    <nav class="navbar navbar-expand-lg bg-white fixed-top">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/main">관리자 페이지</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse " id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto navbar-right-top">
                <li class="nav-item dropdown nav-user">
<!--                     <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" -->
<%--                        aria-haspopup="true" aria-expanded="false"><img src="${pageContext.request.contextPath}/resources/admin_partner/assets/images/avatar-1.jpg" alt="" --%>
<!--                          class="user-avatar-md rounded-circle"></a> -->
                                                                
                                                                
                                                                
                  <div class="header_cont">
				<ul class="util clear">
				
				<c:if test="${empty sessionScope.id }">
					<li><a href="${pageContext.request.contextPath}/login/">로그인</a></li>
					
				</c:if>
				<c:if test="${! empty sessionScope.id }">
					<li><a>${sessionScope.id}님</</a></li>
					<li><a href="${pageContext.request.contextPath}/logout/">로그아웃</a></li>
				</c:if>
					
				</ul>	
<!--                     <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" -->
<!--                          aria-labelledby="navbarDropdownMenuLink2"> -->
<!--                         <div class="nav-user-info"> -->
<!--                             <h5 class="mb-0 text-white nav-user-name">John Abraham </h5> -->
<!--                             <span class="status"></span><span class="ml-2">Available</span> -->
<!--                         </div> -->
<!--                         <a class="dropdown-item" href="#"><i class="fas fa-user mr-2"></i>Account</a> -->
<!--                         <a class="dropdown-item" href="#"><i class="fas fa-cog mr-2"></i>Setting</a> -->
<!--                         <a class="dropdown-item" href="#"><i class="fas fa-power-off mr-2"></i>Logout</a> -->
<!--                     </div> -->
                </li>
            </ul>
        </div>
    </nav>
</header>
