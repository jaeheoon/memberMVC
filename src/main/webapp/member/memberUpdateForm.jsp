<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
#memberUpdateForm div {
	color: red;
	font-size: 9px;
	font-weight: bold;
}
#memberUpdateForm {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 30px auto;
	text-align: left;
}
</style>
</head>
<body>
	<form name="memberUpdateForm" id="memberUpdateForm">
		<jsp:include page="../main/header.jsp" />
		<table border="1">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" id="name" value="${ sessionScope.memberDTO.name }">
					<div id="nameDiv"></div>
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" id="id" value="${ sessionScope.memberDTO.id }" readonly>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" placeholder="비밀번호 입력" name="pwd" id="pwd" value="${ sessionScope.memberDTO.pwd }">
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
					<c:if test="${ not sessionScope.memberDTO.gender.equals('M') }">
						<input type="radio" name="gender" id="gender_m" value="M"/>
					</c:if>
					<c:if test="${ sessionScope.memberDTO.gender.equals('M') }">
						<input type="radio" name="gender" id="gender_m" value="M" checked/>
					</c:if>
					<label for="gender_m">남자</label>
					
					<c:if test="${ not sessionScope.memberDTO.gender.equals('F') }">
						<input type="radio" name="gender" id="gender_f" value="F"/>
					</c:if>
					<c:if test="${ sessionScope.memberDTO.gender.equals('F') }">
						<input type="radio" name="gender" id="gender_f" value="F" checked/>
					</c:if>
					<label for="gender_f">여자</label>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="email1" id="email1" value="${ sessionScope.memberDTO.email1 }"> @ <input type="text" name="email2" id="email2" value="${ sessionScope.memberDTO.email2 }"><input list="email3_list" name="email3" id="email3">
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
					<c:if test="${ memberDTO.tel1.equals('010') }">
						<option value="010" selected>010</option>
						<option value="011">011</option>
						<option value="019">019</option>
					</c:if>
					<c:if test="${ memberDTO.tel1.equals('011') }">
						<option value="010">010</option>
						<option value="011" selected>011</option>
						<option value="019">019</option>
					</c:if>
					<c:if test="${ memberDTO.tel1.equals('019') }">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="019" selected>019</option>
					</c:if>
				</select> - <input type="text" name="tel2" id="tel2" maxlength="4" value="${ sessionScope.memberDTO.tel2 }"> - <input type="text" name="tel3" id="tel3" maxlength="4" value="${ sessionScope.memberDTO.tel3 }">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" readonly name="zipcode" id="zipcode" value="${ sessionScope.memberDTO.zipcode }"><input type="button" onclick="checkPost();" value="우편번호 검색"><br>
					<input type="text" readonly name="addr1" id="addr1" value="${ sessionScope.memberDTO.addr1 }"><br>
					<input type="text" name="addr2" id="addr2" value="${ sessionScope.memberDTO.addr2 }">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" id="updateBtn" value="회원정보 수정">
					<input type="reset" id="resetBtn" value="다시입력" onclick="location.reload()">
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