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
    <style>
        @font-face {
            font-family: 'BMJUA';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        *{margin:0; padding:0;}
        body{width:500px; margin:auto; background:rgb(226, 221, 243); font-family: 'BMJUA'; }
        p{font-size:16px; letter-spacing:0.055em; color:#222; font-weight:700; padding-top:15px; padding-left: 4px;}
        input{width:100%; padding:10px; box-sizing:border-box; margin:10px 0 5px; border:1px solid rgb(173, 142, 179); border-radius:5px; height:51px; font-size:16px;}
        div{font-size:12px;}
        input.wid140{width:154px; display:inline-block; vertical-align:top;}
        input.wid220{width:227px; display:inline-block; vertical-align:top;}
        .box{padding:20px; box-sizing:border-box; background:#fff; border:1px; border-radius:5px}
        submit{width:100%; margin-top:30px; height:50px; font-size:18px; border-radius:5px; display:block; line-height:52px; text-align:center; border:1px solid rgb(173, 142, 179); background-color: #eee ;}
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
회원가입
<div class="box">
<form action="/member/save" method="post" enctype="multipart/form-data">
    <p>아이디</p>
    <input type="text" name="memberId" placeholder="아이디" onblur="idCheck()" id="memberId"><br>
    <div id="idCheckResult"></div>
    <p>비밀번호</p>
    <input type="password" name="memberPassword" placeholder="비밀번호"><br>
    <p>이름</p>
    <input type="text" name="memberName" placeholder="이름"><br>
    <p>이메일</p>
    <input type="text" name="memberEmail" placeholder="이메일"><br>
    <p>전화번호</p>
    <input type="text" name="memberMobile" placeholder="전화번호"><br>
    프로필사진 <input type="file" name="memberFile"><br>
    <input type="submit" value="회원가입">
</form>
</div>
</body>
<script>
    function idCheck(){
        let memberId = document.getElementById("memberId").value;
        let idCheckResult = document.getElementById("idCheckResult");
        let submit = document.getElementById("submit");
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
