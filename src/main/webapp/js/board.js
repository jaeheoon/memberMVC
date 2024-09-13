$(function(){
	$('input[type="submit"]').click(function(){
		$('#contentDiv').empty();
		$('#subjectDiv').empty();
		
		if(!$('#subject').val()){
			$('#subjectDiv').html('제목을 입력하세요');
			$('#subject').focus();
			
			return false;
		}
		
		if(!$('#content').val()){
			$('#contentDiv').html('내용을 입력하세요');
			$('#content').focus();
			
			return false;
		}
	});
});

$(document).ready(function () {
    // 페이지 로드 시 기존 리뷰 목록을 가져오는 AJAX 요청
    fetchArticleList();

    // 폼 제출 시 처리 로직
    $('#writeModal .needs-validation').on('submit', function (event) {
        event.preventDefault(); // 폼의 기본 제출 방지
        
        $.ajax({
            type: 'POST',  // POST 요청으로 데이터 전송
            url: '../article/articleWrite.jsp',  // 데이터가 있는 JSP 파일의 URL
            data: $(this).serialize(),  // 폼 데이터를 직렬화하여 전송
            dataType: 'json',  // 서버에서 JSON 형식으로 응답을 기대
            success: function (data) {  // 요청이 성공했을 때 실행될 함수
                alert(data.message);
                if (data.redirect) {
					$('#writeModal').modal('hide');
                    // 글 등록 성공 시 articleList 새로고침
                    fetchArticleList();
                }
            },
            error: function (e) {  // 요청이 실패했을 때 실행될 함수
                console.log(`${e.status} ${e.statusText}`);  // 에러 상태와 상태 텍스트를 콘솔에 출력
            }
        });
    });
    
    $('#writeModal').on('hidden.bs.modal', function () {
        resetModalForm(); // 폼 내용 초기화 함수 호출
    });

    // 폼 내용 초기화 함수
    function resetModalForm() {
        $('#writeModal .needs-validation')[0].reset(); // 폼 필드 값 초기화
        $('#writeModal .needs-validation').removeClass('was-validated'); // 유효성 검사 클래스 제거
    }

    // articleList를 가져와 테이블을 업데이트하는 함수
    function fetchArticleList() {
        $.ajax({
            type: 'GET',
            url: '../article/articleList.jsp',  // articleList를 반환하는 JSP 파일의 URL
            dataType: 'json',  // 서버에서 JSON 형식으로 응답을 기대
            success: function (data) {  // 요청이 성공했을 때 실행될 함수
                populateReviewTable(data.list);
            },
            error: function (e) {  // 요청이 실패했을 때 실행될 함수
                console.log(`${e.status} ${e.statusText}`);  // 에러 상태와 상태 텍스트를 콘솔에 출력
            }
        });
    }

    // 리뷰 테이블을 동적으로 채우는 함수
    function populateReviewTable(reviews) {
        const tbody = $('#section1 .article tbody');  // 리뷰를 추가할 테이블의 tbody 선택

        // 리뷰 데이터가 없을 경우 메시지 표시
        if (reviews.length === 0) {
            tbody.empty().append('<tr><td colspan="5">리뷰가 없습니다</td></tr>');
            $('div.exec:eq(1) > span').html('0');
            return;
        }

        // 리뷰 데이터를 순회하며 각 데이터를 테이블에 추가
        tbody.empty(); // 기존 내용 제거
        $('div.exec:eq(1) > span').html(reviews.length);
        
        reviews.forEach(review => {
            const row = $('<tr></tr>');  // 새 테이블 행(tr) 생성
            row.append(`<td class="no">${review.reviewNo}</td>`);  // 리뷰 번호 추가
            row.append(`<td class="subject">${review.subject}</td>`);  // 리뷰 제목 추가
            row.append(`<td class="name">${review.memberId}</td>`);  // 작성자
            row.append(`<td class="hit">${review.hit}</td>`);  // 조회수 추가
            row.append(`<td class="date">${review.date}</td>`);  // 작성일시 추가
            tbody.append(row);  // 생성한 행을 tbody에 추가
        });
    }
});