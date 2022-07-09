<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<style>
    .container{padding:0;}
    .center{text-align:Center}
    .left{text-align:left}
    .right{text-align:right}
    .block{display:block;}
    .inline_bottom{display:inline-block; vertical-align:bottom;}
    p{margin:0;}

    body{width:1000px; margin:50px auto; background:#222;}
    .table_layout{padding:25px; box-sizing:border-box; background:#fff; border-radius:20px;}
    .table_layout table{width:100%; table-layout: fixed; border:1px solid #aaa;}
    .table_layout table tbody tr{border-bottom:1px solid #aaa;}
    .table_layout table tbody tr th{word-break: break-all; padding:10px; box-sizing:border-box; border-right:1px solid #aaa;}
    .table_layout table tbody tr td{word-break: break-all; padding:10px; box-sizing:border-box; border-right:1px solid #aaa;}

    .write_custom{padding:20px; box-sizing:border-box; background:#eee;}
    .write_custom input{margin-bottom:20px;}
    .write_custom button{heighT: 126px; width: 137px; border: 0; background: #222; color: #fff;}

    .text_box{font-size:0; letter-spacing:-4px; margin-top:30px;}
    .text_box .img_box{display:inline-block; vertical-align:middle; width:40px; height:40px; border-radius:50%; position:relative; overflow:hidden;}
    .text_box .img_box img{position:absolute; left:50%; top:50%; transform:translate(-50% , -50%); width:100%; height:100%;}
    .text_box .right_box{display:inline-block; vertical-align:middle; width:calc(100% - 40px); padding-left:20px; box-sizing:border-box;}
    .text_box .right_box p{font-size:18px; letter-spacing:-0.04em; color:#222; font-weight:500;}
    .text_box .right_box span{font-size:16px; letter-spacing:-0.04em; color:#666; font-weight:300; display:block; padding-top:10px;}
    .text_box p.desc{padding-top:20px; font-size:18px; letter-spacing:-0.04em; color:#222; font-weight:400;}
</style>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="table_layout">
    <table>
        <colgroup>
            <col width="12.5%">
            <col width="12.5%">
            <col width="12.5%">
            <col width="12.5%">
            <col width="20%">
            <col width="*">
        </colgroup>
        <tbody>
        <tr>
            <th>글제목</th>
            <td colspan="5">${boardDetail.boardTitle}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td colspan="5">${boardDetail.memberId}</td>
        </tr>
        <tr>
            <th>글번호</th>
            <td>${boardDetail.b_id}</td>
            <th>조회수</th>
            <td>${boardDetail.boardHits}</td>
            <th>작성시간</th>
            <td>${boardDetail.boardCreatedDate}</td>
        </tr>
        <tr>
            <th colspan="4" class="center">내용</th>
            <th colspan="2" class="center">사진</th>
        </tr>
        <tr>
            <td colspan="4" class="center">${boardDetail.boardContents}</td>

            <td colspan="2" class="center"><img src="${pageContext.request.contextPath}/upload/${boardDetail.boardFileName}" alt="이미지가없습니다" height="350" width="350"></td>
        </tr>
        </tbody>
    </table>
    <div class="container write_custom">
        <div id="comment-write">
            <input type="text" id="commentWriter" value="${sessionScope.memberId}" class="block">
            <textarea rows="5" cols="100" id="commentContents" placeholder="내용" class="inline_bottom"></textarea>
            <button id="comment-write-btn" class="inline_bottom">댓글작성</button>
        </div>

        <div class="text_box">
            <c:forEach items="${commentList}" var="comment">
                <div class="img_box">
                    <img src="main1.jpg" alt="이미지영역">
                </div>
                <div class="right_box">
                    <p>
                            ${comment.memberId}
                    </p>
                    <span>
                            ${comment.commentCreatedDate}
                    </span>
                </div>
                <p class="desc">
                        ${comment.commentContents}
                </p>
            </c:forEach>
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
            <h3>로그인 후 수정 및 삭제 할 수 있습니다!</h3>
        </c:otherwise>
    </c:choose>
</div>


</body>
<script>
    $("#comment-write-btn").click(function (){
        //alert("버튼클릭")
        //댓글작성자, 내용을 가져오고
        // ajax 문법을 활용하여 /comment/save 주소로 post 방식으로 작성자, 내용, 글번호 이렇게 3개의 값을 보내는 코드 작성
        let commentWriter = document.getElementById("commentWriter").value;
        let commentContents = document.getElementById("commentContents").value;
        let boardId = '${boardDetail.b_id}';
        $.ajax({
            type : "post",
            url : "/comment/save",
            data : {
                "commentWriter" : commentWriter,
                "commentContents":commentContents,
                "boardId": boardId
            },
            dataType : "json",
            success : function (result) {
                let output = "<table class='table'>";
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th></tr>";
                for(let i in result){
                    output += "<tr>";
                    output += "<td>"+result[i].id+"</td>";
                    output += "<td>"+result[i].commentWriter+"</td>";
                    output += "<td>"+result[i].commentContents+"</td>";
                    output += "<td>"+result[i].commentCreatedDate+"</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('comment-List').innerHTML = output;
                document.getElementById('commentWriter').value='';
                document.getElementById('commentContents').value='';
            },
            error : function (){
                alert("어디가 틀렸을까")
            }
        })
    });

    function pwCheck(){
        location.href = "/board/pwCheck?b_id=${boardDetail.b_id}";
    }

    function paging(){
        location.href = "/board/paging?page=${page}"; // 직전에 있었던 페이지 값을 컨트롤러로 요청
    }
</script>
</html>
