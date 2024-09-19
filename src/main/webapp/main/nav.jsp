<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	a {
		text-decoration: none;
		color: black;
	}
	a:hover {
		text-decoration: underline;
		color: blue;
	}
</style>
<c:set var="context" value="${ pageContext.request.contextPath }" />
<c:if test="${ sessionScope.memberDTO.name == null }">
	<h2>로그인 후 이용해주세요</h2>
	<input type="button" value="로그인" onclick="location.href='${ context }/member/loginForm.do'"/><br><br>
	<input type="button" value="회원가입" onclick="location.href='${ context }/member/writeForm.do'"/><br><br>
</c:if>
<c:if test="${ sessionScope.memberDTO.name != null }">
	<h2><a href="${ context }/member/updateForm.do">${ sessionScope.memberDTO.name }</a>님의 메인 화면</h2>
	<input type="button" value="로그아웃" id="logoutBtn"/><br><br>
	<input type="button" value="회원정보수정" onclick="location.href='${ context }/member/updateForm.do'"/><br><br>
</c:if>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	//로그아웃
	$('#logoutBtn').click(function(){
		$.ajax({
			type: 'post',
			url: '${ context }/member/logout.do',
			dataType: 'text',
			success: function(){
				location.href="${ context }/index.do";
			},
			error: function(e){
				console.log(e);
			}
		});
	});
</script>