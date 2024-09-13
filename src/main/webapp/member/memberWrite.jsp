<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
	<c:if test="${ not requestScope.check }">
		<h3>회원가입이 실패하였습니다.</h3><br>
	</c:if>
	<c:if test="${ requestScope.check }">
		<h3>회원가입이 성공하였습니다.</h3><br>
	</c:if>
	<input type='button' onclick="location.href='../index.do'" value='홈으로'>
	<input type='button' onclick='history.go(-1)' value='뒤로'>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="../js/member.js"></script>
</body>
</html>