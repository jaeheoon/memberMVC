package board.bean;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@RequiredArgsConstructor
@AllArgsConstructor
public class BoardDTO {
	@NonNull
	private Integer seq;		//글번호
	@NonNull
	private String id;		    //아이디
	@NonNull
	private String name;		//이름
	@NonNull
	private String email;		//이메일
	@NonNull
	private String subject;		//제목
	@NonNull
	private String content;		//내용
	
	@NonNull
	private Integer ref;		//그룹번호
	@NonNull
	private Integer lev;		//단계
	@NonNull
	private Integer step;		//글순서
	@NonNull
	private Integer pseq;		//원글번호
	@NonNull
	private Integer reply;		//답변수
	
	@NonNull
	private Integer hit;		//조회수
	private Date logtime;		//작성일
	
	@Override
	public String toString() {
		return "글번호 : " + seq + " 아이디 : " + id + " 이름 : " + name + " 이메일 : " + email 
		   + " 제목 : " + subject + " 내용 : " + content + " 그룹번호 : " + ref + " 단계 : " + lev 
		   + " 글순서 : " + step + " 원글번호 : " + pseq + " 답변수 : " + reply + " 조회수 : " + hit 
		   + " 작성일: " + logtime;
	}
	
}
