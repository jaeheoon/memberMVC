package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class LoginService implements CommandProcess{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id = request.getParameter("id");
	    String pwd = request.getParameter("pwd");
	    boolean check = false;
	    
	    MemberDAO memberDAO = MemberDAO.getInstance();
	    MemberDTO memberDTO = memberDAO.loginMember(id, pwd);
	    
	    if (memberDTO != null) {
	        check = true;
	        //세션 생성
	        HttpSession session = request.getSession();
	        
	        request.setAttribute("check", check);
	        session.setAttribute("memberDTO", memberDTO);
	        String email = memberDTO.getEmail1() + "@" + memberDTO.getEmail2();
	        session.setAttribute("memberEmail", email);
	    }
	    
		return "/member/memberLogin.jsp";
	}
}
