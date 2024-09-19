<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="../css/boardList.css">
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="../main/header.jsp" />
			<jsp:include page="../main/menu.jsp" />
		</div>
		<div id="container">
			<div id="nav">
				<jsp:include page="../main/nav.jsp" />
			</div>
			<div id="section">
				<div id="boardList" class="boardList">
			       <!-- 게시판 제목 -->
			        <h1 class="title">게시판</h1>
			        
			        <!-- 게시판 설명 -->
			        <div class="exec"></div>
			        
			        <div class="exec">
			            <!-- 게시물 수  -->
			            총 게시물 수: <span></span>개
			        </div>
			        
			        <div class="article">
			            <table>
			                <thead>
			                    <tr>
			                        <th class="seq">번호</th>
			                        <th class="subject">제목</th>
			                        <th class="id">작성자</th>
			                        <th class="hit">조회수</th>
			                        <th class="logtime">작성일시</th>
			                    </tr>
			                </thead>
			                <tbody>
			                    <!-- 목록 -->
			                </tbody>
			                <tfoot>
			                	<tr>
			                		<td colspan="3" id="paging"></td>
			                	</tr>
			                </tfoot>
			            </table>
			        </div>
			    </div><!-- //div#boardList -->
		    </div>
	    </div>
    </div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.tmpl.min.js"></script>
<!-- 템플릿으로 사용할 HTML 태그 -->
<script type="text/x-jquery-teml" id="itemTmpl">
    <tr>
        <td class="seq">\${seq}</td>
        <td class="left subject">\${subject}</td>
        <td class="id">\${id}</td>
        <td class="hit">\${hit}</td>
        <td class="logtime">\${logtime}</td>
    </tr>
</script>

<script>
$(function(){
    $.ajax({
        type: 'get',
        url: './list.do?page=${requestScope.page}',
        dataType: 'json',
        success: function(data) {
        	//console.log("data = "+data.paging); // 응답 값 확인을 위해 로그 출력
            // 제목과 설명 업데이트
            $('div.exec:eq(1) > span').text(data.totalNum); // 총 게시물 수
            
            // 템플릿을 아이템에 적용
            let tmpl = $('#itemTmpl').tmpl(data.list);
            $('tbody').append(tmpl);
            $('#paging').append(data.paging);
        },
        error: function(xhr, status, error){
        	console.log("AJAX 요청 실패");
            console.log("상태: " + status);
            console.log("오류: " + error);
            console.log("응답 텍스트: " + xhr.responseText);
        }
    });
});
</script>
<!-- BoardPaging에서 사용하는 함수 -->
<script type="text/javascript">
function boardPaging(page) {
	location.href = "listForm.do?page=" + page;
}
</script>
</body>
</html>