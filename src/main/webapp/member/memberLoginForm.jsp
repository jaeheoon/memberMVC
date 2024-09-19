<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<style type="text/css">
table {
	border-collapse: collapse;
}
th, td {
	padding: 5px;
}
#id {
	margin-right: 10px;
}
#id {
	width: 200px;
}
#pwd {
	width: 250px;
}
#loginResult {
	margin-bottom: 5px;
}
#memberLoginForm div {
	color: red;
	font-size: 11px;
	font-weight: bold;
}
#memberLoginForm {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 30px auto;
	text-align: left;
}
</style>
</head>
<body>
	<form action="./login.do" method="post" name="memberLoginForm" id="memberLoginForm">
		<jsp:include page="../main/header.jsp" />
		<table border="1">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" placeholder="아이디 입력" name="id" id="id">
					<div id="idDiv"></div>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" placeholder="비밀번호 입력" name="pwd" id="pwd">
					<div id="pwdDiv"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<div id="loginResult"></div>
					<input type="button" id="loginBtn" value="로그인">
					<input type="button" id="joinBtn" value="회원가입" onclick="memberWrite()">
					<input type="button" value="뒤로" onclick="history.go(-1);">
				</td>
			</tr>
		</table>
	</form>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="../js/login.js"></script>
</body>
</html>