<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-05-27
  Time: 오후 1:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
글작성 페이지
<form action="/board/save" method="post" enctype="multipart/form-data">
    <p>제목</p>
    <input type="text" name="boardTitle" placeholder="제목">
    <p>작성자</p>
    <input type="text" name="memberId" value="${sessionScope.memberId}" readonly>
    <p>내용</p>
    <input type="text" name="boardContents" placeholder="내용">
    <p>첨부파일</p>
    <input type="file" name="boardFile">
    <input type="submit" value="글작성">
</form>
</body>
</html>
