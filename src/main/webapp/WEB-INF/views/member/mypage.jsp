<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-05-27
  Time: 오전 8:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
마이페이지

<p>아이디</p>
<input type="text" value="${memberDetail.memberId}" readonly><br>
<p>비밀번호</p>
<input type="password" placeholder="*********" readonly><br>
<p>이름</p>
<input type="text" value="${memberDetail.memberName}" readonly><br>
<p>이메일</p>
<input type="text" value="${memberDetail.memberEmail}" readonly><br>
<p>핸드폰번호</p>
<input type="text" value="${memberDetail.memberMobile}" readonly><br>
<p>프로필사진</p>
<img src="${pageContext.request.contextPath}/upload/${memberDetail.memberProfileName}" alt="" height="100" width="100"><br>
<a href="/member/update">회원정보수정</a>
</body>
</html>
