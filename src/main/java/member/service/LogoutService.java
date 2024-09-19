package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

public class LogoutService implements CommandProcess{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		
		session.removeAttribute("memberDTO");
		session.removeAttribute("memberEmail");
		
		//세션에 있는 객체들 한번에 다 삭제
		//session.invalidate();
		return "none";
	}
}
