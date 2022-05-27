<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-05-26
  Time: 오후 8:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<table>
    <tr>
        <th>관리번호</th>
        <th>아이디</th>
        <th>비밀번호</th>
        <th>이름</th>
        <th>이메일</th>
        <th>전화번호</th>
        <th>프로필사진</th>
        <th>삭제</th>
    </tr>
    <c:forEach var="member" items="${memberList}">
        <tr>
            <td>${member.m_id}</td>
            <td>${member.memberId}</td>
            <td>${member.memberPassword}</td>
            <td>${member.memberName}</td>
            <td>${member.memberEmail}</td>
            <td>${member.memberMobile}</td>
            <td><img src="${pageContext.request.contextPath}/upload/${member.memberProfileName}" alt="이미지가없습니다" height="100" width="100"></td>
            <td><a href="/member/delete?m_id=${member.m_id}">삭제</a> </td>

        </tr>
    </c:forEach>
</table>

</body>
</html>
