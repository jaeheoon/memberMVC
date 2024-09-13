<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<c:set var="context" value="${ pageContext.request.contextPath }" />
Context = ${ context }
<c:if test="${ sessionScope.memberDTO.name == null }">
	<h2>메인 화면</h2>
	<!-- <h3><a href="./member/writeForm.do">회원가입</a></h3>
		 <h3><a href="./member/loginForm.do">로그인</a></h3> -->
	<h3><a href="${ context }/member/writeForm.do">회원가입</a></h3>
	<h3><a href="${ context }/member/loginForm.do">로그인</a></h3>
</c:if>
<c:if test="${ sessionScope.memberDTO.name != null }">
	<h2>${ sessionScope.memberDTO.name }님의 메인 화면</h2>
	<h3><a href="${ context }/member/updateForm.do">회원정보 수정</a></h3>
	<h3><a href="${ context }/member/logout.do">로그아웃</a></h3>
	<h3><a href="${ context }/board/boardWriteForm.jsp">글쓰기</a></h3>
</c:if>
	<h3><a href="${ context }/board/boardListForm.jsp?page=1">목록</a></h3>
	
</body>
</html>