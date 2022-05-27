<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-05-26
  Time: 오후 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        body{font-family: 'BMJUA';}
        a:link{color:inherit; text-decoration:none;}
        a:hover{color:inherit; text-decoration:none;}
        a:visited{color:inherit; text-decoration:none;}
        #header{position:relative; widtH:100%; height:100px; background:rgb(226, 221, 243); }
        #header .home{position:absolute; left:20px; top:50%; transform:translateY(-50%);}
        #header .home a{font-size:24px; letter-spacing:-0.025em; color:#222; line-height:100px; font-weight:bold; display:inline-block;}
        #header .gnb{text-align:center;}
        #header .gnb ul li{margin-right:20px; display:inline-block}
        #header .gnb ul li a{font-size:24px; letter-spacing:-0.025em; color:#222; line-height:100px; font-weight:bold; display:block;}
    </style>
</head>
<body>
  <div id="header">
      <div class="home">
          <a href="/">HOME</a>
      </div>
      <div class="gnb">
          <ul>
              <li><a href="/board/paging">글목록</a></li>
              <c:choose>
                  <c:when test="${sessionScope.memberId eq 'admin'}">
                      <li><a href ="/member/findAll">관리자페이지(회원목록)</a></li>
                      <li><a href ="/member/logout">로그아웃</a></li>
                      관리자님 안녕하세요!
                  </c:when>
                  <c:when test="${!empty sessionScope.memberId}">
                      <li><a href ="/member/detail?m_id=${memberLogin.m_id}">마이페이지</a></li>
                      <li><a href ="/member/logout">로그아웃</a></li>
                      ${sessionScope.memberId}님 안녕하세요!
                  </c:when>
                  <c:otherwise>
                      <li><a href="/member/save">회원가입</a></li>
                      <li><a href="/member/login">로그인</a></li>
                  </c:otherwise>
              </c:choose>
          </ul>
      </div>
  </div>
</body>
</html>
