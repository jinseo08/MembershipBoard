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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
글 상세조회
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
        <tr>
            <td>${boardDetail.b_id}</td>
            <td>${boardDetail.boardTitle}</td>
            <td>${boardDetail.memberId}</td>
            <td>${boardDetail.boardContents}</td>
            <td><img src="${pageContext.request.contextPath}/upload/${boardDetail.boardFileName}" alt="이미지가없습니다" height="100" width="100"></td>
            <td>${boardDetail.boardHits}</td>
            <td>${boardDetail.boardCreatedDate}</td>
        </tr>
</table>

    <c:choose>
        <c:when test="${sessionScope.memberId == boardDetail.memberId}">
            <li><a href ="/board/update?b_id=${boardDetail.b_id}">글수정</a></li>
            <li><a href ="/board/delete?b_id=${boardDetail.b_id}">글삭제</a></li>
        </c:when>
        <c:when test="${sessionScope.memberId eq 'admin'}">
            <li><a href ="/board/delete?b_id=${boardDetail.b_id}">글삭제(관리자버전)</a></li>
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
