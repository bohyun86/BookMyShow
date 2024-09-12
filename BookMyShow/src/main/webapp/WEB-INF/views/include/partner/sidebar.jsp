<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="nav-left-sidebar sidebar-dark">
    <div class="menu-list">
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="d-xl-none d-lg-none" href="#">Dashboard</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav flex-column">
                    <li class="nav-divider">
                        Menu
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false"
                           data-target="#submenu-1" aria-controls="submenu-1">공연</a>
                        <div id="submenu-1" class="collapse submenu" style="">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/partner/write">공연등록</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">티켓예매 현황</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">정산</a>
                        <div id="submenu-2" class="collapse submenu" style="">
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">후기 관리</a>
                        <div id="submenu-3" class="collapse submenu" style="">
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">1:1 문의</a>
                        <div id="submenu-4" class="collapse submenu" style="">
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>