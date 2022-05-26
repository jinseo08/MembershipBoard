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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
회원가입
<form action="/member/save" method="post" enctype="multipart/form-data">
    <input type="text" name="memberId" placeholder="아이디" onblur="idCheck()" id="memberId"><br>
    <div id="idCheckResult"></div>
    <input type="password" name="memberPassword" placeholder="비밀번호"><br>
    <input type="text" name="memberName" placeholder="이름"><br>
    <input type="text" name="memberEmail" placeholder="이메일"><br>
    <input type="text" name="memberMobile" placeholder="전화번호"><br>
    프로필사진 <input type="file" name="memberFile"><br>
    <input type="submit" value="회원가입">
</form>
</body>
<script>
    function idCheck(){
        let memberId = document.getElementById("memberId").value;
        let idCheckResult = document.getElementById("idCheckResult");
        $.ajax({
            type : "post",
            url : "/member/idCheck",
            data : {"memberId" : memberId}, //전송하는 파라미터
            dataType : "text", //리턴받을 데이터 형식
            success : function (result){
                if(result == "ok"){
                    idCheckResult.innerHTML = "사용 가능한 아이디 입니다.";
                    idCheckResult.style.color = "green";
                }else{
                    idCheckResult.innerHTML = "이미 사용중인 아이디 입니다.";
                    idCheckResult.style.color = "red";
                }
            },
            error : function (){
                alert("오타 체크");
            }
        });
    }
</script>
</html>
