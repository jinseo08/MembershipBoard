<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-05-27
  Time: 오전 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
수정페이지

<form action="/member/update" method="post" name="updateSubmit" enctype="multipart/form-data">
    <input type="hidden" name="m_id" value="${memberDetail.m_id}" readonly><br>
    <p>아이디</p>
    <input type="text" name="memberId" value="${memberDetail.memberId}" readonly><br>
    <p>비밀번호</p>
    <input type="password" name="memberPw" id="memberPw" placeholder="비밀번호를 입력해주세요"><br>
    <p>이름</p>
    <input type="text" name="memberName" value="${memberDetail.memberName}" readonly><br>
    <p>이메일</p>
    <input type="text" name="memberEmail" value="${memberDetail.memberEmail}"><br>
    <p>핸드폰번호</p>
    <input type="text" name="memberMobile" value="${memberDetail.memberMobile}"><br>
    <p>프로필사진</p>
    <img src="${pageContext.request.contextPath}/upload/${memberDetail.memberProfileName}" alt="" height="100" width="100"><br>
<%--    <input type="file" name="memberFile"><br>--%>
    <input type="button" onclick="update()" value="수정완료">
</form>
</body>
<script>
    function update(){
        let pw = document.getElementById("memberPw").value;
        let pwDB = ${memberDetail.memberPassword}
        if(pw == pwDB){
            updateSubmit.submit();
            alert("수정 완료!")
        }else {
            alert("비밀번호를 확인해주세요");
        }
    }
</script>
</html>
