<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="./css/index.css">
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="./main/header.jsp" />
			<jsp:include page="./main/menu.jsp" />
		</div>
		
		<div id="container">
			<div id="nav">
				<jsp:include page="./main/nav.jsp" />
			</div>
			<div id="section">
				<h3>
					저희 홈페이지를 방문해주셔서 감사합니다.<br><br>
					<img alt="홈페이지 화면" src="./image/절벽위섬_1920.jpg" width="100%" height="100%">
				</h3>
			</div>
		</div>
		
		<div id="footer"></div>
	</div>
</body>
</html>