<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-05-26
  Time: 오후 4:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
글목록 페이지
<c:if test="${!empty sessionScope.memberId}">
    <a href ="#">마이페이지</a>
</c:if>
</body>
</html>
