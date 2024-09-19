$(function(){
	// 유효성 검사 함수
	function validateForm() {
		// 오류 메시지 초기화 및 숨김
		$('#nameDiv').hide();
		$('#idDiv').hide();
		$('#pwdDiv').hide();
		$('#repwdDiv').hide();
		
		var isValid = true;
		
		// 비밀번호 확인
		if ($('#pwd').val() !== $('#repwd').val()){
		   $('#repwdDiv').html('비밀번호가 다릅니다').show(); 
		   $('#pwd').focus();
		   isValid = false;
		}
		
		// 비밀번호 재확인 입력 검사
		if ($('#repwd').val() === ''){
		   $('#repwdDiv').html('비밀번호 재확인을 입력해주세요').show(); 
		   $('#repwd').focus();
		   isValid = false;
		}
		  
		// 비밀번호 입력 검사
		if ($('#pwd').val() === ''){
		   $('#pwdDiv').html('비밀번호를 입력해주세요').show(); 
		   $('#pwd').focus();
		   isValid = false;
		}
		
		// 아이디 입력 검사
		if ($('#id').val() === ''){
		   $('#idDiv').html('아이디를 입력해주세요').show();
		   $('#id').focus();
		   isValid = false;
		}
		
		// 이름 입력 검사
		if ($('#name').val() === ''){
		   $('#nameDiv').html('이름을 입력해주세요').show(); // 오류 메시지 표시
		   $('#name').focus();
		   isValid = false;
		}
		
		// 중복체크 (joinBtn 클릭 시만 검사)
		if ($('#joinBtn').length && $('#id').val() !== $('#check').val()){
		   $('#idDiv').html('중복체크를 해주세요').show(); 
		   $('#id').focus();
		   isValid = false;
		}
		
		return isValid;
	}
	
	// 글 작성 버튼 클릭 시 유효성 검사
	$('#joinBtn').click(function(event){
		if (!validateForm()) {
			event.preventDefault(); // 폼 제출 방지
		} else {
			//$('form').submit();
			$.ajax({
				type: 'post',
				url: './write.do',
				data: $('#memberWriteForm').serialize(),
				success: function(){
					alert('회원가입을 축하합니다.');
					location.href='../index.do';
				},
				error: function(e){
					console.log(e);
				}
			});
		}
	});

	/* memberUpdate ajax로 사용 코드 */
	$('#updateBtn').click(function(event){
		if (!validateForm()) {
			event.preventDefault(); // 폼 제출 방지
		} else
		    $.ajax({
		        type: 'post',
		        url: './update.do',
		        data: $('#memberUpdateForm').serialize(), // name=값&id=값&~~~~
		        success: function(){
		            alert('회원정보 수정 완료');
		            location.href = '../index.jsp';
		        },
		        error: function(e){
		            console.log(e);
		        }
		    });
	});
	
	
	// ID 중복체크
	$('#id').on('focusout', function() {
		checkId();
	});
	
	// 초기화 버튼 클릭 시 입력 필드 및 오류 메시지 초기화
	$('#resetBtn').click(function(){
	    $('#nameDiv').hide();
	    $('#idDiv').hide();
	    $('#pwdDiv').hide();
	    $('#repwdDiv').hide();
	    $('#memberWriteForm')[0].reset(); // 폼 필드 초기화
	});
});

/* ID 중복체크 - 새창에서 열기
function checkId(){
	let id = document.getElementById('id').value;
	if(id !== '') {
		window.open("./checkId.jsp?id="+id, "myWindow", "width=450 height=150 top=150 left=600");
		document.getElementById('idDiv').innerHTML = '';
	} else {
		document.getElementById('idDiv').innerHTML = "아이디를 입력해주세요.";
	}
}
*/

// ID 중복체크 - focusout일때 사용할 function
function checkId() {
	let id = $('#id').val();
	if(id !== '') {
		$.ajax({
			url: './checkId.do',
			type: 'GET',
			data: { id: id },
			success: function(data) {
				// 서버로부터의 응답에 따라 처리
				console.log(data); // 응답 값 확인을 위해 로그 출력
				if(data.trim() === 'nonExist') {
					$('#idDiv').html('사용 가능한 아이디입니다.').css('color', 'blue');
					$('#check').val(id); // 중복 체크 성공 시, 숨겨진 필드에 아이디 저장
				} else {
					$('#idDiv').html('이미 사용 중인 아이디입니다.').css('color', 'red');
					$('#check').val(''); // 중복 체크 실패 시, 숨겨진 필드 초기화
				}
			},
			error: function() {
				$('#idDiv').html('아이디 중복 체크 중 오류가 발생했습니다.').css('color', 'red');
			}
		});
	} else {
		$('#idDiv').html('아이디를 입력해주세요.').css('color', 'red');
	}
}

//회원가입
/* js로 한 실행문
function memberWrite() {
	document.getElementById("nameDiv").innerHTML = "";
	document.getElementById("idDiv").innerHTML = "";
	document.getElementById("pwdDiv").innerHTML = "";
	
	//if(document.getElementById("name").value == "") => id 속성
	if(document.memberWriteForm.name.value == "")
		document.getElementById("nameDiv").innerHTML = "이름 입력";
	else if(document.getElementById("id").value == "")
		document.getElementById("idDiv").innerHTML = "아이디 입력";
	else if(document.getElementById("pwd").value == "")
			document.getElementById("pwdDiv").innerHTML = "비밀번호 입력";
	else if(document.getElementById("pwd").value != document.getElementById("repwd").value)
			document.getElementById("pwdDiv").innerHTML = "비밀번호가 맞지 않습니다.";
	else if(document.getElementById("id").value != document.getElementById("check").value)
		document.getElementById("idDiv").innerHTML = "중복체크 하세요";
	else 
		document.memberWriteForm.submit();
}
*/

function checkIdClose(id){
	//opener.document : 열려있는 창 중에서 검색
	opener.document.getElementById("id").value = id;
	opener.document.getElementById("check").value = id;
	window.close();
	opener.document.getElementById("pwd").focus();
}

function checkPost() {
	new daum.Postcode({
	    oncomplete: function(data) {
	        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	        var addr = ''; // 주소 변수
	
	        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	            addr = data.roadAddress;
	        } else { // 사용자가 지번 주소를 선택했을 경우(J)
	            addr = data.jibunAddress;
	        }
	
	        // 우편번호와 주소 정보를 해당 필드에 넣는다.
	        document.getElementById('zipcode').value = data.zonecode;
	        document.getElementById('addr1').value = addr;
	        // 커서를 상세주소 필드로 이동한다.
	        document.getElementById('addr2').focus();
	    }
	}).open();
}

$('#email3').on('input', function() {
	let selectedValue = $(this).val(); // 선택된 값 가져오기
	if (selectedValue !== '직접입력') { // '직접입력'이 아닌 경우에만 동작
	    $('#email2').val(selectedValue); // email2 필드에 값 입력
	    $('#email2').prop('readonly', true); // email2 필드를 읽기 전용으로 설정
	} else {
	    $('#email2').val(''); // email2 필드를 비우기
	    $('#email2').prop('readonly', false); // email2 필드의 읽기 전용 해제
	}
});
// email3 선택한 것을 email2로 값 이동
/* js로 한 실행문
function change() {
	document.getElementById('email2').value = document.getElementById('email3').value
}
*/
$('#email3').on('click', function() {
    $('#email2').val(''); // email2 필드를 비우기
    $('#email3').val(''); // email3 필드를 비우기
    $('#email2').prop('readonly', false); // email2 필드의 읽기 전용 해제
});