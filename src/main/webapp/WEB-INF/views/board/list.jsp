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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
글목록 페이지
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
    <c:forEach var="board" items="${boardList}">
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
<ul class="pagination justify-content-center">
    <c:choose>
        <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌--%>
        <c:when test="${paging.page<=1}">
            <li class="page-item disabled">
                <a class="page-link">[이전]</a>
            </li>
        </c:when>
        <%--1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1작은 페이지 요청--%>
        <c:otherwise>
            <li class="page-item">
                <a class="page-link" href="/board/paging?page=${paging.page-1}">[이전]</a>
            </li>
        </c:otherwise>
    </c:choose>
    <%--for(int i=startPage; i <= endPage; i++) 과 같은 의미  --%>
    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
        <c:choose>
            <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 --%>
            <%-- jsp 문법에서 같다는 의미는 eq로 사용 (== 사용안함) --%>
            <c:when test="${i eq paging.page}">
                <li class="page-item active">
                    <a class="page-link">${i}</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/board/paging?page=${i}">${i}</a>
                </li>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:choose>
        <c:when test="${paging.page>=paging.maxPage}">
            <li class="page-item disabled">
                <a class="page-link">[다음]</a>
            </li>
        </c:when>
        <c:otherwise>
            <li class="page-item">
                <a class="page-link" href="/board/paging?page=${paging.page+1}">[다음]</a>
            </li>
        </c:otherwise>
    </c:choose>
</ul>


<c:choose>
    <c:when test="${!empty sessionScope.memberId}">
        <li><a href ="/board/save">글작성</a></li>
        <li><a href ="#">글수정</a></li>
    </c:when>
    <c:otherwise>
        <h3>로그인 후 글을 작성할 수 있습니다.</h3>
    </c:otherwise>
</c:choose>

</body>
</html>
