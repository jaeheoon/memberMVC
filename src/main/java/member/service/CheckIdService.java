package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class CheckIdService implements CommandProcess{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 1. 데이터 가져오기
        String id = request.getParameter("id");

        // 2. DB 연동
        MemberDAO memberDAO = MemberDAO.getInstance();
        boolean exist = memberDAO.isExistId(id);

        // 결과를 request 객체에 저장
		/*
		 * if (exist) { request.setAttribute("result", "exist"); } else {
		 * request.setAttribute("result", "nonExist"); }
		 */
        request.setAttribute("result", exist);
        
        // 3. 결과를 checkId.jsp로 전달
        return "/member/checkId.jsp";

	}
}
