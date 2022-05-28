<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-05-28
  Time: 오후 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
글수정페이지

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
        <form action="/board/update" method="post">
            <td><input type="text" value="${boardDetail.b_id}" name="b_id" readonly></td>
            <td><input type="text" value ="${boardDetail.boardTitle}" name="boardTitle"></td>
            <td><input type="text" value ="${boardDetail.memberId}" name="memberId" readonly></td>
            <td><input type="text" value ="${boardDetail.boardContents}" name="boardContents"></td>
            <td><img src="${pageContext.request.contextPath}/upload/${boardDetail.boardFileName}" alt="이미지가없습니다" height="100" width="100"></td>
            <td>${boardDetail.boardHits}</td>
            <td>${boardDetail.boardCreatedDate}</td>
            <td><input type="submit" value="수정완료"></td>
        </form>
    </tr>
</table>


</body>
</html>
