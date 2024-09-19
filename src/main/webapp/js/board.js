$(function(){
	function validateForm() {
		$('#contentDiv').hide();
		$('#subjectDiv').hide();
		$('#pwdDiv').hide();
		$('#repwdDiv').hide();
		
		var isValid = true;
		
		// 이름 입력 검사
		if ($('#subject').val() === ''){
		   $('#subjectDiv').html('제목을 입력하세요').show(); // 오류 메시지 표시
		   $('#subject').focus();
		   isValid = false;
		}
		
		if ($('#content').val() === ''){
		   $('#contentDiv').html('내용을 입력하세요').show(); // 오류 메시지 표시
		   $('#content').focus();
		   isValid = false;
		}
		
		return isValid;
	}
	
	$('#writeBtn').click(function(event){
		if (!validateForm()) {
			event.preventDefault(); // 폼 제출 방지
		} else {
			//$('form').submit();
			$.ajax({
				type: 'post',
				url: './write.do',
				data: $('#boardWriteForm').serialize(),
				success: function(){
					alert('글이 등록되었습니다.');
					location.href='./listForm.do?page=1';
				},
				error: function(e){
					console.log(e);
				}
			});
		}
	});
	
	// 초기화 버튼 클릭 시 입력 필드 및 오류 메시지 초기화
	$('#resetBtn').click(function(){
	    $('#subjectDiv').hide();
	    $('#contentDiv').hide();
	    $('#boardWriteForm')[0].reset(); // 폼 필드 초기화
	});
});