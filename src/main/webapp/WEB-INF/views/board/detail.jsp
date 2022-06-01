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

    body{width:100%; background:rgb(226, 221, 243);}
    .table_layout{padding:25px; box-sizing:border-box; background:#fff; border-radius:20px; max-width:1000px; margin:0 auto;}
    .table_layout table{width:100%; table-layout: fixed; border:1px solid #aaa;}
    .table_layout table tbody tr{border-bottom:1px solid #aaa;}
    .table_layout table tbody tr th{word-break: break-all; padding:10px; box-sizing:border-box; border-right:1px solid #aaa; text-align:center;}
    .table_layout table tbody tr td{word-break: break-all; padding:10px; box-sizing:border-box; border-right:1px solid #aaa;}

    .write_custom{padding:20px; box-sizing:border-box; background:#eee; margin-top:20px;}
    .write_custom input{margin-bottom:10px;}
    .write_custom .area{display:inline-block; vertical-align:top; width:calc(100% - 144px); margin-right:10px;}
    .write_custom .area textarea{width:100%; padding:10px; box-sizing:border-box; font-size:18px;}
    .write_custom .area textarea::placeholder{font-size:18px;}
    .write_custom .button_box{display:inline-block; vertical-align:top; height:130px; width:130px;}
    .write_custom .button_box input{width:100%; height:100%; background:rgb(226, 221, 243); color:#222; border:0; border-radius:10px;}


    .text_box{font-size:0; letter-spacing:-4px; margin-top:30px;}
    .text_box .box{padding:20px 0; box-sizing:border-box; border-bottom:1px solid #aaa;}
    .text_box .right_box p{font-size:17px; letter-spacing:-0.04em; color:#666; font-weight:300; display:inline-block; vertical-align:middle; padding-right:20px;}
    .text_box .right_box span{font-size:12px; letter-spacing:-0.04em; color:#888; font-weight:200;  display:inline-block; vertical-align:middle;}
    .text_box p.desc{padding-top:10px; font-size:20px; letter-spacing:-0.04em; color:#222; font-weight:400;}
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
            <col width="17%">
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
    <div class=" write_custom">
        <div>
            <input type="text" id="memberId" placeholder="로그인을 해주세요" value="${sessionScope.memberId}" class="block">
            <div class="area">
                <textarea rows="4" cols="" id="commentContents" placeholder="내용" class="inline_bottom"></textarea>
            </div>
            <div class="button_box">
                <input type="submit" value="댓글작성" onclick="commentSubmit()" class="inline_bottom">
            </div>
        </div>
        <div id="comment-write">
            <div class="text_box">
                <c:forEach items="${commentList}" var="comment">
                <div class="box">
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
                </div>
                </c:forEach>
            </div>
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

    function pwCheck(){
        location.href = "/board/pwCheck?b_id=${boardDetail.b_id}";
    }

    function paging(){
        location.href = "/board/paging?page=${page}"; // 직전에 있었던 페이지 값을 컨트롤러로 요청
    }

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
                let output = "<div class='text_box'>";
                for (let i in result) {
                    output += "<div class='box'>";
                    output += "<div class='right_box'>";
                    output += "<p>" + result[i].memberId + "</p>";
                    output += "<span>" + result[i].commentCreatedDate + "</span>";
                    output += "</div>"
                    output += "<p class='desc'>" + result[i].commentContents + "</p>";
                    output += "</div>";
                }
                    output += "</div>";
                document.getElementById('comment-write').innerHTML = output;
                document.getElementById('memberId').value='${sessionScope.memberId}';
                document.getElementById('commentContents').value='';

            },
            error : function (){
                alert("ajax 오류")
            }
        })
    }
</script>
</html>
