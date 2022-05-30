<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-05-30
  Time: 오후 1:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>Title</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
<div>
  <div>
    <input type="text" id="memberId" value="${sessionScope.memberId}">
    <input type="text" id="commentContents" placeholder="댓글내용">
    <input type="submit" value="댓글작성" onclick="commentSubmit()">
  </div>
  <div id="comment-List">
    <table class='table'>
      <tr>
        <th>댓글번호</th>
        <th>작성자</th>
        <th>내용</th>
        <th>작성시간</th>
      </tr>
      <c:forEach items="${commentList}" var="comment">
        <tr>
          <td>${comment.c_id}</td>
          <td>${comment.memberId}</td>
          <td>${comment.commentContents}</td>
          <td>${comment.commentCreatedDate}</td>
        </tr>
      </c:forEach>
    </table>
  </div>
</div>

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
<script>
  function commentSubmit(){
    let memberId = document.getElementById("memberId").value;
    let commentContents = document.getElementById("commentContents").value;
    let b_id = ${boardDetail.b_id};
    $.ajax({
      type : "post",
      url : "/comment/save",
      data: {
        "memberId" : memberId,
        "commentContents" : commentContents,
        "b_id" : b_id
      },
      dataType : "json",
      success : function (result){
        let output = "<table class='table'>";
        output += "<tr><th>댓글번호</th>";
        output += "<th>작성자</th>";
        output += "<th>내용</th>";
        output += "<th>작성시간</th></tr>";
        for(let i in result){
          output += "<tr>";
          output += "<td>"+result[i].c_id+"</td>";
          output += "<td>"+result[i].memberId+"</td>";
          output += "<td>"+result[i].commentContents+"</td>";
          output += "<td>"+result[i].commentCreatedDate+"</td>";
          output += "</tr>";
        }
        output += "</table>";
        document.getElementById('comment-List').innerHTML = output;
        document.getElementById('memberId').value='';
        document.getElementById('commentContents').value='';
      },
      error : function (){
        alert("ajax 오류")
      }
    })
  }
</script>
</html>