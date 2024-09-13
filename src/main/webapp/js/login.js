// 유효성 검사
/*function memberLogin() {
	document.getElementById("idDiv").innerHTML = "";
	document.getElementById("pwdDiv").innerHTML = "";
	let isValid = true;
	
	if(document.getElementById('id').value == '') {
		document.getElementById('idDiv').innerHTML = "아이디를 입력해주세요.";
		isValid = false;
	}
	else if(document.getElementById('pwd').value == '') {
		document.getElementById('pwdDiv').innerHTML = "비밀번호를 입력해주세요.";
		isValid = false;
	}
	else 
		document.memberLoginForm.submit();
		
	// 유효성 검사가 실패한 경우 폼 제출 중지
	if (!isValid) {
		return false;
	}

   // 유효성 검사가 성공하면 폼 제출
   return true;
}*/

/* 유효성 검사 jQuery & ajax로 실행 - 강사님꺼*/
$(function(){
	$('#loginBtn').click(function(){
		$('idDiv').empty();
		$('pwdDiv').empty();
		
		if($('#id').val() == '')
			$('#idDiv').html('아이디를 입력해주세요.');
		else if($('#pwd').val() == '')
			$('#pwdDiv').html('비밀번호를 입력해주세요.');
		else
			$.ajax({
				type: 'post',
				url:'./login.do',
				//data: 'id='+$('#id').val() + '&pwd=' + $('#pwd').val(),
				data: {
					'id': $('#id').val(),
					'pwd': $('#pwd').val()
				},
				dataType: 'text',
				success: function(data) {
					//alert(data.trim());
					console.log(data.trim());
					if(data.trim() == 'fail') alert('아이디 또는 비밀번호가 틀렸습니다.');
					else {
						alert(data.trim() + '님이 로그인 하셨습니다.');
						location.href='../index.do';
					}
				},
				error: function(e) {
					console.log(e);
				}
			});
		
	});
});


function memberWrite() {
	location.href='./writeForm.do';
}
