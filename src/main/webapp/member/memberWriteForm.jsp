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
#id, #email2, #zipcode {
	margin-right: 10px;
}
#id {
	width: 200px;
}
#pwd, #repwd {
	width: 250px;
}
#tel1, #tel2, #tel3 {
	width: 100px;
}
#addr1, #addr2 {
	width: 80%;
}
#memberWriteForm div {
	color: red;
	font-size: 9px;
	font-weight: bold;
}
#memberWriteForm {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 30px auto;
	text-align: left;
}
</style>
</head>
<body>
	<form name="memberWriteForm" id="memberWriteForm">
		<jsp:include page="../main/header.jsp" />
		<table border="1">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" placeholder="이름 입력" name="name" id="name">
					<div id="nameDiv"></div>
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" placeholder="아이디 입력" name="id" id="id">
					<input type="hidden" id="check" value="">
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
				<th>재확인</th>
				<td>
					<input type="password" placeholder="비밀번호 입력" name="repwd" id="repwd">
					<div id="repwdDiv"></div>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="gender" id="gender_m" value="M" checked/>
					<label for="gender_m">남자</label>
					
					<input type="radio" name="gender" id="gender_f" value="F"/>
					<label for="gender_f">여자</label>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="email1" id="email1"> @ <input type="text" name="email2" id="email2"><input list="email3_list" name="email3" id="email3">
					 <datalist id="email3_list">
					 	 <option value="직접입력">
					 	 <option value="hanmail.com">
					 	 <option value="naver.com">
					 	 <option value="gmail.com">
					 </datalist>
				</td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td>
				<select name="tel1" id="tel1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="019">019</option>
				</select> - <input type="text" name="tel2" id="tel2" maxlength="4"> - <input type="text" name="tel3" id="tel3" maxlength="4">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" readonly placeholder="우편번호" name="zipcode" id="zipcode"><input type="button" onclick="checkPost();" value="우편번호 검색"><br>
					<input type="text" readonly placeholder="주소" name="addr1" id="addr1"><br>
					<input type="text" placeholder="상세주소" name="addr2" id="addr2">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" id="joinBtn" value="회원가입">
					<input type="reset" id="resetBtn" value="다시입력">
					<input type="button" value="뒤로" onclick="history.go(-1);">
				</td>
			</tr>
		</table>
	</form>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/member.js"></script>
</body>
</html>