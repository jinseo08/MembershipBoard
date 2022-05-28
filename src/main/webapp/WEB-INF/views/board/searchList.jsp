<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-05-28
  Time: 오후 5:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
검색리스트
${searchList}
<table class="table table-striped">
    <tr>
        <th>글번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>내용</th>
        <th>이미지</th>
        <th>조회수</th>
        <th>작성시간</th>
    </tr>
    <c:forEach var="board" items="${searchList}">
        <tr>
            <td>${board.b_id}</td>
            <td><a href="/board/detail?b_id=${board.b_id}">${board.boardTitle}</a></td>
            <td>${board.memberId}</td>
            <td>${board.boardContents}</td>
            <td><img src="${pageContext.request.contextPath}/upload/${board.boardFileName}" alt="이미지가없습니다" height="100" width="100"></td>
            <td>${board.boardHits}</td>
            <td>${board.boardCreatedDate}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
