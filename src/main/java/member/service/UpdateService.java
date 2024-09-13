package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class UpdateService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String gender = request.getParameter("gender");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String zipcode = request.getParameter("zipcode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		
		MemberDTO memberDTO = new MemberDTO(name, id, pwd, gender, email1, email2, tel1, tel2, tel3,
				zipcode, addr1, addr2);
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		boolean check = memberDAO.updateMember(memberDTO);
		
		// 업데이트 후 기존에 남아있던 로그인 정보 삭제
		HttpSession session = request.getSession();
		session.removeAttribute("memberDTO");
		session.removeAttribute("memberEmail");
		
		// 새로운 memberDTO 세션에 저장
		memberDTO = memberDAO.loginMember(id, pwd);
		session.setAttribute("memberDTO", memberDTO);
		String email = memberDTO.getEmail1() + "@" + memberDTO.getEmail2();
		session.setAttribute("memberEmail", email);
		request.setAttribute("updateCheck", check);
		
		return "/member/memberUpdate.jsp";
	}

}
