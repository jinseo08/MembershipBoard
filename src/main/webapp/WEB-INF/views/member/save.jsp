<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-05-26
  Time: 오후 2:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
회원가입
<form action="/member/save" method="post">
    <input type="text" name="memberId" placeholder="아이디">
    <input type="password" name="memberPassword" placeholder="비밀번호">
    <input type="text" name="memberName" placeholder="이름">
    <input type="text" name="memberEmail" placeholder="이메일">
    <input type="text" name="memberMobile" placeholder="전화번호">
    <input type="text" name="memberProfile" placeholder="이미지부분">
    <input type="submit" value="회원가입">
</form>
</body>
</html>
