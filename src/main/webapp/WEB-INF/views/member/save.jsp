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
<div class="box">
<form action="/member/save" method="post" enctype="multipart/form-data">
    <p>아이디</p>
    <input type="text" name="memberId" placeholder="아이디" onblur="idCheck()" id="memberId"><br>
    <div id="idCheckResult"></div>
    <p>비밀번호</p>
    <input type="password" name="memberPassword" id="pw" placeholder="비밀번호" onblur="pw_check()"><br>
    <div id="pw_check_result"></div>
    <p>이름</p>
    <input type="text" name="memberName" id="name" placeholder="이름" onblur="name_check()"><br>
    <div id="name_result"></div>
    <p>이메일</p>
    <input type="text" name="memberEmail" id="email" placeholder="이메일" onblur="email_check()"><br>
    <div id="email_result"></div>
    <p>전화번호</p>
    <input type="text" name="memberMobile" id="mobile" onblur="mobile_check()" placeholder="전화번호"><br>
    <div id="mobile_result"></div>
    프로필사진 <input type="file" name="memberFile"><br>
    <input type="submit" value="회원가입">
</form>
</div>
</body>
<script>
    function idCheck(){
        let memberId = document.getElementById("memberId").value;
        let idCheckResult = document.getElementById("idCheckResult");
        const exp = /^[a-z\d]{5,20}$/;
        $.ajax({
            type : "post",
            url : "/member/idCheck",
            data : {"memberId" : memberId}, //전송하는 파라미터
            dataType : "text", //리턴받을 데이터 형식
            success : function (result){
                if(result == "ok"){
                    if(memberId.match(exp)){
                        idCheckResult.innerHTML = "사용 가능한 아이디 입니다.";
                        idCheckResult.style.color = "green";
                    }else if(memberId.length == 0){
                        idCheckResult.innerHTML = "필수정보 입니다"
                        idCheckResult.style.color = "red"
                    }else {
                        idCheckResult.innerHTML = "5~20자의 영어 소문자와 숫자만 사용가능합니다"
                        idCheckResult.style.color = "red"
                    }
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

    function pw_check(){
        let pw_check = document.getElementById("pw").value;
        let result = document.getElementById("pw_check_result")
        /* 8~16자 영문 대 소문자, 숫자, 특수문자(-,_,!)를 사용하세요.
        영어 소문자 + 숫자는 필수 */
        const exp = /^(?=.*[a-z])(?=.*\d)[a-z\dA-Z-_!]{8,16}$/;
        if(pw_check.match(exp)){
            result.innerHTML = "사용 가능한 비밀번호입니다"
            result.style.color = "green"
        }else if(pw_check.length == 0){
            result.innerHTML = "필수정보 입니다"
            result.style.color = "red"
        }else{
            result.innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자(-,_,!)를 사용하세요"
            result.style.color = "red"
        }
    }

    function name_check(){
        let name_check = document.getElementById("name").value;
        let result = document.getElementById("name_result");
        const exp = /^[a-z A-Z 가-힣]{2,16}$/;
        if(name_check.length == 0){
            result.innerHTML = "필수정보 입니다"
            result.style.color = "red"
        }else if(name_check.match(exp)){
            result.innerHTML = "완벽한 이름 입니다!"
            result.style.color = "green"
        }else{
            result.innerHTML = "영어와 한글만 사용 가능합니다"
            result.style.color = "red"
        }
    }
    function email_check(){
        let email_check = document.getElementById("email").value;
        let result = document.getElementById("email_result");
        let exp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
        if(email_check.match(exp)){
            result.innerHTML = "사용가능한 이메일 입니다!";
            result.style.color = "green";
        }else{
            result.innerHTML = "이메일 주소를 확인해주세요";
            result.style.color = "red";
        }
    }

    function mobile_check(){
        let mobile_check = document.getElementById("mobile").value;
        let result = document.getElementById("mobile_result");
        let exp = /^\d{3}-\d{3,4}-\d{4}$/;
        if(mobile_check.match(exp)){
            result.innerHTML = "사용가능한 번호 입니다!";
            result.style.color = "green";
        }else{
            result.innerHTML = "전화번호를 확인해주세요";
            result.style.color = "red";
        }
    }
</script>
</html>
