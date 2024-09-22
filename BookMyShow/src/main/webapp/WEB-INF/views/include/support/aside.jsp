
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<aside class="h-100">
   <div class="title">마이티켓</div>
    <div>
     <li class="list-group-item">
                <a href="${pageContext.request.contextPath}/support/notice"> 
                    공지사항
                </a>
            </li>
            <li class="list-group-item">
                <a href="${pageContext.request.contextPath}/support/faq"> 
                    자주묻는질문
                </a>
            </li>
             <li class="list-group-item">
                <a href="${pageContext.request.contextPath}/support/qna"> 
                    1:1문의
                </a>
            </li>
            </li>
        </ul>
    </div>
</aside>