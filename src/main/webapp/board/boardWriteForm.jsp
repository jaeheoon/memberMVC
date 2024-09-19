<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="../css/boardWrite.css">
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
				<form name="boardWriteForm" id="boardWriteForm">
					<table border="1">
						<tr>
							<th>작성자</th>
							<td>
								<input type="text" name="name" id="name" value="${ sessionScope.memberDTO.name }" placeholder="작성자 입력" readonly>
								<input type="hidden" name="id" id="id" value="${ sessionScope.memberDTO.id }" readonly>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>
								<input type="text" name="subject" id="subject" placeholder="제목 입력">
								<div id = subjectDiv></div>
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea id="content" name="content" rows="15" cols="84"></textarea>
								<div id = contentDiv></div>
							</td>
						</tr>
						<tr>
							<td colspan="3" align="center">
								<input type="button" value="글작성" id="writeBtn">
								<input type="reset" value="다시작성" id="resetBtn">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/board.js"></script>
</body>
</html>