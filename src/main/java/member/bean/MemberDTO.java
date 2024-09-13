package member.bean;

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
public class MemberDTO {
	@NonNull
	private String name;
	@NonNull
	private String id;
	@NonNull
	private String pwd;
	@NonNull
	private String gender;
	@NonNull
	private String email1;
	@NonNull
	private String email2;
	@NonNull
	private String tel1;
	@NonNull
	private String tel2;
	@NonNull
	private String tel3;
	@NonNull
	private String zipcode;
	@NonNull
	private String addr1;
	@NonNull
	private String addr2;
	private Date logtime;
	
	@Override
	public String toString() {
		return "이름 : " + name + " 아이디 : " + id + " 성별 : " + gender 
			 + " 이메일1 : " + email1 + " 이메일2 : " + email2 
			 + " 번호1 : " + tel1 + " 번호2 : " + tel2  + " 번호3 : " + tel3 
			 + " 우편번호 : " + zipcode + " 주소1 : " + addr1 + " 주소2 : " + addr2 
			 + " 가입일 : " + logtime;
	}
	
}
