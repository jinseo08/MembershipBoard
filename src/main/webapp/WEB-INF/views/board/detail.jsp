<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-05-27
  Time: 오후 4:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
글 상세조회

    <c:choose>
        <c:when test="${sessionScope.memberId == boardDetail.memberId}">
            <li><a href ="#">글수정</a></li>
            <li><a href ="#">글삭제</a></li>
        </c:when>
        <c:when test="${sessionScope.memberId eq 'admin'}">
            <li><a href ="#">글삭제(관리자버전)</a></li>
        </c:when>
        <c:when test="${!empty sessionScope.memberId}">
            <li>본인의 글만 수정 및 삭제 할 수 있습니다!</li>
        </c:when>
        <c:otherwise>
            <h3>로그인 후 확인할 수 있습니다.</h3>
        </c:otherwise>
    </c:choose>

</body>
</html>
