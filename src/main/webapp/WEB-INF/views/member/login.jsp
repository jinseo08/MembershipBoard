<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-05-26
  Time: 오후 2:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        @font-face {
            font-family: 'BMJUA';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        *{margin:0; padding:0;}
        body{width:400px; margin:auto; background:rgb(226, 221, 243) ; font-family: 'BMJUA';}
        h1{text-align:center; margin-bottom:20px;}
        p{font-size:20px; text-align:center; letter-spacing:-0.04em; color:#222; font-weight:700; padding-top:15px;}
        input{font-family: 'BMJUA'; width:100%; padding:10px; box-sizing:border-box; margin:10px 0 5px; border:1px solid rgb(173, 142, 179); border-radius:5px; height:51px; font-size:16px;}
        input[type="checkbox"]{width:auto; height:auto; margin:15px 10px 0 0;}
        div{margin-top:30px;}
        div:after{content:''; display:block; clear:both;}
        .center{text-align:Center;}
        .box{padding:50px 20px; box-sizing:border-box; background:#fff; border-radius:20px}
        .box + .box{margin-top:20px;}
        submit{width:100%; margin-top:30px; height:50px; font-size:19px; display:block; line-height:52px; text-align:center; border-radius:5px; border:1px solid rgb(173, 142, 179); background-color: #eee ;}
        .bmj{ font-family: 'BMJUA'; letter-spacing:0.045em; font-size:26px;}
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="box">
    <form action="/member/login" method="post">
        <input type="text" name="memberId" placeholder="아이디">
        <input type="password" name="memberPassword" placeholder="비밀번호">
        <input type="submit" value="로그인">
    </form>
</div>
</body>
</html>
