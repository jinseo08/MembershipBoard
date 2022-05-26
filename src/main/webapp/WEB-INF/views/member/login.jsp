<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-05-26
  Time: 오후 2:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
로그인 페이지
<form action="/member/login" method="post">
    <input type="text" name="memberId" placeholder="아이디">
    <input type="password" name="memberPassword" placeholder="비밀번호">
    <input type="submit" value="로그인">
</form>
</body>
</html>
